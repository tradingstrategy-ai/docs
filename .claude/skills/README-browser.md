# Browser Automation in Claude Code

Use Chrome browser automation with Claude Code via the MCP Chrome extension.

## Prerequisites

1. **Claude in Chrome extension** (v1.0.36+) - [Chrome Web Store](https://chromewebstore.google.com/detail/claude/fcoeoabgfenejglbffodgkkbkcdhcgfn)
2. **Google Chrome** running
3. **Direct Anthropic plan** (Pro, Max, Team, or Enterprise)

## Activating Browser

### VS Code

Browser tools are automatically available when the Chrome extension is connected. Use `@browser` in your prompts:

```
@browser open https://medium.com/some-article
@browser navigate to the SSRN paper and extract the abstract
```

To check connection status, try any browser action. If it fails, ensure:

- Chrome is running
- The Claude in Chrome extension is enabled

### CLI

Enable browser with the `--chrome` flag or `/chrome` command:

```bash
# Start with browser enabled
claude --chrome

# Or enable in an existing session
/chrome
```

Use `/chrome` anytime to check status, manage permissions, or reconnect.

## Permission Popups

There are **two independent permission layers**, and silencing one does not
silence the other:

| Layer | Where it appears | What it asks | How to stop it |
| --- | --- | --- | --- |
| Claude Code permissions | Terminal / VS Code | "Run `mcp__claude-in-chrome__computer`?" | Add `mcp__claude-in-chrome` to `permissions.allow` in a settings file |
| Chrome extension | In the browser | "Allow Claude to work on this domain?" | Choose the persistent "always allow" option, or pre-approve domains in the extension settings |

For the Claude Code layer, the server name alone allows every tool on that
server. There is **no** `mcp__server__*` wildcard — `mcp__claude-in-chrome__*`
matches nothing. Either form works:

```json
{ "permissions": { "allow": ["mcp__claude-in-chrome"] } }        // whole server
{ "permissions": { "allow": ["mcp__claude-in-chrome__navigate"] } }  // one tool
```

Settings are read at session start, so a new rule needs `/config` or a restart
before it takes effect.

The extension layer is **per-domain**, which is why a research session that
touches many hosts prompts repeatedly. Pre-approving the domains in the "Sites
Requiring Browser" table below removes most of the friction. Some confirmations
for genuinely consequential actions are deliberately not suppressible.

## Available MCP Tools

| Tool                    | Purpose                                     |
| ----------------------- | ------------------------------------------- |
| `tabs_context_mcp`      | Get available tabs, check connection        |
| `tabs_create_mcp`       | Create a new tab                            |
| `navigate`              | Go to URL, forward/back in history          |
| `read_page`             | Get accessibility tree of page elements     |
| `find`                  | Find elements by natural language           |
| `computer`              | Click, type, scroll, screenshot, record GIF |
| `javascript_tool`       | Execute JS in page context                  |
| `form_input`            | Fill form fields                            |
| `get_page_text`         | Extract plain text from page                |
| `read_console_messages` | Read browser console output                 |
| `read_network_requests` | Monitor XHR/fetch requests                  |

## Using Browser in Skills

Skills describe the workflow; Claude calls browser tools directly when executing.

### Check Browser Connection

Skills that require browser should start with:

```markdown
1. **Check browser is activated**:
   - Call `tabs_context_mcp` to verify browser connection
   - If it fails, ask the user to enable browser:
     - VS Code: Ensure Chrome extension is connected
     - CLI: Run `claude --chrome` or type `/chrome`
```

### Sites Requiring Browser

These sites block WebFetch/curl and require browser automation:

| Site | Why | Notes |
| --- | --- | --- |
| **medium.com** | Blocks automated requests | |
| **substack.com** | Requires JavaScript | Posts are usually public; `--print-to-pdf` works without login |
| **papers.ssrn.com** | Cloudflare challenge | Usually clears itself; download button works once through |
| **x.com / twitter.com** | Requires authentication | |
| **www.sciencedirect.com** | Cloudflare CAPTCHA + session-bound PDF URLs | Even open-access PDFs need the browser |
| **www.econstor.eu** | Anubis proof-of-work wall | Browser passes it; curl gets a challenge page |
| **link.springer.com** | Abstract is free, PDF paywalled | Abstract pages are often rich enough to catalogue from |
| **sci-hub.\*** | Altcha proof-of-work wall | See `fetch-paper` skill for the storage-URL handoff |
| **researchgate.net** | Login wall, blocks scraping | Treat as unobtainable |

### Blocker Handling

Not every "are you a robot" page is a CAPTCHA. Identify which one you have
before deciding what to do — this matters, because asking the user to solve
something unsolvable wastes their time.

| Blocker | How it looks | What to do |
| --- | --- | --- |
| **Proof-of-work** (Altcha, Anubis) | A progress bar or "verifying" text with **nothing to click** | Do not ask the user — there is no challenge to solve. The browser clears it on its own; curl never will. |
| **Cloudflare Turnstile** | "Are you a robot?" with a checkbox widget | Wait 10–20s and re-screenshot — it frequently auto-clears. If it truly needs a click, ask the user. |
| **Image/puzzle CAPTCHA** | Grid of images, distorted text | Ask the user to complete it manually, then continue. |

Never attempt to solve or bypass a real CAPTCHA yourself.

### Clicking Reliably

**Always take a screenshot immediately before clicking, and click from that
screenshot's coordinates.** Pages reflow after their initial render and stale
coordinates silently hit the wrong element — the click "succeeds" and nothing
happens, which is easy to misread as a broken tool.

Observed on SSRN: a "this is a preprint" banner appears a second after load and
pushes the download button down by ~50px. Two clicks were silently lost to this
before it was diagnosed. If a click produces no effect, re-screenshot and
compare positions before retrying.

After a click that should navigate, call `tabs_context_mcp` to read the
resulting URL — that is how you capture redirect targets (e.g. Sci-Hub's storage
URL) that are not visible in the page DOM.

### Example Skill Pattern

```markdown
## Steps

1. **Check browser is activated**: Call `tabs_context_mcp` to verify connection.

2. **Navigate to the page**: Use `navigate` to open the URL.
   The browser runs visibly in Chrome with your logged-in session.

3. **Handle CAPTCHA if needed**: If CAPTCHA appears, ask user to complete it.

4. **Extract content**: Use `get_page_text` or `read_page` to extract content.
```

## Setup: Enabling Downloads Folder Access

Skills use `~/Downloads` as an intermediate location when generating PDFs from authenticated pages via html2pdf.js. macOS blocks access by default.

To grant access:

1. Open **System Settings** > **Privacy & Security** > **Files and Folders**
2. Find **Visual Studio Code** (or your terminal app)
3. Enable **Downloads Folder**

Alternatively, enable **Full Disk Access** for the app under **Privacy & Security** > **Full Disk Access**.

Without this, the PDF save step in skills will fail when trying to move files from Downloads to `articles/`.

## Saving PDFs

Use headless Chrome `--print-to-pdf` from the command line via Bash.

### Fetching an existing PDF from a curl-hostile host

**Verified working 2026-08-06** — this supersedes an earlier note claiming
programmatic downloads are always dropped by Chrome. A blob download triggered
from `javascript_tool` *does* reach `~/Downloads`, and it is the best tool for a
site that already serves a real PDF but blocks curl (proof-of-work walls such as
EconStor's Anubis, or session-bound URLs such as ScienceDirect's).

Run this on a page of the **same origin** as the PDF:

```javascript
const r = await fetch('/path/to/file.pdf');   // same-origin: cookies ride along
const b = await r.blob();
const sig = new TextDecoder().decode(await b.slice(0,5).arrayBuffer());
let status = 'not-pdf:' + sig;
if (sig.startsWith('%PDF')) {
  const a = document.createElement('a');
  a.href = URL.createObjectURL(b);
  a.download = 'name.pdf';
  document.body.appendChild(a); a.click(); a.remove();
  status = 'downloaded ' + b.size + ' bytes';
}
status
```

Then `mv ~/Downloads/name.pdf articles/`.

Notes learned the hard way:

- It beats clicking Chrome's own PDF-viewer download button, which opens a
  **native save dialog** that automation cannot drive.
- Always check the `%PDF` signature before saving — challenge pages return HTML
  with a 200 status.
- ScienceDirect: click **View PDF** first, then run this on the resulting tab.
  Fetching the `/pdf` link directly only returns an interstitial.
- Do not return `document.cookie` or full query-string URLs from
  `javascript_tool`; that output is blocked. You never need to — use
  `location.pathname + location.search` inside the snippet instead.

### Generating a PDF from a page that has none

For blog posts and tutorials, use headless Chrome `--print-to-pdf` via the Bash
tool. Add `--virtual-time-budget=15000` so lazy-loaded content renders:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --no-pdf-header-footer \
  --print-to-pdf=articles/FILENAME.pdf \
  "URL"
```

For authenticated/paywalled pages, use the MCP browser to extract the full HTML first, save it to a temp file, then print that:

```bash
# After extracting HTML via javascript_tool and saving to /tmp/page.html
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --no-pdf-header-footer \
  --print-to-pdf=articles/FILENAME.pdf \
  /tmp/page.html
```

### Requirements

- Google Chrome installed at `/Applications/Google Chrome.app`
- `articles/` directory must exist (create it first if needed)

### Why not other approaches?

| Approach                              | Problem                                                        |
| ------------------------------------- | -------------------------------------------------------------- |
| Chrome PDF-viewer download button     | Opens a native save dialog automation cannot drive             |
| `Cmd+P` / `window.print()`           | Opens native dialog, blocks MCP browser extension              |
| CDP `Page.printToPDF`                 | Not accessible from `javascript_tool` (page context only)      |
| Base64 transfer via `javascript_tool` | Output too large; use the blob download above instead          |
| `wkhtmltopdf`                         | Removed from Homebrew, no longer maintained                    |

An earlier version of this table claimed blob / `<a download>` downloads are
silently dropped in the MCP context. That was **wrong** — see the blob-download
section above, which is now the preferred method for an existing PDF.

## Troubleshooting

| Issue                            | Solution                                              |
| -------------------------------- | ----------------------------------------------------- |
| `/chrome` not working in VS Code | Use `@browser` instead (VS Code feature)              |
| Extension not detected           | Check `chrome://extensions`, restart Chrome           |
| Tab errors                       | Call `tabs_context_mcp` to refresh tab IDs            |
| Dialog blocking                  | Avoid triggering JS alerts; dismiss manually if stuck |
| Permission denied                | Approve domain in popup or Chrome extension settings; see Permission Popups |
| Click does nothing               | Page reflowed — re-screenshot and click fresh coordinates |
| `[BLOCKED: Cookie/query string data]` | JS returned a cookie or query-string URL. Do the work inside the snippet and return only a status string |
| Downloaded "PDF" is HTML         | Verify `head -c 5 file.pdf` is `%PDF`. Never test with `file x.pdf \| grep -i pdf` — that matches the *filename* |
| `chrome://` navigation refused   | MCP cannot open browser-internal URLs; inspect extension settings manually |
