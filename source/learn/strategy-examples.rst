.. meta::
   :description: Example systematic crypto portfolios from Unravel: market-neutral multi-factor long/short portfolios with their construction and key metrics on Binance and Hyperliquid.

Strategy Examples
~~~~~~~~~~~~~~~~~

This page collects documented, real-world examples of complete trading strategies: what the strategy trades, how the portfolio is constructed, and how it has performed. Each entry describes the portfolio setup and lists its key metrics, so you can use them as reference designs and benchmarks for your own strategy research.

The current examples are the published portfolios of `Unravel <https://unravel.finance/>`__, a Berlin- and London-based provider of cross-sectional crypto factors and multi-factor portfolios. Unravel publishes 5 multi-factor portfolios and 15 single-factor portfolios, each in Top 20, Top 30 and Top 40 market-cap universes. This page lists the multi-factor portfolios, one entry per portfolio type, using the Top 40 universe. The single-factor portfolios that they are built from are on the :doc:`Factor Examples <./factor-examples>` page. All of them share the same construction template:

- **Universe**: the 40 largest crypto assets by market capitalisation, selected on a rolling basis and kept survivorship-bias free. The underlying factors are computed point-in-time over 400+ tickers.
- **Signal**: several cross-sectional factor scores rank the coins and are combined into one portfolio.
- **Positions**: long the highest-ranked and short the lowest-ranked coins on the combined signal, at about 200% gross exposure (100% long, 100% short) before any adaptive overlay scales it down.
- **Risk balancing**: positions are scaled by the inverse of each asset's rolling volatility, so each asset contributes similar risk and the book is market-neutral on a volatility-adjusted basis.
- **Rebalancing**: daily, with signals updated hourly at five minutes past the hour (UTC).

The metrics below were taken from Unravel's portfolio pages on 2026-10-13, using the default smoothing for each portfolio and 0.05% transaction costs. Binance figures start in 2020 (Unravel marks the period from 2024-01-01 onwards as out-of-sample); Hyperliquid figures start on 2024-10-29 and are therefore entirely out-of-sample but cover a much shorter period. These are the vendor's own illustrative portfolios, not audited track records, and the long Binance history is mostly a backtest.

Return series can be downloaded as CSV from each portfolio page, and Unravel publishes two-page factsheets, factor data and a replication notebook in its public `dataroom repository <https://github.com/unravel-finance/dataroom>`__. The factor definitions and the way they are combined are proprietary, so the portfolios cannot be reproduced exactly from public information.

Related topics include :doc:`Factor Examples <./factor-examples>` for the individual factors, :doc:`Cryptocurrency <./cryptocurrency>` for crypto asset pricing research, :doc:`Portfolio Construction <./portfolio-construction>` for combining signals into portfolios, :doc:`Momentum <./momentum>`, :doc:`Mean Reversion <./mean-reversion>` and :doc:`Carry Trade <./carry-trade>` for the research behind the factors.

Unravel Spectra
---------------

Spectra is Unravel's flagship market-neutral, multi-factor crypto portfolio. It combines seven cross-sectional factors that Unravel describes as orthogonal: blended momentum, funding rate carry, contrarian retail flow, liquidation risk, short-term liquidity and order imbalance, mean reversion and conditioned multi-timeframe mean reversion. Each of these is described as a single-factor portfolio on the :doc:`Factor Examples <./factor-examples>` page.

How the portfolio is set up: every factor ranks the coins of a rolling, survivorship-bias-free Top 40 market-cap universe, and the factor signals are combined into one long/short book that is optimised for market-neutral, risk-adjusted performance. Position sizes are scaled by the inverse of each coin's rolling volatility so that every asset contributes a similar amount of risk. The book runs at roughly 200% gross exposure (about 100% long and 100% short), is rebalanced daily and carries a risk overlay. Market neutrality is enforced on a volatility-adjusted basis, so the dollar net exposure can be non-zero on a given day while the volatility-weighted directional exposure stays negligible.

.. list-table:: Key metrics, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 3.02
     - 2.41
   * - CAGR
     - 149.2%
     - 84.7%
   * - Max drawdown
     - -26%
     - -22.1%
   * - Volatility (annualised)
     - 32%
     - 27%
   * - Beta to BTC
     - 0.08
     - -0.07
   * - Average daily turnover
     - 57.2%
     - 58.8%
   * - Average gross exposure
     - 201.4%
     - 204.7%
   * - 1-year CAGR
     - 22.7%
     - 3.2%
   * - 2026 year-to-date
     - -0.5%
     - -5.7%

Spectra shares the highest Sharpe ratio on the site with Spectra Adaptive, and its beta to BTC is close to zero on both venues. 2026 has been weak, with a 1-year CAGR far below the since-inception figure.

Unravel also publishes a `two-page factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/spectra.pdf>`__ with factor quantile and IC diagnostics.

By Unravel.

`Read more <https://unravel.finance/portfolio/spectra.40>`__.

Unravel Spectra Adaptive
------------------------

Spectra Adaptive is the Spectra seven-factor portfolio with an adaptive overlay on top. The overlay reduces the portfolio's gross exposure when market conditions are adverse, which can leave the portfolio at very small gross exposure (under 10%) for long periods.

How the portfolio is set up: the underlying book is identical to Spectra, a long/short combination of seven cross-sectional factors on the Top 40 universe, inverse-volatility sizing and daily rebalancing. The adaptive overlay then scales the whole book down in adverse regimes. In practice this cuts average gross exposure from about 200% to about 110% and lowers turnover, which reduces both return and drawdown while keeping the Sharpe ratio close to the full-exposure version.

.. list-table:: Key metrics, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 3.02
     - 2.42
   * - CAGR
     - 117.5%
     - 66.9%
   * - Max drawdown
     - -21.9%
     - -22.1%
   * - Volatility (annualised)
     - 26.9%
     - 22.1%
   * - Beta to BTC
     - 0.06
     - -0.00
   * - Average daily turnover
     - 37.2%
     - 33.7%
   * - Average gross exposure
     - 115%
     - 107.6%
   * - 1-year CAGR
     - -1.2%
     - -4.3%
   * - 2026 year-to-date
     - -2.5%
     - -4.8%

The overlay keeps the Binance Sharpe ratio unchanged at 3.02 while cutting volatility and drawdown. It did not protect 2026, which is negative year-to-date.

Unravel also publishes a `two-page factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/spectra_adaptive.pdf>`__ with factor quantile and IC diagnostics.

By Unravel.

`Read more <https://unravel.finance/portfolio/spectra_adaptive.40>`__.

Unravel Spectra High-Turnover
-----------------------------

Spectra High-Turnover combines the same seven cross-sectional factors as Spectra, but the combination is optimised for high turnover. Unlike Spectra it has no risk overlay.

How the portfolio is set up: the same seven factor signals, Top 40 universe, inverse-volatility sizing and daily rebalancing as Spectra, at about 200% gross exposure. The optimisation lets positions change much faster: average daily turnover is above 130% of capital, more than twice Spectra's. This makes the result very sensitive to execution costs, so it mostly suits venues and accounts with low fees.

.. list-table:: Key metrics, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 2.60
     - 1.41
   * - CAGR
     - 115.3%
     - 38.1%
   * - Max drawdown
     - -24.8%
     - -22.8%
   * - Volatility (annualised)
     - 31.3%
     - 25.1%
   * - Beta to BTC
     - 0.05
     - -0.10
   * - Average daily turnover
     - 133.4%
     - 143.5%
   * - Average gross exposure
     - 200.1%
     - 202.6%
   * - 1-year CAGR
     - 0.3%
     - -11.9%
   * - 2026 year-to-date
     - -14.1%
     - -18.5%

The higher turnover shows up as a much weaker Hyperliquid result than the standard Spectra over the same window, and the worst 2026 year-to-date return among the multi-factor portfolios.

Unravel also publishes a `two-page factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/spectra_highturnover.pdf>`__ with factor quantile and IC diagnostics.

By Unravel.

`Read more <https://unravel.finance/portfolio/spectra_highturnover.40>`__.

Unravel Foundational Factors
----------------------------

Foundational Factors is a smaller multi-factor portfolio that integrates three orthogonal factors inspired by the academic literature, with proprietary enhancements: momentum, mean reversion and enhanced carry. Momentum captures assets with strong, persistent price trends, mean reversion captures medium-term reversals, and carry earns funding rates and the related statistical price distortions.

How the portfolio is set up: the three factor signals rank the rolling Top 40 universe and are combined into a market-neutral long/short book with inverse-volatility position sizing, rebalanced daily, with a risk overlay. Average gross exposure is about 145%, lower than the seven-factor Spectra book. It is the simplest of Unravel's multi-factor examples and a good template for a first multi-factor crypto portfolio built from well-known factors.

.. list-table:: Key metrics, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 1.83
     - 1.69
   * - CAGR
     - 57.9%
     - 40.7%
   * - Max drawdown
     - -24.5%
     - -21.1%
   * - Volatility (annualised)
     - 26.9%
     - 21.6%
   * - Beta to BTC
     - 0.05
     - -0.07
   * - Average daily turnover
     - 56.3%
     - 56.6%
   * - Average gross exposure
     - 145.9%
     - 147%
   * - 1-year CAGR
     - 13.1%
     - 10.1%
   * - 2026 year-to-date
     - 2.1%
     - 0.5%

The Sharpe ratio is lower than Spectra's but holds up better on Hyperliquid, and 2026 is slightly positive.

Unravel also publishes a `two-page factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/foundational.pdf>`__ with factor quantile and IC diagnostics.

By Unravel.

`Read more <https://unravel.finance/portfolio/foundational.40>`__.

Unravel Foundational Adaptive
-----------------------------

Foundational Adaptive is the three-factor Foundational portfolio (momentum, mean reversion and enhanced carry) with the adaptive overlay. The overlay reduces gross exposure when market conditions are adverse, which can mean long stretches at under 10% gross exposure.

How the portfolio is set up: the same three-factor, market-neutral, inverse-volatility-sized book on the Top 40 universe, rebalanced daily, scaled down by the adaptive overlay in adverse regimes. Average gross exposure is about 80%, the lowest of the multi-factor portfolios, and turnover is about a third lower than the non-adaptive version.

.. list-table:: Key metrics, Top 40 universe, 0.05% transaction costs
   :header-rows: 1
   :widths: 40 30 30

   * - Metric
     - Binance
     - Hyperliquid
   * - Period
     - Jan 1, 2020 – Oct 13, 2026
     - Oct 29, 2024 – Oct 13, 2026
   * - Sharpe ratio
     - 2.05
     - 2.02
   * - CAGR
     - 55.4%
     - 38.6%
   * - Max drawdown
     - -24.1%
     - -10.4%
   * - Volatility (annualised)
     - 22.7%
     - 16.8%
   * - Beta to BTC
     - 0.04
     - 0.02
   * - Average daily turnover
     - 36%
     - 33.3%
   * - Average gross exposure
     - 83.4%
     - 76.8%
   * - 1-year CAGR
     - 12.2%
     - 10.3%
   * - 2026 year-to-date
     - 11.1%
     - 9.3%

This is the most defensive of the multi-factor examples: it has the smallest Hyperliquid drawdown and the best 2026 year-to-date return of the multi-factor portfolios.

Unravel also publishes a `two-page factsheet <https://raw.githubusercontent.com/unravel-finance/dataroom/main/factsheets/foundational_adaptive.pdf>`__ with factor quantile and IC diagnostics.

By Unravel.

`Read more <https://unravel.finance/portfolio/foundational_adaptive.40>`__.
