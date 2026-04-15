---
name: add-code-repository
description: Add a new code repository to the documentation collection. Use when user provides a URL to a GitHub, GitLab, Bitbucket, source repository, or a discussion linking to one.
argument-hint: [url]
---

# Add code repository

Add a new code repository to the documentation collection.

## Input

- URL to a code repository or to a discussion linking to one

## Steps

1. **Check browser is activated**:
   - Call `tabs_context_mcp` to verify browser connection
   - If it fails, ask the user to enable browser:
     - VS Code: Ensure Chrome extension is connected
     - CLI: Run `claude --chrome` or type `/chrome`

2. **Find the canonical repository page**:
   - If the input URL is a repository page on GitHub, GitLab, Bitbucket, SourceHut, Codeberg, or another source host: use that repository URL.
   - If the input URL is a tweet, LinkedIn post, blog post, forum post, or other discussion: use browser automation to navigate to the page and extract the repository link.
   - If multiple repositories are linked, choose the primary repository discussed by the source. Ask only if there is no clear primary repository.

   **Important**: For Twitter/X, LinkedIn, and sites requiring JavaScript, use browser automation instead of WebFetch.

3. **Extract repository information**:
   - **Name**: Repository or project name
   - **Owner/maintainer**: Account, organisation, or author
   - **Description**: What the repository does and who it is for
   - **README content**: Enough to understand usage, installation, examples, and project maturity
   - **Primary language**
   - **License**
   - **Install/run instructions**
   - **Examples, notebooks, demos, or sample data**
   - **Maintenance signals**: latest visible activity, release status, issue state, or obvious archived/unmaintained status

   **For pages requiring browser**: Use `navigate`, then `javascript_tool` or `get_page_text` to extract README and metadata. If CAPTCHA appears, ask the user to complete it manually.

4. **Handle forks carefully**:
   - Detect whether the repository is a fork or mirror of another mainline repository.
   - If it is a fork, identify the upstream/mainline repository and compare the fork against it before adding anything.
   - Look for material differences such as new features, changed examples, added datasets, active maintenance, meaningful bug fixes, a different research direction, or clearer/reproducible packaging.
   - If there are meaningful differences, document only those major differences from the mainline repository. Make clear that it is a fork and why this fork is worth listing separately.
   - If there are no meaningful differences from the mainline repository, skip the fork. Do not add duplicate or low-value fork entries.
   - If the mainline repository is not already documented and is the better canonical source, add the mainline repository instead of the fork.

5. **Check for duplicates**:
   - Search `source/learn/code-repositories.rst` for the repository name, owner/name slug, and canonical URL.
   - IMPORTANT: If the repository already exists, do not add it again.

6. **Add to `source/learn/code-repositories.rst`**:
   - Add the new entry at the END of the file before any blank lines at the very end.
   - Use this exact format:

```rst
Repository Name
---------------

Description paragraph explaining what the repository is and who it is for.

Our summary: practical assessment of what is inside, how useful it is, and notable strengths or caveats.

Practical details: primary language, install or run instructions if available, example code/notebooks/data availability, license, and maintenance status if visible.

`View repository <https://canonical-repository-url>`__
```

   Important formatting notes:

   - The underline of dashes must be at least as long as the title.
   - There should be a blank line after the title underline.
   - There should be a blank line before the "View repository" link.
   - The link format uses double underscores at the end: `__`.

   If the source is a discussion like a tweet, LinkedIn post, blog post, or forum thread, include a paragraph before the repository link:

```rst
Mentioned by XXX in `this discussion <https://discussion-url-here>`__: summary of what people say about it.
```

7. **Commit and push**:
   - Stage only the modified documentation file.
   - Commit with message: `Add: {Repository Name}`.
   - Push to the master branch.

8. **Do not save PDF snapshots**:
   - Repository pages are live code resources.
   - Do not run the PDF generation workflow used by paper or article skills.
