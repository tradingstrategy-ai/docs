# Paper Index (`articles/index.json`)

Central catalog of every paper, blog post, and article referenced across `source/learn/*.rst` files.

## Schema

Each entry is a JSON object:

```json
{
  "title": "Paper Title",
  "authors": "Author1, Author2" or null,
  "publication_year": 2024 or null,
  "download_page": "https://arxiv.org/abs/...",
  "source_file": "momentum.rst",
  "included_in_index_at": "2026-06-05",
  "filename": "paper-title.pdf" or null,
  "downloaded_at": "2026-06-05" or null,
  "download_failure_reason": null or "ssrn_paywall" or "publisher_paywall" or "requires_browser" or "not_attempted" or "not_a_paper"
}
```

### Field definitions

| Field | Type | Description |
|---|---|---|
| `title` | string | RST section heading for the entry |
| `authors` | string \| null | Author names if mentioned in the .rst text |
| `publication_year` | int \| null | Year of publication if stated |
| `download_page` | string | Canonical URL (arXiv abstract, SSRN page, blog post URL) |
| `source_file` | string | Which `source/learn/*.rst` file contains the entry |
| `included_in_index_at` | string | ISO date when entry was added to `index.json` |
| `filename` | string \| null | PDF filename in `articles/` directory, or null if not downloaded |
| `downloaded_at` | string \| null | ISO date when PDF was saved |
| `download_failure_reason` | string \| null | Why the PDF is missing (null = downloaded OK) |

### `download_failure_reason` values

- `null` — PDF exists in `articles/`
- `ssrn_paywall` — SSRN blocks direct download; needs browser or manual save
- `publisher_paywall` — Behind ScienceDirect, Springer, Wiley, etc.
- `requires_browser` — Blog posts and social media that need browser rendering
- `not_attempted` — Freely accessible (e.g. arXiv) but not yet downloaded
- `not_a_paper` — GitHub repos, tools, course pages — no PDF expected

## How to update when adding a paper

After adding a new entry to a `.rst` file and (optionally) downloading its PDF, append to `articles/index.json`:

```python
import json
from datetime import date

with open("articles/index.json") as f:
    index = json.load(f)

index.append({
    "title": "New Paper Title",
    "authors": "Author1, Author2",
    "publication_year": 2026,
    "download_page": "https://arxiv.org/abs/XXXX.XXXXX",
    "source_file": "momentum.rst",
    "included_in_index_at": str(date.today()),
    "filename": "new-paper-title.pdf",        # or null if not downloaded
    "downloaded_at": str(date.today()),         # or null
    "download_failure_reason": None             # or reason string
})

# Keep sorted by source_file then title
index.sort(key=lambda x: (x.get("source_file", ""), x["title"]))

with open("articles/index.json", "w") as f:
    json.dump(index, f, indent=2, ensure_ascii=False)
```

Or manually: add the JSON object to the array, keeping it sorted by `source_file` then `title`.

## PDF filename convention

Slugified title: lowercase, alphanumeric and hyphens only, max ~80 chars.

```
"Factor Momentum and the Momentum Factor" → factor-momentum-and-the-momentum-factor.pdf
```

Some older PDFs use author-based names (e.g., `ackerer-hugonnier-jermann-perpetual-futures-pricing.pdf`). Both conventions are acceptable; the `filename` field is the source of truth.

## Current stats (as of 2026-06-05)

- **625 entries** across 25 `.rst` files
- **362 with PDFs** (58%)
- **263 without PDFs**: 103 require browser, 76 SSRN paywall, 75 not attempted, 24 not papers, 23 publisher paywall
- **~111 orphan PDFs** in `articles/` not yet matched to entries (mostly author-named files)

## Bulk operations

### Download all `not_attempted` arXiv papers

```bash
python3 -c "
import json
with open('articles/index.json') as f:
    index = json.load(f)
for e in index:
    if e['download_failure_reason'] == 'not_attempted' and 'arxiv.org' in e['download_page']:
        print(e['download_page'], e['title'][:60])
"
```

### Find entries missing from the index

Compare `.rst` link count against index entries per file to detect gaps.
