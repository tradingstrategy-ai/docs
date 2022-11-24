.. _strategy-deployment:

Live strategy deployment
========================

In this chapter, we explain how to take a backtested strategy and make it a live running strategy instance.

Preface
-------

This example shows a trading strategy deployment in its simplest form

- Single investor

- Uses a private key hot wallet where tokens and strategy reserves are stored

- Runs on a single Docker instance

- Trades on a single chain, single exchange

Prerequisites
-------------

To get started you need to have a

- A strategy with successful backtests

- Basics of Python programming

- Basics of Linux and Docker system administration

- Ability to set DNS entries (needed for the web interface of the strategy)

- A stash of blockchain native cryptocurrency for gas fees (ETH, BNB, MATIC)

- Initial cash deposit in stablecoin (USDC, BUSD)

Turning a backtest to a strategy module
---------------------------------------

Backtests are Jupyter notebooks, but live strategies need to be deployed as Python applications.

Each strategy runs as a single Python application in a Docker container.

To create a Python strategy module from a backtest

- `Looks up examples in trade-executor module <https://github.com/tradingstrategy-ai/trade-executor/tree/master/strategies>`__

- Extract the following to a new Python .py module
    - Strategy header with parameter definitions
    - `decide_trade()` function
    - `create_trading_universe()` function (must be with this name, even as backtests allow other names)
    - Make sure the strategy module has `TRADING_STRATEGY_ENGINE_VERSION` as this defines how the module is parsed and loaded

You can store the Python module anywhere, as it is referred by its path in the future.

.. _command-line-backtest:

Testing the strategy module
---------------------------

You can run backtests using `trade-executor` command locally on your development module to check the strategy module
looks intact.

We can do backtests in two phases

- Speeded up backtest with more granular time frames for the smoke test

- Actual backtest to see we still get the same results as in the notebook

An example how to run quick backtests. We override some timeframes. This gives incorrect results but quickly shows if
the code is broken:

.. code-block:: shell

    # Set your API key
    export TRADING_STRATEGY_API_KEY=...

    # Run the backtest of this module using local trade-executor command
    # Tick size and stop loss check frequencies are less from what the strategy
    # is expected (1h -> 1d). We call decide_trades less often,
    # allowing us to complete the test faster, albeit with incorrect
    # results.
    trade-executor start \
        --strategy-file=strategies/pancake-eth-usdc-sma.py \
        --execution-type=backtest \
        --trading-strategy-api-key=$TRADING_STRATEGY_API_KEY \
        --cycle-duration=1d \
        --stop-loss-check-frequency=1d \
        --backtest-start=2021-06-01 \
        --backtest-end=2022-09-01 \

Changes between backtesting and live execution
----------------------------------------------

- Candle time frame is not read from Python file, but is given as `position-trigger-check-frequency` command line option

- Stop loss signal is not read from Python file, but is given as `tick-size` command line option

- You need to give `tick_offset_minutes` command line option to tell how much time we give for the price feed
  to generate candles after the trade cycle is triggered



Creating a hot wallet
---------------------

To create a hot wallet for a strategy do the following:

.. code-block:: shell

    python -c "from web3 import Web3; w3 = Web3(); acc = w3.eth.account.create(); print(f'private key={w3.toHex(acc.privateKey)}, account={acc.address}')"

This will give you private key and account pair:

.. code-block::

 private key=0xd67b9015bfa8d6da2e30a7bb232e2d8b2899e610b08a11afb6de48c693226845, account=0x5DC2837bac174efD17aC294A2573F52DED5E5e1D

Then

- Store the private key safely in your backup storage (paper, password manager, etc.)

- Private key will be needed in the trade execution configuration file





