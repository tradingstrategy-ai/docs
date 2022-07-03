Development process and tips
============================

Preface
-------

In this chapter, we will discuss how to developer `tradingstrategy`
and `tradeexecutor` Python packages.

Installation for local development
----------------------------------

To install Trading Strategy using pip do:

.. code-block:: shell

    git clone https://github.com/tradingstrategy-ai/trading-strategy.git
    # We have chains submodule
    git submodule update --recursive --init
    cd tradingstrategy
    poetry shell
    poetry install -E qstrader

Run tests
---------

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

Terminal IPython and debugging with ipdb
----------------------------------------

You might want to run notebooks in a terminal using ``ipython`` command e.g. for better debugging facilities.

You can run example notebooks in a terminal after git checkout and poetry install:

.. code-block:: shell

    ipython --TerminalIPythonApp.file_to_run=docs/source/programming/algorithms/pancakeswap-momentum.ipynb

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