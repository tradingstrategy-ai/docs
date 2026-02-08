---
name: add-paper
description: Add a new research paper to the documentation collection
---

# Add new paper

Add a new research paper to the documentation collection.

## Input

- URL to a paper or to a tweet about a paper

## Steps

1. **Check browser is activated**:
   - Call `tabs_context_mcp` to verify browser connection
   - If it fails, ask the user to enable browser:
     - VS Code: Ensure Chrome extension is connected
     - CLI: Run `claude --chrome` or type `/chrome`

2. **Find the canonical paper page**: If the input URL is:
   - A tweet (x.com or twitter.com): Use browser to navigate to the tweet, take a screenshot, and extract the paper link
   - An arXiv abstract page: Use that URL
   - A PDF direct link: Try to find the canonical landing page (e.g., arXiv abstract page instead of PDF)
   - SSRN: Use browser (WebFetch is blocked)
   - Other: Use the provided URL

   **Important**: For Twitter/X, SSRN, and sites requiring JavaScript, use browser automation instead of WebFetch.

3. **Extract paper information**:
   - **Title**: The full paper title
   - **Description**: A concise summary (1-3 paragraphs) describing what the paper is about, its methodology, and key findings
   - **Full text**: Needed for summarisation later

   **For pages requiring browser**: Use `navigate` to open the page, then `get_page_text` or `read_page` to extract content. If CAPTCHA appears, ask the user to complete it manually.

4. **Determine category**: Based on the extracted content, automatically determine the category:
   - **Trading/Finance** (goes to `source/learn/papers.rst`) - for papers about algorithmic trading, portfolio optimization, market microstructure, momentum strategies, risk management, etc.
   - **AI/ML** (goes to `source/learn/ai-and-machine-learning.rst`) - for papers primarily about machine learning, deep learning, reinforcement learning, or AI techniques applied to trading

   Only ask the user if the content is ambiguous (e.g., equally about ML techniques AND trading strategies). If clearly one category, proceed without asking.

5. **Add to the appropriate .rst file**: Use this exact format (matching existing entries):

Write a custom summary for the paper by reading it and summarising highlights.

Then add the

```rst
Title of the Paper
------------------

Description paragraph(s) here fom the paper itself. Keep it informative but concise.

Our summary of the contents.

`Read the paper <https://canonical-url-here>`__
```

Important formatting notes:

- The underline of dashes must be at least as long as the title
- There should be a blank line after the title underline
- There should be a blank line before the "Read the paper" link
- The link format uses double underscores at the end: `__`
- Add the new entry at the END of the file (before any blank lines at the very end)

If the source of the link is discussion like a tweet, then include a paragraph with a link to that tweet and with the comment "Mentioned by XXX in this discussion" and this is what people say about it".

IMPORTANT. If the paper already exists, do not add it again.

6. **Commit and push**:
   - Stage the modified file
   - Commit with message: "Add: {Paper Title}"
   - Push to master branch
