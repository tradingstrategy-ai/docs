---
name: fetch-paper
description: Fetch a paper PDF that is not freely downloadable. Tries open-access sources first, then Sci-Hub via a browser handoff. Accepts a DOI, paper URL, or arXiv ID.
---

# Fetch a paywalled paper

Download a paper PDF, preferring legitimate open-access copies and falling back
to Sci-Hub.

Use a background subagent for the steps. If you are downloading multiple papers,
use max 4 concurrent subagents. **Exception:** the browser handoff below cannot
be parallelised — it drives the single shared Chrome session, so do those one at
a time in the main thread.

## Input

- A DOI (e.g. `10.1016/j.jfineco.2023.01.001`), paper URL, or arXiv ID
- Optional: desired filename for the PDF

## What changed (verified 2026-08-06)

Read this before trying the old recipes:

- **Sci-Hub's challenge is Altcha proof-of-work, not an image CAPTCHA.** There
  is nothing for a human to click. Asking the user to "solve the CAPTCHA" does
  not help. curl always gets the challenge page.
- **Headless Chrome does not clear it either** (tested with
  `--virtual-time-budget` up to 40s). Only a real browser session passes.
- **A real browser session does pass it automatically.** After the PDF renders,
  clicking Sci-Hub's download button lands on a storage host
  (`sci-hub.cat/storage/...`) that serves the PDF to plain curl with no
  challenge. That is the handoff the script is built around.
- **Mirrors:** `sci-hub.se` has no DNS record; `sci-hub.st` resolves but times
  out. Working: `.ru`, `.wf`, `.ee`, `.red`, `.al`, `.box`.
- **`selenium` is not installed**, so that fallback is skipped with a hint
  rather than a traceback.

## Steps

1. **Determine the identifier**
   - DOI (starts with `10.`) — use directly
   - `doi.org/10.xxx` — the script strips the prefix
   - Publisher URL (ScienceDirect etc.) — pass the full URL; the script
     resolves the PII to a DOI via CrossRef
   - No DOI at hand? Resolve one by title first:
     ```bash
     curl -s "https://api.crossref.org/works?rows=2&query.bibliographic=<title>" \
       | python3 -c "import json,sys;[print(i['DOI'],'|',i['title'][0]) for i in json.load(sys.stdin)['message']['items']]"
     ```

2. **Run the script** — it tries open access first, then Sci-Hub:

   ```bash
   ./scripts/fetch-scihub.sh "<doi-or-url>" "articles/<slug>.pdf"
   ```

   Order of attempts:
   1. **Open access** via OpenAlex (`best_oa_location`, all `locations`,
      `oa_url`). arXiv DOIs (`10.48550/arXiv.*`) go straight to
      `arxiv.org/pdf/<id>`. Landing pages fail verification and fall through.
   2. **Sci-Hub mirrors** via curl — currently all walled, but cheap to try and
      the wall is applied inconsistently.
   3. **selenium**, only if the module is importable.
   4. **headless Chrome** as a long shot.

   Use `--oa-only` to skip Sci-Hub entirely when you just want to know whether a
   legitimate copy exists.

3. **Read the exit code** — it tells you exactly what to do next:

   | Code | Meaning | Action |
   |---|---|---|
   | 0 | Saved and verified | Done |
   | 1 | Not found / download failed | Try alternates (step 5) |
   | 2 | **Altcha wall — needs the browser** | Do the handoff (step 4) |
   | 3 | Genuinely not in Sci-Hub | Try alternates (step 5) |

4. **Browser handoff (exit code 2).** The script prints these steps with the
   DOI filled in:

   1. `navigate` to `https://sci-hub.ru/<DOI>`
   2. `computer screenshot` — confirm the PDF rendered
   3. `computer left_click` the download arrow in **Sci-Hub's own dark overlay
      bar** at the bottom of the page — *not* Chrome's PDF toolbar at the top.
      Chrome's toolbar button opens a native save dialog that automation cannot
      drive; Sci-Hub's button navigates to the storage URL.
   4. `tabs_context_mcp` — the tab URL is now the storage URL
   5. Feed it back to the script, which downloads and verifies:
      ```bash
      ./scripts/fetch-scihub.sh --storage "<storage-url>" "articles/<slug>.pdf"
      ```

   **Always screenshot before clicking.** Page layouts shift after load (SSRN
   pushes its buttons ~50px down when a preprint banner appears), and a click at
   a stale coordinate silently hits the wrong element.

5. **If Sci-Hub does not have it**, in rough order of success rate:
   - **Author / institutional page** — search the title plus `pdf`; working
     papers are very often on a personal or departmental site
   - **Repository copy** — EconStor, RePEc, CORE, SSRN preprint of the same
     paper (an SSRN version often exists under a different DOI)
   - **arXiv** — search the title
   - **Curl-hostile but free hosts.** Some open repositories (EconStor uses
     Anubis proof-of-work; ScienceDirect blocks curl) serve fine in the browser.
     Navigate there and use the same download-then-`--storage` idea, or grab the
     direct bitstream URL via `javascript_tool`:
     ```javascript
     JSON.stringify([...document.querySelectorAll('a')]
       .map(a => a.getAttribute('href'))
       .filter(h => h && /\.pdf|bitstream/i.test(h)).slice(0, 6))
     ```
   - **Theses** are often restricted with no open copy at all (e.g. Aalto's
     thesis database). Catalogue with
     `download_failure_reason: "publisher_paywall"` and move on.

6. **Filename**: slugify the title — lowercase, dashes for spaces and special
   characters, no consecutive dashes. Derive from the DOI if no title.

7. **Verify** — the script already does this, but if you download by hand,
   check the **magic bytes**, never `file`:

   ```bash
   head -c 5 articles/FILE.pdf   # must print %PDF
   pdfinfo articles/FILE.pdf | awk '/^Pages/'
   ```

   `file articles/FILE.pdf | grep -i pdf` is a **false-positive trap**: `file`
   echoes the path, and the path ends in `.pdf`, so an HTML challenge page
   passes. This bug silently shipped HTML files as PDFs before it was fixed.

8. **Report**: the path saved, the page count, and — if you fell back — which
   source it came from, so the index entry's `download_failure_reason` is
   accurate.

## Batch fetching

```bash
./scripts/fetch-missing-papers.sh --dry-run     # see what needs fetching
./scripts/fetch-missing-papers.sh               # 2 parallel jobs
./scripts/fetch-missing-papers.sh --parallel 4
```

The batch script maps filename → DOI in its `PAPERS` array. Note that anything
requiring the browser handoff will report exit code 2 and be skipped — collect
those and do them interactively.
