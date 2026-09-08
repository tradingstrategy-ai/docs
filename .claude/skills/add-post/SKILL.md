---
name: add-post
description: Add a new blog post or article to the documentation collection. Use when user provides a URL to a blog post, article, or tweet linking to one.
argument-hint: [url]
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

4. **Choose the target file**: Trading/finance and AI/ML posts are filed into the most specific **topic file** under `source/learn/` — there is no catch-all `blog-posts.rst`. Pick the single best-matching file, for example:
   - `cryptocurrency.rst`, `carry-trade.rst`, `defi-amm.rst`, `market-microstructure.rst`, `order-flow.rst` — crypto and microstructure
   - `momentum.rst`, `trend-following.rst`, `mean-reversion.rst`, `statistical-arbitrage.rst`, `volatility.rst`, `equity-factors.rst`, `market-regimes.rst`, `signal-decomposition.rst`, `time-series.rst` — strategies and signals
   - `backtesting.rst`, `portfolio-construction.rst`, `risk-management.rst`, `liquidity-provision.rst`, `algorithmic-trading.rst`, `algorithmic-trading-frameworks.rst` — process and infrastructure
   - `machine-learning.rst`, `reinforcement-learning.rst` — posts primarily about ML/RL techniques applied to trading

   Run `ls source/learn/*.rst` to see the full, current list and match the post to the closest topic. If several fit, choose the one the post spends the most on; only ask the user when it is genuinely ambiguous.

   **Not trading related**: Don't add this post. If the user specifically asked to add it anyway, ask the user for confirmation.

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

6. **Save as PDF**: Follow the procedure in **README-browser.md > Saving PDFs > How it works** using:
   - URL: the blog post URL
   - FILENAME: `<slugified-title>.pdf`
   - Save to `articles/` directory

7. **Update the article index**: After adding the entry to the `.rst` file and saving the PDF, update `articles/index.json`. See `.claude/docs/paper-index.md` for the full schema. Append a new entry:

   ```json
   {
     "title": "Blog Post Title",
     "authors": "Author Name or Publication",
     "publication_year": 2026,
     "download_page": "https://canonical-url",
     "source_file": "target-file.rst",
     "included_in_index_at": "YYYY-MM-DD",
     "filename": "slugified-title.pdf",
     "downloaded_at": "YYYY-MM-DD",
     "download_failure_reason": null,
     "short_description": "One paragraph (2-3 sentences) describing what the post covers and its key takeaway."
   }
   ```

   Set `source_file` to the exact topic file you added the entry to in step 5 (e.g. `cryptocurrency.rst` or `volatility.rst`). If the PDF could not be saved, set `filename` and `downloaded_at` to `null` and set `download_failure_reason` to the appropriate reason (`requires_browser`, `paywall`, `not_attempted`).

   Keep the array sorted by `source_file` then `title`.

8. **Commit and push**:
   - Stage the modified `.rst` file, the PDF (force-add with `git add -f`, since `articles/*.pdf` is gitignored), and `articles/index.json`
   - Commit with message: "Add: {Blog Post Title}"
   - Push to master branch
