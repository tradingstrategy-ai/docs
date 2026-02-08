# Dealing with document repository

## Websites and skills

There are websites that do not work with the _WebFetch_ tool.

Always use MCP Chrome browser for the following sites, never use WebFetch:

- Medium.com
- Substack.com
- papers.ssrn.com
- x.com / twitter.com

**For MCP Chrome Browser**: Use the browser automation tools:

1. Check browser is connected by calling `tabs_context_mcp`
2. Navigate to the URL using `navigate`
3. If CAPTCHA appears, ask the user to complete it manually
4. Extract content using `get_page_text` or `read_page`

The browser runs visibly in your Chrome session with your logged-in state.

See `.claude/skills/README-browser.md` for full documentation.
