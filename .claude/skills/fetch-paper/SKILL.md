---
name: fetch-paper
description: Fetch a non-accessible paper PDF via Sci-Hub. Use when a paper is behind a paywall or not freely available. Accepts a DOI, paper URL, or arXiv ID.
---

# Fetch paper via Sci-Hub

Download a paper PDF that is behind a paywall using Sci-Hub.

Use a background subagent for the steps. If you are downloading multiple papers, use max 4 concurrent subagents.

## Input

- A DOI (e.g., `10.1016/j.jfineco.2023.01.001`), paper URL, or arXiv ID
- Optional: desired filename for the PDF

## Steps

1. **Determine the identifier**:
   - If the input is a DOI (starts with `10.`), use it directly
   - If the input is an arXiv URL, extract the arXiv ID (e.g., `2301.12345`)
   - If the input is a publisher URL (e.g., ScienceDirect, Springer, Wiley, SSRN), use the full URL
   - If the input is already a DOI URL (`doi.org/10.xxx`), extract the DOI part

2. **Use the fetch-scihub.sh script**:
   The script handles all Sci-Hub interaction (multiple mirrors, CAPTCHA bypass via headless Chrome, PDF extraction and verification).

   ```bash
   ./scripts/fetch-scihub.sh "<doi-or-url>" "articles/<filename>.pdf"
   ```

   The script will:
   - Try curl first (fast path, works when no CAPTCHA)
   - Fall back to headless Chrome (bypasses JS-based CAPTCHAs on most mirrors)
   - Try multiple mirrors: sci-hub.st, sci-hub.ru, sci-hub.se
   - Resolve ScienceDirect PII URLs to DOIs via CrossRef
   - Verify the downloaded file is a valid PDF > 10KB

3. **If fetch-scihub.sh fails**, try alternative approaches:
   - If the user has browser MCP available, use `navigate` to go to `https://sci-hub.st/{identifier}`, ask user to solve CAPTCHA if needed, then extract PDF URL via `javascript_tool` and download with curl
   - Try the arXiv preprint: search for the paper title on arXiv
   - Suggest the user download manually from their institutional access

4. **Generate the filename** (if not provided):
   - Slugify the paper title: lowercase, replace spaces/special chars with dashes, remove consecutive dashes
   - If no title is available, derive from the DOI

5. **Verify the download**:
   ```bash
   ls -la articles/FILENAME.pdf
   file articles/FILENAME.pdf
   ```
   - File must be > 10KB and identified as PDF

6. **Report result**:
   - Tell the user the PDF was saved to `articles/FILENAME.pdf`
   - If the paper title was extracted, display it

## Batch fetching

For fetching many papers at once, use the batch script:

```bash
# Dry run — see what needs fetching
./scripts/fetch-missing-papers.sh --dry-run

# Fetch with 2 parallel jobs (default)
./scripts/fetch-missing-papers.sh

# Fetch with 4 parallel jobs
./scripts/fetch-missing-papers.sh --parallel 4
```

The batch script has a mapping of filename → DOI for known papers. Add new entries to the `PAPERS` associative array in the script.
