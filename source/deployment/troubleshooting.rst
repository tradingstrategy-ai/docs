Troubleshooting live trade execution deployments
================================================

This chapter contains diagnostics and troubleshooting information and recipes
for :ref:`live trade executors <.

.. _console:

Interactive Python console
~~~~~~~~~~~~~~~~~~~~~~~~~~

There is a `console` command that allows you to launch `trade-executor` with a Python prompt open.

- Manually inspect state and connections in an interactive Python prompt

- Repair damaged data

- Close any live `trade-executor` before opening the interactive shell,
  as both can write to the state at the same time

To start the console you can do:

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma -- console

.. code-block:: text

    Following classes and objects are available:
    web3                          : <web3.main.Web3 object at 0x7fe04912d120>
    client                        : <tradingstrategy.client.Client object at 0x7fe049e2c370>
    state                         : <State for None>
    universe                      : TradingStrategyUniverse(reserve_assets=[AssetIdentifier(chain_id=137, address='0x2791bca1f2de4661ed88a30c99a7a9449aa84174', token_symbol='USDC', decimals=6, internal_id=None, info_url=None)], universe=Universe(time_bucket=<TimeBucket.h1: '1h'>, chains={<ChainId.polygon: 137>}, exchanges={<Exchange Quickswap at 0x5757371414417b8c6caad45baef941abc7d3ab32 on Polygon>}, pairs=<tradingstrategy.pair.PandasPairUniverse object at 0x7fe048f64610>, candles=<tradingstrategy.candle.GroupedCandleUniverse object at 0x7fdf897e0700>, liquidity=None), backtest_stop_loss_time_bucket=<TimeBucket.m15: '15m'>, backtest_stop_loss_candles=<tradingstrategy.candle.GroupedCandleUniverse object at 0x7fdf897e2b60>)
    store                         : <tradeexecutor.state.store.JSONFileStore object at 0x7fe04912fc10>
    routing_state                 : <UniswapV2RoutingState Tx builder: <tradeexecutor.ethereum.tx.TransactionBuilder object at 0x7fe048730a60> web3: <web3.main.Web3 object at 0x7fe04912d120>>
    pricing_model                 : <tradeexecutor.ethereum.uniswap_v2_live_pricing.UniswapV2LivePricing object at 0x7fe0487304f0>
    valuation_method              : <tradeexecutor.ethereum.uniswap_v2_valuation.UniswapV2PoolRevaluator object at 0x7fe048730490>
    datetime                      : <module 'datetime' from '/usr/local/lib/python3.10/datetime.py'>
    pd                            : <module 'pandas' from '/usr/local/lib/python3.10/site-packages/pandas/__init__.py'>
    cache_path                    : cache
    Decimal                       : <class 'decimal.Decimal'>

    Python 3.10.8 (main, Dec  6 2022, 14:13:21) [GCC 10.2.1 20210110]
    Type 'copyright', 'credits' or 'license' for more information
    IPython 8.7.0 -- An enhanced Interactive Python. Type '?' for help.

    In [1]:

Then you can use `%cpaste` command to paste Python snippets into the console.

Inspecting state file on another computer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the case `trade-executor` crashes, you can download its state file into
local development environment for examination.
This may offer much faster development cycle than trying to diagnose the state file
on a remote server.

First copy file to the local computer e.g. using `scp`.

Then start console:

.. code-block:: shell

    ipython

Load the state and extract information from it:

.. code-block:: python

    from tradeexecutor.state.state import State
    from pathlib import Path

    state = State.read_json_file(Path("../enzyme-polygon-multipair.json"))

    # Run a function against the state
    from tradeexecutor.statistics.summary import calculate_summary_statistics
    stats = calculate_summary_statistics(state)

    display(stats)


Local Docker image builds
~~~~~~~~~~~~~~~~~~~~~~~~~

If needed you can build the image locally from `trade-executor repo <https://github.com/tradingstrategy-ai/trade-executor/>`__:

.. code-block:: shell

     docker build -t ghcr.io/tradingstrategy-ai/trade-executor:latest .

Direct python application execution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can also run `trade-executor` :ref:`directly from Python source code <trade-executor-command-line>`,
without Docker, if needed.

- Take Github checkout

- Poetry install

- Read Docker .env files to the shell using :ref:`shdotenv`

- Run `poetry run trade-executor`

.. _manually checking webhook:

Checking web server uptime
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note ::

    Even if the `trade-executor` live trade loop dies, the web server stays up
    to provide the diagnostics information about the cause of the crash.
    See :ref:`checking for trade execution main loop crash` how to monitor
    the trade execution crashes.

After your Docker instance is running you can check that its webhook port is replying using `curl`.

.. code-block:: shell

    curl http://localhost:19003/ping

This should give you the JSON result:

.. code-block:: text

    {"ping": "pong"}

You can get the status overview:

.. code-block:: shell

    curl http://localhost:19009/status | jq

.. code-block:: json

    {
      "executor_id": "enzyme-polygon-eth-usdc-sls",
      "last_refreshed_at": 1686639960,
      "started_at": 1686638369,
      "executor_running": true,
      "completed_cycle": 2,
      "cycles": 1,
      "position_trigger_checks": 9,
      "position_revaluations": 0,
      "frozen_positions": 0,
      "crashed_at": null,
      "exception": null,
      "source_code": null,
      "visualisation": {
        "last_refreshed_at": 1686640029,
        "small_image": null,
        "small_image_dark": null,
        "large_image": null,
        "large_image_dark": null
      },
      "summary_statistics": {
        "calculated_at": 1686639605,
        "first_trade_at": 1686638109,
        "last_trade_at": 1686638117,
        "enough_data": false,
        "current_value": 1.923205,
        "profitability_90_days": null,
        "performance_chart_90_days": null
      },
      "market_data_feed_lag": null,
      "version": {
        "tag": "v170",
        "commit_message": "Fix close position signature (#381)",
        "commit_hash": "40f05bf8c550f9edaca01bfeb1360122576f0403"
      }
    }


`View the trade-executor webhook API <https://github.com/tradingstrategy-ai/trade-executor/blob/master/tradeexecutor/webhook/api.py>`__.

.. _checking for trade execution main loop crash:

Checking if the trade executor loop has crashed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :ref:`webhook` server provides information about the status of the
`trade-execution` live trade main loop.

- When was the last trade

- Whether the loop is still running

- What was the cause of crash if the loop has failed

 A shell script to check the status of `trade-executor`:

.. code-block:: shell

    #!/bin/bash
    #
    # Check the trade-executor status through the webhook
    #
    # - Return 1 if the trade-executor main loop has crashed
    #
    # - Echo the crash reason
    #
    # - Read the webhook URL from the command line argumetn
    #

    set -e

    if [ -z "$1" ]; then
        echo "Error: Give the webhook URL as the first argument"
        exit 1
    fi

    set -u

    webhook_url=$1

    # /status gives 200 in the case the trade-executor has crashed
    # and you need to check for the exception record in the status output
    failure_reason=$(curl --silent --fail "$webhook_url/status" | jq ".exception")

    if [ "$failure_reason" != "null" ] ; then
        echo "trade-executor has crashed: $failure_reason"
        exit 1
    fi

    echo "Ok"
    exit 0

Then you can run:

.. code-block:: shell

     scripts/check-status.sh https://enzyme-polygon-multipair.tradingstrategy.ai

This `script is also included part of the Docker <https://github.com/tradingstrategy-ai/trade-executor/blob/master/scripts/check-webhook-status.sh>`__.
`docker-compose` health check is set up as:

.. code-block:: shell

    # Internally inside Docker container, the webhook is mapped to http://localhost:3456
    docker-compose exec enzyme-polygon-multipair scripts/check-webhook-status.sh http://localhost:3456

And if the `trade-executor` main loop is still running this will exit 0 and print:

.. code-block:: text

    Ok

Running trade-executor without Docker
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`trade-executor` can be run without Docker.

- You need set up a Python environment using Poetry

Then you can run `trade-executor` as Python application:


.. code-block:: shell

    trade-executor hello

.. code-block:: text

    Hello blockchain

Reinitialising trade-executor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reinitialisation resets the state file of a `trade-executor`.

You need to do this if

- State file data structures have backwards incompatible migrations

- State file account balances have somehow become out of sync with the on-chain balances

.. warning::

    Resetting state file is not possible at the moment if there are open positions.
    Stop `trade-executor` and manually unwind any positions before performing
    reinitialisation.

To perform a reinitialisation:

.. code-block:: shell

    export TRADE_EXECUTOR_VERSION=...
    export EXECUTOR_NAME=enzyme-polygon-eth-usdc
    docker-compose run $EXECUTOR_NAME reinit

This will:

- Generate a state backup file in `state` folder

- Resync available reserve currency from on-chain data

- Resync vault deployment and such init information

- Clear all statistics and positions

.. _shdotenv:

Using shdotenv helper
~~~~~~~~~~~~~~~~~~~~~

Poetry / Typer environment does not support reading `.env` files directly.
You first need to `load any .env file to your shell using shdotenv <https://stackoverflow.com/a/67357762/315168>`__
before calling `trade-executor`.

`shdotenv` is especially needed to translate Docker style `.env` files to a format
UNIX shell can understand.

.. code-block:: shell

    wget https://github.com/ko1nksm/shdotenv/releases/latest/download/shdotenv -O ~/.local/bin/shdotenv
    chmod +x ~/.local/bin/shdotenv

Then you can run with `.env` file:

.. code-block:: shell

    eval "$(shdotenv --dialect docker --env ~/pancake-eth-usd-sma-final.env)"
    echo "Strategy file is: $STRATEGY_FILE"

And now you can run `trade-executor` commands that take complex configuration
that would be hard to type otherwise:

.. code-block:: shell

    trade-executor check-wallet

Getting the latest release from Github in shell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can set up `TRADE_EXECUTOR_VERSION` environment variable
to the latest release with the following UNIX shell source snippet:

.. code-block:: shell

    # Export the latest trade-executor tag
    #
    # This will set TRADE_EXECUTOR_VERSION environment variable
    #
    # Usage:
    #
    #    source scripts/set-latest-tag.sh
    #

    tag=`curl -s "https://api.github.com/repos/tradingstrategy-ai/trade-executor/tags" | jq -r '.[0].name'`
    export TRADE_EXECUTOR_VERSION=$tag
    echo "TRADE_EXECUTOR=${TRADE_EXECUTOR_VERSION}"
