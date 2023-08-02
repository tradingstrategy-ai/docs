Turning backtest to an executable live trading strategy
=======================================================

In this chapter, we discuss how to turn a Jupyter Notebook based backtests
to a live trading strategy module.

- Strategy development and backtesting is usually performed in Jupyter Notebook environment.

- After the strategy is ready for forward-testing with real money,
  it is time for :ref:`strategy deployment` with a standalone strategy module.

- The strategy module is a standalone Python file without outside dependencies,
  including command line applications. The strategy module does not have
  any dependencies to complex Jupyter environment.

- The strategy module itself can be backtested and analysed using
  :ref:`trade-executor` binary commands.

- After you have created an independent strategy module,
  you need to run `trade-executor backtest` command against
  it to see your strategy module is functional (no import errors,
  backtest results are what is expected).

- `Some example strategy modules are available at trade-executor Github repository <https://github.com/tradingstrategy-ai/trade-executor/tree/master/strategies>`__.
  Please check with the community for the latest examples before starting to work.

Turning a backtest to a strategy module
---------------------------------------

Backtests are Jupyter notebooks, but live strategies need to be deployed as Python modules.

- Python module is loaded by :ref:`trade-executor` for live trading as an algorithm

To create a Python strategy module from a backtest

- `Looks up examples in trade-executor module <https://github.com/tradingstrategy-ai/trade-executor/tree/master/strategies>`__

- Extract the following to a new Python .py module

  - Strategy variables

  - `decide_trade()` function

  - `create_trading_universe()` function (must be with this name, even as backtests allow other names)

  - Make sure the strategy module has `TRADING_STRATEGY_ENGINE_VERSION` as this defines how the module is parsed and loaded.
    The version must be `"0.2"` or newer.

You can store the Python module anywhere, but we recommend

- Create a folder `strategies`

- Store the Python module as `strategies/strategy-id.py` e.g.
  `strategies/arbitrum-btc-usdc-sls.py`

Backtest specific variables
---------------------------

Some variables are only relevant for backtesting, not to the live trade execution.
However, you still want to set these variables in your strategy module,
as there variables are used to generate the backtesting benchmark
results that are shown on the website user interface.

Following variables need to be set in the strategy module in
order to perform `trade-executor backtest` command:

.. code-block:: python

    # Version >= 0.2
    TRADING_STRATEGY_ENGINE_VERSION = "0.2"

    # How much USD the backtest starts with
    INITIAL_CASH = 10_000

    # Backtest range we will use to show the results
    # on the website
    BACKTEST_START = datetime.datetime(2022, 12, 20)
    BACKTEST_END = datetime.datetime(2023, 6, 4)

    # Optional, depends on the strategy create_trading_universe() function
    STOP_LOSS_TIME_BUCKET=TimeBucket.m5

Run a backtest on the standalone strategy module
------------------------------------------------

This will run a backtest on a strategy module from the command
line and display the summary backtest.

- Enable docker login to Github - see
  `how to set up Github access token to download Docker images from GHCR <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>`_.

- See :ref:`get an API key` if you do not have one yet.

- `Go and check the latest version tag from trade-executor release <https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor>`__.

- You can find more information in :ref:`managing docker images`.

Create folder `state` in the current working directory. The `backtest` command will write multiple report files in this folder.
If you want to override the file locations you can use command line arguments for `backtest` command to set a different location:

.. code-block:: shell

    mkdir state

Run the backtest. Here we assume you have your strategy module as `strategy/strategy/arbitrum-btc-usdc-sls.py`:

.. code-block:: shell

    # Replace with the latest version
    export TRADE_EXECUTOR_VERSION=v163

    # Read command line help
    docker run \
        ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION} \
        backtest --help

    # Run the backtest using the backtest period given in the strategy module
    docker run \
        -v `pwd`:`pwd` \
        -w `pwd` \
        ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION} \
        backtest \
        --strategy-file=strategy/arbitrum-btc-usdc-sls.py \
        --trading-strategy-api-key=$TRADING_STRATEGY_API_KEY

The :term:`Docker` command above maps the current working directory (`pwd`)
to Docker as a volume,
so that :ref:`trade-executor` can read and write your local files.

On the results

- The `trade-executor backtest` command complains if there
  are any errors with your strategy file, like missing variables

- It will display the summary results to the console

- It will write a report files like a standalone .HTML
  file for the results

.. _run deployment backtest:

Run a backtest on the deployed strategy module
----------------------------------------------

After the strategy module and Docker instance and its configuration have been deployed,
you can run the backtest on the live trade executor with.

- You have a ready live trading environment set up with `docker-composer`

The major difference is that all configuration, like `TRADING_STRATEGY_API_KEY`
will now come from the Docker or `docker-compose` configuration and not from
the command line.

.. code-block:: shell

    docker-compose run enzyme-polygon-eth-usdc backtest

- This will use the final configuration (strategy module, environment files) to run the backtest
  and see that the strategy module functions properly.

- This will generate backtest reports (HTML, notebook, state) for the web frontend

- The backtest result is saved on the local file system. The result of this backtest
  run is used to show some of the key metrics (sharpe, sortino, max drawdown)
  in the web frontend UI via :ref:`webhook`.

- The default generated state file will be `state/{id}-backtest.json`.

Example:

.. code-block: shell

    docker-compose run enzyme-polygon-matic-usdc backtest

And you will get a report like:

.. code-block:: text

    Trading period length                      359 days
    Return %                                     57.96%
    Annualised return %                          58.87%
    Cash at start                            $10,000.00
    Value at end                             $15,796.42
    Trade volume                            $948,224.62
    Position win percent                         48.48%
    Total positions                                  66
    Won positions                                    32
    ...
    Avg realised risk                            -0.96%
    Max pullback of total capital                -6.47%
    Max loss risk at opening of position          1.02%