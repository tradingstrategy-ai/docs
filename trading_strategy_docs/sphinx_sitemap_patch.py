"""Monkey-patch sphinx-sitemap to support <priority> XML argument

Wraps the upstream ``create_sitemap`` and adds ``<priority>`` to the XML file it writes.

We used to carry a copy of the upstream function instead. That copy broke when
sphinx-sitemap 2.7 started queueing ``(link, last_updated)`` tuples, and every URL
in the sitemap became ``https://tradingstrategy.ai/docs/('index.html', None)``.
Do not copy upstream internals here again.

Check the build output with ``scripts/check-sitemap.py``.
"""

from pathlib import Path
from xml.etree import ElementTree

from sphinx.application import Sphinx

import sphinx_sitemap

PRIORITY = 0.8

SITEMAP_NS = "http://www.sitemaps.org/schemas/sitemap/0.9"
XHTML_NS = "http://www.w3.org/1999/xhtml"

_upstream_create_sitemap = sphinx_sitemap.create_sitemap


def _add_priority(filename: Path):
    """Add <priority> to every <url> in a sitemap file written by sphinx-sitemap."""
    # Keep the default and xhtml namespaces unprefixed when writing the file back
    ElementTree.register_namespace("", SITEMAP_NS)
    ElementTree.register_namespace("xhtml", XHTML_NS)

    tree = ElementTree.parse(filename)
    preceding_tags = {f"{{{SITEMAP_NS}}}loc", f"{{{SITEMAP_NS}}}lastmod"}

    for url in tree.getroot().findall(f"{{{SITEMAP_NS}}}url"):
        if url.find(f"{{{SITEMAP_NS}}}priority") is not None:
            continue
        priority = ElementTree.Element(f"{{{SITEMAP_NS}}}priority")
        priority.text = str(PRIORITY)
        # The sitemap schema orders children as loc, lastmod, changefreq, priority
        index = sum(1 for child in url if child.tag in preceding_tags)
        url.insert(index, priority)

    tree.write(filename, xml_declaration=True, encoding="utf-8", method="xml")


def _create_sitemap_patched(app: Sphinx, exception):
    _upstream_create_sitemap(app, exception)

    filename = Path(app.outdir) / app.config.sitemap_filename
    if filename.exists():
        _add_priority(filename)


sphinx_sitemap.create_sitemap = _create_sitemap_patched
