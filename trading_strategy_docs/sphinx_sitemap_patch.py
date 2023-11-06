"""Monkey-patch sphinx-sitemap to support <priority> XML argument

"""

import os
import queue
from multiprocessing import Manager
from pathlib import Path
from typing import Any, Dict, List, Optional
from xml.etree import ElementTree
import logging

from sphinx.application import Sphinx
from sphinx.util.logging import getLogger

import sphinx_sitemap
from sphinx_sitemap import get_locales, hreflang_formatter

PRIORITY = 0.8

logger = logging.getLogger(__name__)


# def _create_sitemap_patched_old(app, exception):
#     """Generates the sitemap.xml from the collected HTML page links"""
#     site_url = app.builder.config.site_url or app.builder.config.html_baseurl
#     if site_url:
#         site_url.rstrip("/") + "/"
#     else:
#         logger.warning(
#             "sphinx-sitemap: html_baseurl is required in conf.py." "Sitemap not built.",
#             type="sitemap",
#             subtype="configuration",
#         )
#         return
#
#     env = app.builder.env
#     import ipdb ; ipdb.set_trace()
#     if env.sitemap_links.empty():
#         logger.info(
#             "sphinx-sitemap: No pages generated for %s" % app.config.sitemap_filename,
#             type="sitemap",
#             subtype="information",
#         )
#         return
#
#     ET.register_namespace("xhtml", "http://www.w3.org/1999/xhtml")
#
#     root = ET.Element("urlset", xmlns="http://www.sitemaps.org/schemas/sitemap/0.9")
#
#     locales = get_locales(app, exception)
#
#     if app.builder.config.version:
#         version = app.builder.config.version + "/"
#     else:
#         version = ""
#
#     while True:
#         try:
#             link = env.sitemap_links.get_nowait()
#         except queue.Empty:
#             break
#
#         url = ET.SubElement(root, "url")
#         scheme = app.config.sitemap_url_scheme
#         if app.builder.config.language:
#             lang = app.builder.config.language + "/"
#         else:
#             lang = ""
#
#         ET.SubElement(url, "loc").text = site_url + scheme.format(
#             lang=lang, version=version, link=link
#         )
#
#         ET.SubElement(url, "priority").text = str(PRIORITY)
#
#         for lang in locales:
#             lang = lang + "/"
#             ET.SubElement(
#                 url,
#                 "{http://www.w3.org/1999/xhtml}link",
#                 rel="alternate",
#                 hreflang=hreflang_formatter(lang.rstrip("/")),
#                 href=site_url + scheme.format(lang=lang, version=version, link=link),
#             )
#
#     filename = app.outdir + "/" + app.config.sitemap_filename
#     ET.ElementTree(root).write(
#         filename, xml_declaration=True, encoding="utf-8", method="xml"
#     )
#
#     logger.info(
#         "sphinx-sitemap: %s was generated for URL %s in %s"
#         % (app.config.sitemap_filename, site_url, filename),
#         type="sitemap",
#         subtype="information",
#     )

def _create_sitemap_patched(app: Sphinx, exception):
    """
    Generates the sitemap.xml from the collected HTML page links.

    :param app: The Sphinx Application instance
    """
    site_url = app.builder.config.site_url or app.builder.config.html_baseurl
    if site_url:
        site_url.rstrip("/") + "/"
    else:
        logger.warning(
            "sphinx-sitemap: html_baseurl is required in conf.py." "Sitemap not built.",
            type="sitemap",
            subtype="configuration",
        )
        return

    if app.env.app.sitemap_links.empty():  # type: ignore
        logger.info(
            "sphinx-sitemap: No pages generated for %s" % app.config.sitemap_filename,
            type="sitemap",
            subtype="information",
        )
        return

    ElementTree.register_namespace("xhtml", "http://www.w3.org/1999/xhtml")

    root = ElementTree.Element(
        "urlset", xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
    )

    locales = get_locales(app)

    if app.builder.config.version:
        version = app.builder.config.version + "/"
    else:
        version = ""

    while True:
        try:
            link = app.env.app.sitemap_links.get_nowait()  # type: ignore
        except queue.Empty:
            break

        url = ElementTree.SubElement(root, "url")
        scheme = app.config.sitemap_url_scheme
        if app.builder.config.language:
            lang = app.builder.config.language + "/"
        else:
            lang = ""

        ElementTree.SubElement(url, "loc").text = site_url + scheme.format(
            lang=lang, version=version, link=link,
        )

        ElementTree.SubElement(url, "priority").text = str(PRIORITY)

        for lang in locales:
            lang = lang + "/"
            ElementTree.SubElement(
                url,
                "{http://www.w3.org/1999/xhtml}link",
                rel="alternate",
                hreflang=hreflang_formatter(lang.rstrip("/")),
                href=site_url + scheme.format(lang=lang, version=version, link=link),
            )

    filename = Path(app.outdir) / app.config.sitemap_filename
    ElementTree.ElementTree(root).write(
        filename, xml_declaration=True, encoding="utf-8", method="xml"
    )

    logger.info(
        "sphinx-sitemap: %s was generated for URL %s in %s"
        % (app.config.sitemap_filename, site_url, filename),
        type="sitemap",
        subtype="information",
    )


sphinx_sitemap.create_sitemap = _create_sitemap_patched