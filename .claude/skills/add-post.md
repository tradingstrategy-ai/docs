---
name: add-post
description: Add a new blog post or article to the documentation collection
---

# Add new blog post

Add a new blog post or article to the documentation collection.

## Input

- URL to a blog post/article or to a tweet/discussion about a blog post

## Steps

1. **Find the canonical blog post page**: If the input URL is:
   - A tweet (x.com or twitter.com): Use Playwright to fetch the tweet content since WebFetch cannot access Twitter/X. Navigate to the URL, extract the blog post link from the tweet using JavaScript DOM manipulation.
   - A direct blog post URL: Use that URL
   - Other: Use the provided URL
   - For X.com (Twitter) links, it can be either a X post or X article - handle articles as posts

   **Important**: If WebFetch fails or returns no useful content (common with Twitter/X, sites requiring JavaScript), use Playwright with Node.js to navigate to the page and extract the information.

2. **Extract blog post information**:
   - **Title**: The full blog post title
   - **Author/Source**: The author name or blog/publication name
   - **Description**: A concise summary (1-2 paragraphs) describing what the post covers

   **For pages with JavaScript/CAPTCHA**: Use Playwright to scrape the details:
   - Create a Node.js script using Playwright to navigate to the page
   - Use `browser.launch({ headless: false })` to open a visible browser window if needed
   - If CAPTCHA appears, ask the user to complete it manually, then continue extraction
   - Extract title from `h1` element and description from article content or meta description

3. **Determine category**: Based on the extracted content, automatically determine the category:
   - **Trading/Finance** (goes to `source/learn/blog-posts.rst`) - for posts about algorithmic trading, quantitative finance, market analysis, portfolio management, risk management, backtesting, etc.
   - **AI/ML** (goes to `source/learn/ai-and-machine-learning.rst`) - for posts primarily about machine learning, deep learning, neural networks, or AI techniques applied to trading

   Only ask the user if the content is ambiguous (e.g., equally about ML techniques AND trading strategies). If clearly one category, proceed without asking.

4. **Add to the appropriate .rst file**: Use this exact format (matching existing entries):

   ```rst
   Title of the Blog Post
   ----------------------

   Description paragraph(s) here. Keep it informative but concise.

   Two paragraph summary of the post here.

   `Read the blog post <https://url-here>`__.
   ```

   Or with author attribution:

   ```rst
   Title of the Blog Post
   ----------------------

   Description paragraph(s) here.

   Two paragraph summary of the post here.

   By Author Name.

   `Read the blog post <https://url-here>`__.
   ```

   Important formatting notes:
   - The underline of dashes must be at least as long as the title
   - There should be a blank line after the title underline
   - There should be a blank line before the "Read the blog post" link
   - The link format uses double underscores at the end: `__`
   - Use "Read the blog post" or "Read the article" or "Read more" as appropriate
   - Add the new entry at the END of the file

If the source of the link is a discussion like a tweet, then include a paragraph with a link to that tweet with the comment "Mentioned by XXX in this discussion" and include what they say about it.

5. **Commit and push**:
   - Stage the modified file
   - Commit with message: "Add: {Blog Post Title}"
   - Push to master branch
