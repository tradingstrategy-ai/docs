# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))

# -- Project information -----------------------------------------------------


project = 'Trading Strategy'
copyright = '2021, Mikko Ohtamaa'
author = 'Mikko Ohtamaa'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'nbsphinx',
    "sphinx.ext.intersphinx",
    "sphinx_sitemap",
    "sphinx.ext.autodoc",
    "sphinx.ext.autosummary",
    "sphinx.ext.viewcode",
#    "sphinx_toolbox.more_autodoc",
#    "sphinx_autodoc_typehints"
]

intersphinx_mapping = {
    "pandas": ("http://pandas.pydata.org/pandas-docs/dev", None),
    "matplotlib": ("https://matplotlib.org/stable/", None),
    "numpy": ("https://numpy.org/doc/stable/", None),
    "python": ("https://docs.python.org/3/", None),
    "web3": ("https://web3py.readthedocs.io/en/latest/", None),
    "web3-ethereum-defi": ("https://web3-ethereum-defi.readthedocs.io/", None),
}

# https://help.farbox.com/pygments.html
pygments_style = 'perldoc'

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []

html_theme = "furo"

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

# Fix "en" in sitemap URL
# https://pypi.org/project/sphinx-sitemap/
sitemap_url_scheme = "{link}"

# Logos
# https://pradyunsg.me/furo/customisation/logo/
html_theme_options = {
    "light_logo": "logo-light.svg",
    "dark_logo": "logo-dark.svg",

    # https://pradyunsg.me/furo/customisation/edit-button/
    "source_repository": "https://github.com/tradingstrategy-ai/docs/",
    "source_branch": "master",
    "source_directory": "source/",
}

# Fix plotly.js loading
html_js_files = [
    "require.min.js",
    "custom.js",
]

html_css_files = [
    "custom.css",
]

html_context = {
    "theme_sidebar_hide_name": True,
}

#
# All notebooks in documentation needs an API key and must be pre-executed
# https://nbsphinx.readthedocs.io/en/0.8.6/never-execute.html
#
nbsphinx_execute = 'never'


nbsphinx_prolog = """

.. raw:: html

    <a style="display: block; margin-top: 1.5rem" href="https://mybinder.org/v2/gh/tradingstrategy-ai/binder-env/master?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Ftradingstrategy-ai%252Fdocs%26branch%3Dmaster%26urlpath%3Dlab%252Ftree%252Fdocs%252Fsource%252F{{ env.doc2path(env.docname, base=None) }}">
        <img src="https://mybinder.org/badge_logo.svg">
    </a>    

"""

# For the sitemap
html_baseurl = 'https://tradingstrategy.ai/docs'

# https://stackoverflow.com/a/62613202/315168
autodoc_class_signature = "separated"

autodoc_typehints = "description"

autosummary_generate = True

add_module_names = False

autodoc_member_order = "bysource"

# autosummary_imported_members = True

# Monkey-patch autosummary template context
from sphinx.ext.autosummary.generate import AutosummaryRenderer


def partial_name(fullname):
    parts = fullname.split(".")
    return parts[-1]


def fixed_init(self, app):
    AutosummaryRenderer.__old_init__(self, app)
    self.env.filters["partial_name"] = partial_name


AutosummaryRenderer.__old_init__ = AutosummaryRenderer.__init__
AutosummaryRenderer.__init__ = fixed_init

