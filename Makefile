# Make Trading Strategy docs
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?= -j auto

# # Full tracebacks
# SPHINXOPTS    ?= -T -j 1

SPHINXBUILD   ?= poetry run sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Open locally build docs in a web browser
browser-docs-macos:
	open build/html/index.html

# Fetch submodules
install-deps:
	git submodule update --init --recursive

# Fetch submodules and check out trade-executor master
update-git-submodules:
	git submodule set-url deps/furo https://github.com/tradingstrategy-ai/furo.git
	git submodule set-url deps/trade-executor https://github.com/tradingstrategy-ai/trade-executor.git
	git submodule update --init --recursive
	# git clone --recursive https://github.com/tradingstrategy-ai/trade-executor.git deps/trade-executor

poetry-install:
	poetry install

# TODO: Some hacks here because Poetry does not pick up right
# packages always so that docs would get correctly built
pip-force-install-deps:
	# pip install -e "deps/trade-executor/deps/trading-strategy[direct-feed]"
	# pip install -e "deps/trade-executor/deps/web3-ethereum-defi[data]"
	#pip install -e "deps/trade-executor[qstrader,execution,web-server]"
	#pip install backtrader
	echo "X"


# Get Webpack tool chain to build Furo theme
install-furo:
	(cd deps/furo && npm install)


# Makefile hack, Sphinx build does something weird
build-html:
	$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)

# Rebuild furo.css
rebuild-furo:
	(cd deps/furo && npm run build)
	cp deps/furo/src/furo/theme/furo/static/styles/furo.css source/_static/styles/

# Recreate environment, update all to the latest, clean any generated files and rebuild HTML docs
clean-install-and-build-local-docs: update-git-submodules poetry-install pip-force-install-deps install-furo rebuild-furo clean-autosummary clean build-html

# Clean problematic autosummary leftovers from local tree.
# We use folder "help" as the slug for API docs
# TODO: maybe change this
clean-autosummary:
	-find source -iname "help" -exec rm -rf {} \; 2>/dev/null

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
