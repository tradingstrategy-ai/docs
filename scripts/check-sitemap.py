#!/usr/bin/env python3
"""Check the generated docs sitemap for broken URLs.

Catches the class of bug where our sphinx-sitemap monkey-patch drifts from
the upstream package and writes URLs like
``https://tradingstrategy.ai/docs/('index.html', None)``.

Usage:
    python scripts/check-sitemap.py [SITEMAP]

Defaults to build/html/sitemap-docs.xml.
Exit code 0 if the sitemap is valid, 1 if any errors found.
"""

import sys
from pathlib import Path
from xml.etree import ElementTree

NS = {"sm": "http://www.sitemaps.org/schemas/sitemap/0.9"}
BASE_URL = "https://tradingstrategy.ai/docs/"


def check_sitemap(path: Path) -> list[str]:
    """Return list of error messages for the sitemap file."""
    root = ElementTree.parse(path).getroot()
    urls = root.findall("sm:url", NS)
    if not urls:
        return [f"{path}: no <url> entries"]

    errors = []
    for url in urls:
        loc = url.findtext("sm:loc", default="", namespaces=NS)
        if not loc.startswith(BASE_URL):
            errors.append(f"URL outside {BASE_URL}: {loc}")
        elif any(c in loc for c in "()',\" ") or loc.endswith("None"):
            errors.append(f"Malformed URL: {loc}")
        elif not (loc.endswith(".html") or loc.endswith("/")):
            errors.append(f"URL is not a page: {loc}")

        if url.findtext("sm:priority", namespaces=NS) is None:
            errors.append(f"Missing <priority>: {loc}")

    return errors


def main():
    path = Path(sys.argv[1] if len(sys.argv) > 1 else "build/html/sitemap-docs.xml")
    errors = check_sitemap(path)
    for error in errors[:20]:
        print(error)
    if errors:
        print(f"{path}: {len(errors)} errors")
        sys.exit(1)
    count = len(ElementTree.parse(path).getroot().findall("sm:url", NS))
    print(f"{path}: {count} URLs OK")


if __name__ == "__main__":
    main()
