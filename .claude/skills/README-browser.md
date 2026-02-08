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

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `/chrome` not working in VS Code | Use `@browser` instead (VS Code feature) |
| Extension not detected | Check `chrome://extensions`, restart Chrome |
| Tab errors | Call `tabs_context_mcp` to refresh tab IDs |
| Dialog blocking | Avoid triggering JS alerts; dismiss manually if stuck |
| Permission denied | Approve domain in popup or Chrome extension settings |
