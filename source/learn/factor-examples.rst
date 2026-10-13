.. meta::
   :description: Catalogue of concretely defined trading factors for crypto, equities and commodities, with their construction and the reported evidence that they predict returns.

Factor Examples
~~~~~~~~~~~~~~~

This page is a catalogue of documented, concretely defined factors: trading signals with a stated construction and reported evidence that they predict returns. For each factor it describes what the signal measures, the economic idea behind it, how it is turned into a portfolio, and the evidence. Use it as a reference for factor ideas and as a benchmark for your own factor research. The factors are grouped by asset class, and complete strategies built from factors are on :doc:`Strategy Examples <./strategy-examples>`.

Related topics include :doc:`Carry Trade <./carry-trade>`, :doc:`Momentum <./momentum>` and :doc:`Mean Reversion <./mean-reversion>` for the research behind the price- and funding-based factors, :doc:`Order Flow <./order-flow>` and :doc:`Market Microstructure <./market-microstructure>` for the flow, liquidity and positioning factors, and :doc:`Equity Factors <./equity-factors>` for factor investing in traditional markets.

Crypto Factors
==============

The factors in this section are the published factors and single-factor portfolios of `Unravel <https://unravel.finance/factors>`__, a provider of cross-sectional crypto factors and multi-factor portfolios. Unravel publishes each factor in Top 20, Top 30 and Top 40 market-cap universes; we list one entry per factor, using the Top 40 universe, with the key metrics of each example portfolio on two venues: Binance and Hyperliquid. We use descriptive factor names: Unravel markets some of these factors under product names of its own, and the link in each entry leads to the original page. The multi-factor portfolios built from these factors are on the :doc:`Strategy Examples <./strategy-examples>` page.

All example portfolios except the long-only trend factor share the same construction:

- **Universe**: the 40 largest crypto assets by market capitalisation, selected on a rolling basis and kept survivorship-bias free. The raw factors themselves are computed point-in-time over 400+ tickers.
- **Signal**: one cross-sectional factor score ranks the coins each day. Some fast-moving factors are smoothed with a moving average to cut trading costs.
- **Positions**: long the coins at one end of the ranking and short the coins at the other, sized in proportion to the factor's cross-sectional strength, at about 200% gross exposure (100% long, 100% short).
- **Risk balancing**: positions are scaled by the inverse of each asset's rolling volatility, so each asset contributes similar risk and the book is market-neutral on a volatility-adjusted basis.
- **Rebalancing**: daily, with factor values updated hourly at five minutes past the hour (UTC).

The metrics were taken from Unravel's portfolio pages on 2026-10-13, using each factor's default smoothing and 0.05% transaction costs. Binance figures start in 2020 or 2021 (Unravel marks the period from 2024-01-01 onwards as out-of-sample); Hyperliquid figures start on 2024-10-29 and are therefore entirely out-of-sample but cover a much shorter period. These are the vendor's illustrative portfolios, not audited track records, and the long Binance history is mostly a backtest. Two information coefficient measures are given:

- **Rank IC t-stat** is from the portfolio page: the mean per-date Spearman rank correlation between the factor and subsequent returns, divided by its standard error. An absolute value above 2 is roughly significant at 5%.
- **1-day IC** is from Unravel's factsheet, computed on the raw factor values over the Top 40 universe: the mean and standard deviation of the daily Spearman IC, their ratio (IR) and the share of days with a positive IC.

Data and code availability: for every factor except the long-only trend factor, Unravel's public `dataroom repository <https://github.com/unravel-finance/dataroom>`__ has the raw daily factor values and the example portfolio's daily returns as CSV, plus a two-page factsheet. A `replication notebook <https://github.com/unravel-finance/dataroom/blob/main/notebooks/00_replicate_portfolio_backtest.ipynb>`__ replicates the example portfolio backtests in AlphaLens. The way each raw factor is calculated is proprietary, so the factors themselves cannot be recomputed from public information.

Funding Rate Carry
------------------

A cross-sectional carry factor for perpetual futures. It earns the funding premium and, in large part, the statistical price inefficiencies that come with it, in addition to the funding payments themselves. Funding rates are aggregated from the top 10 derivatives exchanges rather than taken from a single venue, which makes the signal less sensitive to one exchange's funding quirks.

How it is set up: coins in the Top 40 universe are ranked on their cross-venue funding rate, and the example portfolio goes long and short in proportion to the factor's cross-sectional strength. The signal is smoothed with a 5-day moving average by default to reduce turnover. The data comes from derivatives exchanges and starts in April 2020.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Apr 4, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.59
     - 1.29
   * - CAGR
     - 50%
     - 32.2%
   * - Max drawdown
     - -26.5%
     - -17.3%
   * - Volatility (annualised)
     - 27.8%
     - 23.8%
   * - Beta to BTC
     - 0.01
     - -0.10
   * - Average daily turnover
     - 66.2%
     - 71.1%
   * - Average gross exposure
     - 199.9%
     - 200.1%
   * - 1-year CAGR
     - 17.3%
     - 25.1%
   * - 2026 year-to-date
     - 20.5%
     - 17.2%
   * - Rank IC t-stat (all years)
     - 6.5
     - 2.4

1-day IC of the raw factor: mean 0.0238, standard deviation 0.1903, IR 0.12, positive on 55.2% of days.

This is one of the most consistent factors in the catalogue: it has a significant rank IC on both venues and is up about 20% in 2026 on both.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/carry_enhanced.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/carry_enhanced.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/carry_enhanced.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/carry_enhanced.40>`__.

Short-Term Momentum
-------------------

A plain cross-sectional momentum factor that captures short-term, asset-specific momentum. Recent winners are expected to keep outperforming recent losers over the next days, and keeping long and short exposure balanced removes most of the overall market direction.

How it is set up: coins in the Top 40 universe are ranked by short-term past returns, and the example portfolio is long the winners and short the losers, with no smoothing. The data comes from derivatives exchanges and starts in January 2020.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 0.92
     - 0.45
   * - CAGR
     - 29.5%
     - 9.2%
   * - Max drawdown
     - -50.2%
     - -28.1%
   * - Volatility (annualised)
     - 34.6%
     - 29.7%
   * - Beta to BTC
     - 0.07
     - -0.01
   * - Average daily turnover
     - 56.9%
     - 54.5%
   * - Average gross exposure
     - 197.4%
     - 197.9%
   * - 1-year CAGR
     - -3.6%
     - -10.8%
   * - 2026 year-to-date
     - -12.3%
     - -10.9%
   * - Rank IC t-stat (all years)
     - -1.7
     - -0.1

1-day IC of the raw factor: mean 0.0018, standard deviation 0.2568, IR 0.01, positive on 49.9% of days.

Plain momentum is the weakest member of the momentum family. It has a -50% drawdown on Binance, a weak Hyperliquid result and a 1-day IC close to zero. The more refined momentum measures below have done better.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/momentum.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/momentum.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/momentum.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/momentum.40>`__.

Instantaneous Momentum
----------------------

A proprietary measure of very recent price momentum. Assets with higher instantaneous momentum tend to outperform those with lower instantaneous momentum. How the measure is calculated is not disclosed.

How it is set up: coins in the Top 40 universe are ranked on instantaneous momentum, and the example portfolio is long the highest and short the lowest, with no smoothing. It is one of the three components of Blended Momentum below.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.72
     - 1.97
   * - CAGR
     - 70.4%
     - 64%
   * - Max drawdown
     - -42.2%
     - -23.3%
   * - Volatility (annualised)
     - 34.3%
     - 26.9%
   * - Beta to BTC
     - 0.03
     - -0.12
   * - Average daily turnover
     - 63%
     - 59.4%
   * - Average gross exposure
     - 200.3%
     - 202%
   * - 1-year CAGR
     - 60.2%
     - 38.3%
   * - 2026 year-to-date
     - 30.4%
     - 24.3%
   * - Rank IC t-stat (all years)
     - -2.4
     - 0.5

1-day IC of the raw factor: mean -0.0013, standard deviation 0.2269, IR -0.01, positive on 49.9% of days.

This is the strongest factor in 2026 and one of the few that did better on Hyperliquid than on Binance. The Binance drawdown is deep, at -42%. The raw factor's 1-day IC is close to zero even though the portfolio is profitable.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/instantaneous_momentum.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/instantaneous_momentum.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/instantaneous_momentum.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/instantaneous_momentum.40>`__.

Normalised Short-Term Momentum
------------------------------

A proprietary, market-neutral measure designed to identify short-term, normalised momentum effects across crypto assets. How the normalisation is done is not disclosed.

How it is set up: coins in the Top 40 universe are ranked on normalised short-term momentum, and the example portfolio goes long the strongest and short the weakest, with no smoothing. It is one of the three components of Blended Momentum below.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.69
     - 1.50
   * - CAGR
     - 67.6%
     - 51.4%
   * - Max drawdown
     - -35%
     - -23.6%
   * - Volatility (annualised)
     - 33.9%
     - 30.7%
   * - Beta to BTC
     - 0.00
     - -0.12
   * - Average daily turnover
     - 53.7%
     - 50.2%
   * - Average gross exposure
     - 201.2%
     - 204%
   * - 1-year CAGR
     - 21.3%
     - 2.2%
   * - 2026 year-to-date
     - 0.9%
     - -7.9%
   * - Rank IC t-stat (all years)
     - -1.2
     - 0.7

1-day IC of the raw factor: mean 0.0008, standard deviation 0.2313, IR 0.00, positive on 48.7% of days.

It has a solid long-run result on both venues, but 2026 is flat to negative. As with the other momentum measures, the raw factor's 1-day IC is close to zero.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/polaris.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/polaris.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/polaris.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/polaris.40>`__.

Blended Momentum
----------------

A blend of three momentum measures: Short-Term Momentum, Instantaneous Momentum and Normalised Short-Term Momentum. It captures short-term momentum effects measured in several proprietary ways. Unravel recommends using the individual components rather than the blend.

How it is set up: the three momentum signals are combined into one ranking of the Top 40 universe, and the example portfolio is long the strongest and short the weakest coins, with no smoothing. Average gross exposure is about 173%, a bit lower than for the individual components. This blend is the momentum input to Unravel's seven-factor portfolio on the :doc:`Strategy Examples <./strategy-examples>` page.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.52
     - 1.47
   * - CAGR
     - 51.9%
     - 39.3%
   * - Max drawdown
     - -47.1%
     - -17.5%
   * - Volatility (annualised)
     - 30.5%
     - 24.6%
   * - Beta to BTC
     - 0.02
     - -0.09
   * - Average daily turnover
     - 45.4%
     - 42.4%
   * - Average gross exposure
     - 172.6%
     - 173.4%
   * - 1-year CAGR
     - 15.9%
     - 2.7%
   * - 2026 year-to-date
     - -0.5%
     - -4.7%
   * - Rank IC t-stat (all years)
     - -2.5
     - 0.6

1-day IC of the raw factor: mean -0.0026, standard deviation 0.2300, IR -0.01, positive on 48.8% of days.

The Binance drawdown of -47% is much deeper than on Hyperliquid, and the Sharpe ratio is similar on both venues.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/momentum_enhanced.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/momentum_enhanced.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/momentum_enhanced.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/momentum_enhanced.40>`__.

Mean Reversion
--------------

A basket-based reversal factor diversified across several lookback windows. It captures broad short-term reversal dynamics and statistical arbitrage opportunities in crypto assets.

How it is set up: coins in the Top 40 universe are ranked on the reversal signal, and the example portfolio buys recent relative losers and sells recent relative winners, with no smoothing. It is one of the three factors in Unravel's three-factor portfolio on the :doc:`Strategy Examples <./strategy-examples>` page.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.12
     - 1.06
   * - CAGR
     - 33.4%
     - 28.2%
   * - Max drawdown
     - -32.1%
     - -30.1%
   * - Volatility (annualised)
     - 29.6%
     - 26.9%
   * - Beta to BTC
     - 0.04
     - -0.03
   * - Average daily turnover
     - 33.1%
     - 29.3%
   * - Average gross exposure
     - 194.5%
     - 195.7%
   * - 1-year CAGR
     - 11.4%
     - 4.4%
   * - 2026 year-to-date
     - -7.1%
     - -5.1%
   * - Rank IC t-stat (all years)
     - 0.8
     - -0.5

1-day IC of the raw factor: mean 0.0004, standard deviation 0.2092, IR 0.00, positive on 50.7% of days.

The results are moderate but consistent across venues, with similar Sharpe ratios on Binance and Hyperliquid.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/mean_reversion.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/mean_reversion.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/mean_reversion.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/mean_reversion.40>`__.

Conditioned Multi-Timeframe Mean Reversion
------------------------------------------

A refined version of the Mean Reversion factor. It combines several mean-reversion transformations across multiple time frames and adds extra conditioning to make it more robust.

How it is set up: coins in the Top 40 universe are ranked on the conditioned reversal signal, and the example portfolio buys recent relative losers and sells recent relative winners, with no smoothing. Because of the conditioning the book is partly flat much of the time: average gross exposure is under 90%, versus about 200% for most factors, which gives it the lowest volatility in the catalogue.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 2.08
     - 0.85
   * - CAGR
     - 38%
     - 10.2%
   * - Max drawdown
     - -16.4%
     - -18.1%
   * - Volatility (annualised)
     - 16.1%
     - 12.3%
   * - Beta to BTC
     - 0.01
     - 0.00
   * - Average daily turnover
     - 32.9%
     - 33.8%
   * - Average gross exposure
     - 89.2%
     - 84.8%
   * - 1-year CAGR
     - -12.1%
     - -14.0%
   * - 2026 year-to-date
     - -14.4%
     - -12.3%
   * - Rank IC t-stat (all years)
     - 4.2
     - -0.2

1-day IC of the raw factor: mean 0.0151, standard deviation 0.2061, IR 0.07, positive on 52.8% of days.

On Binance it has the highest Sharpe ratio of any single factor, but it is much weaker on Hyperliquid and is down in 2026 on both venues.

Methodology: in a LinkedIn post, Mark Aron Szulyovszky of Aperiodic, Unravel's sister company, explains how this factor differs from classic pairs trading and statistical arbitrage. Those approaches build baskets with a fixed number of assets, where each asset is either in a basket or not. This factor instead finds mean-reverting baskets walk-forward, using a range of transformations and lookback periods, and gives each asset a probability of belonging to each basket. When the signals are aggregated into one cross-sectional score, each asset's mean-reversion signal is weighted by those probabilities. The post reports +170% since January 2020 with a Sharpe ratio of 1.80 and a -14.3% maximum drawdown; these figures cover a different period from the table above. The author also warns that crypto samples are small: the number of tradable assets is close to unlimited, but the liquid universe is much smaller. `Read the post <https://www.linkedin.com/posts/almostintuitive_mean-reversion-means-a-lot-of-different-share-7470090273981730817-QQ2a/>`__.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/mean_reversion_enhanced.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/mean_reversion_enhanced.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/mean_reversion_enhanced.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/mean_reversion_enhanced.40>`__.

Instantaneous Volatility
------------------------

A proprietary measure of very recent volatility. Assets with higher instantaneous volatility tend to outperform less volatile assets in certain market conditions, which makes this a regime-dependent factor.

How it is set up: coins in the Top 40 universe are ranked on instantaneous volatility, and the example portfolio is long the high-volatility and short the low-volatility coins, with no smoothing. It trades about 100% of capital per day.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.25
     - 0.62
   * - CAGR
     - 44%
     - 14%
   * - Max drawdown
     - -67.6%
     - -22.4%
   * - Volatility (annualised)
     - 33.7%
     - 26.9%
   * - Beta to BTC
     - 0.07
     - 0.14
   * - Average daily turnover
     - 99.6%
     - 98.4%
   * - Average gross exposure
     - 200.3%
     - 201.9%
   * - 1-year CAGR
     - -11.9%
     - -13.4%
   * - 2026 year-to-date
     - 10.8%
     - 3.8%
   * - Rank IC t-stat (all years)
     - 1.8
     - 1.6

1-day IC of the raw factor: mean 0.0070, standard deviation 0.2091, IR 0.03, positive on 52.3% of days.

It has the deepest drawdown in the catalogue, -68% on Binance, and its Hyperliquid Sharpe is about half the Binance figure.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/instantaneous_volatility.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/instantaneous_volatility.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/instantaneous_volatility.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/instantaneous_volatility.40>`__.

Short-Term Liquidity and Order Imbalance
----------------------------------------

A proprietary short-term liquidity factor that captures intraday market dynamics: liquidity, slippage and market order imbalances. The underlying data is collected in real time and aggregated across the most reputable derivatives exchanges.

How it is set up: coins in the Top 40 universe are ranked on the liquidity and imbalance metric, and the example portfolio goes long and short in proportion to the factor's strength. The raw signal changes quickly, so by default it is smoothed with a 20-day moving average to reduce turnover and trading costs. It is one of the seven factors in Unravel's multi-factor portfolio.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.64
     - 2.01
   * - CAGR
     - 54.7%
     - 62%
   * - Max drawdown
     - -27.2%
     - -19.4%
   * - Volatility (annualised)
     - 29.3%
     - 25.6%
   * - Beta to BTC
     - 0.12
     - 0.06
   * - Average daily turnover
     - 35.3%
     - 37%
   * - Average gross exposure
     - 202.6%
     - 206.6%
   * - 1-year CAGR
     - 3.0%
     - -4.4%
   * - 2026 year-to-date
     - -13.0%
     - -16.0%
   * - Rank IC t-stat (all years)
     - 8.2
     - 3.6

1-day IC of the raw factor: mean 0.0397, standard deviation 0.2384, IR 0.17, positive on 57.2% of days.

This is one of the few factors that did better on Hyperliquid than on Binance, and it has one of the highest rank IC t-statistics in the catalogue. 2026 is a losing year on both venues.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/altair.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/altair.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/altair.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/altair.40>`__.

Relative Illiquidity
--------------------

A liquidity premium factor: among mid- and large-cap crypto assets, those with higher relative illiquidity tend to outperform. Relative illiquidity is the arithmetic mean of several liquidity ratios, usually with market capitalisation as the denominator, including volume, open interest, order book depth and spread, aggregated across the top 10 exchanges.

How it is set up: coins in the Top 40 universe are ranked on the combined illiquidity score, and the example portfolio is long the relatively illiquid coins and short the relatively liquid ones, with no smoothing. Turnover is low, about 22-24% of capital per day.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.14
     - 0.44
   * - CAGR
     - 31.8%
     - 8%
   * - Max drawdown
     - -36%
     - -31.9%
   * - Volatility (annualised)
     - 27.6%
     - 24.5%
   * - Beta to BTC
     - 0.03
     - 0.01
   * - Average daily turnover
     - 24.3%
     - 21.8%
   * - Average gross exposure
     - 184.7%
     - 189.6%
   * - 1-year CAGR
     - -18.2%
     - -30.0%
   * - 2026 year-to-date
     - -22.8%
     - -29.4%
   * - Rank IC t-stat (all years)
     - 8.3
     - 4.3

1-day IC of the raw factor: mean 0.0374, standard deviation 0.2351, IR 0.16, positive on 57.1% of days.

The rank IC t-statistic is very high, but that has not translated into returns recently: 2026 is the worst year-to-date of any factor on both venues.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/relative_illiquidity.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/relative_illiquidity.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/relative_illiquidity.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/relative_illiquidity.40>`__.

Liquidation Risk
----------------

A leverage positioning factor: assets with more positions at risk of liquidation tend to underperform less leveraged assets. The factor estimates the positions vulnerable to forced closure at 1%, 2%, 5% and 10% moves from the current price, using data aggregated from the top 10 derivatives exchanges.

How it is set up: coins in the Top 40 universe are ranked on estimated liquidation exposure, and the example portfolio goes long the less leveraged coins and short the coins with the most at-risk leverage. The signal is smoothed with a 10-day moving average by default. The history starts in January 2021.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2021 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.61
     - 0.74
   * - CAGR
     - 51.7%
     - 18.6%
   * - Max drawdown
     - -20.1%
     - -23.4%
   * - Volatility (annualised)
     - 28.3%
     - 28.4%
   * - Beta to BTC
     - 0.03
     - 0.02
   * - Average daily turnover
     - 26.5%
     - 24%
   * - Average gross exposure
     - 202.9%
     - 203.4%
   * - 1-year CAGR
     - -6.7%
     - -21.9%
   * - 2026 year-to-date
     - -10.8%
     - -19.7%
   * - Rank IC t-stat (all years)
     - 8.6
     - 4.4

1-day IC of the raw factor: mean 0.0439, standard deviation 0.2678, IR 0.16, positive on 56.4% of days.

It has a strong, statistically significant rank IC and the highest 1-day IC in the catalogue, but the Hyperliquid Sharpe is less than half the Binance figure and both venues are down in 2026.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/margin_risk.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/margin_risk.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/margin_risk.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/margin_risk.40>`__.

Contrarian Retail Flow
----------------------

A positioning factor that measures retail investor activity and trades against it. It analyses individual executed trades, uses order sizes and types to separate retail from institutional activity, and finds the assets most influenced by retail participation, aiming to exploit overreaction and herding.

How it is set up: trade imbalances on the filtered retail trades are measured with five different techniques, whose outputs are normalised and combined in an ensemble without any optimisation or parameter fitting. The example portfolio takes contrarian long/short positions across the Top 40 universe, with a 10-day moving average on the signal. The history starts in November 2020.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Nov 15, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 0.97
     - 0.23
   * - CAGR
     - 28.1%
     - 2.7%
   * - Max drawdown
     - -26.1%
     - -26%
   * - Volatility (annualised)
     - 30.5%
     - 22.8%
   * - Beta to BTC
     - -0.01
     - -0.07
   * - Average daily turnover
     - 38.1%
     - 34.7%
   * - Average gross exposure
     - 201.1%
     - 202.2%
   * - 1-year CAGR
     - -15.1%
     - -17.3%
   * - 2026 year-to-date
     - -4.6%
     - -10.1%
   * - Rank IC t-stat (all years)
     - 0.5
     - -0.7

1-day IC of the raw factor: mean 0.0031, standard deviation 0.1954, IR 0.02, positive on 50.7% of days.

This is one of the weaker factors: the rank IC is not significant, the 1-day IC is close to zero and the Hyperliquid result is close to flat.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/retail_flow.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/retail_flow.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/retail_flow.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/retail_flow.40>`__.

Open Interest Divergence
------------------------

A positioning factor based on the persistent relationship between perpetual futures open interest dynamics and future asset performance. It identifies divergences in open interest patterns across assets and trades them systematically, aiming to profit from behavioural inefficiencies.

How it is set up: coins in the Top 40 universe are ranked on the divergence signal, and the example portfolio goes long and short with no smoothing. Turnover is low, about 20-25% of capital per day. The history starts in February 2020.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Feb 28, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.21
     - 0.90
   * - CAGR
     - 38.3%
     - 22.9%
   * - Max drawdown
     - -43%
     - -30.3%
   * - Volatility (annualised)
     - 30.6%
     - 26.8%
   * - Beta to BTC
     - -0.02
     - 0.03
   * - Average daily turnover
     - 24.7%
     - 19.9%
   * - Average gross exposure
     - 201.3%
     - 202.7%
   * - 1-year CAGR
     - -12.9%
     - -26.7%
   * - 2026 year-to-date
     - -16.8%
     - -26.2%
   * - Rank IC t-stat (all years)
     - 6.3
     - 4.1

1-day IC of the raw factor: mean 0.0266, standard deviation 0.2353, IR 0.11, positive on 55.0% of days.

It has a strong rank IC t-statistic, but 2026 is a large losing year on both venues.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/open_interest_divergence.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/open_interest_divergence.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/open_interest_divergence.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/open_interest_divergence.40>`__.

Token Supply Inflation
----------------------

A tokenomics factor that measures changes in token supply, capturing inflationary and deflationary pressure across crypto assets. It is based on the observation that supply inflation leads to underperformance, and that crypto is maturing into a market where fundamentals and tokenomics increasingly matter. The data comes directly from the protocols.

How it is set up: coins in the Top 40 universe are ranked on supply inflation, and the example portfolio goes long the low-inflation (or deflationary) tokens and short the high-inflation ones, with no smoothing. It has the lowest turnover in the catalogue, about 15% of capital per day.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.30
     - 2.14
   * - CAGR
     - 40.4%
     - 68.5%
   * - Max drawdown
     - -50.9%
     - -15.7%
   * - Volatility (annualised)
     - 29.5%
     - 25.9%
   * - Beta to BTC
     - 0.13
     - 0.08
   * - Average daily turnover
     - 15.5%
     - 14.5%
   * - Average gross exposure
     - 198.7%
     - 199.3%
   * - 1-year CAGR
     - 55.5%
     - 32.4%
   * - 2026 year-to-date
     - 29.9%
     - 18.0%
   * - Rank IC t-stat (all years)
     - 8.4
     - 5.6

1-day IC of the raw factor: mean 0.0387, standard deviation 0.2271, IR 0.17, positive on 56.2% of days.

This factor has improved recently: it is stronger on Hyperliquid than on Binance and is one of the two best factors in 2026. The early Binance history has a -51% drawdown.

Data: `raw factor values <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/raw-factors/supply_velocity.csv>`__, `example portfolio returns <https://raw.githubusercontent.com/unravel-finance/dataroom/main/data/portfolio-40-returns/supply_velocity.csv>`__ and the `factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/supply_velocity.pdf>`__.

By Unravel.

`Read more <https://unravel.finance/portfolio/supply_velocity.40>`__.

Long-Only Trend Consensus
-------------------------

A long-only trend factor that exploits the asymmetric positive expected returns of assets with a positive trend consensus. It is the only long-only factor in the catalogue and has no short exposure.

How it is set up: the portfolio goes long the top fifth of the Top 40 universe by trend consensus (Unravel calls it the top sextile but specifies 20%), and only when the overall market trend is positive. Otherwise it stays out of the market. It is shown at 100% target gross exposure. Because it sits out falling markets, average gross exposure is only about 50%. Unlike the other factors it is directional, with a beta to BTC of about 0.44.

.. list-table:: Example portfolio, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.70
     - 1.09
   * - CAGR
     - 104.2%
     - 44.5%
   * - Max drawdown
     - -46.3%
     - -28.9%
   * - Volatility (annualised)
     - 49.1%
     - 42%
   * - Beta to BTC
     - 0.44
     - 0.44
   * - Average daily turnover
     - 30.7%
     - 29.5%
   * - Average gross exposure
     - 50.8%
     - 47.1%
   * - 1-year CAGR
     - 17.6%
     - 13.5%
   * - 2026 year-to-date
     - 22.3%
     - 18.5%
   * - Rank IC t-stat (all years)
     - -0.4
     - 0.9

This is the only directional factor on this page: CAGR is high, but so are volatility and drawdown. Unravel does not publish a factsheet or factor data file for it.

By Unravel.

`Read more <https://unravel.finance/portfolio/trend_longonly_adaptive.40>`__.

Equity Factors
==============

.. _volume-momentum-deviation-factor:

The Volume Momentum Deviation Factor
-------------------------------------

A short, self-contained write-up of a volume-based factor the author calls the Volume Momentum Deviation Factor. The construction is a MACD histogram computed on volume rather than price: take a fast smoothed moving average of volume, subtract a slow one, then subtract that difference's own smoothing, leaving the second-order deviation. The published formula is ``sma(volume,13,2) - sma(volume,27,2) - sma(sma(volume,13,2) - sma(volume,27,2),10,2)`` — a 13/27 volume MACD with a 10-period signal line, expressed in the two-argument SMA convention used by Chinese quant platforms (period, weight).

The economic story is a lead-lag one. When short-horizon volume strengthens sharply against its longer-horizon baseline, participation and trading heat are rising; when that pickup in volume structure is not yet matched by a corresponding price move, the author reads the gap between fund behaviour and price performance as evidence of an incipient trend or a mispricing. The factor is meant to capture that "volume leading, price not yet reflecting" state and the continuation or correction that follows it. The post shows a backtest equity curve and notes that the whole thing is two lines of source code, inviting readers to test it themselves.

By 套利豪仔 (@pritipatelfgoo).

`Read the X post <https://x.com/pritipatelfgoo/status/2091750955582980218>`__.

.. _volatility-range-expansion-factor:

The Volatility Range Expansion Factor
---------------------------------------

A short X post from the same series as :ref:`The Volume Momentum Deviation Factor <volume-momentum-deviation-factor>` — a single-formula cross-sectional stock-selection factor, posted with its quantile backtest and an invitation to reproduce it. The author calls it the Volatility Range Expansion Factor (波动幅度扩散因子), and the stated motivation is that a stock's true daily movement is not captured by the high-low range alone: overnight gaps carry displacement that an intraday range misses entirely. The construction therefore takes the maximum of three distances — the day's range, yesterday's close to today's high, and yesterday's close to today's low — averages it over twelve days, and negates the result.

**The strategy.** The published formula is ``-MEAN(MAX(MAX((HIGH-LOW),ABS(DELAY(CLOSE,1)-HIGH)),ABS(DELAY(CLOSE,1)-LOW)),12)``. The inner expression is exactly Wilder's True Range, so the factor is the negative of a twelve-day simple-average ATR. The leading minus sign is the whole strategy: because these factors are ranked cross-sectionally and the top bucket is bought, negating the average true range means the portfolio goes long the *least* volatile names and the bottom bucket holds the most volatile. Despite the name and the author's framing around volatility expansion and overreaction, what is actually implemented is a low-volatility stock selector. The attached charts are a daily-rebalanced quantile test (rebalance period 1, horizon 1) running from January 2005 to 2026: cumulative long returns of roughly 80x for the top quantile against about 20x for the middle and 12x for the bottom, with the ordering monotone, plus a cumulative Rank IC curve that ends above 30.

**Why it should work.** The mechanism is the low-volatility anomaly, one of the better-documented failures of the CAPM. Investors who want high returns but cannot or will not use leverage bid up high-beta and high-volatility stocks instead, which leaves those names systematically overpriced and their low-volatility counterparts cheap — the betting-against-beta argument of Frazzini and Pedersen. Running alongside it is the lottery-preference effect: retail investors overpay for stocks with a chance of an extreme payoff, and measures of recent extreme movement predict poor subsequent returns for exactly that reason. Both channels are amplified in a market as retail-dominated as Chinese A-shares, which is the plausible reason a plain low-volatility sort produces a Rank IC this persistent. The choice of true range over the simpler high-low range is the one genuinely well-judged detail, and it matters more in this market than elsewhere: under daily price limits a limit-up day can print a tiny high-low range while gapping the full move from the previous close, so a range-only measure would score the most violently moving stocks as quiet ones. Taking the maximum against both gap distances repairs that. The twelve-day window, roughly two and a half trading weeks, is long enough to describe a persistent state rather than a single event.

**Our reading of the main weakness.** True range is measured in currency units and is never normalised by price, so the cross-sectional ranking is dominated by price level rather than by volatility. Prices across a broad A-share universe span two orders of magnitude while percentage true range spans about one, which means a sort on −ATR is substantially a sort on *low price*, and in this market low price is a close proxy for small and micro-cap. The backtest's shape supports that reading: the top quantile is unremarkable until the 2015 small-cap bubble, where it jumps sharply, and its steepest run comes in the 2024–2026 micro-cap rally — both episodes are size-factor events rather than low-volatility events. Dividing by close, or by a moving average of close, would separate the two hypotheses in a single line of code, and is the first thing worth testing before treating this as a volatility factor at all. Three further gaps: the cumulative Rank IC is essentially flat from 2005 to about 2013, so nearly all of a twenty-one-year result comes from the back half; the bottom quantile still returns 12x, meaning most of the headline number is market beta and only the spread is alpha; and a rebalance period of one day implies very high turnover with no transaction costs, stamp duty or borrow reported anywhere, which in A-shares is enough to consume a spread of this size.

By 套利豪仔 (@pritipatelfgoo). Quotations are X's own machine translation from the Chinese original.

`Read the X post <https://x.com/pritipatelfgoo/status/2093215831199297732>`__

The Price-Volume Decoupling Reversal Factor
---------------------------------------------

Another short, single-formula X post from 套利豪仔 (@pritipatelfgoo), in the same series as :ref:`The Volatility Range Expansion Factor <volatility-range-expansion-factor>` above and :ref:`The Volume Momentum Deviation Factor <volume-momentum-deviation-factor>` — no external write-up, just a factor formula, a paragraph of intuition, and two backtest charts, with an invitation for readers to reproduce it. The author calls it the Price-Volume Decoupling Reversal Factor (价量协同失效反转因子): the premise is that price and volume normally move together — rising prices with rising volume, falling prices with falling volume — and that when this co-movement breaks down over a short window, the resulting "structural mismatch" tends to revert.

**The strategy.** The published formula is ``-1 * RANK(COVARIANCE(RANK(CLOSE), RANK(VOLUME), 5))``. For each stock, close and volume are cross-sectionally ranked every day, then the five-day rolling covariance of those two rank series is taken; a large positive covariance means price and volume have been moving together over the past week, while a value near zero or negative means they have decoupled. Cross-sectionally ranking that covariance and negating the result puts stocks with the *weakest* recent price-volume co-movement at the top of the long bucket, so the strategy is a bet that decoupled names revert toward normal synergy — buying structural divergence and selling structural agreement.

The attached charts are a daily-rebalanced quantile backtest (rebalance period 1, horizon 1) spanning January 2005 to 2026: the top quantile compounds to roughly 60x, versus about 12x for the middle quantile and under 3x for the bottom, alongside a cumulative Rank IC curve that climbs almost monotonically to above 100 over the same period.

**Why it should work.** The mechanism sits close to standard microstructure intuition: a price move accompanied by rising volume usually signals broad participation and a degree of consensus, while a price move without matching volume — or a volume shock without a price reaction — is more consistent with a narrow subset of participants moving price, forced flow, or a temporary imbalance than with information being genuinely absorbed by the market. Ranking on a short five-day covariance window keeps the signal reactive to the kind of transient dislocation that should resolve quickly, rather than to slow, structural shifts in trading activity.

**Our reading of the main weakness.** As posted, the formula gives no way to distinguish a temporary liquidity event from a stock that has simply begun a genuine trend on rising volume — the reversal framing would misclassify the latter as decoupling and bet against it. Rank-covariance of this kind is also sensitive to a stock's baseline volume regime, and no volume-normalisation, sector-neutralisation, or turnover and cost accounting is shown, so the chart evidence is consistent with true reversal alpha but doesn't rule out an uncontrolled size or liquidity tilt either. In the replies, another trader (@DavidHoong1) asked whether this was a repost of an earlier strategy of the author's that he had tested and found didn't work; the author replied simply "Different," so the exchange is inconclusive about this specific factor but a reminder that the account posts many such factors in quick succession.

**Related research.** The idea that a break in the normal price-volume relationship is informative has a long academic history, and the literature is split on which way that information cuts — which sharpens rather than resolves the weakness above. `Campbell, Grossman & Wang (1993) <https://web.mit.edu/wangj/www/pap/CampbellGrossmanWang93.pdf>`__ model risk-averse market makers who absorb selling pressure from liquidity traders and demand a higher expected return for doing so; in their framework a price decline on high volume is a stronger signal of future outperformance than the same decline on low volume, a reversal story. `Llorente, Michaely, Saar & Wang (2002) <http://web.mit.edu/~wangj/www/pap/LlorenteMichaelySaarWang02.pdf>`__ sharpen this by splitting volume by what generates it: returns following high-volume days *continue* when the volume reflects informed, speculative trading, but *reverse* when it reflects risk-sharing or liquidity-driven trading, with the split empirically tracking proxies such as market capitalisation and bid-ask spread. A five-day rank-covariance between price and volume has no way to tell which of these two regimes it is looking at, which is exactly why it cannot cleanly separate the reversal cases the strategy wants from the continuation cases that would work against it.

The high-volume side of the same question has its own literature, with a market-specific wrinkle worth flagging given the A-share setting these charts appear to run on. `Gervais, Kaniel & Mingelgrin (2001) <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=146468>`__ document a "high-volume return premium" in US data: stocks with unusually high trading activity over a day or a week tend to appreciate over the following month, which they attribute to volume shocks raising a stock's visibility and subsequent demand. Testing the same premium in China, `Wang, Wen & Singh (2017) <https://doi.org/10.1016/j.pacfin.2017.10.003>`__ find it does not hold — high-turnover Chinese stocks instead earn a return *discount* relative to low-turnover stocks, concentrated in the small-cap, low-institutional-ownership names where retail speculation is heaviest. If that discount extends from volume levels to short-horizon price-volume mismatches, it would favour the reversal factor specifically in this market, which is a more market-structure-grounded reason to expect it to work here than the post's own intuition supplies — but it also means the result may not transfer to markets where the high-volume premium runs the other way.

By 套利豪仔 (@pritipatelfgoo). Quotations are X's own machine translation from the Chinese original.

`Read the X post <https://x.com/pritipatelfgoo/status/2099689112630653260>`__

.. _topix500-quality-adjusted-size:

Quality-Adjusted Size Effect Verified on Japanese TOPIX500 (Asness et al. 2018)
---------------------------------------------------------------------------------

A verification report applying Asness, Frazzini, Israel, Moskowitz & Pedersen's 2018 paper "Size Matters, If You Control Your Junk" to Japanese TOPIX500 data. The paper argues that the small-cap premium was being suppressed by low-quality small-caps dragging down the factor's average return. When stocks are scored on four quality dimensions and the analysis is run on quality-matched samples, the size premium re-emerges clearly.

The Japanese market backtest (TOPIX500, 2017–2025) confirms the effect with a long-short strategy going long quality small-caps and short large-caps: +8.1% annualized return, 0.88 Sharpe ratio, -12.9% maximum drawdown.

By AI Data Lab (in Japanese).

`Read the report <https://aidatalab.jp/jp/papers/asness2018_size/output/report.html>`__.

.. _topix500-fundamental-indexation:

Fundamental Indexation Verified on Japanese TOPIX500 (Arnott, Hsu & Moore 2005)
---------------------------------------------------------------------------------

A verification report applying Arnott, Hsu & Moore's 2005 "Fundamental Indexation" paper to Japanese TOPIX500 data. The paper identifies a structural flaw in market-cap weighting: because stock prices contain noise, market-cap indices mechanically overweight overvalued stocks. The fix is to weight by real economic scale — sales, cash flow, dividends, book value.

The Japanese market backtest (TOPIX500, 2017–2025) delivers +10.8% annualized return, 1.03 Sharpe ratio, and -20.1% maximum drawdown. The t-test p-value of 0.0026 confirms very high statistical confidence.

By AI Data Lab (in Japanese).

`Read the report <https://aidatalab.jp/jp/papers/arnott_hsu_moore2005/output/report.html>`__.

.. _topix500-small-cap-multi-factor:

Small-Cap × Multi-Factor Composite Verified on Japanese TOPIX500 (Alquist, Israel & Moskowitz 2018)
------------------------------------------------------------------------------------------------------

A verification report applying Alquist, Israel & Moskowitz's 2018 "Fact, Fiction, and the Size Effect" to Japanese TOPIX500 data. The paper shows that size acts as a powerful amplification catalyst: small × value, small × quality, and small × momentum portfolios each produce significantly higher returns than their large-cap equivalents.

The Japanese market backtest (TOPIX500, 2017–2025) earns the site's top S-rank (91/100): +6.4% annualized return, 1.40 Sharpe ratio, and only -7.2% maximum drawdown. The t-test p-value is <0.0001 and the effect holds in every sub-period tested.

By AI Data Lab (in Japanese).

`Read the report <https://aidatalab.jp/jp/papers/alquist_israel_moskowitz2018/output/report.html>`__.

Commodity Factors
=================

Gold and Macro Factors
----------------------

Ralph Sueppel (Macrosynergy) asks whether theory-based macroeconomic factors have predictive power for gold futures returns, using 30 years of point-in-time data (1996–2026). Rather than mining price history, the study builds conceptual macro factors from economic first principles that should support the gold price, then tests them out of sample. Three thematic scores are constructed: (1) *persistent U.S. financial and monetary ease* — assembled from CPI inflation shortfalls, unemployment increases, credit tightening, real-estate price shortfalls, and equity carry shortfalls; (2) *U.S. dollar stability risk* — excess government deficits, real trade-weighted USD depreciation, and excess Treasury volatility; and (3) *global economic doom* — GDP-weighted consumer and manufacturing "doom" scores across nine developed markets. These are z-scored, aggregated into thematic factors, and finally combined into a single composite "macro support score" for gold.

Our summary: the core claim is that gold behaves as a hedge against monetary debasement, dollar-stability erosion, and global crisis, and that publicly available macro-quantamental data captures those states well enough to time it. Point-in-time discipline is the methodological backbone — every indicator uses only information that would have been available on the day, so the reported edge is genuinely out-of-sample rather than an in-sample fit. The composite macro support score is the strongest single predictor, beating each of its three thematic components, which is the expected payoff from combining diversifying, theory-motivated signals. The economically important result is not just directional gold timing but the gold-versus-equity application: a macro-conditioned long-short between gold and the S&P 500 turned a structurally money-losing "always long gold versus equity" position into a positive-Sharpe strategy, with near-zero correlation to both gold and equity benchmarks — i.e. the value comes from *when* to hold gold, not from a permanent gold tilt. The caveats are the honest ones for this genre: Sharpe ratios are modest (below 0.55), the strategy is a single-asset directional bet with real drawdowns, and the whole apparatus depends on a proprietary macro-quantamental data feed.

Used data and code: the analysis is fully reproducible via an attached Jupyter notebook built on J.P. Morgan Macrosynergy Quantamental System (JPMaQS) data, downloaded through the DataQuery API (48 tickers, 416,571 rows across nine developed-market cross sections — USD, EUR, GBP, JPY, AUD, CAD, CHF, SEK, NOK — from 1990). The notebook uses the open-source ``macrosynergy`` Python package for factor construction (z-scoring, linear composites), signal-return diagnostics, and naive PnL evaluation; JPMaQS access requires a subscription and API credentials.

Key metrics: over 1996–2026 (~368 vol-targeted trading months), the composite macro support score predicts next-month gold futures returns with 55.2% monthly accuracy, a Pearson correlation of 0.133 (p = 0.011) and Kendall tau of 0.113 (p = 0.001) — outperforming each thematic component (financial/monetary ease 0.125, dollar stability 0.103, global doom 0.096). The directional long-short gold strategy earned 6.6% annualised at 14.1% volatility (Sharpe 0.47, Sortino 0.67) versus 4.1% and Sharpe 0.34 for long-only gold, while cutting the peak-to-trough drawdown from −77% to −32% and holding correlation to gold at just 0.12 and to equities at 0.03 (Sharpe stability ratio 2.75). A macro-managed long-only variant improved to a Sharpe of 0.52 (6.8% return, Sortino 0.73). The gold-versus-S&P 500 relative strategy returned 5.7% at 20.6% volatility (Sharpe 0.28) against −2.2% (Sharpe −0.13) for a static always-long-gold-versus-equity position, again with near-zero correlation to both benchmarks.

Introduced by Ralph Sueppel (@macro_synergy) in `this discussion <https://x.com/macro_synergy/status/2096134989041619378>`__, where he notes that "theory-based macro factors have significantly predicted gold futures returns at monthly and quarterly horizons" and that related strategies "would have generated respectable long-term P&L value with little correlation to major market benchmarks."

`Read the paper <https://macrosynergy.com/research/gold-and-macro-factors/>`__

More Factor Examples in the Learning Section
============================================

These entries define specific factors with reported evidence, but they stay on their topic pages because they are central to that topic.

- :ref:`Time Series Momentum <example-time-series-momentum>` (Momentum): an asset's own past 12-month return predicts its next-month return across futures markets.
- :ref:`Factor Momentum and the Momentum Factor <example-factor-momentum-and-the-momentum-factor>` (Momentum): momentum in factor returns, which subsumes much of individual stock momentum.
- :ref:`The Intramonth Momentum Cycle <example-the-intramonth-momentum-cycle>` (Momentum): stock momentum returns concentrated in the days before month-end.
- :ref:`Short-Term Reversal Persists Globally — If Properly Measured <example-short-term-reversal-persists-globally-if-properly-measured>` (Mean Reversion): industry-adjusted one-month reversal across 64 countries.
- :ref:`Intraday Residual Reversal in the U.S. Stock Market <example-intraday-residual-reversal-in-the-u-s-stock-market>` (Mean Reversion): reversal of 30-minute residual returns in S&P 500 stocks.
- :ref:`End-of-Day Reversal <example-end-of-day-reversal>` (Mean Reversion): reversal of the rest-of-day return in the last half hour of trading.
- :ref:`Short-horizon Mean Reversion in Cryptocurrency Markets: A Matched Cross-Market Measurement <example-short-horizon-mean-reversion-in-cryptocurrency-markets-a-mat>` (Mean Reversion): fading the previous 15-minute candle across crypto markets.
- :ref:`Altcoin-Bitcoin Arbitrage <example-altcoin-bitcoin-arbitrage>` (Statistical Arbitrage): reversal of altcoin returns against Bitcoin.
- :ref:`Trading Crypto Funding Rates — Part 1: Do Cheaper-Funding Coins Earn Better Returns? <example-trading-crypto-funding-rates-part-1-do-cheaper-funding-coins>` (Carry Trade): ranking Binance perpetuals on recent funding, long cheap and short expensive funding.
- :ref:`Predictive Order Flow Imbalance: Cross-Asset Microstructure Alpha <example-predictive-order-flow-imbalance-cross-asset-microstructure-a>` (Market Microstructure): level-1 order flow imbalance as a short-horizon signal across equities, ETFs and futures.
- :ref:`Order Flow Imbalance — A High Frequency Trading Signal <example-order-flow-imbalance-a-high-frequency-trading-signal>` (Order Flow): order flow imbalance as a predictor of Bitcoin price changes on Coinbase.
- :ref:`Volatility Salience: Evidence from the Options Market <example-volatility-salience-evidence-from-the-options-market>` (Volatility): how salient a stock's recent volatility is, as a predictor of option returns.
- :ref:`Economic Uncertainty and the Beta Anomaly in G10 Countries <example-economic-uncertainty-and-the-beta-anomaly-in-g10-countries>` (Equity Factors): the low-beta anomaly conditioned on economic policy uncertainty.
- :ref:`Skewness Managed Portfolios <example-skewness-managed-portfolios>` (Equity Factors): using forecast skewness to manage the long and short legs of equity anomalies.
