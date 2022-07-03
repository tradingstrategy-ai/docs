# Trading strategy documentation

Documentation for [Trading Strategy algorithmic trading framework](https://tradingstrategy.ai/).
View [the documentation here]((https://tradingstrategy.ai/).

This documentation repository covers

- [Trading strategy DeFi data client](https://github.com/tradingstrategy-ai/trading-strategy/)
- [Trading strategy execution](https://github.com/tradingstrategy-ai/trade-executor/)

# About documentation internals

- The documentation is built on the top of [Sphinx documentation toolchain](https://www.sphinx-doc.org/en/master/)
- [Furo based theme is used](https://github.com/pradyunsg/furo)
- [API documentation is generated with sphinx-autodoc-typehints](https://github.com/tox-dev/sphinx-autodoc-typehints) 
- [Interactive Jupyter notebook examples are generated with nbsphinx](https://nbsphinx.readthedocs.io/)
- [The documentation is self-hosted using Caddy](github.com/tradingstrategy-ai/proxy-server/)

# Building locally

[pyproject.toml](./pyproject.toml) is automatically pulling the master version of the packages.

To build:

```shell
poetry shell
poetry install
make clean-autosummary clean html
```

Then you can open `build/html/index.html` in your local web browser:

```shell
open build/html/index.html
```

See [Makefile](./Makefile) for more recipes.

