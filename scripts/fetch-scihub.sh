#!/bin/bash
#
# Fetch a paper PDF, preferring legitimate open-access sources over Sci-Hub.
#
# Usage:
#   ./scripts/fetch-scihub.sh <doi-or-url> <output-file>
#   ./scripts/fetch-scihub.sh --storage <storage-url> <output-file>
#   ./scripts/fetch-scihub.sh --oa-only <doi-or-url> <output-file>
#
# Examples:
#   ./scripts/fetch-scihub.sh 10.1016/j.eswa.2023.122108 articles/my-paper.pdf
#   ./scripts/fetch-scihub.sh "https://www.sciencedirect.com/science/article/abs/pii/S0957417423022108" articles/x.pdf
#   ./scripts/fetch-scihub.sh --storage "https://sci-hub.cat/storage/zero/.../paper.pdf" articles/x.pdf
#
# Requirements: curl, python3 (Google Chrome and selenium are optional fallbacks)
#
# Exit codes:
#   0 = success
#   1 = not found / download failed
#   2 = blocked by the Altcha proof-of-work wall — needs the browser MCP flow
#       (see "BROWSER HANDOFF" below; the script prints the steps)
#   3 = article genuinely not in Sci-Hub
#
# WHY THE BROWSER HANDOFF EXISTS (verified 2026-08-06)
#   Every reachable Sci-Hub mirror now sits behind an Altcha proof-of-work
#   challenge ("проверка на робота"). This is NOT an image CAPTCHA — there is
#   nothing a human can click, so asking the user to "solve the CAPTCHA" does
#   not help. curl always receives the challenge page, and headless Chrome does
#   not complete the PoW either (tested with --virtual-time-budget up to 40s).
#   A real browser session DOES pass it. Once past, clicking Sci-Hub's download
#   button lands on a storage host (e.g. sci-hub.cat/storage/...) that serves
#   the PDF to plain curl with no challenge — hence the --storage mode.

set -euo pipefail

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# Mirror list verified 2026-08-06 from a European IP.
#   sci-hub.se  — no DNS record at all, removed
#   sci-hub.st  — DNS resolves but connections time out, kept last
# All of these currently answer, and all currently present the Altcha wall to
# curl; they are still tried first because the wall is applied inconsistently
# and a mirror occasionally serves the article page directly.
MIRRORS=(
    "https://sci-hub.ru"
    "https://sci-hub.wf"
    "https://sci-hub.ee"
    "https://sci-hub.red"
    "https://sci-hub.al"
    "https://sci-hub.box"
    "https://sci-hub.st"
)

UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"

mode="scihub"
case "${1:-}" in
    --storage)  mode="storage"; shift ;;
    --oa-only)  mode="oa-only"; shift ;;
esac

identifier="${1:?Usage: fetch-scihub.sh [--storage|--oa-only] <doi-or-url> <output-file>}"
output="${2:?Usage: fetch-scihub.sh [--storage|--oa-only] <doi-or-url> <output-file>}"

mkdir -p "$(dirname "$output")"

# ---------------------------------------------------------------- utilities

# Download and verify a PDF. $2 is an optional Referer.
download_and_verify() {
    local pdf_url="$1"
    local referer="${2:-}"

    local -a hdrs=(-H "User-Agent: $UA")
    [ -n "$referer" ] && hdrs+=(-H "Referer: $referer")

    curl -sL -o "$output" "$pdf_url" "${hdrs[@]}" \
        --connect-timeout 15 --max-time 180 2>/dev/null || true

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

    # Verify by magic bytes ONLY. Do not use `file "$output" | grep -i pdf`:
    # `file` echoes the path, and every output path here ends in ".pdf", so
    # that test matches the filename and passes for HTML challenge pages.
    if ! head -c 5 "$output" | grep -q '%PDF'; then
        echo "    Not a PDF (challenge or error page)" >&2
        rm -f "$output"
        return 1
    fi

    local pages=""
    if command -v pdfinfo >/dev/null 2>&1; then
        pages=$(pdfinfo "$output" 2>/dev/null | awk '/^Pages/{print $2}')
        if [ -z "$pages" ]; then
            echo "    PDF header present but unparseable — rejecting" >&2
            rm -f "$output"
            return 1
        fi
    fi

    echo "    OK: $(du -h "$output" | cut -f1)${pages:+, $pages pages}" >&2
    return 0
}

# Resolve a DOI from a publisher URL via CrossRef.
resolve_doi_from_url() {
    local url="$1" pii doi
    pii=$(echo "$url" | sed -n 's|.*pii/\([A-Za-z0-9]*\).*|\1|p')
    [ -z "$pii" ] && return 1
    doi=$(curl -sL "https://api.crossref.org/works?query=$pii&rows=1" \
        -H "User-Agent: PaperFetcher/1.0" \
        --connect-timeout 10 --max-time 20 2>/dev/null | python3 -c "
import sys, json
try:
    items = json.load(sys.stdin).get('message', {}).get('items', [])
    print(items[0].get('DOI','') if items else '')
except Exception: pass
" 2>/dev/null || true)
    [ -n "$doi" ] && { echo "$doi"; return 0; }
    return 1
}

# Ask OpenAlex whether a legitimate open-access PDF exists.
# Many "paywalled" papers have an author manuscript, arXiv preprint or
# repository copy. Always cheaper and more ethical than Sci-Hub.
try_open_access() {
    local doi="$1"
    echo "  [open-access] checking OpenAlex for $doi" >&2

    # An arXiv DOI is a direct hit — skip the API call entirely.
    local arxiv_id
    arxiv_id=$(echo "$doi" | sed -n 's|^10\.48550/ar[Xx]iv\.\(.*\)$|\1|p')
    if [ -n "$arxiv_id" ]; then
        echo "    arXiv DOI -> https://arxiv.org/pdf/${arxiv_id}" >&2
        download_and_verify "https://arxiv.org/pdf/${arxiv_id}" "" && return 0
    fi

    # Collect every candidate PDF url OpenAlex knows about, best first.
    local urls
    urls=$(curl -sL "https://api.openalex.org/works/doi:${doi}" \
        -H "User-Agent: PaperFetcher/1.0" \
        --connect-timeout 10 --max-time 25 2>/dev/null | python3 -c "
import sys, json
try:
    d = json.load(sys.stdin)
except Exception:
    sys.exit()
seen, out = set(), []
def add(u):
    if u and u not in seen:
        seen.add(u); out.append(u)
best = d.get('best_oa_location') or {}
add(best.get('pdf_url'))
for loc in (d.get('locations') or []):
    add(loc.get('pdf_url'))
add((d.get('open_access') or {}).get('oa_url'))
add(best.get('landing_page_url'))
for u in out:
    # arXiv abs pages are HTML; rewrite to the PDF endpoint.
    print(u.replace('arxiv.org/abs/', 'arxiv.org/pdf/'))
" 2>/dev/null || true)

    if [ -z "$urls" ]; then
        echo "    No open-access copy found" >&2
        return 1
    fi

    # Try each candidate. Landing pages (doi.org, publisher HTML) fail
    # verification and we fall through to the next one, then to Sci-Hub.
    while IFS= read -r url; do
        [ -z "$url" ] && continue
        echo "    OA candidate: $url" >&2
        if download_and_verify "$url" ""; then return 0; fi
    done <<< "$urls"

    return 1
}

print_browser_handoff() {
    local doi="$1"
    cat >&2 <<EOF

BROWSER HANDOFF REQUIRED — the Altcha proof-of-work wall blocked every mirror.
This is not a solvable CAPTCHA; it needs a real browser session.

Steps (browser MCP):
  1. navigate  https://sci-hub.ru/${doi}
  2. computer screenshot          # confirm the PDF rendered; note the toolbar
  3. computer left_click on the download arrow in Sci-Hub's dark overlay bar
     (bottom-right of the page, NOT Chrome's own PDF toolbar)
  4. tabs_context_mcp             # the tab URL is now a storage URL, e.g.
                                  # https://sci-hub.cat/storage/zero/.../x.pdf
  5. ./scripts/fetch-scihub.sh --storage "<that-url>" "$output"

Storage hosts serve PDFs to plain curl with no challenge, so step 5 always
works once you have the URL.
EOF
}

# ------------------------------------------------------------ storage mode

if [ "$mode" = "storage" ]; then
    echo "Downloading from storage URL" >&2
    if download_and_verify "$identifier" "https://sci-hub.ru/"; then
        echo "Saved: $output" >&2
        exit 0
    fi
    echo "FAILED: storage URL did not yield a PDF" >&2
    exit 1
fi

# -------------------------------------------------------------- main flow

echo "Fetching: $identifier" >&2

doi="$identifier"
if echo "$identifier" | grep -qE 'https?://'; then
    if resolved=$(resolve_doi_from_url "$identifier"); then
        echo "Resolved DOI: $resolved" >&2
        doi="$resolved"
    fi
fi
doi=$(echo "$doi" | sed 's|^https\?://\(dx\.\)\?doi\.org/||')

# Step 1 — legitimate open access
if echo "$doi" | grep -q '^10\.'; then
    if try_open_access "$doi"; then
        echo "Saved (open access): $output" >&2
        exit 0
    fi
fi

if [ "$mode" = "oa-only" ]; then
    echo "FAILED: no open-access copy found (--oa-only)" >&2
    exit 1
fi

# Step 2 — Sci-Hub mirrors via curl
walled=0
for mirror in "${MIRRORS[@]}"; do
    url="${mirror}/${doi}"
    echo "  [curl] $url" >&2
    html=$(curl -sL "$url" -H "User-Agent: $UA" \
        -H "Accept: text/html,application/xhtml+xml" \
        --connect-timeout 10 --max-time 25 2>/dev/null || true)

    if [ -z "$html" ]; then
        echo "    No response" >&2
        continue
    fi
    # Altcha wall — the current default on every mirror
    if echo "$html" | grep -qiE 'altcha|проверка на робота|not a bot'; then
        echo "    Altcha proof-of-work wall" >&2
        walled=1
        continue
    fi
    if echo "$html" | grep -qiE 'article (is )?not (available|found)|not found in sci-hub'; then
        echo "    Article not available in Sci-Hub" >&2
        exit 3
    fi

    pdf_url=$(echo "$html" | grep -oE '(src|href)="[^"]*(/storage/|/downloads/)[^"]*\.pdf[^"]*"' \
        | head -1 | sed 's/^[a-z]*="//; s/"$//' || true)
    if [ -z "$pdf_url" ]; then
        pdf_url=$(echo "$html" | sed -n 's/.*citation_pdf_url"[^"]*content="\([^"]*\)".*/\1/p' | head -1)
    fi
    if [ -z "$pdf_url" ]; then
        echo "    No PDF URL in page" >&2
        continue
    fi

    case "$pdf_url" in
        //*) pdf_url="https:$pdf_url" ;;
        /*)  pdf_url="${mirror}${pdf_url}" ;;
    esac
    echo "    PDF: $pdf_url" >&2
    if download_and_verify "$pdf_url" "$mirror/"; then
        echo "Saved: $output" >&2
        exit 0
    fi
done

# Step 3 — selenium, only if it is actually installed
SELENIUM_SCRIPT="$(cd "$(dirname "$0")" && pwd)/fetch-scihub-selenium.py"
if [ -f "$SELENIUM_SCRIPT" ] && python3 -c "import selenium" 2>/dev/null; then
    echo "  [selenium] $doi" >&2
    python3 "$SELENIUM_SCRIPT" "$doi" "$output" 2>&1 | sed 's/^/    /' >&2 || true
    if [ -f "$output" ]; then
        size=$(stat -f%z "$output" 2>/dev/null || stat -c%s "$output" 2>/dev/null || echo 0)
        if [ "$size" -gt 10000 ] && head -c 5 "$output" | grep -q '%PDF'; then
            echo "Saved: $output" >&2
            exit 0
        fi
        rm -f "$output"
    fi
else
    echo "  [selenium] skipped — module not installed (pip install selenium)" >&2
fi

# Step 4 — headless Chrome. Kept as a long shot: as of 2026-08-06 it does NOT
# clear the Altcha wall, but it costs little and may work if the wall is lifted.
if [ -x "$CHROME" ]; then
    for mirror in "${MIRRORS[@]:0:2}"; do
        echo "  [headless] ${mirror}/${doi}" >&2
        html=$(timeout 60 "$CHROME" --headless=new --disable-gpu --no-sandbox \
            --timeout=45000 --virtual-time-budget=20000 \
            --dump-dom "${mirror}/${doi}" 2>/dev/null || true)
        [ -z "$html" ] && continue
        echo "$html" | grep -qiE 'altcha|not a bot' && { echo "    Still walled" >&2; continue; }
        pdf_url=$(echo "$html" | grep -oE '(src|href)="[^"]*(/storage/|/downloads/)[^"]*\.pdf[^"]*"' \
            | head -1 | sed 's/^[a-z]*="//; s/"$//' || true)
        [ -z "$pdf_url" ] && { echo "    No PDF URL in page" >&2; continue; }
        case "$pdf_url" in
            //*) pdf_url="https:$pdf_url" ;;
            /*)  pdf_url="${mirror}${pdf_url}" ;;
        esac
        if download_and_verify "$pdf_url" "$mirror/"; then
            echo "Saved: $output" >&2
            exit 0
        fi
    done
fi

if [ "$walled" -eq 1 ]; then
    print_browser_handoff "$doi"
    exit 2
fi

echo "FAILED: Could not download from any source" >&2
exit 1
