# Dealing with document repository

## Websites and skills

There are websites that do not work with the _WebFetch_ tool.

Always use MCP Chrome browser insead of Web Fatch to read content.

**For MCP Chrome Browser**: Use the browser automation tools:

1. Check browser is connected by calling `tabs_context_mcp`
2. Navigate to the URL using `navigate`
3. If CAPTCHA appears, ask the user to complete it manually
4. Extract content using `javascript_tool` (preferred) or `get_page_text`

The browser runs visibly in your Chrome session with your logged-in state.

See `.claude/skills/README-browser.md` for full documentation.

## JavaScript DOM Extraction Patterns

**Prefer DOM** for text content. Use `javascript_tool` to extract content directly from the DOM - it's faster, more accurate, and uses less context than OCR from screenshots. Only use screenshots when you need to see visual layout or interact with coordinates. Extract HTML from the page and directly work on HTML.

**Never use screenshots and scroll down for content extraction - instead of directly extract the content from DOM/exported HTML.**

**Generic content extraction**:

```javascript
(() => {
  const title =
    document
      .querySelector('h1, [class*="title"], article h1, .post-title')
      ?.innerText?.trim() || document.title;
  const author =
    document
      .querySelector(
        '[class*="author"], [rel="author"], .byline, [class*="byline"]',
      )
      ?.innerText?.trim() || "";
  const content =
    document
      .querySelector(
        'article, [class*="content"], [class*="post-body"], .thread-content, main',
      )
      ?.innerText?.trim() || document.body.innerText.substring(0, 10000);
  return JSON.stringify({
    title,
    author,
    content: content.substring(0, 15000),
  });
})();
```

**Site-specific selectors**:
| Site | Selector |
|------|----------|
| ThreadReaderApp | `document.querySelector('.thread-content, .content-tweet')?.innerText` |
| Medium | `document.querySelector('article')?.innerText` |
| Substack | `document.querySelector('.post-content, .body')?.innerText` |
| Twitter/X | `document.querySelector('[data-testid="tweetText"]')?.innerText` |
| SSRN | `document.querySelector('.abstract-text, #abstract')?.innerText` |
