.. meta::
   :description: How to build alpha model strategies in Python

Developing portfolio construction trading strategies
====================================================

In this post, we will cover the basics of portfolio constructions and alpha models.
We will show how to build a simple portfolio construction strategy using Python and Trading Strategy's backtesting framework.

The target audience of this post us :term:`quants <quant>` and people who want to learn :term:`algorithmic trading`.

What is Portfolio Construction?
-------------------------------

Portfolio construction is the process of selecting securities optimally to achieve maximum returns while taking minimum risk.
It involves understanding how different asset classes, funds, and weightings impact each other and an investor's objectives

Portfolio construction has several phases

- **Asset allocation models** - to determine the optimal mix of asset classes (stocks, bonds, and commodities) in a portfolio, based on historical returns, volatility, and correlations.

- **Optimization techniques** - to identify the best combination of individual securities within each asset class, based on factors such as expected return, risk, and liquidity.

- **Risk management tools** - such as :term:`stop-loss orders <stop loss>`, hedging strategies, and diversification techniques, to manage portfolio risk and reduce exposure to individual assets or market risks

- :term:`Alpha generation strategies <alpha model>` - such as :term:`factor investing`, :term:`statistical arbitrage`, and :term:`trend-following`, to identify assets that are likely to outperform or underperform the broader market.

What is Alpha model?
--------------------

An alpha model is a mathematical or quantitative framework used to generate trading signals that can be used in :term:`portfolio construction`.

The alpha model seeks to identify assets that are likely to outperform or underperform their peers, based on a variety of factors and variables.

Alpha models can be constructed using a variety of techniques, such as statistical analysis, machine learning algorithms, or financial modeling. The inputs to an alpha model may include company financial statements, price and volume data, macroeconomic indicators, and other market data.

Once an alpha model generates :term:`trading signals <alpha signal>`, the portfolio manager can use those signals to construct a portfolio that aims to generate alpha (i.e., excess returns) relative to a benchmark index.

What is Trading Strategy Framework?
-----------------------------------

The Trading Strategy Framework is a :term:`Python` based software development library
to develop :term:`automated trading strategies <automated trading strategy>` for :term:`decentralised finance`
markets.

The framework consists of

- Market data feed reader in the form of :term:`Trading Strategy Client`

- :term:`Backtesting framework <backtesting>`

- Live trade execution environment

The core audience of the library is :term:`quants <quant>`.

How does Trading Strategy framework support creating portfolio constructions strategies?
----------------------------------------------------------------------------------------

The Trading Strategy Framework provides functionality for

- Setting up a tradeable asset universe from assets traded on :term:`decentralised finance markets <decentralised finance>`

- Writing a :term:`trading strategy` logic using a well-formed interface that transforms
  input data to trades

- Supports :term:`alpha model` that allows easily writing strategies for portfolio construction

The workflow for the framework is

- Develop and :term:`backtest` your strategies using :term:`Jupyter Notebook`

- Visualise and analyse the performance of your trading strategy using various tools
  and methods, like performance summary statistics, :term:`equity curve`, tracking the performance of
  individual positions

- Take your trading strategy backtested code unmodified to the live trading execution environment

