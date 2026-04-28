#!/bin/bash
#
# Fetch a paper PDF from Sci-Hub without browser MCP automation.
# Uses headless Chrome to bypass CAPTCHA, then curl to download the PDF.
#
# Usage:
#   ./scripts/fetch-scihub.sh <doi-or-url> <output-file>
#
# Examples:
#   ./scripts/fetch-scihub.sh 10.1016/j.eswa.2023.122108 articles/my-paper.pdf
#   ./scripts/fetch-scihub.sh "https://www.sciencedirect.com/science/article/abs/pii/S0957417423022108" articles/my-paper.pdf
#
# Requirements: Google Chrome, curl, python3
# Exit codes: 0 = success, 1 = not found / download failed

set -euo pipefail

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
MIRRORS=(
    "https://sci-hub.st"
    "https://sci-hub.ru"
    "https://sci-hub.se"
)

UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

identifier="${1:?Usage: fetch-scihub.sh <doi-or-url> <output-file>}"
output="${2:?Usage: fetch-scihub.sh <doi-or-url> <output-file>}"

mkdir -p "$(dirname "$output")"

# Resolve DOI from a ScienceDirect PII URL via CrossRef
resolve_doi_from_pii() {
    local url="$1"
    local pii
    pii=$(echo "$url" | sed -n 's|.*pii/\([A-Za-z0-9]*\).*|\1|p')
    if [ -n "$pii" ]; then
        local doi
        doi=$(curl -sL "https://api.crossref.org/works?query=$pii&rows=1" \
            -H "User-Agent: PaperFetcher/1.0 (mailto:research@example.com)" \
            --connect-timeout 10 --max-time 15 2>/dev/null | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    items = data.get('message', {}).get('items', [])
    if items:
        print(items[0].get('DOI', ''))
except: pass
" 2>/dev/null || true)
        if [ -n "$doi" ]; then
            echo "$doi"
            return 0
        fi
    fi
    return 1
}

# Extract PDF URL from Sci-Hub HTML (works with both curl and headless Chrome output)
extract_pdf_url() {
    local html="$1"
    local url

    # Method 1: citation_pdf_url meta tag (most reliable)
    url=$(echo "$html" | sed -n 's/.*citation_pdf_url"[^"]*content="\([^"]*\)".*/\1/p' | head -1)
    if [ -n "$url" ]; then echo "$url"; return 0; fi

    # Method 2: embed src
    url=$(echo "$html" | sed -n 's/.*<embed[^>]*src="\([^"]*\)".*/\1/p' | head -1)
    if [ -n "$url" ]; then echo "$url"; return 0; fi

    # Method 3: iframe src
    url=$(echo "$html" | sed -n 's/.*<iframe[^>]*src="\([^"]*\)".*/\1/p' | grep -i 'pdf\|sci-hub\|download\|storage' | head -1 || true)
    if [ -n "$url" ]; then echo "$url"; return 0; fi

    # Method 4: id="pdf" element src
    url=$(echo "$html" | sed -n 's/.*id="pdf"[^>]*src="\([^"]*\)".*/\1/p' | head -1)
    if [ -n "$url" ]; then echo "$url"; return 0; fi

    # Method 5: href with .pdf
    url=$(echo "$html" | sed -n 's/.*href="\([^"]*\.pdf[^"]*\)".*/\1/p' | head -1)
    if [ -n "$url" ]; then echo "$url"; return 0; fi

    # Method 6: any src with /storage/ or /downloads/
    url=$(echo "$html" | sed -n 's/.*src="\([^"]*\/storage\/[^"]*\)".*/\1/p' | head -1)
    if [ -n "$url" ]; then echo "$url"; return 0; fi
    url=$(echo "$html" | sed -n 's/.*src="\([^"]*\/downloads\/[^"]*\)".*/\1/p' | head -1)
    if [ -n "$url" ]; then echo "$url"; return 0; fi

    return 1
}

# Normalize a PDF URL
normalize_url() {
    local url="$1"
    local mirror="${2:-}"
    if [[ "$url" == //* ]]; then
        echo "https:$url"
    elif [[ "$url" == /* ]]; then
        echo "${mirror}${url}"
    else
        echo "$url"
    fi
}

# Check if page says article not found
is_not_found() {
    local html="$1"
    if echo "$html" | grep -qi 'article is not available'; then return 0; fi
    if echo "$html" | grep -qi 'article not found'; then return 0; fi
    if echo "$html" | grep -qi 'not found in sci-hub'; then return 0; fi
    return 1
}

# Download and verify PDF
download_and_verify() {
    local pdf_url="$1"
    local mirror="$2"

    curl -sL -o "$output" "$pdf_url" \
        -H "User-Agent: $UA" \
        -H "Referer: $mirror/" \
        --connect-timeout 15 \
        --max-time 120 \
        2>/dev/null

    if [ ! -f "$output" ]; then
        echo "    Download failed — file not created" >&2
        return 1
    fi

    local size
    size=$(stat -f%z "$output" 2>/dev/null || stat -c%s "$output" 2>/dev/null || echo 0)
    if [ "$size" -lt 10000 ]; then
        echo "    File too small (${size} bytes)" >&2
        rm -f "$output"
        return 1
    fi

    if ! file "$output" | grep -qi 'pdf'; then
        echo "    Not a PDF" >&2
        rm -f "$output"
        return 1
    fi

    echo "    OK: $(du -h "$output" | cut -f1)" >&2
    return 0
}

# Strategy 1: Headless Chrome (bypasses CAPTCHA via JS execution)
try_headless_chrome() {
    local mirror="$1"
    local ident="$2"
    local url="${mirror}/${ident}"

    echo "  [headless] $url" >&2
    local html
    # Use virtual-time-budget to let JS CAPTCHA widgets solve themselves
    html=$("$CHROME" --headless=new --disable-gpu --no-sandbox \
        --timeout=25000 --virtual-time-budget=10000 \
        --run-all-compositor-stages-before-draw \
        --dump-dom "$url" 2>/dev/null || true)

    if [ -z "$html" ]; then
        echo "    No response from headless Chrome" >&2
        return 1
    fi

    if is_not_found "$html"; then
        echo "    Article not available" >&2
        return 3
    fi

    local pdf_url
    pdf_url=$(extract_pdf_url "$html") || {
        echo "    Could not find PDF URL in page" >&2
        return 1
    }

    pdf_url=$(normalize_url "$pdf_url" "$mirror")
    echo "    PDF: $pdf_url" >&2

    download_and_verify "$pdf_url" "$mirror"
}

# Strategy 2: Direct curl (works when no CAPTCHA)
try_curl() {
    local mirror="$1"
    local ident="$2"
    local url="${mirror}/${ident}"

    echo "  [curl] $url" >&2
    local html
    html=$(curl -sL "$url" \
        -H "User-Agent: $UA" \
        -H "Accept: text/html,application/xhtml+xml" \
        -H "Accept-Language: en-US,en;q=0.9" \
        --connect-timeout 15 --max-time 30 2>/dev/null || true)

    if [ -z "$html" ]; then
        echo "    No response" >&2
        return 1
    fi

    if echo "$html" | grep -qi 'captcha\|are you.*robot\|robot.*check'; then
        echo "    CAPTCHA — skipping" >&2
        return 2
    fi

    if is_not_found "$html"; then
        echo "    Article not available" >&2
        return 3
    fi

    local pdf_url
    pdf_url=$(extract_pdf_url "$html") || {
        echo "    Could not find PDF URL in page" >&2
        return 1
    }

    pdf_url=$(normalize_url "$pdf_url" "$mirror")
    echo "    PDF: $pdf_url" >&2

    download_and_verify "$pdf_url" "$mirror"
}

echo "Fetching: $identifier" >&2

# Build list of identifiers to try
identifiers=("$identifier")

# If it's a ScienceDirect URL, also try resolving DOI
if echo "$identifier" | grep -q 'sciencedirect.com'; then
    doi=$(resolve_doi_from_pii "$identifier" || true)
    if [ -n "$doi" ]; then
        echo "Resolved DOI: $doi" >&2
        identifiers=("$doi" "$identifier")
    fi
fi

# Strategy 3: Selenium (best CAPTCHA handling, slower)
SELENIUM_SCRIPT="$(cd "$(dirname "$0")" && pwd)/fetch-scihub-selenium.py"

try_selenium() {
    local ident="$1"
    echo "  [selenium] $ident" >&2
    python3 "$SELENIUM_SCRIPT" "$ident" "$output" 2>&1 | while IFS= read -r line; do
        echo "    $line" >&2
    done
    # Check if file was created and is valid
    if [ -f "$output" ]; then
        local size
        size=$(stat -f%z "$output" 2>/dev/null || stat -c%s "$output" 2>/dev/null || echo 0)
        if [ "$size" -gt 10000 ] && file "$output" | grep -qi 'pdf'; then
            return 0
        fi
    fi
    return 1
}

# Try each identifier: curl (fast) → selenium (robust) → headless chrome (fallback)
for ident in "${identifiers[@]}"; do
    # First pass: try curl on all mirrors (fastest)
    for mirror in "${MIRRORS[@]}"; do
        ret=0
        try_curl "$mirror" "$ident" || ret=$?
        if [ "$ret" -eq 0 ]; then exit 0; fi
    done

    # Second pass: use Selenium (handles ALTCHA properly)
    sret=0
    try_selenium "$ident" || sret=$?
    if [ "$sret" -eq 0 ]; then exit 0; fi

    # Third pass: try headless Chrome on each mirror (fallback)
    for mirror in "${MIRRORS[@]}"; do
        hret=0
        try_headless_chrome "$mirror" "$ident" || hret=$?
        if [ "$hret" -eq 0 ]; then exit 0; fi
    done
done

echo "FAILED: Could not download from any Sci-Hub mirror" >&2
exit 1
