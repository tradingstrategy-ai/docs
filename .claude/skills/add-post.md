---
name: add-post
description: Add a new blog post or article to the documentation collection
---

# Add new blog post

Add a new blog post or article to the documentation collection.

## Input

- URL to a blog post/article or to a tweet/discussion about a blog post

## Steps

1. **Check browser is activated**:
   - Call `tabs_context_mcp` to verify browser connection
   - If it fails, ask the user to enable browser:
     - VS Code: Ensure Chrome extension is connected
     - CLI: Run `claude --chrome` or type `/chrome`

2. **Find the canonical blog post page**: If the input URL is:
   - A tweet (x.com or twitter.com): Use browser to navigate to the tweet, extract the blog post link
   - A direct blog post URL: Use that URL
   - Medium.com or Substack.com: Use browser (WebFetch is blocked)
   - Other: Use the provided URL
   - For X.com (Twitter) links, it can be either a X post or X article - handle articles as posts

   **Important**: For Twitter/X, Medium, Substack, and sites requiring JavaScript, use browser automation instead of WebFetch.

3. **Extract blog post information**:
   - **Title**: The full blog post title
   - **Author/Source**: The author name or blog/publication name
   - **Description**: A concise summary (1-2 paragraphs) describing what the post covers

   **For pages requiring browser**: Use `navigate` to open the page, then use `javascript_tool` to extract content. See **CLAUDE.md > JavaScript DOM Extraction Patterns** for selectors and examples.

   If CAPTCHA appears, ask the user to complete it manually.

4. **Determine category**: Based on the extracted content, automatically determine the category:
   - **Trading/Finance** (goes to `source/learn/blog-posts.rst`) - for posts about algorithmic trading, quantitative finance, market analysis, portfolio management, risk management, backtesting, etc.
   - **AI/ML** (goes to `source/learn/ai-and-machine-learning.rst`) - for posts primarily about machine learning, deep learning, neural networks, or AI techniques applied to trading
     **Not trading related**: Don't add this post. If the user specifically asked to add this post, ask user for confrimation.

   Only ask the user if the content is ambiguous (e.g., equally about ML techniques AND trading strategies). If clearly one category, proceed without asking.

5. **Add to the appropriate .rst file**: Use this exact format (matching existing entries):

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

6. **Commit and push**:
   - Stage the modified file
   - Commit with message: "Add: {Blog Post Title}"
   - Push to master branch

7. **Save as PDF** (manual step):
   - Ensure the browser is on the post page
   - Tell the user the suggested filename: `articles/<slugified-title>.pdf`
   - Ask the user to save the page as PDF themselves (Cmd+P → "Save as PDF" → save to `articles/`)
   - **Do not** use `computer` tool with `key` Cmd+P or `window.print()` — these trigger a native dialog that blocks the browser extension
   - Create the `articles/` directory if it doesn't exist
   - If the user skips this step, proceed without the PDF
