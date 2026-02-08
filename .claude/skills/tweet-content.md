---
name: tweet-content
description: Pick a random item from the trading content collection and compose a tweet about it on X
---

# Tweet trading content

Pick a random item from the algorithmic trading content collection (papers, blog posts, AI/ML resources) and compose a tweet about it on X (Twitter).

## Steps

1. **Check browser is activated**:
   - Call `tabs_context_mcp` to verify browser connection
   - If it fails, ask the user to enable browser:
     - VS Code: Ensure Chrome extension is connected
     - CLI: Run `claude --chrome` or type `/chrome`

2. **Extract all tweetable items from RST files**: Read the following RST files and extract every entry (title, description, URL, author if present, and any "Mentioned by" discussion links):
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

3. **Pick a random item**: Select one item at random from the list. Tell the user which item was selected.

4. **Download the article image**: Use browser to navigate to the article URL and capture a screenshot of the main content. Steps:
   - Use `navigate` to open the article URL
   - Wait for page to load, handle CAPTCHA if needed
   - Use `computer` with action `screenshot` to capture the page
   - The screenshot ID can be used with `upload_image` if needed

   If the page cannot be accessed (paywall, CAPTCHA), tell the user and proceed without an image.

5. **Look up author Twitter handle**: If the item has a known author, look up their Twitter/X handle:
   - Read `source/learn/influencers.rst` and match the author name to a listed handle
   - If the author is not in influencers.rst, use browser to check the article page for a Twitter handle clue (e.g., an X.com link in the post, or the author's profile). If found, add the author to the appropriate section of `source/learn/influencers.rst`
   - Store the handle (e.g., `@pedma7`) for use in the tweet

6. **Create tweet text**: Write a concise two-line summary of the item suitable for a tweet. Guidelines:
   - First line: What the paper/post is about and why it matters (the hook)
   - Second line: A key finding or insight
   - Attribute the author with "By @handle" (using the Twitter handle from step 5)
   - Add the URL at the end
   - If the item has a "Mentioned by" discussion, add a line like: `Discussed by @handle here: <discussion_url>`
   - Keep the total under 280 characters (excluding the URL which X auto-shortens to 23 chars)
   - Use a professional but engaging tone appropriate for fintwit/quant twitter

   Save the tweet text to the scratchpad:
   `/private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweet-text.txt`

7. **Copy tweet text to clipboard and open X compose**:
   ```bash
   cat /private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweet-text.txt | pbcopy
   ```
   ```bash
   open "https://x.com/compose/post"
   ```
   This copies the tweet text to the clipboard and opens the X compose window in the user's default browser (with their signed-in session).

8. **Stop and wait**: Tell the user:
   - "The tweet text has been copied to your clipboard (Cmd+V to paste)."
   - "If a screenshot was captured, you can drag it into the compose window."
   - "X compose is open in your browser. Paste, attach any image, review, and post."
   Do NOT attempt to post the tweet automatically.
