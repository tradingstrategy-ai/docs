---
name: tweet-content
description: Pick a random item from the trading content collection and compose a tweet about it on X
---

# Tweet trading content

Pick a random item from the algorithmic trading content collection (papers, blog posts, AI/ML resources) and compose a tweet about it on X (Twitter).

## Steps

1. **Extract all tweetable items from RST files**: Read the following RST files and extract every entry (title, description, URL, author if present, and any "Mentioned by" discussion links):
   - `source/learn/papers.rst`
   - `source/learn/ai-and-machine-learning.rst`
   - `source/learn/blog-posts.rst`

   For each entry, extract:
   - **title**: The RST section title
   - **url**: The link URL from the `Read the paper/post/...` line
   - **description**: The description paragraph(s)
   - **author**: Author name if present (lines starting with "By ")
   - **mention_url**: Any Twitter/X discussion URL from "Mentioned by" lines
   - **mention_author**: The person who mentioned it
   - **mention_quote**: What they said about it
   - **source_file**: Which RST file it came from

   Write the full list as a Markdown file to the scratchpad directory at:
   `/private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweetable-items.md`

   Format each item as:
   ```markdown
   ## Title Here
   - **URL**: https://...
   - **Source**: papers.rst | ai-and-machine-learning.rst | blog-posts.rst
   - **Author**: Name (if available)
   - **Discussion**: [Mentioned by X](https://x.com/...) (if available)
   - **Description**: Brief description...
   ```

2. **Pick a random item**: Select one item at random from the list. Tell the user which item was selected.

3. **Download the article image**: Use the Playwright image download script to fetch the last content image from the article (typically the most impactful chart or result). The image is saved to `~/Downloads/` with a descriptive filename:
   ```bash
   node .claude/skills/scripts/download-article-image.js "<URL>" "<TITLE>"
   ```
   The script saves the image to `~/Downloads/tweet-<slugified-title>.png`.
   It filters out tiny icons, avatars, and logos, keeping only real content images. If no content images are found, it falls back to a viewport screenshot.

   If the download fails (e.g., CAPTCHA, paywall), tell the user and proceed without an image.

4. **Look up author Twitter handle**: If the item has a known author, look up their Twitter/X handle:
   - Read `source/learn/influencers.rst` and match the author name to a listed handle
   - If the author is not in influencers.rst, check the item's URL/page for a Twitter handle clue (e.g., an X.com link in the post, or the author's profile). If found, add the author to the appropriate section of `source/learn/influencers.rst`
   - Store the handle (e.g., `@pedma7`) for use in the tweet

5. **Create tweet text**: Write a concise two-line summary of the item suitable for a tweet. Guidelines:
   - First line: What the paper/post is about and why it matters (the hook)
   - Second line: A key finding or insight
   - Attribute the author with "By @handle" (using the Twitter handle from step 4)
   - Add the URL at the end
   - If the item has a "Mentioned by" discussion, add a line like: `Discussed by @handle here: <discussion_url>`
   - Keep the total under 280 characters (excluding the URL which X auto-shortens to 23 chars)
   - Use a professional but engaging tone appropriate for fintwit/quant twitter

   Save the tweet text to the scratchpad:
   `/private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweet-text.txt`

6. **Copy tweet text to clipboard and open X compose**:
   ```bash
   cat /private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweet-text.txt | pbcopy
   ```
   ```bash
   open "https://x.com/compose/post"
   ```
   This copies the tweet text to the clipboard and opens the X compose window in the user's default browser (with their signed-in session).

7. **Stop and wait**: Tell the user:
   - "The tweet text has been copied to your clipboard (Cmd+V to paste)."
   - "The article image is saved at: ~/Downloads/tweet-<name>.png -- drag it into the compose window to attach."
   - "X compose is open in your browser. Paste, attach the image, review, and post."
   Do NOT attempt to post the tweet automatically.
