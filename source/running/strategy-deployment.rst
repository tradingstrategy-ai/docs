.. strategy-deployment::

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

Turning backtest to a strategy module
-------------------------------------

Backtests are Jupyter notebooks, but live strategies need to be deployed as Python applications.

Each strategy runs as a single Python application in a Docker container.

To create a Python strategy module from a backtest

- `Looks up examples in trade-executor module <https://github.com/tradingstrategy-ai/trade-executor/tree/master/strategies>`__

- Extract the following to a new Python .py module
    - Strategy header with parameter definitions
    - `decide_trade()` function
    - `create_trading_universe()` function

TODO

