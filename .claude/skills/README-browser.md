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

## Saving PDFs

Use headless Chrome `--print-to-pdf` from the command line via Bash.

### Why not html2pdf.js via MCP browser?

The MCP Chrome extension's `javascript_tool` executes in a context where **programmatic downloads are silently dropped** by Chrome. Even with `isTrusted=true` clicks via the `computer` tool, blob/data-URI downloads never reach disk. This affects all download methods (html2pdf.js `.save()`, `<a download>` clicks, `window.location` blob URLs). The root cause is likely Chrome's tab group or extension execution environment suppressing download events.

### How it works

Use headless Chrome `--print-to-pdf` via the Bash tool:

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
| html2pdf.js via MCP `javascript_tool` | Downloads silently dropped — Chrome suppresses in MCP context  |
| `Cmd+P` / `window.print()`           | Opens native dialog, blocks MCP browser extension              |
| CDP `Page.printToPDF`                 | Not accessible from `javascript_tool` (page context only)      |
| Base64 transfer via `javascript_tool` | Blocked by MCP tool                                            |
| `wkhtmltopdf`                         | Removed from Homebrew, no longer maintained                    |

## Troubleshooting

| Issue                            | Solution                                              |
| -------------------------------- | ----------------------------------------------------- |
| `/chrome` not working in VS Code | Use `@browser` instead (VS Code feature)              |
| Extension not detected           | Check `chrome://extensions`, restart Chrome           |
| Tab errors                       | Call `tabs_context_mcp` to refresh tab IDs            |
| Dialog blocking                  | Avoid triggering JS alerts; dismiss manually if stuck |
| Permission denied                | Approve domain in popup or Chrome extension settings  |
