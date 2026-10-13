.. meta::
   :description: Documented examples of complete trading strategies across crypto, options, equities, futures and FX, with their construction and reported performance metrics.

Strategy Examples
~~~~~~~~~~~~~~~~~

This page collects documented, real-world examples of complete trading strategies: what the strategy trades, how positions are built and managed, and how it has performed. Each entry describes the setup and lists the reported metrics, so you can use them as reference designs and benchmarks for your own strategy research. The examples are grouped by asset class. Most figures are the authors' own backtests, so check the costs, the sample period and any out-of-sample evidence before relying on them. The individual signals behind many of these strategies are on :doc:`Factor Examples <./factor-examples>`.

Related topics include :doc:`Cryptocurrency <./cryptocurrency>` for crypto asset pricing research, :doc:`Portfolio Construction <./portfolio-construction>` for combining signals into portfolios, :doc:`Momentum <./momentum>`, :doc:`Mean Reversion <./mean-reversion>` and :doc:`Carry Trade <./carry-trade>` for the research behind individual strategy families, and :doc:`Backtesting <./backtesting>` for judging reported results.

Crypto Multi-Factor Portfolios
==============================

The portfolios in this section are published by `Unravel <https://unravel.finance/>`__, a Berlin- and London-based provider of cross-sectional crypto factors and multi-factor portfolios. Unravel publishes 5 multi-factor portfolios and 15 single-factor portfolios, each in Top 20, Top 30 and Top 40 market-cap universes. This section lists the multi-factor portfolios, one entry per portfolio type, using the Top 40 universe. The single-factor portfolios that they are built from are on the :doc:`Factor Examples <./factor-examples>` page. All of them share the same construction template:

- **Universe**: the 40 largest crypto assets by market capitalisation, selected on a rolling basis and kept survivorship-bias free. The underlying factors are computed point-in-time over 400+ tickers.
- **Signal**: several cross-sectional factor scores rank the coins and are combined into one portfolio.
- **Positions**: long the highest-ranked and short the lowest-ranked coins on the combined signal, at about 200% gross exposure (100% long, 100% short) before any adaptive overlay scales it down.
- **Risk balancing**: positions are scaled by the inverse of each asset's rolling volatility, so each asset contributes similar risk and the book is market-neutral on a volatility-adjusted basis.
- **Rebalancing**: daily, with signals updated hourly at five minutes past the hour (UTC).

The metrics below were taken from Unravel's portfolio pages on 2026-10-13, using the default smoothing for each portfolio and 0.05% transaction costs. Binance figures start in 2020 (Unravel marks the period from 2024-01-01 onwards as out-of-sample); Hyperliquid figures start on 2024-10-29 and are therefore entirely out-of-sample but cover a much shorter period. These are the vendor's own illustrative portfolios, not audited track records, and the long Binance history is mostly a backtest.

Return series can be downloaded as CSV from each portfolio page, and Unravel publishes two-page factsheets, factor data and a replication notebook in its public `dataroom repository <https://github.com/unravel-finance/dataroom>`__. The factor definitions and the way they are combined are proprietary, so the portfolios cannot be reproduced exactly from public information.

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

Crypto Factor Leadership and the Seven-Factor Composite
-------------------------------------------------------

Daniel Szemerey reports a first-half 2026 update on Aperiodic's cross-sectional crypto factors. The best single factor, Polaris, returned +15.35%, while Enhanced Carry returned +12.06%; but the main point is portfolio construction rather than leaderboard chasing. The seven-factor blend returned +9.25% year to date with a 1.80 Sharpe ratio, 9.9% volatility, and a 6.1% maximum drawdown, capturing most of the upside from the winning factor while avoiding the need to forecast which signal would lead.

Entry discussion: Enhanced Carry is the carry sleeve most directly connected to this file. It is not just a naive harvest of perpetual funding payments; the post says its return was largely driven by the predictive signal embedded in funding rates. In practice, that means ranking assets by cross-sectional funding pressure, using a composite across venues, and building a market-neutral long/short book that benefits when expensive-to-own perpetuals subsequently underperform cheaper or negative-funding assets. Supply Velocity is the on-chain supply-risk sleeve: assets with faster token supply growth or inflationary pressure are expected to lag assets with cleaner supply dynamics, although the factor cooled to +4.29% after a much stronger prior year. Margin Risk is a derivatives crowding and liquidation-overhang signal: assets with more positions near forced liquidation thresholds can underperform less leveraged assets because modest price moves can trigger mechanical selling or short-covering cascades. Altair and Relative Illiquidity are liquidity/microstructure signals; Retail Flow is a contrarian flow signal that rebounded as retail positioning shifted. The useful lesson is that these sleeves are economically different enough to diversify one another, so the composite can be more robust than any single "best" factor.

Mentioned by Daniel Szemerey in `this LinkedIn discussion <https://www.linkedin.com/posts/daniel-szemerey_our-best-crypto-alpha-factor-returned-1535-ugcPost-7480553339462754304-ZMPu/>`__, where he also links to `Aperiodic Factors <https://factors.aperiodic.io/>`__ for the live factor board.

By Daniel Szemerey.

`Read the post <https://www.linkedin.com/posts/daniel-szemerey_our-best-crypto-alpha-factor-returned-1535-ugcPost-7480553339462754304-ZMPu/>`__

Crypto Strategies
=================

Crypto Momentum Is Explained by Size: Shorting Pumped Small Caps
-----------------------------------------------------------------

A ten-post X thread by Scott Phillips arguing that the crypto momentum premium is largely a size effect, and working through what that implies for a trader operating at retail size. The starting claim is that momentum "works better on big coins" — and that the corollary is the interesting half: if momentum is stronger the larger the asset, then in the smallest names it is not merely weaker but *negative*. Phillips puts the boundary at roughly the smallest decile of coins listed on a major venue, and says the ranking variable barely matters — market cap, average volume, or any similar proxy gives the same partition. In that bucket, a large recent gain predicts a subsequent fall, which is the reversal effect most participants already recognise intuitively from watching low-quality tokens round-trip their pumps.

The explanation offered is unglamorous: rather than reaching for behavioural stories, Phillips argues that most micro-cap tokens simply are bad assets, that their promoters are looking to exit into strength, and that this becomes truer as fewer tokens survive across multiple cycles. The more useful part of the thread is the account of why the edge survives being widely known, which rests on two limits. Capacity is tiny, so professional capital cannot be bothered with it; and pressing size into an illiquid short invites a squeeze. Phillips treats the second point as the crux — short-squeeze risk is not a defect of the trade, it is the compensation, the reason the premium is left on the table for someone willing to wear it.

**The strategy, cleaned up.** Rank the tradable universe by size, using market capitalisation or average dollar volume, and keep only the smallest tier — roughly the bottom decile. Within that tier, screen for the largest one-day moves and short the biggest gainers, on the thesis that in small illiquid names a violent up-move is a reversal signal rather than a continuation signal. Position sizing is the entire risk framework: run many of these shorts concurrently at small individual size so that no single squeeze is fatal, and accept the squeeze losses as the cost of the premium rather than trying to dodge them. Phillips is explicit that the tempting refinement — modelling when squeezes occur and filtering out the trades likely to squeeze — is the wrong move, because "trying to separate the risk from the return angers the market Gods": the filter removes the compensated risk and, with it, the return. He sketches three implementation tiers — picking coins by feel, asking an LLM to screen for candidates, or doing it systematically by finding the smallest coins with the largest one-day moves — and notes in passing that the institutional version of the same insight is a cross-sectional book, long the large end and short the small end of a momentum ranking, which is roughly market-neutral by construction. Exit and trade-management rules are deferred to a promised follow-up thread and are not covered here.

**A third party backtests it.** The thread contained no backtest; dima (@dima_quant) supplied one, quoting a later Phillips post that gives the entry rule as "coins which have made a 3 standard deviation move in the last N days" along with the warning that optimising whatever rule you base it on is "canonical overfitting". The tested specification: short the bottom 30% of Binance coins by market capitalisation after a daily pump of three standard deviations or more, enter at the next UTC open, hold at most five positions at 20% each, stop at the pump day's seven-day high, take profit at 2R, and exit after three days without a further signal. Over roughly fifteen months from January 2025 to March 2026 it returns +36.4% cumulative — 28.6% annualised — on a Sharpe of 1.36 with a −15.4% maximum drawdown across 124 trades, net of 15 basis points a side and observed funding, with no minimum average-daily-volume floor. The author is explicit that this is a proof of concept rather than a tuned system.

The result is worth having because it converts an untested assertion into something with a number attached, and it is consistent with the thread's central claim: the reversal after a pump in small-cap coins is real enough to survive fees and funding. It is also much weaker evidence than the equity curve suggests. Fifteen months and 124 trades is a thin sample for a strategy whose risk is a fat left tail, and one commenter's observation that the window is a bear regime matters directly — short books flatter themselves when the market falls, and the sample contains no sustained altcoin bull run, which is precisely the environment Phillips identifies as the source of the squeeze risk that the premium compensates. The specification also embeds several choices the thread warned against fixing by optimisation: the 30% size cut-off, the 3σ threshold, 2R, three days, five positions. Nothing here shows they were swept. The absence of a liquidity floor cuts the other way, honestly making the test harder, since the bottom decile of Binance by market cap includes names where a 20% book position is not realistically short-able at the modelled price. Two suggestions in the replies point at the same weakness: capping exposure per name rather than by position count, which would address the concentration that a five-position book at 20% each creates.

Worth noting what the original thread does not contain: no backtest, no sample period, no universe definition beyond "listed on binance (or anywhere)", and no cost or borrow assumptions. It is a statement of a practitioner's prior about where the crypto size-momentum interaction sits and how to trade it, not an evidenced study — the size-sorted crypto momentum literature catalogued elsewhere in this section is where the supporting evidence would have to come from.

By Scott Phillips.

The thread quotes `a post by as required. (@0xasrequired) <https://x.com/0xasrequired/status/2092669812279271457>`__ describing exactly this trade run by hand on a perp venue: sort listings by 24-hour change descending, short any unfamiliar token up more than 50%, size up hardest on the extreme cases (a name up over 300% with positive funding), and collect exchange incentive rewards on top of the trading PnL.

`dima (@dima_quant) posted the backtest here <https://x.com/dima_quant/status/2093452753238696280>`__, quoting `Phillips's follow-up post on the entry rule <https://x.com/ScottPh77711570/status/2093272721472004387>`__.

`Read the X thread <https://x.com/ScottPh77711570/status/2092945468410274091>`__

C18 -- Peer Breadth Diffusion
-----------------------------

The Milk Man's research loop proposes C18, a daily long/short strategy across 20 Binance USDT perpetuals. For each coin, the other 19 form a peer group. A coin is eligible only when at least 80% of that identical peer set has a complete five-day return both today and yesterday; otherwise it produces no signal. The breadth measure is the share of peers with a positive five-day return today, compared with yesterday. Go long when that share crosses above 70% today after being below it yesterday, the coin's own five-day return is positive, and its daily close is up; short on the inverse: negative peer breadth crosses 70% after being below it, the coin's five-day return is negative, and its close is down.

The execution card specifies next-bar entry, a 2.5 ATR(14) stop clamped to 0.5--20%, a 3R target, and a 14-day time stop. It risks 0.25% of equity per opportunity, caps aggregate initial risk at 1.5%, and caps gross notional at 2x; only 477 of 1,313 signals since 2025 passed those portfolio caps, because signals often cluster on the same day. On a USD 100,000 account with 20 bp costs plus funding, the card reports +41.5% return, -4.6% maximum drawdown, 1,403 trades, 1.66 profit factor, and 1.28 Sharpe from 2020; the 2025-onward subset reports +16.7%, -2.8%, 468 trades, PF 2.14, and Sharpe 1.77. The latest 2026 YTD line is +10.5%, -2.4%, 225 trades, PF 2.67, and Sharpe 3.01; the last 90 days are +3.9% with a -1.9% drawdown and PF 3.45.

This is an unverified candidate rather than a validated strategy. The author explicitly says he has not yet checked the research loop's output and intends out-of-sample validation and stress testing. The 65% and 75% neighbouring thresholds reportedly remain positive, which is useful but does not substitute for a full parameter sweep, point-in-time universe checks, realistic Binance execution/funding data, and a holdout that was not used to select C18 from the loop's candidate set. It is not the same strategy as the earlier Raschke NQ EMA reversion entry: C18 is daily, cross-sectional crypto breadth/momentum with ATR exits, whereas the Raschke rule is a next-day single-index reversion setup.

The wider research-loop discussion makes the selection bias explicit. In the author's earlier shortlist, C18 is ranked first of five candidates and labelled a "BANGER," with 54% wins, PF 2.14, about 281 trades/year, -2.8% maximum drawdown and +10.5% 2026 YTD. That scorecard also prints a +105% ``YTD @10x`` column. It is an arithmetic leverage illustration, not a validated deployment claim: it conflicts with C18's own stated 2x gross-notional cap and says nothing about the nonlinear impact of fills, liquidation risk or funding at higher leverage. The author says the loop had merely produced a top-five shortlist and that he did not yet know how good the candidates were.

Our reading: the breadth cross and the same-peer-set requirement are sensible protections against reacting to a single idiosyncratic coin move or a changing universe. But the most important unknown is the research process before the card: how many signals, thresholds, universes and exit specifications were tried before C18 was chosen. A profitable 65%/70%/75% neighbourhood is encouraging, not a correction for selecting the best candidate from a search. The immediate next tests are a frozen post-selection holdout, execution on point-in-time Binance contracts with actual funding and delisting handling, sensitivity of the ATR/target/time-stop triple, and a portfolio simulation whose leverage matches the published 1.5% initial-risk and 2x-notional constraints.

By The Milk Man (@MrMilkTrading); the peer-breadth prompt came from All.them.Witches (@MacFlyMM).

`Read the candidate shortlist <https://x.com/MrMilkTrading/status/2096970241964143092>`__, the `peer-breadth discussion prompt <https://x.com/MacFlyMM/status/2096976955669180881>`__, and the `C18 detail card <https://x.com/MrMilkTrading/status/2096978472325283950>`__.

Options Strategies
==================

The Edge In Buying Straddles For The Weekend
---------------------------------------------

Thalex examines a counterintuitive options backtest: rather than continuously rolling a long straddle, buy at 08:00 UTC on Saturday and sell at 08:00 UTC on Monday. The post contrasts this two-day holding period with a weekly Friday-to-expiry long-straddle roll, whose expected negative carry reflects the variance risk premium: option sellers normally collect enough implied-volatility premium that theta outweighs buyers’ gamma over time.

On its two years of historical data, Thalex reports that the weekend version has a markedly more positive and less outlier-dependent P&L profile. Greek attribution identifies vega as the driver: vega contributes about +55k of P&L while gamma and theta together give back about 22k, and vega P&L is positive in 97% of the sampled weekends. The proposed mechanism is intraweek seasonality: weekend variance consumes more slowly than weekday variance, reducing theta decay, while implied volatility tends to reprice higher into Monday as trading activity and information flow resume. An entry-time sweep shows broadly similar results around the 08:00 UTC entry, with 10:00--13:00 UTC looking still better, which is a useful robustness check against a single chosen timestamp.

The evidence is exploratory rather than a fully reproducible trading claim: raw data, contract-selection rules, execution costs, and an out-of-sample test are not published, and the reported history covers only two years. Still, it is a clear example of decomposing an options backtest into Greeks and then testing whether an apparent timing edge survives small perturbations to its entry rule.

By Thalex.

Shared by Thalex (@ThalexGlobal) in `this X post <https://x.com/ThalexGlobal/status/2085290122983907651>`__, which links to the article.

`Read the article <https://x.com/i/article/2085245276281880576>`__

BTC Systematic Options Strategy Index: Same Strangle, Weekend Versus Full Week
--------------------------------------------------------------------------------

An instalment of a recurring biweekly report tracking a family of systematic BTC option-selling indices, all built on the same 35-delta strike rule and run from a base of 100 on 1 July 2019 to 23 August 2026. The construction is stated on the chart: weekly seven-day synthetic options, fully invested at 1x, with covered calls and collars collateralised in BTC and strangles and short puts collateralised in cash, no delta hedging, and transaction costs excluded. Volatility and Sharpe are annualised from daily returns at a zero risk-free rate. The report is written in Chinese; quotations here are X's own machine translation.

**The strategy family and its results.** Six indices are tracked. Buy-and-hold BTC ends at 733 (+633% cumulative, 32.1% annualised, 60.2% volatility, Sharpe 0.77, −77% maximum drawdown, 53% weekly win rate). The covered call reaches 1053 (+953%, Sharpe 0.84, −56%), the 35Δ/15Δ collar 808 (+708%, Sharpe 0.75, −56%), and the cash-secured short put 359 (+259%, Sharpe 0.76, −44%, 79% weekly win rate). The two that matter are the strangles. The weekly 35-delta strangle, STG35, ends at 204 — +104% over seven years, 10.5% annualised on 37.8% volatility, Sharpe 0.47, a −66% drawdown, 65% weekly win rate. The weekend-only version, WKND35, ends at 1493: +1393% cumulative, 45.9% annualised on 15.5% volatility, Sharpe 2.52, a −26% maximum drawdown and an 83% weekly win rate. The two are the same strikes and the same structure; the only difference is that one holds for the full week and the other for roughly forty hours across the weekend.

**This edition's two weeks.** BTC fell then surged, with buy-and-hold going 612 → 593 (−3.22%) → 733 (+23.70%), the gains concentrated in three days from 19 to 21 August. The author uses the fortnight to illustrate each structure's payoff shape. The covered call captured only 5.57% of a 23.70% spot move once its 63,895 strike was breached at 75,604 — the classic problem of selling the right tail while retaining the left. The collar trailed it by 0.34% and 0.41%, which is simply the cost of put insurance that expired worthless. The cash-secured put earned premium only, capturing none of the rally because its collateral is cash. STG35 lost 17.49% in the second week, the fifth-worst week in seven years, and the author notes that four of its five worst weeks came during sharp rallies. WKND35 collected its premium in both weeks, because the entire move happened on weekdays.

**Why the weekend version should work.** Options are priced off calendar time to expiry, but volatility is produced by information arrival, and the two diverge sharply across a weekend. A weekend spans roughly two-sevenths of the week's calendar time while carrying far less than two-sevenths of its news: macro releases, the US equity session, ETF creations and redemptions, CME futures, and institutional desks are all closed. Because BTC trades continuously there is no gap to price and no obvious moment at which a pricing model would mark weekend variance down, so implied volatility carried into Saturday tends to be scaled off calendar time while realised volatility follows the information calendar. Selling a strangle that spans only that window therefore harvests a structurally wider gap between implied and realised variance than selling the same strangle across the whole week. It also avoids the window where the tails live: the weekly version bears every scheduled catalyst and every liquidation cascade, and its short call is unbounded precisely when BTC trends hardest. That is the mechanism behind an 83% weekly win rate at 15.5% volatility against 65% at 37.8%, and it is why the author frames the pair as one strategy with two holding periods rather than two strategies.

**Our reading, and a contrast already in this collection.** The comparison is unusually clean as natural experiments go — identical strike rule, identical structure, one variable changed — so the gap between the two indices is close to a direct estimate of how much of a short-volatility book's risk is compensation for weekday event exposure rather than a volatility premium as such. It is worth reading alongside *The Edge In Buying Straddles For The Weekend* above, where Thalex finds that *buying* weekend straddles is profitable. The two results look contradictory and are not: Thalex attributes its P&L to vega, with implied volatility repricing higher into Monday while gamma and theta give money back, whereas a 35-delta strangle held over a quiet weekend is dominated by theta and realised variance rather than by vega. One trade is long the Monday implied-volatility reset, the other is short weekend realised variance, and the same seasonality supports both. Reconciling them properly would require the Greek attribution that this report does not publish.

The caveats are substantial. The index uses synthetic seven-day options, which is a reasonable way to hold maturity constant but is not an instrument anyone can trade — real execution means rolling listed strikes, and a forty-hour weekend structure was not readily available on exchange for much of the early sample. Transaction costs are excluded, which matters more for the weekend index than any other because it rebalances every week for a short holding period, and there is no delta hedging, so the reported Sharpe is for an unhedged short-gamma book. Seven years of BTC options history contains few genuine tail events, and a strategy whose edge is the absence of catastrophe in a particular window is exactly the kind whose worst outcome is not yet in the sample. Finally, the weekday concentration of large moves is an empirical regularity of 2020–2026 rather than a structural guarantee, and it is self-limiting: enough capital selling weekend premium would push weekend implied volatility down until the gap closes.

By leifu (@leifuchen). Index computed on the Gezhi backtesting system.

`Read the X post <https://x.com/leifuchen/status/2092637603556102161>`__

Harvesting the Volatility Risk Premium: A Learning-to-Rank Approach
--------------------------------------------------------------------

Maciej Wysocki (Department of Quantitative Finance and Machine Learning, University of Warsaw; arXiv:2608.24786, August 2026) applies cross-sectional learning-to-rank to the SPXW zero-day-to-expiration surface. Every trading day at 10:00 ET a LightGBM LambdaRank model ranks a nine-candidate set: eight short SPX put positions targeting deltas of 0.05 through 0.45, plus a synthetic *SKIP* candidate with a fixed score of zero that lets the model decline to trade. The candidate set is put-only, on the documented asymmetry of the index-option variance risk premium. Positions are held to PM cash settlement. The ranking target is unusual and is the paper's most interesting design choice: rather than end-of-day P&L, the label is a path-aware Sortino-on-bars score computed at one-minute resolution, with intraday marks taken at the *ask* — the cost to buy the position back — so a strike that finishes profitable after a violent intraday excursion is graded below one that gets there quietly.

Two risk controls sit on top. A confidence gate reads the score gap between the model's top-1 and top-2 candidates as an uncertainty signal, with a per-window threshold calibrated on a held-out six-month slice by maximising Sortino; below threshold the day is skipped. The realised trade rate that falls out of this ranges from 30.6% in 2023 to 100% in 2021 and 2025. Sizing is delegated to seven single-parameter methods, each re-fitted per window against a 16% volatility anchor. Evaluation is a four-window expanding walk-forward (train 2018-2020 → predict 2021, out to train 2018-2023 → predict 2024) with 2025 held out entirely as a single-shot integrity check, and every P&L figure carries Reg-T margin, an Interactive Brokers tiered fee schedule and bid-to-mid fills.

Our summary: this is a well-constructed paper and an unusually honest one, which matters because the headline number — out-of-time Sharpe ratios of 4.31 to 5.76 — is the kind of figure that normally signals a broken backtest. It is not broken here, but it does not mean what the magnitude suggests, and the author says so directly. The Sharpe comes almost entirely from the denominator: on the 2025 hold-out the headline Edge Allocation method earns 10.48% excess return at 1.82% realised volatility, against 8.84% at 19.12% for SPX buy-and-hold. The excess *return* advantage over passive is slim; the volatility is an order of magnitude smaller because returns are measured per unit of posted collateral, no sizing method actually reaches its 16% anchor, and abstention plus the 0DTE structure leaves many sessions at or near zero P&L. Matching the PUT index's volatility would require roughly 8x leverage, which margin, capacity and gap risk do not permit — so the paper explicitly reads its own hold-out figure as an upper bound on live deployment. A Diebold-Mariano test fails to reject equality of mean daily P&L against any external benchmark after Bonferroni correction, meaning the *level* difference is not statistically resolved on one year.

The rest of the honesty is worth cataloguing, because it is where the real information sits. Per-year Sharpe for the headline method runs from 6.52 in 2021 to 0.41 in 2024, and in 2024 five of the seven sizing methods are outright negative — the 2025 hold-out is one draw from a wide spread, not a stable operating level. The out-of-time Deflated Sharpe Ratios, which apply a 75-trial multiple-testing penalty, land at 0.856 to 0.913 and clear 0.95 for no method out of time. The author also notes the 2018-2025 sample contains no 2008-style systemic stress, and that adverse selection, queue position and market impact are unmodelled. Read as a methods contribution the paper is strong: the path-aware Sortino label, the SKIP candidate that converts "which strike" into "whether to trade at all", and the uncertainty gate are all transferable ideas, and the two-by-two ablation showing that most of the out-of-time edge comes from the ranker itself rather than the risk controls is the sort of decomposition most strategy papers omit. Read as a performance claim, the honest summary is a modest absolute edge over passive put-writing, measured on a denominator that flatters it, established on a single year.

Data and code: minute-frequency SPXW 1-minute OHLC bars and intraday quotes obtained directly from CBOE, spanning 2017-2025 with 2017 as feature warm-up; CBOE PUT and WPUT indices and SPX as benchmarks; EFFR as the risk-free rate. No public code repository and no data availability statement — the CBOE intraday options data is a commercial licence, so independent replication is expensive. Funded by IDUB University of Warsaw grant 501-D124-20-0004410.

Key metrics: on the 2025 out-of-time hold-out, the seven sizing methods produce annualised Sharpe ratios of 4.31 (quarter-Kelly) to 5.76 (Edge Allocation), against a walk-forward range of 1.90 to 3.11. Edge Allocation returns 10.48% at 1.82% volatility with a 1.43% out-of-time maximum drawdown (2.28% over the walk-forward); the deepest drawdown across all seven methods is 9.25%. Benchmarks over the same hold-out: SPX buy-and-hold 0.46 Sharpe, CBOE PUT 0.18, CBOE WPUT 0.13. Internal baselines are weaker still — random selection 0.34, always-sell-25-delta 0.00, momentum -0.40. Probabilistic Sharpe Ratio for the headline method is 0.964 against the worst external benchmark, but the multiple-testing-corrected Deflated Sharpe Ratio is 0.856 out of time. Execution stress is mild and monotonic: moving from mid fills to selling at the bid costs 6.5% to 10.9% of out-of-time Sharpe, leaving Edge Allocation at 5.31. Per-year dispersion is the number to weigh most heavily: 6.52 (2021) down to 0.41 (2024).

`Read the paper <https://arxiv.org/abs/2608.24786>`__

Equity and ETF Strategies
=========================

A Simple S&P 100 Breakout System from the RealTest Examples File
------------------------------------------------------------------

A short X post presenting a complete long-only equity trend system in six bullet points, with the author's point being that it ships as an example file with the RealTest backtesting platform rather than being anyone's proprietary edge. The rules: an S&P 100 universe, entry on a 100-day breakout, only fresh breakouts taken, candidates ranked by 100-day rate of change, a Chande-Kroll trailing stop for exits, and position sizing that risks 0.5% of equity per trade adjusted for volatility. The attached screenshot is the RealTest results row for a run labelled ``tf_trailing_stops`` covering 3 January 2006 to 28 August 2026 — 5,195 periods and 973 trades — together with a log-scale equity curve that compounds steadily across the whole span.

**The reported results.** Annualised return 9.63% on 11.87% volatility, Sharpe 0.84, net profit $569,785 compounded, maximum drawdown −15.50% against an average drawdown of 4.65%, and MAR 0.62. The trade statistics are the informative part: only 42.65% of trades win, but the average winner returns 13.50% against an average loser of 5.34%, giving a profit factor of 1.86 and an expectancy of 2.69% per trade. Winners are held 81.24 days on average and losers 22.20 — winners run almost four times as long as losers. Average exposure is 77.32%, and 71.93% of qualifying signals were skipped.

**Why it should work.** Each component maps to a documented effect. The 100-day breakout is a Donchian-style time-series momentum entry sitting squarely in the three-to-twelve-month band where return autocorrelation is strongest, the horizon at which information diffuses slowly through the investor base and momentum traders amplify the move. Ranking simultaneous breakouts by 100-day rate of change adds a cross-sectional momentum filter on top of the time-series one, so capital goes to names that have both just entered a trending state and are among the strongest movers — the two effects are known to be complementary rather than redundant. Restricting to fresh breakouts is housekeeping rather than edge: it stops the system re-entering the same extended move repeatedly and concentrating risk in one leg. The Chande-Kroll stop is ATR-based, so the exit distance scales with each name's own volatility, and pairing it with a fixed 0.5% risk budget means every position contributes roughly the same risk regardless of how volatile the underlying is. That is what keeps portfolio volatility at 11.87% while running 77% average exposure to high-momentum large caps.

The engine, though, is the asymmetry rather than any of the individual rules. A 42.65% win rate is only profitable because the trailing stop truncates losers at roughly 5% while leaving winners uncapped, and the holding-period split — 81 days against 22 — is the mechanical expression of that. This is the standard trend-following payoff, and the reason the S&P 100 universe suits it is liquidity: breakouts in mega-caps fill with little slippage and produce fewer false signals than a small-cap universe would.

**Our reading.** The headline return is not the achievement. Over 2006–2026 the S&P 500 itself compounded at roughly ten percent, so a 9.63% annualised return is at best in line with simply holding the index. What the system delivers is the drawdown profile — a −15.50% worst case across a window that contains the 2008 crisis, against something in the region of −55% for buy-and-hold — which is where the MAR of 0.62 and the modest 11.87% volatility come from. Judged as a return generator it is unremarkable; judged as a way to hold equity beta with a quarter of the tail, it is a reasonable object. One number cuts against the usual trend-following story: skew is −0.47, whereas trend systems are normally positively skewed at the portfolio level. The trade-level payoff is positively skewed as designed, but the book is long-only equities at high average exposure, so daily portfolio returns inherit equity market crash skew rather than the convexity a long/short managed-futures programme would show.

Three reproducibility gaps are worth stating. The post never defines the breakout precisely — a reader asks exactly this in the replies and it is unanswered — so whether it is a close above the prior 100-day high, an intraday high, or something else is unspecified. Nothing is said about whether S&P 100 membership is point-in-time; running today's constituents back to 2006 would be a severe survivorship bias, since those are precisely the mega-caps that won, and while RealTest with Norgate data handles this properly the post does not confirm it was used. And 71.93% of signals were skipped, meaning most qualifying breakouts went untaken because capital or position limits bound, so the result leans heavily on the 100-day ROC ranking to choose well among candidates — a sensitivity the single reported run cannot show.

By Ignis (@ignis55).

`Read the X post <https://x.com/ignis55/status/2093754279710363733>`__

VIX and Trend Following Revisited: Nearly a Decade of Out-of-Sample Evidence
------------------------------------------------------------------------------

In September 2017 Alpha Architect published *VIX and Trend-Following, the Killer Combo?*, which asked whether volatility information could improve a traditional trend-following allocation model. The intuition was that market volatility carries information about how fast a momentum signal should be measured: a shorter lookback may react better when volatility rises, while a longer window gives a more stable signal in calm markets. This follow-up tests that hypothesis on data that did not exist when the original was written — August 2017 through June 2026, a period spanning the COVID shock, the 2022 inflation and rate shock, several rapid equity reversals, and long stretches of calm.

The implementation is a transparent ETF proxy rather than an exact replication of the original index backtest. The universe is five liquid ETFs — SPY (US large cap), VXF (US ex-S&P 500), EFA (developed international), AGG (investment-grade bonds), and BIL (T-bills) — ranked monthly by momentum, with the lookback window chosen by a VIX regime classification: Green (lowest volatility, slowest lookback), Yellow (elevated, faster), and Red (extreme, fastest). Signals are computed at month end and applied the following month. Four portfolios are compared: VIX Top 1 and VIX Top 2 against fixed ten-month-momentum benchmarks 10M Top 1 and 10M Top 2.

Our summary: the honest finding is narrower than the headline CAGR gap suggests, and the post is unusually good about saying so. VIX Top 1 beat its benchmark in only 13.08% of months, and the two strategies held different portfolios in just 24.07% of months — most of the time the adaptive lookback picks the same asset the fixed one does. The entire cumulative edge comes from a small cluster of divergent allocation decisions, concentrated in 2020–2021, where rolling twelve-month relative return briefly exceeded 40 percentage points before fading back toward zero. Neither the paired t-test (p = 0.1696) nor the Wilcoxon test (p = 0.4237) reaches significance. The regime decomposition is the most useful part: Green months contributed exactly zero excess return (the strategies were identical there), Yellow months contributed 29.46 percentage points or 81.88% of the total, and the rare Red regime — only three observations — contributed the remaining 18.12%. So the defensible claim rests on the 48-month Yellow sample, not on crisis heroics. The Top 1 versus Top 2 split is the other lesson: diversifying across two assets dilutes exactly the concentrated ranking decisions that generated the edge, while keeping the higher turnover cost, so VIX Top 2 converges to its benchmark and falls behind it once costs rise.

Data and reproduction: monthly rebalanced ETF proxy backtest on SPY, VXF, EFA, AGG, and BIL from August 2017 through June 2026 (107 completed return months, 108 classified signal months), with the volatility regime derived from the ^VIX index. Results are hypothetical and gross of management fees. No code or data release accompanies the post, and the exact VIX regime thresholds and per-regime lookback lengths are described qualitatively rather than specified numerically.

Key metrics: VIX Top 1 produced a gross CAGR of 14.59% and net CAGR of 14.09% against 10.23% and 9.87% for 10M Top 1, with net Sharpe of 1.03 versus 0.81 and maximum drawdown of -11.02% versus -12.99% — a net CAGR improvement of 4.22 percentage points and an Information Ratio of 0.46. The advantage survives every cost assumption tested, still returning 12.10% versus 8.44% at 50 bps per unit of turnover, despite higher turnover (36.92% monthly, 4.43x annualised, versus 27.57% and 3.31x). VIX Top 2 by contrast returned 10.30% net against 10.40% for 10M Top 2, with an Information Ratio of 0.01 and near-identical drawdowns (-15.09% versus -15.08%), and falls to 8.88% versus 9.38% at 50 bps. By regime, VIX Top 1 averaged 1.62% monthly in Yellow versus 1.00% for the benchmark, and 4.57% versus 2.39% in Red.

By David Mesicek (Alpha Architect).

`Read the blog post <https://alphaarchitect.com/vix-trend-following-out-of-sample/>`__

Larry Connors' R3 Strategy (It Still Works)
--------------------------------------------

Quantified Strategies backtests the R3 strategy from Chapter 4 of Larry Connors' 2009 book *High Probability ETF Trading*, checking whether the published edge survived the twelve years after publication. R3 is a short-term mean-reversion system built on the 2-day RSI: the close must be above the 200-day moving average, the 2-day RSI must fall three days in a row with the first drop starting from a reading below 60, and the 2-day RSI must be below 10 on the entry day. The position is exited on the close once the 2-day RSI rises above 70. Connors also proposed an aggressive variant that adds a second unit whenever the position trades below the entry price, but that version is not tested here.

Our summary: replicated on Connors' basket of 20 liquid ETFs (plus GDX, GDXJ, TLT, XLP, and XME added by the author) from inception to December 2020, the strategy still works but has decayed — roughly half the ETFs performed worse over the twelve years since publication, and the author could not reproduce Connors' fill counts exactly despite both using dividend-adjusted data. On SPY the win rate is 90% but there are only 96 trades since 1993. Run as a portfolio across all 25 ETFs from 2000 to 2020, capped at five concurrent positions and 20% equity per position, R3 produced 992 trades, a 75% win ratio, 0.68% average gain per trade, a profit factor of 2.08, a 6.47% CAGR, and a -16% maximum drawdown concentrated in the August 2011 sovereign debt crisis. A QQQ/SPY-only version raises the profit factor to 3.37 but drops the CAGR to 2.69% because the strategy is only in the market 4.5% of the time — the classic mean-reversion trade-off between high per-trade quality and low capital utilisation.

Data and reproduction: Amibroker backtests on 25 dividend-adjusted ETFs from inception (1993 for SPY) through December 2020, with no commissions or slippage included. The full Amibroker code sits behind the site's membership, so the rules are reproducible from the article text but the exact implementation is not published.

Key metrics: all-ETF portfolio — 992 trades, 75% win ratio, 0.68% average gain per trade, profit factor 2.08, CAGR 6.47%, max drawdown -16%. SPY alone — 90% win rate over 96 trades. QQQ/SPY portfolio — profit factor 3.37, CAGR 2.69%, 4.5% time in market.

By Oddmund Groette (QuantifiedStrategies.com).

`Read the blog post <https://www.quantifiedstrategies.com/larry-connors-r3-strategy/>`__

Logistic Regression-Based Systematic Trading: Performance on the S&P 500
------------------------------------------------------------------------

Conrad O. Voigt (Stetson University) examines the performance of a Logistic Regression-Based Systematic Trading (LRST) strategy applied to S&P 500 stocks from January 1985 to July 2024. The strategy uses logistic regression to predict binary stock price movements - whether a stock's next-month return will exceed the cross-sectional median - based on 20-day and 12-month cumulative returns as features. The model employs a rolling 10-year window, re-estimating parameters every month to adapt to changing market conditions. Each month, the 20 stocks with the highest predicted probability of outperformance are selected into an equally weighted portfolio.

The LRST strategy delivered strong long-term performance, particularly during the 1990s and early 2000s, but struggled significantly in the 2021-2024 period when it consistently trailed the S&P 500. The author attributes this recent underperformance to the rise of algorithmic trading, macroeconomic shifts, and structural market changes that the simple logistic regression model was not designed to capture. The paper concludes that while the approach shows promise, incorporating additional predictive variables such as sentiment indicators and advanced ML techniques like LSTMs could improve robustness.

The data was sourced from Bloomberg and includes stocks added to or removed from the S&P 500 during the study period to mitigate survivorship bias. No code repository is provided.

Key metrics (1984-2024): annualised return 24.61% (vs 12.88% for S&P 500), annualised standard deviation 26.11%, Sharpe ratio 0.7738 (vs 0.7254), Sortino ratio 0.7514, max monthly return 35.18%, min monthly return -32.47%, monthly downside deviation 7.76%.

Mentioned by `Nam Nguyen in this discussion <https://www.linkedin.com/posts/namnguyento_evaluating-a-logistic-regression-trading-share-7458519268922503168-NSA5>`__.

`Read the paper <https://conradvoigt.github.io/Logistic%20Regression%20Based%20Trading%20on%20the%20S&P%20500.pdf>`__

Regime-Adaptive Ensemble Strategy: From Backtest to Live Paper Trading
----------------------------------------------------------------------

Brayton Beam documents the launch of his quantitative trading strategy (V3.5) into a paper trading account after a year of development. The system is a regime-adaptive ensemble of four factor experts (momentum, value, low-volatility, and defensive), with per-regime blending governed by independent classifiers: VIX percentile, yield curve, Fed cycle, and a structural-break detector. A 12-month half-life reconsolidation EMA per expert-regime cell serves as the model's memory of which experts work in which regimes. Conditional 1.25x leverage fires only on calm-bull "flow days" where five independent signals align.

The 13.5-year backtest on S&P 500 phantom-filtered top-15 stocks (2012-2025) reports a 31.20% in-sample CAGR (29.37% walk-forward), Sharpe ratio of 1.48, and max drawdown of -30.21%. Six of seven validation tests pass: walk-forward with annual CPI re-tune, parameter perturbation, Monte Carlo simulation (P(Sharpe > 1) = 94%), execution realism with realistic costs, feature ablation, and cross-universe validation. The regime holdout test flagged a Risk-On dependency which the author identifies as an architectural feature — per-ticker alpha autocorrelation captured by the reconsolidation EMA, orthogonal to standard factor exposures (Ken French MOM correlation -0.06, value +0.04). On Day 1, 43 positions filled cleanly and the model correctly de-levered into an Inflationary regime rather than mechanically applying leverage.

By Brayton Beam.

`Read the post <https://www.linkedin.com/posts/brayton-beam-93633b293_quant-algorithmictrading-systematicinvesting-share-7467215494857580544-BXSZ/>`__

Combining Three Academic Factor Strategies to Compress Drawdown and Multiply Returns
-------------------------------------------------------------------------------------

A Japanese-language portfolio construction case study examining how combining three independently sourced, uncorrelated factor strategies transforms risk-adjusted performance far beyond what any strategy achieves alone. When combined with equal weighting and monthly rebalancing, the portfolio compresses maximum drawdown from -13.4% (simple average of the three) to -3.2% — a fourfold reduction — while annualized return rises from +8.4% to +11.3%.

The three components are AI Data Lab's TOPIX500 verification reports on :doc:`Factor Examples <./factor-examples>`: :ref:`quality-adjusted size <topix500-quality-adjusted-size>`, :ref:`fundamental indexation <topix500-fundamental-indexation>` and the :ref:`small-cap multi-factor composite <topix500-small-cap-multi-factor>`. Their simple averages, +8.4% return and -13.4% maximum drawdown, are the baseline figures quoted above.

The core insight is that drawdown reduction is not merely defensive — it creates leverage headroom that converts correlation-based diversification into a compounding multiplier on absolute returns.

By AI Data Lab (in Japanese).

`Read the post <https://aidatalab.jp/jp/portfolio_process.html>`__.

Futures Strategies
==================

Linda Raschke's 15-Minute EMA Trend-Day Reversion, Backtested on NQ
--------------------------------------------------------------------

The Milk Man (@MrMilkTrading) backtests a single rule that Linda Raschke posted on X in July 2026: "If no trade to pit session 15 minute EMA on a trend day, it WILL revert to the mean the next day." The setup is a trend day on which price never trades back to the pit-session 15-minute exponential moving average; the trade is to fade that move the following morning, entering and exiting within the same session. Because the condition can only be evaluated once the prior session has closed, the signal is free of look-ahead bias. The author describes the implementation as "in raw form, definitely needs improvement" and invites others to extend it.

The published backtest covers NQ futures from 2008 to 2026 on a single contract, after friction: a 71% win rate (83% since 2022), profit factor 2.19 (2.57 since 2022), maximum peak-to-trough drawdown of $14,300, a profit-to-max-drawdown ratio of 6.0x (6.3x measured in percentage terms), cumulative net profit of about $86,000, an average of $319 per trade and roughly 15 setups a year.

Our analysis: the mechanism is a clean, well-specified counter-trend idea with genuine provenance, but three features of the presentation flatter it. First, the equity curve is plotted as cumulative dollars on one contract and is nearly flat from 2008 to 2015 before turning sharply upward after 2016. NQ rose from roughly 1,200 to over 20,000 across that window, so an identical percentage move pays around fifteen times more dollars at the end of the sample than at the start — a fixed-contract dollar curve bends upward even when the underlying edge is constant. The card's "6.3x in % terms" figure acknowledges this, but the chart is the most persuasive object in the graphic and the most distorted by it. Second, the win rate conceals negative skew: from the reported profit factor and win rate, the average winner is about 0.89 times the average loser, the classic mean-reversion profile of frequent small gains punctuated by larger losses. A 71% hit rate reads as safety while the payoff structure does the opposite, and with roughly 270 trades in total the tail is thinly sampled, so the stated maximum drawdown should be treated as a lower bound. Third, the 2022-onward split is the weakest evidence rather than the strongest: it is about 60 trades, it sits in the period where the dollar-inflation artefact is largest, and it covers an unusually reversion-friendly intraday regime in index futures.

Worth testing before trusting it: replot the results in R-multiples or ATR-normalised units to remove the nominal-growth artefact; split 2008-2016 against 2017-2026 as a genuine holdout; sweep the EMA length and the trend-day threshold looking for a sensitivity plateau rather than a spike; compare entry at the overnight session open against the RTH open, since if the reversion mostly completes overnight the edge is being captured somewhere other than where the strategy trades; and run the same rule on ES, YM and RTY, because a real market-structure effect should replicate across index futures and that is the cheapest available falsification. Note also that neither the trend-day definition, the session boundaries, nor the exit rule are stated in the source post.

**Update: an independent replication, and a decomposition that reassigns the credit.** The Dutch Warren, posting analysis as Hawk Quant (@etbent1), ran the setup on nine years of USTEC minute data (2017-2026, 15 lots, 1.25 points of friction, entry at the next morning's open toward the EMA, flat the same morning, stopless by design). The rule as he implements it is "a trend day that closes near its extreme and never touches the 20-EMA." The headline replicates: 75% wins and a 2.32 profit factor against the original's 71% and 2.19, on 145 trades, $52,560 net on 15 lots after costs, a deepest drawdown of $10,356 and a 5.1x profit-to-drawdown ratio against the original's 6.0x. In his words, "the claim holds."

The more valuable contribution is a two-by-two that splits the rule into its two conditions and prices each separately. Trend day with the EMA untouched gives a 2.32 profit factor over 145 days (+$52,560); trend day with the EMA touched gives 0.95 over 325 days (-$8,445); *ordinary* day with the EMA untouched still gives 1.64 over 140 days (+$32,674); ordinary day with the EMA touched gives 0.90 over 1,710 days (-$84,404). Both EMA-touched cells lose money and both EMA-untouched cells make it, so the discriminating condition is the untouched moving average, not the trend day — the trend-day filter improves an edge that already exists without it. Hence his summary that "the trend day turns out to be the passenger. The untouched 20-EMA is the engine." Acting on that, loosening the trend-day threshold from a body-to-range ratio of 0.75 to 0.45 lifts the sample from 145 to 253 trades and net profit from $52,560 to $90,224, which is what the two-by-two predicts: the days admitted at the looser threshold are less trendy but still EMA-untouched, and they carry the edge.

The robustness work answers two of the tests suggested above, one favourably and one not. The threshold sweep is a plateau rather than a peak, with profit factor holding roughly 2.3 to 2.7 across body-to-range thresholds from 0.2 to 0.9 on 2023-2026 data and 1.7 to 2.0 on 2017-2022 — the published 0.75 is not a spike. A Monte Carlo of 400 runs on random days with random direction centres near 1.0 with a 95th percentile of 1.45, placing the real 2.32 at the 100th percentile of the noise distribution, and the author's own proposed control confirms it: ordinary days entered at the same distance from the EMA give 1.01 and all ordinary days give 0.95. Forty-five exit variants (five targets, three stops, three cut-off times) rank the published exit 11th at 2.32 against a best of roughly 2.5, so the original exit was neither cherry-picked nor optimal. Variants were chosen on 2017-2022 and graded on 2023-2026, and sixteen additional filters were tried without beating random pruning. Against all that, the cross-instrument test fails outright: **nine other instruments were tested and none passed.** That is the cheapest falsification available and the effect does not survive it, which argues the edge is Nasdaq-specific rather than a general property of index intraday behaviour — an important qualification on reading it as market structure.

Three differences from the original are worth holding in view when comparing the two sets of numbers. USTEC is a CFD quoted at 1 USD per index point per lot, not the NQ future, so fills come from a broker's book rather than an exchange and the dollar figures are not comparable to a one-contract NQ result. The EMA is not the same object: Raschke's wording is "pit session 15 minute EMA," most naturally read as an EMA on 15-minute bars with the period unstated, whereas this test uses a 20-period EMA on minute data — so this is a variant reading of the rule, not an exact replication of it. And the window is 2017-2026 against the original's 2008-2026, covering only the later and more favourable portion of it. The per-year bars are the useful corrective to both dollar curves: profit is positive in most years, concentrated in 2022 and 2024 at roughly $13,000 and $14,500, near flat in 2020, and negative in 2026 to date. That distribution is healthier than the original's smooth-looking cumulative ramp implied, but it also confirms the strategy has losing years, and the stopless construction means the tail remains the risk that neither backtest has yet sampled.

By The Milk Man (@MrMilkTrading), crediting Linda Raschke (@LindaRaschke) for the original rule, with the replication and rule decomposition by the Dutch Warren / Hawk Quant (@etbent1).

Mentioned by The Milk Man in `this discussion <https://x.com/MrMilkTrading/status/2094768621419471130>`__, where he presents it as "the Legend's EMA strategy" and asks readers to improve on it. The chain runs `the original rule and NQ backtest <https://x.com/MrMilkTrading/status/2094768621419471130>`__ then `the USTEC replication and two-by-two decomposition <https://x.com/etbent1/status/2094880988904243490>`__. Replies on both posts were not retrievable for this entry.

`Read the post <https://x.com/etbent1/status/2094880988904243490>`__.

Project Kintoun: A Regime-Filtered ORB Strategy
------------------------------------------------

A regime-filtered opening range breakout (ORB) strategy for NQ (Nasdaq-100) futures on 1-minute timeframes during US equity morning sessions. The strategy builds on classic ORB mechanics — trading price movements beyond the initial 15-minute range — but adds three validation layers to filter false breakouts: microstructure retest confirmation (price must return to the breakout level), VWAP slope regime filtering (trades align with intraday trend direction), and volume confirmation (breakouts require above-average participation).

Backtested from June 2022 through October 2025 across 1,062 trades, the strategy achieved a 1.47 profit factor, 2.28 Sharpe ratio, 57.24% annualized returns, and a maximum drawdown of -8.46% (6.76 Calmar ratio) on a 33.9% win rate. The implementation handles timezone alignment across daylight savings transitions, incorporates dynamic position scaling based on account equity changes, and uses multiple exit mechanisms including profit targets, stop losses, and time-based exits.

By Jeremy Hsu.

Mentioned by `Jeremy Hsu <https://www.linkedin.com/in/jerm04>`__ in `this discussion <https://www.linkedin.com/posts/jerm04_most-trading-strategies-fail-because-they-share-7423958468975407104-pZ7E>`__: "Most trading strategies fail because they assume the wrong probability model."

`Read the blog post <https://mrjerm.github.io/project_kintoun.html>`__.

Replicating and Improving the Saty Phase Oscillator Opening-Window Strategy
----------------------------------------------------------------------------

An X quote-chain in which a published intraday index-futures strategy is independently rebuilt, validated against beta and randomised entries, improved, adopted back by its author, and then stress-tested on 19 years of history it had never seen. It is a worked example of what a serious replication of a social-media strategy post looks like — and of how much the published version can flatter itself.

**The strategy.** The signal is the Saty Phase Oscillator, a free TradingView indicator plotting price displacement from the 21-period EMA normalised by ATR(14), read on a 10-minute NQ chart with extended-hours data. A close above +100 goes long, below −100 goes short; per the replicator, ±100 is roughly 3 ATR of displacement, so this buys extension rather than fading it. Entries are allowed only from 9:30–11:00 ET, exits come on the opposite cross or flat at the close, and there is no stop or target. On NQ since 2019, one contract with friction, the author reported 392 trades, a 59% win rate, 1.86 profit factor, +$259,883 and −$29,707 maximum drawdown.

**The replication.** The Dutch Warren (@etbent1) rebuilt it from the Pine source as both an MQL5 expert advisor and a Python twin, neither tuned toward the published numbers, and ran it on USTEC from 2020: 13,038 points against the original's 12,994 — a different index over a different window, about 2% apart. Two controls support it. Buying every open in the same window returns +6.5 points per trade over 1,716 trades against the signal's +35.0 over 373, so this is not simply long exposure to a rising index; and it beat all 1,000 of 1,000 random-entry variants.

**The improvements.** Two changes held on both the 2020–23 train and 2024–26 test splits. Ending the entry window at 10:00 rather than 11:00 lifts profit factor from 1.97 to 2.34 and roughly doubles return over drawdown, monotonically — every widening makes it worse. The replicator ties this to the indicator's construction: ATR(14) on 10-minute bars spans 140 minutes, so at 9:30 the normaliser is almost all premarket while by 11:00 it is full of regular-hours bars, meaning the 3-ATR threshold stops measuring the same quantity as the session progresses. Exiting at the 61.8 level instead of the full traverse to −100 lifts profit factor to 2.16. A third refinement skips entries more than 2.5 ATR from session VWAP, ending in the same place on 258 trades instead of 373 while cutting drawdown from 1,797 points to 759. The two negative results matter as much: sweeping the entry threshold from 80 to 120 shows 100 is a clean peak on both halves rather than a fitted artefact, and measured adverse excursion — winners median 35 points, losers median 117 — overlaps so heavily that any stop tighter than 150 points destroys returns, costing 53% of total profit at 60 points and 21% at 100. There is room for a catastrophe stop, not a working one.

**The round trip.** The original author adopted all three changes on NQ and re-ran his own backtest, so improvements found on another instrument in another codebase held on the instrument they came from. The current configuration is "+100/−100 cross, 9:30–10:00 ET, exit at opposite 61.8 — skip if price is > 2.5 ATR from VWAP", and adding the VWAP filter to the already-narrowed version moved profit factor 2.73 → 3.07, drawdown −$14.0K → −$10.4K, return over drawdown 16.1x → 21.8x, t-statistic 4.93 → 5.18, on unchanged total profit of +$227K. Against the original rules that is roughly 87% of the profit on fewer than half the trades — 182 since 2019 — with about a third of the drawdown. Pressed on whether this is levered tech beta, he supplied the long/short split the earlier posts lacked: shorts made $140K against longs' $87K, which is hard to square with pure long-beta over a period when the index rose throughout.

**Our reading of why it works.** Inference from the mechanics, not a claim in the posts. The construction quirk the replicator treats as a nuisance is more plausibly the edge. Because ATR(14) looks back 140 minutes, a 9:30–10:00 signal normalises the opening move against thin overnight bars, so a displacement reading as 3 ATR is a far smaller bar than 3 ATR of regular-hours volatility. The trigger therefore fires on days when the opening auction repriced the index decisively beyond its overnight range — information events and large order imbalances rather than noise. Parent orders discovered at the open are worked through the morning on scheduled algorithms, supplying the continuation the trade holds for; this is the standard microstructural account of opening-range effects. It predicts each improvement. The 10:00 cutoff works because the imbalance is largest before it has been worked off, and because a later +100 print requires a bigger move that more likely marks the end of the repricing than its start. The 61.8 exit works because the edge decays as the imbalance is absorbed. The VWAP filter works because an entry far from VWAP means chasing a move that is largely complete — the same exit from a worse price.

**Why it should travel across these instruments.** Also inference. NQ and USTEC agreement is the weakest evidence of the three, since USTEC is a contract-for-difference wrapper on the same index: it tests data and implementation, not the mechanism. US500 is the only independent instrument, and it is the one that agrees weakly. Four conditions look necessary, and they rank the instruments as observed: a discrete cash open, an overnight session thin enough that premarket-built ATR is materially smaller than regular-hours volatility, enough underlying flow that parent orders are worked over hours, and a participant mix that extends rather than fades the initial move. The Nasdaq-100 scores highest on the last two — it is the most concentrated major index, its constituents carry the heaviest single-stock options and leveraged-ETF flow, and it attracts the most momentum-oriented participation. The S&P 500 is broader and more heavily hedged, so imbalances are smaller relative to volatility and absorbed faster by cross-sector and index-arbitrage flow. Its 1.14 profit factor in 2020–23 against USTEC's 1.60 is therefore the expected ordering, not a robustness failure.

The same logic says where it should fail, which is the falsifiable half. Continuously traded assets with no opening auction — spot FX, crypto perpetuals — have no premarket-to-regular-hours volatility ratio for the normaliser to exploit and no daily moment when accumulated information discharges at once. Single stocks keep the auction but replace institutional rebalancing flow with idiosyncratic news. Part of that prediction has since been tested.

**The multi-instrument test.** The replicator ran the same signal on four instruments, each keyed to its own session open rather than the US equity open: USTEC at 09:30 ET, BTC at 10:00, gold at 01:30 (London metals) and WTI at 03:30 (London oil), on M10 bars over 2020–2026, each leg scaled to one unit of its own maximum drawdown. All three satellites earn their place on recovery factor (return ÷ max drawdown): USTEC alone 22.1, plus gold 24.0, plus BTC 29.5, plus WTI 31.1, all four 31.8. The portfolio result is the striking one — every pairwise daily correlation is within ±0.04, so four legs at one unit of risk each still draw down only 1.10 combined while return goes from 22 to 35. Near-zero correlation is itself evidence for the mechanism: if these legs were riding a common macro factor or shared beta they would move together, whereas each trading its own local session's information discharge is exactly what produces independence. The negative results carry as much information. Forex produced nothing at any hour of the day; silver, platinum and most mega-caps were actively worse than buying blind. His summary is the right one — the window matters more than the instrument.

**Scoring our prediction against it.** Half right. Forex failing at every hour is a clean confirmation, and so is the mega-cap result, where a signal that is *worse* than blind buying fits the known tendency of single-stock opening moves to reverse rather than extend. But BTC working refutes the crypto half outright, and the correction is worth making precisely. What the mechanism requires is not a formal opening auction but a recurring hour at which activity steps up sharply from a thin baseline — and post-ETF Bitcoin has one, since institutional and US-hours flow concentrates the day even though the venue never closes. An auction is one way to manufacture that step; a habitual session is another. The result also narrows our earlier account of why NQ ranks first. Gold, oil and BTC have no 0DTE hedging, no leveraged-ETF rebalancing and no mega-cap retail concentration, yet the signal works on all three, so those features cannot be what the edge depends on. The common factor is thinner: a thin period followed by a concentrated one, in an instrument whose flow at that hour is large enough to be worked over hours rather than absorbed at once. That is a better and more falsifiable claim than the equity-microstructure story it replaces. Two cautions on the test itself: it is 2020–2026 only, so the regime concerns raised by the 26-year backtest apply here with less history rather than more, and the author flags that these are CFDs rather than futures and a backtest rather than live results. There is also a selection question — establishing that forex fails "at any hour of the day" means many instrument-by-hour combinations were searched, and the surviving three were reported alongside the failures, which is the honest way to do it but still a wide search.

**Extending the sample to 2000.** Cédric Després (@semoi69) re-ran the original rules — 388 trades indicates the unrefined version — and changed how the results are presented, twice. First, a like-for-like sizing comparison on the published window: one fixed contract against risking 1% of capital per 0.4% of price movement, a constant notional of about 2.5x capital. Same signals and 59.3% win rate, but profit factor 1.85 against 1.71, CAGR +18.0% against +15.1%, Sharpe 1.38 against 1.21, at average leverage 3.1x and 2.5x. The reframing number is the drawdown: −$30,989, quoted as −24.0% of capital, implying an account near $130,000. Stated that way the strategy is an 18% CAGR at a 24% peak-to-trough loss with Calmar below 1 — respectable, but a different object from "+$227K on one contract, 21.8x return over drawdown", which omits the capital required to carry it.

Second, he extended the backtest to 2000 and shaded the region the published version never saw — "les 19 années que la stratégie publiée n'a jamais vues". Under percentage sizing the strategy does make money there, but the shape is nothing like the recent curve: a strong run into a 2008–09 peak, then roughly seven years sideways-to-underwater through 2016, mostly −5% to −25% below prior peak, before climbing again into 2019. His summary is the right one — you have to be willing to be flat for five or more years and keep taking the trades.

**Why the sizing matters.** Our analysis. Under fixed-contract sizing, dollar P&L is proportional to *point* moves, and a Nasdaq point has been worth $20 throughout while the index went from roughly 1,500 in 2003 to 25,000 today. An unchanged percentage edge therefore yields something like fifteen times more dollars at the end of the sample than at the start. That is what the chart shows: the fixed-contract line is pinned near zero across 2000–2018 and only takes off after 2019, while the percentage-sized line shows the strategy was demonstrably active and profitable in the early 2000s. The flat stretch is an artefact of quoting a two-decade backtest in undeflated points, and the same artefact inflates the recent record. This is distinct from the beta question already addressed — the random-entry and buy-every-open controls are also in points, so they establish the signal beats naive entry but do not correct for dollar magnitude scaling with index level. It also explains the post-2025 divergence: a contract at 25,000 is simply a larger bet than a contract at 7,000, which is what the 3.1x versus 2.5x average leverage measures.

**Why the regime matters.** The long flat stretch runs from roughly 2009 to 2016, which on the reading above is exactly where the mechanism should have been weakest: post-crisis quantitative easing, suppressed intraday volatility, low dispersion, dominant index arbitrage, and execution algorithms whose purpose is to absorb the opening imbalance this strategy rides. An imbalance worked off in twenty minutes yields nothing to a system holding for continuation. The strong early 2000s fit from the other direction — the dot-com unwind supplied enormous overnight repricings into a market with far less algorithmic absorption — and the post-2019 resurgence coincides with 0DTE hedging, leveraged-ETF rebalancing in mega-cap technology, and a step-change in retail participation. The 26-year curve is less an indictment than a confirmation of what the strategy is: a bet on a microstructural regime that paid in 2000–08, did not in 2009–16, and has paid again since 2019.

**What this does to the statistics.** Profit factor 3.07, return over drawdown 21.8x and a 5.18 t-statistic are all computed inside the favourable regime on 182 trades. The t-statistic tests whether the mean trade differs from zero within the sample, not whether the sample is representative, and a strategy refined on a regime will produce a strong one there almost by construction. Every improvement — the 10:00 cutoff, the 61.8 exit, the VWAP filter — was developed on 2020–26 data and validated on a split entirely inside that window, and a train/test partition of a single regime cannot detect regime-dependence. Després's real contribution is pointing out that a genuine 19-year holdout already exists, unused. Re-running the refined ruleset in percentage terms on 2000–2019 is the highest-value test remaining. In fairness, he tested the original rules rather than the refined ones, and 10-minute Nasdaq futures data with premarket sessions back to 2000 is hard enough to source that the pre-2010 portion deserves scepticism about the data before the strategy.

Remaining caveats. Slippage assumptions beyond "friction included" are never stated, nor is it shown how the results survive the 2020 volatility regime specifically. The system runs without a working stop, which the adverse-excursion study justifies statistically but which stays a live tail-risk decision — easier to see once drawdown is quoted as −24% of capital rather than a dollar figure detached from any account size.

By The Milk Man (@MrMilkTrading), with the replication and extensions by the Dutch Warren (@etbent1) and the long-history test by Cédric Després (@semoi69).

The chain runs `original rules and backtest <https://x.com/MrMilkTrading/status/2092599219521507760>`__ → `independent replication and two improvements <https://x.com/etbent1/status/2092707152251191659>`__ → `the author's acknowledgement <https://x.com/MrMilkTrading/status/2092710877845655590>`__ → `the VWAP-distance filter <https://x.com/etbent1/status/2092860879712801203>`__ → `the filter confirmed on NQ, with updated metrics <https://x.com/MrMilkTrading/status/2093162557536141453>`__. A `follow-up applies the signal to four instruments on their own session opens <https://x.com/etbent1/status/2092975986925076724>`__. Separately, `Cédric Després extends the backtest to 2000 and compares position-sizing schemes <https://x.com/semoi69/status/2093098767272620059>`__.

`Read the X post <https://x.com/etbent1/status/2092860879712801203>`__

A Trend Following Framework for Gold, Bitcoin, and Nasdaq
---------------------------------------------------------

A practical framework for systematic trend following across Gold, Nasdaq, and Bitcoin futures. The approach combines a Donchian Channel for trend detection with a Chandelier Stop for risk management. Key components include: volatility-targeted position sizing (risking 2% of equity per trade with stops at 3x ATR), a two-stage exit mechanism using both protective trailing stops and technical exits based on lowest low breakdowns.

The system targets "fat tails" while keeping maximum drawdown to -15%. With a 47% win rate but favorable risk/reward (average win 4.30% vs average loss 2.06%), the framework emphasizes that systematic execution beats emotional guessing. Assets are chosen for their high volatility, strong trends, and low correlation.

By Petr Podhajsky. Tools used: RealTest & Norgate Data.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_terrified-of-buying-the-top-in-gold-bitcoin-ugcPost-7424474305478000640-bV86/>`__

FX Strategies
=============

Systematic FX trading with regression learning and transaction cost analysis
----------------------------------------------------------------------------

Macrosynergy demonstrates how regression-based statistical learning can combine macro factors into composite trading signals for systematic developed-market FX forward trading, while explicitly accounting for transaction costs. The approach uses sequential learning: at each point in time the model type and its parameters are chosen using only the data available up to that date — through cross-validation scored on a Sortino ratio — so that signals are generated without hindsight bias. Ten conceptual macro factors (relative indicators such as excess core inflation versus inflation expectations, and real GDP growth versus real consumption, across a panel of eight developed-market currency areas) are winsorized at three standard deviations and fed into linear models, including ordinary and time-weighted least squares, with variants such as non-negative least squares and elastic net able to drop factors that lack plausible predictive power.

A distinctive contribution is the transaction-cost workflow: the authors use large language model prompts to retrieve key cost parameters and feed them into Python functions that impute realistic costs as a function of the notional amount traded. This turns an otherwise abstract backtest into a capacity-aware one, making explicit how risk-adjusted performance erodes as position sizes grow and where the practical limits of the strategy lie.

The study is fully reproducible through an attached Jupyter notebook built on the J.P. Morgan Macrosynergy Quantamental System (JPMaQS); running it requires access to J.P. Morgan DataQuery, which is available to institutional clients (including free trials) and through an academic support program.

Key metrics: over 1997-2026 the standard least-squares signal produced a Sharpe ratio of 0.6 and a Sortino ratio of 0.8 before costs, with a Sharpe stability ratio of 2.7 (an over-99% probability of generating systematic risk-adjusted returns). A representative trading book returned 6.1% annualised at 10.7% annualised volatility (about USD 15 million average annual PnL), with near-zero correlation to the S&P 500 future, the 10-year US Treasury, and EURUSD forwards. Transaction costs trimmed the annualised return only modestly — from 6.1% to 5.8% (roughly 0.3%, or about USD 750,000 per year) — and the after-cost Sharpe ratio declined from around 0.54-0.56 for USD 50 million positions per unit signal to about 0.48 for USD 250 million positions.

Mentioned by Piotr Pomorski (@PtrPomorski) in `this discussion <https://x.com/PtrPomorski/status/2071321989114151372>`__, who calls it "another goldmine from Macrosynergy" and agrees with the factor selection, while noting it is striking that the strategy's correlation with market performance is near zero across most currencies.

`Read the article <https://macrosynergy.com/research/systematic-macro-trading-with-regression-learning-and-transaction-cost-analysis/>`__

More Strategy Examples in the Learning Section
==============================================

These entries describe complete strategies with reported results, but they stay on their topic pages because they are central to that topic.

- :ref:`Demystifying Managed Futures <example-demystifying-managed-futures>` (Trend Following): a time-series momentum futures portfolio built from 1-, 3- and 12-month signals with volatility targeting, used to explain managed-futures returns.
- :ref:`Leverage for the Long Run - A Systematic Approach to Managing Risk and Magnifying Returns in Stocks <example-leverage-for-the-long-run-a-systematic-approach-to-managing>` (Trend Following): leveraged equity exposure when the S&P 500 is above its moving average and T-bills when it is below.
- :ref:`Breaking Bad Trends <example-breaking-bad-trends>` (Trend Following): a futures trend portfolio that blends fast and slow signals depending on the trend state.
- :ref:`Pairs Trading: Performance of a Relative-Value Arbitrage Rule <example-pairs-trading-performance-of-a-relative-value-arbitrage-rule>` (Statistical Arbitrage): the classic distance-method pairs trading rule on US equities.
- :ref:`Statistical Arbitrage in the U.S. Equities Market <example-statistical-arbitrage-in-the-u-s-equities-market>` (Statistical Arbitrage): PCA and ETF residual mean reversion with s-score entry and exit rules.
- :ref:`Cluster-Based Pairs Trading: Combining Unsupervised Learning with Cointegration Filtering <example-cluster-based-pairs-trading-combining-unsupervised-learning>` (Statistical Arbitrage): ETF pairs selected by clustering and cointegration filters, traded on z-score rules.
- :ref:`Exploring Risk and Return Profiles of Funding Rate Arbitrage on CEX and DEX <example-exploring-risk-and-return-profiles-of-funding-rate-arbitrage>` (Carry Trade): long spot, short perpetual funding arbitrage across centralised and decentralised exchanges.
- :ref:`Basis Trading and HIP-3 Spread Capture <example-basis-trading-and-hip-3-spread-capture>` (Carry Trade): a delta-neutral spread and funding trade between Hyperliquid core and HIP-3 markets.
- :ref:`Revisiting Trend-Following and Mean-Reversion Strategies in Bitcoin <example-revisiting-trend-following-and-mean-reversion-strategies-in>` (Mean Reversion): Bitcoin trading rules based on recent local maxima and minima.
- :ref:`Simple Dynamic Stock/Bond/Gold Portfolios <example-simple-dynamic-stock-bond-gold-portfolios>` (Portfolio Construction): a monthly constrained mean-variance allocation across stocks, bonds, gold and cash, with replication code.
- :ref:`Backtesting, Biases, and the Bilbo Box Breakout <example-backtesting-biases-and-the-bilbo-box-breakout>` (Backtesting): an options breakout strategy tested on real option quotes, alongside a primer on backtest biases.
- :ref:`Regime-Switching Factor Investing with Hidden Markov Models <example-regime-switching-factor-investing-with-hidden-markov-models>` (Market Regimes): rotating between equity factor models using a hidden Markov model regime signal.
- :ref:`Can Day Trading Really Be Profitable? Evidence from Opening Range Breakouts <example-can-day-trading-really-be-profitable-evidence-from-opening-r>` (Algorithmic Trading): an opening range breakout strategy on stocks with unusual pre-market activity.
- :ref:`Enhancing Time Series Momentum Strategies Using Deep Neural Networks <example-enhancing-time-series-momentum-strategies-using-deep-neural>` (Machine Learning): futures time-series momentum where a neural network learns both the trend estimate and the position size.
- :ref:`Tabular Deep Learning for Algorithmic Trading: Cross-Regime Bayesian Optimisation for Equity Signal Generation <example-tabular-deep-learning-for-algorithmic-trading-cross-regime-b>` (Machine Learning): a daily long/short US large-cap strategy driven by a tabular deep learning classifier.
