---
name: add-paper
description: Add a new research paper to the documentation collection
---

# Add new paper

Add a new research paper to the documentation collection.

## Input

- URL to a paper or to a tweet about a paper

## Steps

1. **Find the canonical paper page**: If the input URL is:
   - A tweet (x.com or twitter.com): Use Playwright MCP browser to fetch the tweet content since WebFetch cannot access Twitter/X. Navigate to the URL, take a screenshot, and extract the paper link from the tweet.
   - An arXiv abstract page: Use that URL
   - An SSRN page: Use that URL
   - A PDF direct link: Try to find the canonical landing page (e.g., arXiv abstract page instead of PDF)
   - Other: Use the provided URL

   **Important**: If WebFetch fails or returns no useful content (common with Twitter/X, sites requiring JavaScript), use the Playwright MCP browser tool to navigate to the page and extract the information.

2. **Extract paper information**:
   - **Title**: The full paper title
   - **Description**: A concise summary (1-3 paragraphs) describing what the paper is about, its methodology, and key findings

   **For SSRN papers**: Use Playwright to scrape the paper details:
   - Create a Node.js script using Playwright to navigate to the SSRN page
   - Use `browser.launch({ headless: false })` to open a visible browser window
   - If CAPTCHA appears, ask the user to complete it manually, then continue extraction
   - Extract title from `h1` element and abstract from `.abstract-text` element
   - Example flow:
     1. Launch browser with `headless: false`
     2. Navigate to SSRN URL
     3. Wait and check if CAPTCHA is present
     4. If CAPTCHA: inform user and wait for them to complete it
     5. Extract title and abstract after page loads

3. **Determine category**: Based on the extracted content, automatically determine the category:
   - **Trading/Finance** (goes to `source/learn/papers.rst`) - for papers about algorithmic trading, portfolio optimization, market microstructure, momentum strategies, risk management, etc.
   - **AI/ML** (goes to `source/learn/ai-and-machine-learning.rst`) - for papers primarily about machine learning, deep learning, reinforcement learning, or AI techniques applied to trading

   Only ask the user if the content is ambiguous (e.g., equally about ML techniques AND trading strategies). If clearly one category, proceed without asking.

4. **Add to the appropriate .rst file**: Use this exact format (matching existing entries):

   ```rst
   Title of the Paper
   ------------------

   Description paragraph(s) here. Keep it informative but concise.

   `Read the paper <https://canonical-url-here>`__
   ```

   Important formatting notes:
   - The underline of dashes must be at least as long as the title
   - There should be a blank line after the title underline
   - There should be a blank line before the "Read the paper" link
   - The link format uses double underscores at the end: `__`
   - Add the new entry at the END of the file (before any blank lines at the very end)

If the source of the link is discussion like a tweet, then include a paragraph with a link to that tweet and with the comment "Mentioned by XXX in this discussion" and this is what people say about it".

5. **Commit and push**:
   - Stage the modified file
   - Commit with message: "Add: {Paper Title}"
   - Push to master branch
