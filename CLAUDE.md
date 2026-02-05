# Dealing with document repository

## Websites and skills

There are websites that do not work with _Web Fetch_ tool.

Always use Playwright for the following sites, never use Web Fetch:

- Medium.com
- Substack.com
- papers.ssrn.com

**For Playwright**: Use Playwright to scrape the paper details:

- Create a Node.js script using Playwright to navigate to the SSRN page
- Use `browser.launch({ headless: false })` to open a visible browser window
- If CAPTCHA appears, ask the user to complete it manually, then continue extraction
- Extract title from `h1` element and abstract from `.abstract-text` element
- Example flow:
  1.  Launch browser with `headless: false`
  2.  Navigate to SSRN URL
  3.  Wait and check if CAPTCHA is present
  4.  If CAPTCHA: inform user and wait for them to complete it
  5.  Extract title and abstract after page loads
