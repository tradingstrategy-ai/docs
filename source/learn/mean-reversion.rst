.. meta::
   :description: Research papers and blog posts on mean reversion strategies in equities and cryptocurrency markets.

Mean Reversion
~~~~~~~~~~~~~~

Mean reversion strategies exploit the tendency for asset prices to return toward their historical average after periods of extreme deviation. Unlike momentum, which bets on continuation, mean reversion bets on correction. The strategy is particularly effective in markets with high short-term volatility and strong fundamental anchors, such as individual equity stocks where fundamental value acts as a gravitational center. Mean reversion is distinct from pairs trading — which exploits the spread between two correlated assets — in that it focuses on single-asset reversion dynamics.

The research collected here covers both the theoretical foundations of mean reversion as a power-law decay process in equity market dynamics, and practical implementation: buying dips in uptrending stocks, exploiting implied volatility extremes, and systematic strategies that enter when prices deviate significantly from moving averages. Key challenges include distinguishing temporary overshoots from genuine trend changes and avoiding "value traps" where prices fall for fundamental rather than technical reasons.

Related topics include :doc:`Statistical Arbitrage <./statistical-arbitrage>` for pairs-based mean reversion, :doc:`Technical Indicators <./technical-indicators>` for the oscillators commonly used in mean-reversion signal generation, and :doc:`Market Microstructure <./market-microstructure>` for the microstructure dynamics that create mean-reverting patterns at short horizons.

Scale Dependent Dynamics in Equity Market Phase Space
------------------------------------------------------

This paper models mean reversion in equity markets as a scale-dependent power-law decay process, documenting that mean-reversion strength varies with both the magnitude of deviation and the time horizon. The framework provides a rigorous theoretical foundation for understanding why some mean-reversion strategies are profitable in certain regimes but not others.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3456789>`__

Advanced Signal Filtering for Mean Reversion Trading
-----------------------------------------------------

This paper develops a regime-aware neural signal filter for mean-reversion trading that achieves a Sharpe ratio of 11.05 in backtesting. The approach uses machine learning to identify when mean-reversion signals are likely to succeed versus when trending dynamics will overwhelm reversion attempts, significantly improving the timing of mean-reversion entries.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4150721>`__

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

Short-Term Reversal Persists Globally — If Properly Measured
-------------------------------------------------------------

This paper by Stosik and Zaremba investigates why the classic short-term reversal anomaly appears to have weakened globally and shows that the signal remains alive once properly measured. The authors study 64 countries and find that the standard short-term reversal signal — based on raw past returns — earns just +0.05% per month, effectively dead. However, when the reversal signal is measured relative to industry peers rather than raw price moves, the picture changes dramatically.

The key insight is that mean reversion did not disappear — it moved inside industries. By stripping out the industry component and focusing on stock-specific reversals within sectors, the authors recover a strong and economically significant signal. The industry-adjusted reversal strategy delivers +0.53% per month with a Sharpe ratio of 0.74. This suggests that much of the raw reversal signal was being contaminated by industry momentum, which moves in the opposite direction and masks the underlying mean-reversion dynamics at the individual stock level.

The paper serves as a practical reminder for anyone running factor work: when a known anomaly appears dead, the first place to check is whether the measurement still aligns with the original economic logic. In this case, decomposing returns into industry and stock-specific components reveals that the short-term reversal premium remains robust and tradeable.

Key metrics: standard reversal +0.05% monthly return, industry-adjusted reversal +0.53% monthly return, Sharpe ratio 0.74. Data covers 64 countries.

Mentioned by Ivan Blanco Sanchez in `this discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-ideas-finding-short-term-share-7457319174034436096-ocSC>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6630998>`__

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

Enhanced Mean Reversion: Continuous Basket Methodology for Crypto Cross-Sectional Factors
------------------------------------------------------------------------------------------

Mark Aron Szulyovszky (Aperiodic) outlines a distinction between different meanings of "mean reversion" in quantitative finance and introduces Aperiodic's Enhanced Mean Reversion factor for crypto markets. In a cross-sectional factor context, mean reversion is about identifying baskets of mean-reverting assets in a walk-forward manner, using a range of transformations and lookback periods to compute an aggregate mean-reversion score for each asset. Traditional pairs trading and statistical arbitrage approaches typically construct baskets with a fixed number of assets where membership is binary — an asset is either in the basket or not.

Aperiodic's framework departs from this by using a continuous methodology: each asset has a probability of being part of a basket rather than a hard inclusion/exclusion boundary. When signals are aggregated to create a cross-sectional score, the mean-reversion signal is multiplied by the probability of the asset belonging to every basket. The Enhanced Mean Reversion factor (AF-MRX) ensembles multiple new transformations and basket-definition methodologies. The factor is constructed as a rank-weighted long/short portfolio of the top 40 crypto assets by market cap, with positions scaled by inverse rolling volatility and hourly point-in-time updates. Since inception (January 2020), the factor has returned +170% with a Sharpe ratio of 1.80 and maximum drawdown of -14.3%, though the author notes the caveats of working with smaller sample sizes in crypto — while the number of tradable assets is close to infinite, the liquid universe is considerably smaller.

See the `Enhanced Mean Reversion factsheet <https://factors.aperiodic.io/catalog/mean_reversion_enhanced>`__ on Aperiodic Factors for live performance, methodology details, and downloadable data. See also Aperiodic's related `Enhanced Momentum factor (AF-MOMX) <https://factors.aperiodic.io/catalog/momentum_enhanced>`__, which exploits the opposite side of the cross-sectional spectrum.

By Mark Aron Szulyovszky (Aperiodic).

`Read the post <https://www.linkedin.com/posts/almostintuitive_mean-reversion-means-a-lot-of-different-share-7470090273981730817-QQ2a/>`__

Profiting From Sector Dispersion: The Case for Trading Sector & Industry ETFs
----------------------------------------------------------------------------

Concretum Research (Carlo Zarattini and colleagues) present a deliberately simple systematic model for exploiting cross-sectional dispersion among US sector and industry ETFs. Motivated by the current intensity of the sector-rotation debate — semiconductors after an essentially unprecedented run, software-related names after a sharp drop, and biotech breaking to a fresh multi-year high — the piece builds a rules-based strategy that actively times three iShares ETFs (SOXX for semiconductors, IGV for expanded tech-software, and IBB for biotechnology), rotating exposure to capture temporary price dislocations between them while remaining profitable under conservative transaction-cost assumptions.

Our summary: the strategy is framed as a baseline rather than an optimised product — the authors stress that experienced quantitative researchers can layer a number of standard refinements on top of the core entry/exit logic. The intuition is cross-sectional mean reversion: when one sector stretches too far relative to its peers, the model leans against the dislocation, harvesting the dispersion that sector-rotation narratives create. The article also uses the case study to introduce a "delicate" methodological point the authors consider central to the analysis and implementation of many short-term trading strategies (developed behind the paywall), signalling that realistic execution and cost modelling — results are reported net of USD 0.0035 per share — are treated as first-order concerns rather than afterthoughts.

Data and reproduction: the backtest actively times SOXX, IGV, and IBB over roughly 2016–2026 (per the equity-curve chart in the announcement), reporting results net of fees at USD 0.0035 per share. The full trading rules, portfolio-construction details, and the methodological discussion sit behind Concretum's paid Substack; no code repository is provided, and the free preview exposes only the setup and the headline metrics.

Key metrics: the net-of-fee portfolio is reported to achieve a CAGR of 24.6%, a Sharpe ratio of 1.17, and a maximum drawdown of roughly 20%, materially smoothing the equity curve relative to buying and holding any single one of the three sector ETFs.

Mentioned by Carlo Zarattini (Founder of Concretum Group, co-founder of R-Candles.com) in `this LinkedIn discussion <https://www.linkedin.com/posts/carlozarattini_a-systematic-approach-to-sector-dispersion-share-7478841533954379776--B0e/>`__, where he describes it as "a simple systematic trading model designed to exploit temporary price dislocations while remaining attractive even under conservative transaction-cost assumptions," intended as an ideal starting point for developing more sophisticated tactical sector-dispersion models.

`Read the research piece <https://concretumgroup.substack.com/p/profiting-from-sector-dispersion>`__

Larry Connors' R3 Strategy (It Still Works)
--------------------------------------------

Quantified Strategies backtests the R3 strategy from Chapter 4 of Larry Connors' 2009 book *High Probability ETF Trading*, checking whether the published edge survived the twelve years after publication. R3 is a short-term mean-reversion system built on the 2-day RSI: the close must be above the 200-day moving average, the 2-day RSI must fall three days in a row with the first drop starting from a reading below 60, and the 2-day RSI must be below 10 on the entry day. The position is exited on the close once the 2-day RSI rises above 70. Connors also proposed an aggressive variant that adds a second unit whenever the position trades below the entry price, but that version is not tested here.

Our summary: replicated on Connors' basket of 20 liquid ETFs (plus GDX, GDXJ, TLT, XLP, and XME added by the author) from inception to December 2020, the strategy still works but has decayed — roughly half the ETFs performed worse over the twelve years since publication, and the author could not reproduce Connors' fill counts exactly despite both using dividend-adjusted data. On SPY the win rate is 90% but there are only 96 trades since 1993. Run as a portfolio across all 25 ETFs from 2000 to 2020, capped at five concurrent positions and 20% equity per position, R3 produced 992 trades, a 75% win ratio, 0.68% average gain per trade, a profit factor of 2.08, a 6.47% CAGR, and a -16% maximum drawdown concentrated in the August 2011 sovereign debt crisis. A QQQ/SPY-only version raises the profit factor to 3.37 but drops the CAGR to 2.69% because the strategy is only in the market 4.5% of the time — the classic mean-reversion trade-off between high per-trade quality and low capital utilisation.

Data and reproduction: Amibroker backtests on 25 dividend-adjusted ETFs from inception (1993 for SPY) through December 2020, with no commissions or slippage included. The full Amibroker code sits behind the site's membership, so the rules are reproducible from the article text but the exact implementation is not published.

Key metrics: all-ETF portfolio — 992 trades, 75% win ratio, 0.68% average gain per trade, profit factor 2.08, CAGR 6.47%, max drawdown -16%. SPY alone — 90% win rate over 96 trades. QQQ/SPY portfolio — profit factor 3.37, CAGR 2.69%, 4.5% time in market.

By Oddmund Groette (QuantifiedStrategies.com).

`Read the blog post <https://www.quantifiedstrategies.com/larry-connors-r3-strategy/>`__

Short-horizon Mean Reversion in Cryptocurrency Markets: A Matched Cross-Market Measurement
--------------------------------------------------------------------------------------------

Nadav A. Kitron and Jonathan M. Wengrowicz measure directional mean reversion on 15-minute bars across 183 Binance USDT spot pairs and a matched sample of 187 liquid US stocks and ETFs. Their pre-specified, strictly out-of-sample walk-forward protocol fits a constrained 12-lag logistic model alongside an unconstrained AR(12) logit, evaluates AUC, and controls false discoveries jointly across the 370 instruments. The authors also test whether the effect transfers to NAV-linked listed wrappers and condition it on aggressive taker flow and order-book information.

Our summary: the paper makes a careful distinction between statistical predictability and a tradeable strategy. Most of the crypto effect is captured by taking the opposite side of the preceding candle's sign, while conventional return autocorrelation is close to zero. It is stable across the study's 2021--2026 checks, survives a frozen six-month post-sample holdout and an exact permutation null, and is stronger after intensive aggressive flow. The flow evidence is consistent with liquidity providers being compensated for absorbing short-lived price pressure, but the authors appropriately do not claim it identifies the mechanism. US-listed crypto and metal funds reproduce the dynamics of their NAV underlyings, whereas merely correlated stocks do not; this suggests the effect is a property of the price process rather than its listing venue.

Data and reproduction: the primary test uses 15-minute Binance and Alpaca bars from 2025-01-01 to 2026-02-11; supporting data include Binance histories back to 2021, Coinbase/OKX/Bybit, Dukascopy, and a 2026-02--2026-08 holdout. The full replication package, frozen symbol lists, source code, result files, and file hashes are available in the authors' `GitHub repository <https://github.com/nadav2/short-horizon-reversion>`__. The underlying market data can be refetched from public exchange APIs, except that reproducing US-listed bars requires Alpaca market-data access.

Key metrics: crypto averages an out-of-sample AUC of 0.531, versus 0.499 for US stocks and ETFs; 164 of 183 crypto pairs (90%) are significant after FDR control, compared with 5 of 187 stocks/ETFs (2.7%). The designed class-mean AUC gap is +0.031; under the most conservative accounting it is +0.011 (95% CI [+0.008, +0.014]). The gross directional edge peaks near 1.3 bp per trade, below the paper's 5 bp cheapest benchmark spot round-trip cost, so the finding is not evidence of an implementable taker strategy at those costs.

`Read the paper <https://arxiv.org/abs/2608.21888>`__

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
