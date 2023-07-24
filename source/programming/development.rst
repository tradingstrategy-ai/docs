Internal development process
============================

Preface
-------

In this chapter, we will discuss how to developer `trading-strategy`
and `trade-executor` Python packages.

Installation for local development
----------------------------------

See respective READMEs in Github repositories.

Run tests
---------

trading-strategy package
------------------------

To run tests you need to have a Trading Strategy API key. Tests use the production server.

.. code-block:: shell

    poetry shell
    export TRADING_STRATEGY_API_KEY="secret-token:tradingstrategy-xxx"
    pytest

Tests are very slow.

By default, the test run will cache any downloaded blobs. You can force the redownload with:

.. code-block:: shell

    CLEAR_CACHES=true pytest --log-cli-level=debug -k test_grouped_liquidity

Or manually:

.. code-block:: shell

    rm -rf /tmp/trading-strategy-tests

trade-executor package
----------------------

To run the full test suite, multiple blockchain node connections are needed.

You will also need to have installed

* Anvil

* Ganache

You also need [Trading Strategy API key](https://tradingstrategy.ai/trading-view/backtesting).

To set environment:

.. code-block:: shell

    # Free and somewhat robust Polygon endpoint
    export JSON_RPC_POLYGON="https://polygon-rpc.com"
    export TRADING_STRATEGY_API_KEY=...
    export BNB_CHAIN_JSON_RPC=...

Then run:

.. code-block:: shell

    pytest

Some tests take a long time, because they are checking different real-time timings.
You can skip the slow tests with

.. code-block:: shell

    export SKIP_SLOW_TESTS=true

For more information see Github CI pipeline.


Updating documentation notebooks
--------------------------------

The example notebooks must be run using `jupyter notebook` server
before committing to the documentation, as otherwise Plotly figures won't display.

- Visual Studio Code notebook output gives you `Data type cannot be displayed: application/vnd.plotly.v1+json`
  error if added via `nbsphinx`

- PyCharm has internal bugs and fails to finish running notebooks

First set up the development environment:

.. code-block:: shell

    git clone git@github.com:tradingstrategy-ai/docs.git
    co docs
    make \
      update-git-submodules \
      poetry-install \
      pip-force-install-deps \
      install-furo \
      rebuild-furo \
      clean-autosummary \
      clean \
      html

This will create `build/html/index.html` which you can open in your web browser

.. code-block:: shell

    open build/html/index.html

And now you can browse the documentation locally using `file://` protcol.

Then to rerun and rerender a Jupyter notebook locally.

First start the notebook browser locally in Poetry environment:

.. code-block::

    jupyter notebook

This will spawn a Jupyter server and open a Jupyter notebook user interface
in your web browser. You can later close this with `CTRL + C`.

Find a notebook that you want to rerender.

Choose clear output. Run it.

Manually inspect that the notebook complete and there are no errors

- All figures are rendered

- The last cell with `print("Ok")`

= There are no excessive warnings (some warnings are ok)

Then commit new notebook

- Create a branch

- Push in refreshed `ipynb` file

- Open a PR

.. note ::

    Because how Sphinx automsummary works, it may update files under `source` tree, so be careful
    when doing a full regeneration of documentation.

Terminal IPython and debugging with ipdb
----------------------------------------

You might want to run notebooks in a terminal using ``ipython`` command e.g. for better debugging facilities.

You can run example notebooks in a terminal after git checkout and poetry install:

.. code-block:: shell

    ipython --TerminalIPythonApp.file_to_run=source/programming/strategy-examples/pancakeswap-ema.ipynb

This is especially useful if you want to debug library code with ipdb.

Dataset cache
-------------

The default cache location for the downloaded datasets is `~/.cache/tradingstrategy`.

.. code-block:: shell

    ls -lha ~/.cache/tradingstrategy

.. code-block:: text

    total 56M
    drwxr-xr-x  5 moo staff  160 Jul 19 23:14 ./
    drwx------ 14 moo staff  448 Jul 18 15:49 ../
    -rw-r--r--  1 moo staff  49M Jul 19 23:14 candles-24h.feather
    -rw-r--r--  1 moo staff  95K Jul 18 15:49 exchange-universe.json
    -rw-r--r--  1 moo staff 6.3M Jul 19 21:57 pair-universe.json.zstd


You can clear this out manually from the UNIX shell

.. code-block:: shell

    rm -rf ~/.cache/tradingstrategy

Making a release
----------------

`Release with poetry <https://python-poetry.org/docs/cli/>`_.

.. code-block:: shell

    poetry build
    poetry publish

Memory profiling
----------------

Use `pytest-monitor <https://github.com/CFMTech/pytest-monitor>`__ for
profiling memory usage. We need to ensure large datasets
do not cause issues on low-memory environments like WebAsssembly
in web browsers.

Building Docker image locally
-----------------------------

For testing `trade-executor` command or for writing documentation with an unreleased version.

.. code-block:: shell

    docker build -t ghcr.io/tradingstrategy-ai/trade-executo/trade-executor:latest .

Then copy-paste the image hash from `docker build` output and run:

.. code-block:: shell

    docker run -it cf308d43ad577c5194dd8669316a6a80ba6adc901f461ddf287f14915f206082 --help

Converting backtest notebooks to PDF
------------------------------------

You might want to convert backtest results Jupyter Notebooks for PDF format
to share them.

Make sure you initialise notebook charting in static (offline) mode:

.. code-block:: python

    from tradeexecutor.backtest.notebook import setup_charting_and_output, OutputMode
    # Set Jupyter Notebook output mode parameters
    setup_charting_and_output(OutputMode.static)

Run the notebook e.g. using Visual Studio Code.

Then you can use `nbconvert` to generate a PDF out of the notebook:

.. code-block:: shell

    # Mactex takes long to install
    brew install --cask mactex
    eval "$(/usr/libexec/path_helper)"
    jupyter nbconvert --to pdf uniswap_v3_1h_arbitrum.ipynb

This will generate PDF file from the notebook.



