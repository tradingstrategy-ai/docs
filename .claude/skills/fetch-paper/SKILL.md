---
name: fetch-paper
description: Fetch a non-accessible paper PDF via Sci-Hub. Use when a paper is behind a paywall or not freely available. Accepts a DOI, paper URL, or arXiv ID.
---

# Fetch paper via Sci-Hub

Download a paper PDF that is behind a paywall using Sci-Hub (https://sci-hub.ru/).

## Input

- A DOI (e.g., `10.1016/j.jfineco.2023.01.001`), paper URL, or arXiv ID
- Optional: desired filename for the PDF

## Steps

1. **Check browser is activated**:
   - Call `tabs_context_mcp` to verify browser connection
   - If it fails, ask the user to enable browser:
     - VS Code: Ensure Chrome extension is connected
     - CLI: Run `claude --chrome` or type `/chrome`

2. **Determine the identifier**:
   - If the input is a DOI (starts with `10.`), use it directly
   - If the input is an arXiv URL, extract the arXiv ID (e.g., `2301.12345`)
   - If the input is a publisher URL (e.g., ScienceDirect, Springer, Wiley, SSRN), use the full URL
   - If the input is already a DOI URL (`doi.org/10.xxx`), extract the DOI part

3. **Navigate to Sci-Hub**:
   - Use `navigate` to go to `https://sci-hub.ru/{identifier}`
     - For DOIs: `https://sci-hub.ru/10.1016/j.jfineco.2023.01.001`
     - For URLs: `https://sci-hub.ru/https://www.sciencedirect.com/...`
     - For arXiv IDs: `https://sci-hub.ru/arXiv:2301.12345`

4. **Handle CAPTCHA if needed**:
   - Use `javascript_tool` to check for CAPTCHA presence:
     ```javascript
     !!document.querySelector('img[id="captcha"], .captcha, input[name="captcha"]')
     ```
   - If CAPTCHA is present, ask the user to complete it manually in the visible Chrome window
   - Wait for user confirmation before proceeding

5. **Locate the PDF**:
   - Use `javascript_tool` to find the PDF embed or download link:
     ```javascript
     (() => {
       const embed = document.querySelector('embed[type="application/pdf"], iframe[src*=".pdf"], #pdf');
       if (embed) return embed.src || embed.getAttribute('src');
       const link = document.querySelector('a[onclick*="location.href"], #buttons a, a[href*=".pdf"]');
       if (link) return link.href || link.getAttribute('onclick')?.match(/location\.href='([^']+)'/)?.[1];
       return null;
     })()
     ```
   - If no PDF is found, check if Sci-Hub shows an error message:
     ```javascript
     document.querySelector('#smile, .container p, #main p')?.innerText
     ```
   - If the paper is not available on Sci-Hub, inform the user and suggest alternatives (arXiv, author's website, institutional access)

6. **Extract the PDF URL**:
   - The PDF URL may be protocol-relative (starting with `//`), prepend `https:` if needed
   - The URL typically looks like `https://sci-hub.ru/downloads/...` or `https://twin.sci-hub.ru/...`

7. **Download the PDF**:
   - Generate the filename: slugify the paper title (lowercase, replace spaces/special chars with dashes, remove consecutive dashes)
   - If no title is available, derive from the DOI or use the identifier
   - Download using `curl` via Bash:
     ```bash
     curl -L -o articles/FILENAME.pdf "PDF_URL"
     ```
   - If curl fails (some Sci-Hub mirrors require browser cookies), fall back to browser-based download:
     1. Use `navigate` to open the direct PDF URL in the browser
     2. Use `javascript_tool` to extract the PDF as base64 or use headless Chrome:
        ```bash
        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
          --headless --no-pdf-header-footer \
          --print-to-pdf=articles/FILENAME.pdf \
          "PDF_URL"
        ```

8. **Verify the download**:
   - Check the file exists and has a reasonable size (> 10KB):
     ```bash
     ls -la articles/FILENAME.pdf
     ```
   - If the file is too small or is HTML instead of PDF, the download likely failed — retry with the browser fallback method
   - Verify it's actually a PDF:
     ```bash
     file articles/FILENAME.pdf
     ```

9. **Report result**:
   - Tell the user the PDF was saved to `articles/FILENAME.pdf`
   - If the paper title was extracted, display it
   - Ask if the user also wants to add the paper to the documentation collection (invoke the `add-paper` skill if yes)
