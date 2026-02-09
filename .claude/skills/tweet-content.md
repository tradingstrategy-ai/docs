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

4. **Capture the article screenshot**: Use browser MCP to navigate to the article URL and save a screenshot. Steps:
   - Use `navigate` to open the article URL
   - Wait for page to load; if CAPTCHA appears, ask the user to complete it manually
   - Use `computer` with action `screenshot` to capture the page
   - Save the screenshot to disk using `javascript_tool`:
     ```javascript
     // Get the screenshot as a data URL and trigger a download
     // Alternatively, use the returned screenshot data from the computer tool
     ```
   - Save the image to the scratchpad:
     `/private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweet-image.png`
   - If saving fails, use Bash: `screencapture` or fall back to a manual approach

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

7. **Open X compose and prepare the draft in browser**:
   Use browser MCP to navigate to X and fill in the tweet compose form with text and image.

   a. **Navigate to X compose**:
      - Use `navigate` to open `https://x.com/compose/post`
      - Wait for the compose dialog to load
      - If a login page or CAPTCHA appears, ask the user to handle it, then continue

   b. **Type the tweet text**:
      - Use `find` to locate the tweet text input area (the contenteditable div in the compose dialog)
      - Use `computer` with action `click` to focus the text input
      - Use `computer` with action `type` to type the tweet text character by character
      - Alternatively, use `javascript_tool` to set the text directly:
        ```javascript
        (() => {
          const editor = document.querySelector('[data-testid="tweetTextarea_0"] [contenteditable="true"]');
          if (!editor) return 'ERROR: Could not find tweet editor';
          editor.focus();
          // Use execCommand to trigger React's change detection
          document.execCommand('insertText', false, TWEET_TEXT_HERE);
          return 'OK';
        })();
        ```
      - Verify the text appears correctly using `computer` with action `screenshot`

   c. **Attach the screenshot image** (if one was captured in step 4):
      - Use `find` to locate the media upload button (the image/photo icon in the compose toolbar)
      - Use `computer` with action `click` on the media upload button
      - This opens a file picker dialog — use `form_input` or `computer` to interact with it
      - Navigate to the screenshot file:
        `/private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweet-image.png`
      - If the file picker cannot be automated, fall back to copying the file path to clipboard and tell the user to paste it:
        ```bash
        echo "/private/tmp/claude/-Users-moo-code-docs/882c5ece-843e-4dd4-ab2c-94ca5a77e61c/scratchpad/tweet-image.png" | pbcopy
        ```
      - Wait for the image thumbnail to appear in the compose dialog

   d. **Take a confirmation screenshot**:
      - Use `computer` with action `screenshot` to capture the compose dialog with text and image ready
      - Show this to the user for review

8. **Stop and wait for user approval**: Tell the user:
   - "The tweet draft is ready in your browser with text and image attached."
   - "Please review the compose window and click Post when ready."
   - If the image could not be attached automatically: "The screenshot path has been copied to your clipboard — use the media button in the compose window to attach it manually."
   Do NOT click the Post button. The user must post manually.
