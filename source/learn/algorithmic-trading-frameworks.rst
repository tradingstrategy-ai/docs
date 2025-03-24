Algorithmic trading frameworks for Python
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See also :doc:`AI and machine learning topics <./ai-and-machine-learning.rst>` if you are especially looking for AI-based trading solutions.

Trading Strategy
----------------

Trading Strategy is the next generation algorithmic trading protocol for decentralised markets.

It includes

- Market data fetch
- Backtesting and strategy development framework
- Live trade execution
- Capital and investor management with smart contract-based vaults

`View website <https://tradingstrategy.ai>`__.

Demeter
-------

Demeter is a :term:`liquidity provision` :term:`backtest` framework for :term:`Uniswap`, :term:`Aave`
and other :term:`decentralised finance` protocols.

Demeter allows you to simulate :term:`high-frequency trading` :term:`market making` using :term:`Python` code.

Demeter is good for backtesting

- :term:`CLMM` strategies

- :term:`Delta hedged` strategies (e.g. with Aave)

- :term:`Gamma hedged` strategies (e.g. with decentralised options market places like Aevo or Derive)

Examples of Demeter strategies are available in `Trading Strategy's Getting started <https://github.com/tradingstrategy-ai/getting-started>`__ repository.

See -`Demeter website <https://github.com/zelos-alpha/demeter/>`__ by Zelos Alpha.

.. _backtrader:

Backtrader
----------

**Backtrader is no longer maintained**.

Backtrader is one of the oldest and most popular Python based backtesting frameworks. It supports live trading. Direct support for Jupyter notebooks.  `Read more on BackTrader <https://www.backtrader.com/>`__.


.. _qstrader:

QsTrader
--------

**QsTrader is no longer maintained**.

QsTrader is a portfolio optimisation backtesting framework for Python. It originally focused on ETFs and stock. `Read more on QsTrader <https://www.quantstart.com/qstrader/>`__.

Fastquant
---------

**FastQuant is no longer maintained**.

A simplified one-liner backtesting solution built on the top of Backtrader. `Read more <https://github.com/enzoampil/fastquant>`__.

Zipline Reloaded
----------------

Continued work of the famous ZipLine library that was created by now defunctional Quantopian. `Read more <https://pypi.org/project/zipline-reloaded/>`__.

AlphaPy
-------

AlphaPy is a machine learning framework for both speculators and data scientists. It is written in Python mainly with the scikit-learn and pandas libraries, as well as many other helpful packages for feature engineering and visualization. `Read more <https://github.com/ScottFreeLLC/AlphaPy>`__.

bt
--

bt is a flexible backtesting framework for Python used to test quantitative trading strategies. The framework allows you to easily create strategies that mix and match different Algos. It aims to foster the creation of easily testable, re-usable and flexible blocks of strategy logic to facilitate the rapid development of complex trading strategies. `Read more <https://github.com/pmorissette/bt>`__.


AlphaLens
---------

Alpha factor library for ZipLine. `Read more <https://github.com/quantopian/alphalens>`__.

PyFolio
-------

Performance and risk analysis for portfolios. `Read more <https://github.com/quantopian/pyfolio>`__.

PyAlgoTrade
-----------

Was originally written for Bitstamp. Offers backtesting, paper trading, live trading. Looks abandoned now. `Read more <https://github.com/gbeced/pyalgotrade>`__.

LEAN
----

Lean Engine is an open-source algorithmic trading engine built for easy strategy research, backtesting and live trading. We integrate with common data providers and brokerages so you can quickly deploy algorithmic trading strategies.

The core of the LEAN Engine is written in C#; but it operates seamlessly on Linux, Mac and Windows operating systems. It supports algorithms written in Python 3.8 or C#. Lean drives the web-based algorithmic trading platform QuantConnect.

`View LEAN Github page <https://github.com/QuantConnect/Lean>`__.

FreqTrade
---------

Freqtrade is a free and open source crypto trading bot written in Python. It is designed to support all major exchanges and be controlled via Telegram or webUI. It contains backtesting, plotting and money management tools as well as strategy optimization by machine learning.

`View FreqFrade on Github <https://github.com/freqtrade/freqtrade>`__.

Gekko
-----

**Gekko is no longer maintainer**.

Gekko is an open source platform for automating trading strategies over bitcoin markets.

`View Gekko homepage <https://gekko.wizb.it/>`__.

HftBacktest
-----------

This framework is designed for developing high-frequency trading and market-making strategies. It focuses on accounting for both feed and order latencies, as well as the order queue position for order fill simulation. The framework aims to provide more accurate market replay-based backtesting, based on full order book and trade tick feed data.

Written in Python and Rust.

- Complete tick-by-tick simulation with a variable time interval.
- Full order book reconstruction based on L2 feeds(Market-By-Price).
- Backtest accounting for both feed and order latency, using provided models or your own custom model.
- Order fill simulation that takes into account the order queue position, using provided models or your own custom model.

`View homepage <https://hftbacktest.readthedocs.io/en/v1.8.4/>`__.

