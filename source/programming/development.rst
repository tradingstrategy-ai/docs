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



