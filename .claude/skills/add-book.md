# Add new book

Add a new book to the documentation collection.

## Input

- URL to a book (Amazon, publisher page, etc.) or to a tweet/discussion about the book

## Steps

1. **Determine book category**: Ask the user whether this is:
   - A **trading/finance book** (goes to `source/learn/books.rst`) - for books about algorithmic trading, quantitative finance, portfolio management, etc.
   - An **AI/ML book** (goes to `source/learn/ai-and-machine-learning.rst`) - for books about machine learning and AI applied to trading

2. **Find the canonical book page**: If the input URL is:
   - A tweet (x.com or twitter.com): Use Playwright to fetch the tweet content since WebFetch cannot access Twitter/X. Navigate to the URL, extract the book link from the tweet using JavaScript DOM manipulation.
   - An Amazon page: Use that URL
   - A publisher page: Use that URL
   - Other: Use the provided URL

   **Important**: If WebFetch fails or returns no useful content (common with Twitter/X, sites requiring JavaScript), use Playwright with Node.js to navigate to the page and extract the information.

3. **Extract book information**:
   - **Title**: The full book title
   - **Author(s)**: The book author(s)
   - **Description**: A concise summary (1-3 paragraphs) describing what the book covers and who it's for

   **For pages with JavaScript/CAPTCHA**: Use Playwright to scrape the book details:
   - Create a Node.js script using Playwright to navigate to the page
   - Use `browser.launch({ headless: false })` to open a visible browser window
   - If CAPTCHA appears, ask the user to complete it manually, then continue extraction
   - Extract title, author, and description from the page

4. **Add to the appropriate .rst file**: Use this exact format (matching existing entries):

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

5. **Commit and push**:
   - Stage the modified file
   - Commit with message: "Add: {Book Title}"
   - Push to master branch
