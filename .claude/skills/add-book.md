---
name: add-book
description: Add a new book to the documentation collection
---

# Add new book

Add a new book to the documentation collection.

## Input

- URL to a book (Amazon, publisher page, etc.) or to a tweet/discussion about the book

## Steps

1. **Check browser is activated**:
   - Call `tabs_context_mcp` to verify browser connection
   - If it fails, ask the user to enable browser:
     - VS Code: Ensure Chrome extension is connected
     - CLI: Run `claude --chrome` or type `/chrome`

2. **Find the canonical book page**: If the input URL is:
   - A tweet (x.com or twitter.com): Use browser to navigate to the tweet, take a screenshot, and extract the book link
   - An Amazon page: Use that URL
   - A publisher page: Use that URL
   - Other: Use the provided URL

   **Important**: For Twitter/X and sites requiring JavaScript, use browser automation instead of WebFetch.

3. **Extract book information**:
   - **Title**: The full book title
   - **Author(s)**: The book author(s)
   - **Description**: A concise summary (1-3 paragraphs) describing what the book covers and who it's for

   **For pages requiring browser**: Use `navigate` to open the page, then `get_page_text` or `read_page` to extract content. If CAPTCHA appears, ask the user to complete it manually.

4. **Determine category**: Based on the extracted content, automatically determine the category:
   - **Trading/Finance** (goes to `source/learn/books.rst`) - for books about algorithmic trading, quantitative finance, portfolio management, risk management, market microstructure, etc.
   - **AI/ML** (goes to `source/learn/ai-and-machine-learning.rst`) - for books primarily about machine learning, deep learning, neural networks, or AI techniques applied to trading

   Only ask the user if the content is ambiguous (e.g., equally about ML techniques AND trading strategies). If clearly one category, proceed without asking.

5. **Add to the appropriate .rst file**: Use this exact format (matching existing entries):

   ```rst
   Title of the Book
   -----------------

   Description paragraph(s) here. Keep it informative but concise.

   `Buy the book <https://amazon-or-publisher-url-here>`__
   ```

   Or for free books:

   ```rst
   Title of the Book
   -----------------

   Description paragraph(s) here.

   `Read the book <https://url-here>`__
   ```

   Important formatting notes:
   - The underline of dashes must be at least as long as the title
   - There should be a blank line after the title underline
   - There should be a blank line before the "Buy/Read the book" link
   - The link format uses double underscores at the end: `__`
   - Use "Buy the book" for paid books (Amazon, etc.) and "Read the book" or "Read more" for free resources
   - Add the new entry BEFORE the "Further reading lists" section in books.rst

If the source of the link is a discussion like a tweet, then include a paragraph with a link to that tweet with the comment "Mentioned by XXX in this discussion" and include what they say about it.

6. **Commit and push**:
   - Stage the modified file
   - Commit with message: "Add: {Book Title}"
   - Push to master branch

7. **Save as PDF** (automated via browser MCP):
   - Create the `articles/` directory if it doesn't exist
   - Ensure the browser is on the book page (use `navigate` if needed)
   - Use `javascript_tool` to inject html2pdf.js and generate the PDF:
     ```javascript
     // Step 1: Inject html2pdf.js
     await new Promise(r => {
       if (typeof html2pdf !== 'undefined') return r();
       const s = document.createElement('script');
       s.src = 'https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.2/html2pdf.bundle.min.js';
       s.onload = r;
       document.head.appendChild(s);
     });
     // Step 2: Generate and download PDF
     const el = document.querySelector('#bookDescription_feature_div') || document.querySelector('article') || document.querySelector('main');
     await html2pdf().set({
       filename: '<slugified-title>.pdf',
       margin: [10, 10, 10, 10],
       image: { type: 'jpeg', quality: 0.92 },
       html2canvas: { scale: 2, useCORS: true },
       jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
     }).from(el).save();
     ```
   - Wait a few seconds for the download to complete
   - Move from `~/Downloads/<slugified-title>.pdf` to `articles/`
   - This uses the MCP browser session (has user cookies, works for authenticated pages)
   - **Do not** use `computer` tool with `key` Cmd+P or `window.print()` — these trigger a native dialog that blocks the browser extension
