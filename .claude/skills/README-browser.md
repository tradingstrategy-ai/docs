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

When using browser tools, Claude may ask for permission to visit specific domains. **Approve these prompts** to allow browser automation. You can also pre-approve domains in the Chrome extension settings.

## Available MCP Tools

| Tool | Purpose |
|------|---------|
| `tabs_context_mcp` | Get available tabs, check connection |
| `tabs_create_mcp` | Create a new tab |
| `navigate` | Go to URL, forward/back in history |
| `read_page` | Get accessibility tree of page elements |
| `find` | Find elements by natural language |
| `computer` | Click, type, scroll, screenshot, record GIF |
| `javascript_tool` | Execute JS in page context |
| `form_input` | Fill form fields |
| `get_page_text` | Extract plain text from page |
| `read_console_messages` | Read browser console output |
| `read_network_requests` | Monitor XHR/fetch requests |

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

These sites block WebFetch and require browser automation:

- **Medium.com** - Blocks automated requests
- **Substack.com** - Requires JavaScript
- **papers.ssrn.com** - May show CAPTCHA
- **x.com / twitter.com** - Requires authentication

### CAPTCHA Handling

When a CAPTCHA appears:
1. The browser window is visible (uses your Chrome session)
2. Ask the user to complete it manually
3. Continue extraction after user confirms

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

## PDF Generation

Skills generate PDFs automatically using html2pdf.js injected via the MCP browser — no manual Cmd+P needed.

### How it works

1. Ensure the browser is on the target page (use `navigate` if needed)
2. Use `javascript_tool` to inject html2pdf.js and generate the PDF:
   ```javascript
   // Step 1: Inject html2pdf.js
   await new Promise(r => {
     if (typeof html2pdf !== 'undefined') return r();
     const s = document.createElement('script');
     s.src = 'https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.2/html2pdf.bundle.min.js';
     s.onload = r;
     document.head.appendChild(s);
   });
   // Step 2: Generate and download PDF (replace SELECTOR and FILENAME)
   const el = document.querySelector(SELECTOR);
   await html2pdf().set({
     filename: FILENAME,
     margin: [10, 10, 10, 10],
     image: { type: 'jpeg', quality: 0.92 },
     html2canvas: { scale: 2, useCORS: true },
     jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
   }).from(el).save();
   ```
3. Wait a few seconds for the download to complete
4. Move from `~/Downloads/<filename>.pdf` to `articles/`
5. Create the `articles/` directory first if it doesn't exist

This uses the MCP browser session (has user cookies), so it works for both public and authenticated/paywalled pages.

**Do not** use `computer` tool with `key` Cmd+P or `window.print()` — these trigger a native dialog that blocks the browser extension.

### Requirements

- Browser MCP must be connected (see setup above)
- `~/Downloads` must be accessible (see "Enabling Downloads Folder Access")
- Chrome must not have "Ask where to save" enabled (default is off)

### Why not other approaches?

| Approach | Problem |
|----------|---------|
| `Cmd+P` / `window.print()` | Opens native dialog, blocks MCP browser extension |
| Headless Chrome `--print-to-pdf` | No cookies — fails on authenticated/paywalled pages |
| CDP `Page.printToPDF` | Not accessible from `javascript_tool` (page context only) |
| Base64 transfer via `javascript_tool` | Blocked by MCP tool |

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `/chrome` not working in VS Code | Use `@browser` instead (VS Code feature) |
| Extension not detected | Check `chrome://extensions`, restart Chrome |
| Tab errors | Call `tabs_context_mcp` to refresh tab IDs |
| Dialog blocking | Avoid triggering JS alerts; dismiss manually if stuck |
| Permission denied | Approve domain in popup or Chrome extension settings |
