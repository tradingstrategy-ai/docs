.. meta::
   :description: Research papers and blog posts on mean reversion strategies in equities and cryptocurrency markets.

Mean Reversion
~~~~~~~~~~~~~~

Mean reversion strategies exploit the tendency for asset prices to return toward their historical average after periods of extreme deviation. Unlike momentum, which bets on continuation, mean reversion bets on correction. The strategy is particularly effective in markets with high short-term volatility and strong fundamental anchors, such as individual equity stocks where fundamental value acts as a gravitational center. Mean reversion is distinct from pairs trading — which exploits the spread between two correlated assets — in that it focuses on single-asset reversion dynamics.

The research collected here covers both the theoretical foundations of mean reversion as a power-law decay process in equity market dynamics, and practical implementation: buying dips in uptrending stocks, exploiting implied volatility extremes, and systematic strategies that enter when prices deviate significantly from moving averages. Key challenges include distinguishing temporary overshoots from genuine trend changes and avoiding "value traps" where prices fall for fundamental rather than technical reasons.

Related topics include :doc:`Statistical Arbitrage <./statistical-arbitrage>` for pairs-based mean reversion, :doc:`Technical Indicators <./technical-indicators>` for the oscillators commonly used in mean-reversion signal generation, and :doc:`Market Microstructure <./market-microstructure>` for the microstructure dynamics that create mean-reverting patterns at short horizons.

For complete worked examples of trading strategies and individual factors, see :doc:`Strategy Examples <./strategy-examples>` and :doc:`Factor Examples <./factor-examples>`.

Scale Dependent Dynamics in Equity Market Phase Space
------------------------------------------------------

This paper models mean reversion in equity markets as a scale-dependent power-law decay process, documenting that mean-reversion strength varies with both the magnitude of deviation and the time horizon. The framework provides a rigorous theoretical foundation for understanding why some mean-reversion strategies are profitable in certain regimes but not others.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6380118>`__

Advanced Signal Filtering for Mean Reversion Trading
-----------------------------------------------------

This paper develops a regime-aware neural signal filter for mean-reversion trading that achieves a Sharpe ratio of 11.05 in backtesting. The approach uses machine learning to identify when mean-reversion signals are likely to succeed versus when trending dynamics will overwhelm reversion attempts, significantly improving the timing of mean-reversion entries.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6225198>`__

Buy the Dip
-----------

A systematic approach to buying short-term dips in the stock market. The strategy identifies when stocks have pulled back from recent highs and enters positions mechanically based on predefined rules. The post covers the logic behind mean reversion in equities, entry and exit criteria, and the importance of market regime filtering to avoid catching falling knives during bear markets.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buy-the-dip/>`__.

Buy the Dip Weekly
------------------

A weekly-frequency version of the buy-the-dip mean reversion strategy for stocks. This variant adapts the daily dip-buying approach to a weekly timeframe, making it suitable for traders who prefer less frequent portfolio adjustments. The post walks through the modified rules for weekly signals, position sizing considerations, and how performance compares to the daily version.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buy-the-dip-weekly/>`__.

Buying Short-Term Dips in Stocks
---------------------------------

An interactive backtester for exploring short-term dip-buying strategies in stocks. The tool allows users to adjust parameters like the dip threshold, holding period, and market regime filter to see how different configurations affect historical performance. The backtester demonstrates the core concept that buying temporary pullbacks in uptrending stocks can produce consistent returns when combined with proper market timing and position sizing.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buying-short-term-dips-in-stocks/>`__.

Buying Short-Term Dips in Stocks - RealTest Code
-------------------------------------------------

The RealTest implementation code for the short-term dip buying strategy. This companion post provides the complete RealTest script for the mean reversion strategy that buys temporary pullbacks in uptrending stocks. The code handles position sizing, market regime filtering, and portfolio-level risk management, allowing traders to reproduce and extend the strategy using the RealTest backtesting platform.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buying-short-term-dips-in-stocks-realtest-code/>`__.

Deep Dip - Innovative Short-Term Mean Reversion
------------------------------------------------

A live trading model implementing a short-term mean reversion strategy called Deep Dip. The system targets stocks that have experienced unusually large short-term drawdowns and enters positions expecting a snap-back rally. The post describes the signal construction, filters used to avoid value traps, position sizing methodology, and real-time tracking of the model's performance as a live trading system.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/deep-dip-innovative-short-term-mean-reversion/>`__.

IV Mean Reversion
-----------------

A trading strategy based on implied volatility mean reversion. The approach identifies when implied volatility for individual stocks has moved significantly away from its historical average and takes positions expecting a reversion to the mean. The post covers how to measure IV deviation, set entry and exit thresholds, and combine the IV signal with directional filters for a complete trading system.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/iv-mean-reversion/>`__.

The Low-Volatility Anomaly Applied to Cryptocurrency Markets
-------------------------------------------------------------

Research Article #43 from Trading Research Hub. Examines the low volatility anomaly applied to cryptocurrency markets. The well-documented volatility effect in equities suggests that lower-risk assets tend to outperform higher-risk counterparts on a risk-adjusted basis, defying the Capital Asset Pricing Model's prediction that higher risk should correlate with higher returns.

The article tests whether this anomaly persists in crypto markets, developing a strategy that targets lower-volatility assets with the aim of achieving competitive returns with significantly less risk. The study explores why the volatility effect exists and its implications for crypto portfolio construction and asset selection.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-43-the-volatility>`__.

Buying Crypto All-Time Highs: A Simple Strategy Beating Bitcoin 2x
-------------------------------------------------------------------

Research Article #42 from Trading Research Hub. Tests a simple momentum strategy based on buying cryptocurrencies at their all-time highs, delivering more than 2x the annualized returns of Bitcoin. The author shares how this counter-intuitive finding emerged from moving away from overly complex models toward simpler, more robust approaches.

The article demonstrates through backtesting that buying assets making new highs, rather than waiting for pullbacks, captures strong trending behavior in crypto markets. The simplicity of the rule makes it less susceptible to overfitting, and the results challenge the common retail trader instinct to avoid buying assets at their most expensive levels.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-42-buying-cryptocurrency>`__.

Broadening Portfolio Exposure to Detect Strategy Edge Decay Faster
------------------------------------------------------------------

An article describing the process of broadening portfolio exposure for efficient detection of strategy edge decay and failure. The author's portfolio combines momentum and mean reversion strategies, with the goal of reducing outcome correlation across the portfolio.

The article explains the rationale for running multiple strategy types simultaneously: it enables faster identification of when individual systems lose their edge or fail due to overfitting. By maintaining diversified exposure, the trader can detect problems earlier and reduce dependence on any single strategy, creating a more resilient overall trading operation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-the-market-a-dynamic-approach>`__.

.. _example-short-term-reversal-persists-globally-if-properly-measured:

Short-Term Reversal Persists Globally — If Properly Measured
-------------------------------------------------------------

This paper by Stosik and Zaremba investigates why the classic short-term reversal anomaly appears to have weakened globally and shows that the signal remains alive once properly measured. The authors study 64 countries and find that the standard short-term reversal signal — based on raw past returns — earns just +0.05% per month, effectively dead. However, when the reversal signal is measured relative to industry peers rather than raw price moves, the picture changes dramatically.

The key insight is that mean reversion did not disappear — it moved inside industries. By stripping out the industry component and focusing on stock-specific reversals within sectors, the authors recover a strong and economically significant signal. The industry-adjusted reversal strategy delivers +0.53% per month with a Sharpe ratio of 0.74. This suggests that much of the raw reversal signal was being contaminated by industry momentum, which moves in the opposite direction and masks the underlying mean-reversion dynamics at the individual stock level.

The paper serves as a practical reminder for anyone running factor work: when a known anomaly appears dead, the first place to check is whether the measurement still aligns with the original economic logic. In this case, decomposing returns into industry and stock-specific components reveals that the short-term reversal premium remains robust and tradeable.

Key metrics: standard reversal +0.05% monthly return, industry-adjusted reversal +0.53% monthly return, Sharpe ratio 0.74. Data covers 64 countries.

Mentioned by Ivan Blanco Sanchez in `this discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-ideas-finding-short-term-share-7457319174034436096-ocSC>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6630998>`__

.. _example-revisiting-trend-following-and-mean-reversion-strategies-in:

Revisiting Trend-Following and Mean-Reversion Strategies in Bitcoin
--------------------------------------------------------------------

This paper by Matúš Padyšák and Radovan Vojtko (Quantpedia) examines whether Bitcoin exhibits trend-following or mean-reversion patterns by analyzing price behavior relative to local maxima and minima over 10-50 day lookback periods. Using Gemini exchange data from November 2015 to August 2024, the authors find that both effects coexist: Bitcoin tends to continue trending upwards when at local highs (momentum) and to bounce back when at local lows (mean reversion).

Our summary: the paper's practical value lies in showing that trend-following and mean-reversion are not mutually exclusive in crypto — they operate at different parts of the price cycle. The combined strategy that buys at both local maxima (riding momentum) and local minima (catching reversals) dramatically reduces drawdowns compared to passive holding while maintaining strong risk-adjusted returns. The 10-day lookback consistently outperforms longer windows, suggesting Bitcoin's dynamics favor shorter timeframes.

Data: Bitcoin prices from Gemini exchange, November 2015 to August 2024. No code provided.

Key metrics: combined strategy annualized return 98.43%, volatility 47.75%, maximum drawdown -37.67%, return/volatility ratio 2.06. Compare to Bitcoin buy-and-hold: volatility 74.35%, maximum drawdown -83.65%.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4955617>`__

Asymmetric Mean Reversion of Bitcoin Price Returns
---------------------------------------------------

This paper by Shaen Corbet (DCU Business School) and Paraskevi Katsiampa (Sheffield Hallam University) is the first study to examine mean reversion in cryptocurrency markets. Using Bitcoin data from July 2010 to February 2018 across minutely, hourly, daily, and weekly frequencies (3,994,142 minutely observations at the highest frequency), the authors apply Asymmetric Nonlinear Autoregressive (ANAR) models to test whether Bitcoin price returns exhibit asymmetric reverting patterns similar to those documented in equity markets.

Our summary: the key finding is that negative Bitcoin returns revert faster and more strongly than positive returns — a pattern consistent with the overreaction hypothesis. The asymmetry is more pronounced in the post-$1,000 sub-period and at higher data frequencies (minutely), becoming more symmetrical at lower frequencies (weekly). Positive returns show positive serial correlation (momentum persistence), while serial correlation with prior negative returns decreases and can turn negative — confirming that downside moves snap back while upside moves tend to continue. Higher-order ANAR models reveal that positive returns have higher persistence than negative returns, further supporting asymmetric reverting behavior.

Data: Bitcoin prices from July 2010 to February 2018 at minutely, hourly, daily, and weekly frequencies. Published in International Review of Financial Analysis (2019). No code provided.

Key metrics: this is a statistical study documenting asymmetric mean reversion patterns rather than a trading strategy, so no trading performance metrics are reported. The paper establishes the empirical foundation that negative crypto returns revert faster than positive returns.

`Read the paper <https://doi.org/10.1016/j.irfa.2018.10.004>`__

Trading Multiple Mean Reversion
---------------------------------

This paper by Elena Boguslavskaya, Mikhail Boguslavsky, and Dmitry Muravey addresses the portfolio construction problem for multiple mean-reverting assets. The authors formulate an optimal control problem for an agent trading several Ornstein-Uhlenbeck mean-reverting assets simultaneously, assuming power utility preferences. They derive a semi-explicit solution that enables analysis of parameter specification errors and optimal portfolio properties.

Our summary: the paper's key theoretical contribution is answering whether zero mean-reversion assets should be included in a portfolio alongside mean-reverting ones, and how to optimally allocate across multiple mean-reverting processes with different speeds and volatilities. The semi-explicit solution form makes the framework practical for real portfolio construction in pairs trading and stat-arb contexts. The analysis of parameter misspecification is particularly relevant for practitioners, as mean-reversion speed estimates are notoriously noisy in practice.

Data: theoretical framework with analytical solutions. No empirical backtesting data. No code provided.

Key metrics: this is a theoretical paper providing closed-form solutions rather than empirical trading results. The framework enables optimal position sizing across multiple mean-reverting spreads under power utility.

`Read the paper <https://arxiv.org/abs/2009.09816>`__

Optimal Mean Reversion Trading with Transaction Costs and Stop-Loss Exit
-------------------------------------------------------------------------

This paper by Tim Leung and Xin Li studies optimal timing strategies for trading a mean-reverting price spread modeled as an Ornstein-Uhlenbeck process. The authors formulate the problem as an optimal double stopping problem to determine when to enter and exit positions while accounting for transaction costs. They extend the analysis to incorporate stop-loss constraints, deriving the optimal price intervals for market entry and exit.

Our summary: the paper provides the mathematical foundation for optimal entry and exit timing in mean-reversion strategies. The key practical insight is that the optimal entry region is a bounded price interval that lies strictly above the stop-loss level, and higher stop-loss levels correlate with lower optimal take-profit thresholds. This creates a direct trade-off between drawdown control and profit targets that mean-reversion traders must navigate. The framework is widely applicable to pairs trading, stat-arb, and any strategy trading OU-modeled spreads.

Data: analytical framework with numerical solutions. Published in International Journal of Theoretical and Applied Finance, Vol. 18, No. 3 (2015). No code provided.

Key metrics: this is a theoretical paper providing optimal stopping rules rather than empirical trading results. The framework derives closed-form entry/exit boundaries as functions of OU parameters, transaction costs, and stop-loss levels.

`Read the paper <https://arxiv.org/abs/1411.5062>`__

Testing for Mean Reversion in Bitcoin Returns with Gibbs-Sampling-Augmented Randomization
------------------------------------------------------------------------------------------

This paper by Douglas Eduardo Turatti, Fernando Henrique P.S. Mendes, and João Frois Caldeira tests whether Bitcoin log-returns exhibit mean reversion using the autoregression test based on Gibbs-sampling-augmented randomization. The methodology employs Markov-switching models to handle heteroskedastic disturbances with a mixture distribution, addressing a key gap in the literature since Bitcoin had not previously been tested for mean reversion using robust methods that account for time-varying volatility.

Our summary: the paper's key finding is that Bitcoin is mean *averting* — not mean reverting — for different return horizons, model specifications, and sub-sample periods from 2010 to 2019. This is an important counter-finding to the common assumption that crypto prices revert to a mean. The explosive characteristic of Bitcoin in the sample period suggests that momentum or trend-following may dominate over mean reversion at the horizons tested. This result complements Corbet and Katsiampa's asymmetric mean reversion finding by suggesting that while short-term negative returns may revert, the overall price process is not mean-reverting.

Data: Bitcoin returns from 2010 to 2019. Published in Finance Research Letters, Vol. 34 (2020). No code provided.

Key metrics: this is a statistical testing paper rather than a trading strategy. The main result is the rejection of the mean reversion hypothesis in favor of mean aversion across multiple specifications.

`Read the paper <https://doi.org/10.1016/j.frl.2019.07.025>`__

Profiting From Sector Dispersion: The Case for Trading Sector & Industry ETFs
----------------------------------------------------------------------------

Concretum Research (Carlo Zarattini and colleagues) present a deliberately simple systematic model for exploiting cross-sectional dispersion among US sector and industry ETFs. Motivated by the current intensity of the sector-rotation debate — semiconductors after an essentially unprecedented run, software-related names after a sharp drop, and biotech breaking to a fresh multi-year high — the piece builds a rules-based strategy that actively times three iShares ETFs (SOXX for semiconductors, IGV for expanded tech-software, and IBB for biotechnology), rotating exposure to capture temporary price dislocations between them while remaining profitable under conservative transaction-cost assumptions.

Our summary: the strategy is framed as a baseline rather than an optimised product — the authors stress that experienced quantitative researchers can layer a number of standard refinements on top of the core entry/exit logic. The intuition is cross-sectional mean reversion: when one sector stretches too far relative to its peers, the model leans against the dislocation, harvesting the dispersion that sector-rotation narratives create. The article also uses the case study to introduce a "delicate" methodological point the authors consider central to the analysis and implementation of many short-term trading strategies (developed behind the paywall), signalling that realistic execution and cost modelling — results are reported net of USD 0.0035 per share — are treated as first-order concerns rather than afterthoughts.

Data and reproduction: the backtest actively times SOXX, IGV, and IBB over roughly 2016–2026 (per the equity-curve chart in the announcement), reporting results net of fees at USD 0.0035 per share. The full trading rules, portfolio-construction details, and the methodological discussion sit behind Concretum's paid Substack; no code repository is provided, and the free preview exposes only the setup and the headline metrics.

Key metrics: the net-of-fee portfolio is reported to achieve a CAGR of 24.6%, a Sharpe ratio of 1.17, and a maximum drawdown of roughly 20%, materially smoothing the equity curve relative to buying and holding any single one of the three sector ETFs.

Mentioned by Carlo Zarattini (Founder of Concretum Group, co-founder of R-Candles.com) in `this LinkedIn discussion <https://www.linkedin.com/posts/carlozarattini_a-systematic-approach-to-sector-dispersion-share-7478841533954379776--B0e/>`__, where he describes it as "a simple systematic trading model designed to exploit temporary price dislocations while remaining attractive even under conservative transaction-cost assumptions," intended as an ideal starting point for developing more sophisticated tactical sector-dispersion models.

`Read the research piece <https://concretumgroup.substack.com/p/profiting-from-sector-dispersion>`__

.. _example-short-horizon-mean-reversion-in-cryptocurrency-markets-a-mat:

Short-horizon Mean Reversion in Cryptocurrency Markets: A Matched Cross-Market Measurement
--------------------------------------------------------------------------------------------

Nadav A. Kitron and Jonathan M. Wengrowicz measure directional mean reversion on 15-minute bars across 183 Binance USDT spot pairs and a matched sample of 187 liquid US stocks and ETFs. Their pre-specified, strictly out-of-sample walk-forward protocol fits a constrained 12-lag logistic model alongside an unconstrained AR(12) logit, evaluates AUC, and controls false discoveries jointly across the 370 instruments. The authors also test whether the effect transfers to NAV-linked listed wrappers and condition it on aggressive taker flow and order-book information.

Our summary: the paper makes a careful distinction between statistical predictability and a tradeable strategy. Most of the crypto effect is captured by taking the opposite side of the preceding candle's sign, while conventional return autocorrelation is close to zero. It is stable across the study's 2021--2026 checks, survives a frozen six-month post-sample holdout and an exact permutation null, and is stronger after intensive aggressive flow. The flow evidence is consistent with liquidity providers being compensated for absorbing short-lived price pressure, but the authors appropriately do not claim it identifies the mechanism. US-listed crypto and metal funds reproduce the dynamics of their NAV underlyings, whereas merely correlated stocks do not; this suggests the effect is a property of the price process rather than its listing venue.

Data and reproduction: the primary test uses 15-minute Binance and Alpaca bars from 2025-01-01 to 2026-02-11; supporting data include Binance histories back to 2021, Coinbase/OKX/Bybit, Dukascopy, and a 2026-02--2026-08 holdout. The full replication package, frozen symbol lists, source code, result files, and file hashes are available in the authors' `GitHub repository <https://github.com/nadav2/short-horizon-reversion>`__. The underlying market data can be refetched from public exchange APIs, except that reproducing US-listed bars requires Alpaca market-data access.

Key metrics: crypto averages an out-of-sample AUC of 0.531, versus 0.499 for US stocks and ETFs; 164 of 183 crypto pairs (90%) are significant after FDR control, compared with 5 of 187 stocks/ETFs (2.7%). The designed class-mean AUC gap is +0.031; under the most conservative accounting it is +0.011 (95% CI [+0.008, +0.014]). The gross directional edge peaks near 1.3 bp per trade, below the paper's 5 bp cheapest benchmark spot round-trip cost, so the finding is not evidence of an implementable taker strategy at those costs.

`Read the paper <https://arxiv.org/abs/2608.21888>`__

Mean Reversion Strategies: Backtested Trading Rules
---------------------------------------------------

Oddmund Groette of QuantifiedStrategies.com presents three long-running ETF/index mean-reversion backtests: buying a deviation from a recent high in the Consumer Staples Select Sector SPDR Fund (XLP), shorting the Internal Bar Strength (IBS) signal in the China Large-Cap ETF (FXI), and buying a five-day low in the S&P 500. The common thesis is to buy weakness or sell strength and exit into a moderate reversal, with low time in market rather than continuous exposure.

The reported results are material but should be treated as research claims rather than executable specifications. From 2000 onward, the XLP test reports 514 trades, 0.32% average gain per trade, 6.7% CAGR versus 4.8% buy-and-hold, 20% maximum drawdown, and profit factor 1.50. The FXI IBS short, run from 2010, reports 450 trades, 0.67% average gain, 14.8% CAGR versus 1.8% buy-and-hold, 47% maximum drawdown, and profit factor 1.75. The S&P 500 five-day-low test reports 393 trades, 0.45% average gain, 7.1% CAGR versus 5.9% buy-and-hold, 23% maximum drawdown, and profit factor 1.60; its buy-and-hold comparator excludes reinvested dividends.

Data and reproduction: the article identifies the instruments and broad signal types, but its three rule blocks are now membership-gated and the offered AmiBroker/TradeStation code is paid. The visible article does not state commission, slippage, short-borrow, or fill assumptions. This prevents an independent reproduction of the reported figures; the appropriate use is as a set of falsifiable templates, particularly the high-drawdown FXI short, rather than as ready-to-trade rules.

By Oddmund Groette (QuantifiedStrategies.com).

Mentioned by QuantifiedStrategies.com in `this X post <https://x.com/QuantifiedStrat/status/2095934668847579471>`__, which says the strategies were partly published earlier, then adjusted and republished as three free examples.

`Read the blog post <https://www.quantifiedstrategies.com/mean-reversion-strategies/>`__.

From The Desk
-------------

Seth Rosenthal's Market Math essay argues that mean reversion should be treated as a testable property of a specified process, not as a label for any price move away from a moving average or a high Z-score. It distinguishes a temporary displacement from a permanent repricing, and separates several concepts that are often conflated: negative return autocorrelation, a stationary mean-reverting level process, cointegration in a spread, a low variance ratio, and an estimated half-life.

The article proposes a disciplined research sequence: define the series and equilibrium relation, test stationarity and serial dependence, measure the speed and stability of any decay, condition results on market state, inspect failed reversions, validate out of sample, and include implementation costs. Its central warning is that none of the usual diagnostics alone establishes a tradeable opportunity; apparent reversion can be regime-specific, unstable, or too small to survive liquidity and trading frictions.

By Seth Rosenthal (Market Math).

`Read the blog post <https://marketmath.substack.com/p/from-the-desk>`__.

.. _example-intraday-residual-reversal-in-the-u-s-stock-market:

Intraday Residual Reversal in the U.S. Stock Market
----------------------------------------------------

Jonathan Brogaard, Jaehee Han and Hanjun Kim study whether the part of an intraday stock return not explained by known characteristics subsequently reverses. On each 30-minute interval, the authors estimate a factor-based expected return from 15 cross-sectional characteristics, use the unexplained component as a residual-return signal, and form a market-neutral portfolio that buys the most negative-residual S&P 500 stocks and shorts the most positive-residual stocks. Their interpretation is that residual moves partly reflect temporary order-flow and liquidity pressure rather than information about fundamentals, so the long-short return is compensation for supplying liquidity to that transitory component.

Our summary: the paper is a useful bridge between cross-sectional factor modelling and microstructure mean reversion. Its unusually short holding horizon makes the headline return a statement about gross mid-quote predictability, not a ready-to-trade strategy. In the authors' transaction-cost analysis, the 30-minute implementation is not viable at 3 bp per trade; the reversal persists for roughly 3.5 hours, so longer holding periods can retain positive, significant results under some cost assumptions. That is the operative result: any implementation must earn more than spread, impact, borrow, and the cost of repeatedly trading roughly one fifth of the S&P 500, not merely reproduce a residual sort.

Data and reproduction: the study uses S&P 500 constituents from July 1996 through December 2022, 30-minute bid-ask midpoints from TAQ, and daily inputs for the 15 characteristics. The authors report 169 formation/holding variants, all positive and statistically significant before costs. No code or processed dataset is released; reproducing it requires licensed TAQ data plus historical constituent membership, point-in-time characteristic data, and careful treatment of midpoint fills, reconstitution, and shorting.

Key metrics: the baseline residual-reversal portfolio earns a reported gross annualised return of 162.3% (13.5% per month stated in the conference abstract). At the individual 30-minute horizon, the lowest-residual portfolio is reported at 5.39% annualised and the highest-residual portfolio at -2.31%, for a 7.70% annualised long-short spread. The study reports stronger results in high-VIX periods; however, the 30-minute turnover makes transaction costs the binding economic metric rather than the gross return.

Mentioned by Matias Scalbi in `this X discussion <https://x.com/MatiasScalbi/status/2100727687518056513>`__, where he highlights the 30-minute residual sort, the headline gross return, and the importance of costs and execution.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4731947>`__.

.. _example-end-of-day-reversal:

End-of-Day Reversal
--------------------

Guido Baltussen (Erasmus / Northern Trust), Zhi Da (Notre Dame) and Amar Soebhag (Erasmus / Robeco) document a cross-sectional reversal in the last 30 minutes of the US trading day: a stock's return from the previous close up to 15:00 negatively predicts its return from 15:30 to the close. The predictor, which they call ``ROD3`` (overnight + first half-hour + middle of day), deliberately skips the 15:00–15:30 window so that the result cannot be an artefact of bid-ask bounce or other microstructure noise. Sorting stocks into quintiles on ROD3 and holding only during the last half hour, the low-minus-high portfolio earns 3.78 bps per day value-weighted (9.5% annualised) and 6.86 bps per day equal-weighted (17.3% annualised), with t-statistics in simple portfolio sorts typically above 10. Positions are opened at 15:30 and closed at 16:00, so the strategy carries no overnight exposure.

Our summary: the useful part of the paper is not the headline return but the anatomy of where it comes from. The effect is almost entirely one-sided — it is driven by the subsample with negative ROD3 returns, so it is positive price pressure on intraday losers rather than symmetric reversal. In the value-weighted quintile sort the loser leg earns 3.55 bps per day while the winner leg earns only −0.22 bps, meaning the short book contributes almost nothing and a long-only implementation captures most of the gross spread. The authors then rule out the obvious explanations one by one: it is not illiquidity (it survives among the largest, most traded and most liquid stocks, with a six-factor alpha of 3.41 bps per day, t = 10.61, in the largest size quintile, against 14.71 bps, t = 27.20, in the smallest); it is not a permanent liquidity-shock correction (extending the horizon to include the next day's overnight and open, or the next close-to-close return, makes the predictability disappear, so the last-half-hour move is itself transitory); it is not gamma hedging by option or leveraged-ETF market makers (the effect remains after controlling for those demands and is strongly present in stocks with no listed options and outside index membership); and it is not arbitrageurs unwinding before the close, since undervalued ROD3 losers outperform overvalued ROD3 winners. What is left are two behavioural channels the authors measure directly: attention-induced "buy-the-dip" retail purchases, identified three ways (small-trade-size classification pre-decimalisation, the Boehmer-Jones-Zhang-Zhang algorithm for 2010–2019, and Robinhood holdings changes for 2018–2019), all showing retail buying concentrated in extreme ROD3 stocks and much stronger among losers; and short-sellers managing overnight risk, where proprietary intraday data on new short positions shows a drop during the last half hour that is more than three times larger for losers than winners. The paper also reconciles its result with the market-level intraday momentum of Gao et al. (2018) and Baltussen et al. (2021): individual stocks display time-series momentum into the close, but positive cross-stock autocorrelations dominate, producing reversal in the cross-section — the two findings are complementary rather than contradictory.

The cost caveat is stated plainly by the authors and is the reason to treat this as a stylised fact rather than a strategy. The 9.5%/17.3% figures are gross, the strategy rebalances the whole book every day for a 30-minute holding period, and the paper offers no net-of-cost backtest; it notes only that low-cost participants (market makers, proprietary desks), more extreme decile cutoffs, an explicit signal-versus-cost trade-off per stock, or folding the signal into the timing of already-planned trades are the plausible routes to capturing it, and leaves execution design to future research. The annualisation itself is mechanical — daily basis points multiplied by 252 — despite the portfolio being invested for only half an hour a day. Anyone testing this should also note that the asymmetry means the economically interesting question is whether the loser leg alone survives spread, impact and the cost of trading into the close, where liquidity is abundant but so is competition.

Data and reproduction: NYSE, NASDAQ and AMEX common stocks (share codes 10 and 11) from January 1993 to December 2019, using TAQ intraday transactions and quotes, CRSP daily data and Compustat accounting data, with both $5 and $1 price filters. Retail identification uses the Boehmer et al. (2021) method and Robinhood holdings; the short-selling evidence uses proprietary intraday data on new short positions. No public code repository is provided, and reproduction requires licensed TAQ access.

The paper placed second in the Quantpedia Awards 2025, `as noted by Erasmus University <https://www.eur.nl/en/news/end-day-reversal-pattern-second-place-quantpedia-awards-2025>`__. The freely downloadable manuscript is hosted on `Zhi Da's Notre Dame page <https://academicweb.nd.edu/~zda/EOD.pdf>`__.

Mentioned by Matias Scalbi in `this X discussion <https://x.com/MatiasScalbi/status/2102545664974405754>`__, where he summarises the ranking rule and the 15:30 entry / 16:00 exit mechanics, highlights that the reversal shows up among losers rather than winners, and stresses the two limitations that matter most: the 9.5% figure is gross with no complete post-cost backtest, and the predictive relationship vanishes once the horizon extends into the next trading day. His closing point is that identifying a historical anomaly is not enough — "you also have to understand who's generating the movement, how long it lasts, and how much it costs you to capture it."

By Guido Baltussen, Zhi Da, and Amar Soebhag.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5039009>`__.

Front-run monthly rebalancing: SPY or TLT
------------------------------------------

TiltFolio (@TiltFolio) presents a compact cross-asset mean-reversion and tactical-allocation sketch. The premise is that large funds' monthly portfolio rebalancing can create predictable demand: after stocks outperform bonds, institutional rebalancing may require buying bonds and selling stocks; after bonds outperform stocks, the flow may reverse. The proposed system uses only SPY and TLT and is framed as a way to anticipate those flows, inspired by @jedimarkus77.

The attached chart, titled ``Front-run monthly rebalancing: SPY or TLT``, shows an equity curve beginning at roughly $10,000 around January 2005 and ending near $38,000 by January 2026. Because the X post does not state the exact relative-performance lookback, signal date, trade execution, allocation or cash rules, dividend treatment, leverage, transaction costs, or benchmark, the chart is not a reproducible performance claim. Those details are essential: the result could be testing a cross-asset laggard/mean-reversion signal, a month-end calendar effect, or both, and it may be sensitive to adjusted prices and the precise timing of the rebalance.

Mentioned by TiltFolio (@TiltFolio) in `this discussion <https://x.com/TiltFolio/status/2104191288719352293>`__, where the system is described as being inspired by @jedimarkus77.

`Read the post <https://x.com/TiltFolio/status/2104191288719352293>`__.

Three Dead Simple Edges in Macro ETFs
-------------------------------------

A Substack post by Robot James presenting three straightforward systematic trading edges in macro ETFs, specifically SPY and TLT. The core thesis is that forced flows — situations where market participants must trade regardless of price — create predictable, tradeable dislocations. The post focuses on rebalancing flows as the primary mechanism: the vast wealth management industry running 60/40 stock/bond portfolios creates massive, synchronized rebalancing activity, mostly concentrated around month-end, which temporarily distorts prices.

The first strategy explicitly detailed is an end-of-month SPY/TLT rebalance flow trade: on trading day 15 of each month, compare month-to-date returns for SPY and TLT, then go long whichever has underperformed (the asset rebalancers are likely buying into) and hold until month-end. The post promises two additional similar edges, all framed as simple rules-based setups that exploit structural forced flows rather than forecasting. The full strategy details for all three edges are available to paid subscribers.

By Robot James.

`Read the blog post <https://robotjames.substack.com/p/three-dead-simple-edges-in-macro>`__.

Mean Reversion on Renko Charts: Exploiting the 70% Ranging Market
-----------------------------------------------------------------

A post by Better System Trader summarizing Stefan Friedrichowski's mean reversion framework built on a simple premise: markets spend roughly 70% of their time ranging, not trending, yet most retail trading education, indicators, and strategies are designed to capture directional moves. The proposed solution is to use percentage-based Renko bricks instead of time-based charts. Renko charts filter out time and show only price movement, making mean-reverting markets visible as a clear alternating pattern — up brick, down brick, up brick, down brick. That alternating sequence is framed as the edge: information that is present in the data but obscured by standard time-based chart formats.

The core claim — that markets range 70% of the time — aligns broadly with practitioner intuition and some empirical work on market regimes. Regime-switching models, beginning with Hamilton (1989, "A New Approach to the Economic Analysis of Nonstationary Time Series and the Business Cycle"), have consistently found that financial markets alternate between high-volatility trending states and low-volatility mean-reverting states, with the latter dominating in duration. Ang and Bekaert (2002) and Guidolin and Timmermann (2007) extended this framework to show that the "calm" regime — characterised by lower volatility and range-bound behavior — persists for longer periods across equities, FX, and fixed income. ADX-based studies in the practitioner literature frequently report that readings below 20 (indicating non-trending conditions) occur on 60–75% of trading days for major indices, depending on the lookback period and instrument — broadly consistent with Friedrichowski's 70% estimate. The mean reversion phenomenon itself is well-documented academically: Poterba and Summers (1988) found negative serial correlation in stock returns at longer horizons, Fama and French (1988) decomposed stock prices into permanent and transitory components showing significant mean-reverting behavior, and Lo and MacKinlay (1988) demonstrated short-horizon predictability through variance ratio tests. In shorter-term systematic trading, Connors and Alvarez demonstrated that RSI(2)-based mean reversion strategies on equities produced high win rates (above 70%) historically, though with significant tail risk during regime shifts.

However, the framework as presented has several important weaknesses that the literature highlights. First, Renko charts create a subtle but dangerous **backtesting bias**: a Renko brick does not close until price has moved a full brick size, meaning the closing price of a brick is known only in hindsight. This temporal distortion makes it extremely difficult to construct a realistic backtest — the "alternating pattern" is only visible after the fact, and the entry/exit signals it generates embed look-ahead information that inflates historical performance. Glasserman and Yu (2005) showed that even small sources of look-ahead bias can produce dramatic overstatement of strategy returns. Second, Renko's removal of time information discards valuable signals: time-of-day effects (Gao et al., 2018), volume patterns, and event-driven dynamics all contribute to identifying when mean reversion is likely versus when a genuine breakout is forming — stripping these out reduces the trader's information set. Third, the "alternating pattern" on Renko charts can be **an artifact of brick size selection**: if the brick size is calibrated close to the typical noise amplitude of an instrument, alternating bricks emerge by construction from random walk dynamics — this is a well-known property of threshold-based discretisation of any noisy signal, not evidence of a tradeable mean reversion edge. Anderson (2003) and related work on discretised random walks show that alternation frequencies depend primarily on the ratio of brick size to local volatility, not on any structural market property. Fourth, mean reversion strategies carry **severe tail risk**: they profit from small, frequent reversals but are exposed to catastrophic losses when trends persist — the strategy is effectively short gamma, and the 2008 financial crisis, the 2020 COVID crash, and the 2022 crypto collapse all demonstrated how quickly mean reversion edges can be overwhelmed by regime shifts. Bondarenko (2003) and Dunis et al. (2006) both documented that mean reversion strategies exhibit negative skewness and excess kurtosis in their return distributions. Fifth, the 70% ranging estimate, while plausible, is **unfalsifiable without specifying the exact definition** of "ranging" versus "trending," the timeframe, and the measurement methodology — different ADX thresholds, lookback periods, and instruments yield estimates ranging from 50% to 85%, making the claim more of a heuristic than a testable hypothesis.

Mentioned by `Better System Trader <https://x.com/bettersystrader>`__ in `this discussion <https://x.com/bettersystrader/status/2047331472449720432>`__: "70% of the time, markets aren't trending. They're ranging. Most trading strategies are built for the other 30%."

`Read the post <https://x.com/bettersystrader/status/2047331472449720432>`__.
