.. meta::
   :description: Research papers and blog posts on trend following strategies, managed futures, and systematic CTA-style approaches.

Trend Following
~~~~~~~~~~~~~~~

Trend following is one of the oldest and most empirically robust systematic trading approaches, with evidence of profitability stretching back over two centuries. The strategy is conceptually simple: buy assets that have been rising and sell those that have been falling. In practice, systematic trend following programs — often called managed futures or CTAs — use diversified portfolios of futures contracts across equities, bonds, currencies, and commodities, applying trend signals at multiple time horizons with volatility-targeted position sizing.

The research here covers the historical evidence for trend following across asset classes and time periods, the theoretical explanations for why trends persist, practical implementation across different markets including cryptocurrencies, and the question of whether trend following remains viable as more capital has flowed into the strategy. Topics include exponential moving average crossovers, Donchian channels, volatility targeting for trend programs, regime-dependent allocation, and the relationship between trend following and managed futures returns.

Related topics include :doc:`Momentum <./momentum>` for cross-sectional and time-series momentum strategies, :doc:`Market Regimes <./market-regimes>` for regime-conditional trend allocation, and :doc:`Portfolio Construction <./portfolio-construction>` for position sizing and risk parity approaches used in trend programs.

Catching Crypto Trends: A Tactical Approach for Bitcoin and Altcoins
---------------------------------------------------------------------

This paper develops a tactical trend-following framework for Bitcoin and altcoins using Donchian Channel breakout signals combined with volatility-based position sizing. The approach demonstrates consistent performance across different crypto market conditions and provides practical implementation guidance for systematic crypto trend following.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4028648>`__

Does Trend-Following Still Work on Stocks?
-------------------------------------------

This paper examines the profitability of trend-following strategies on US stocks, testing whether the time-series momentum documented in futures markets also generates risk-adjusted returns in equity markets. The authors evaluate multiple trend specifications and find that trend following remains profitable in equities, though with important differences from futures-based implementations.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2528780>`__

Following a Trend with an Exponential Moving Average: Analytical Results for a Gaussian Model
----------------------------------------------------------------------------------------------

This paper derives analytical results for the P&L distribution of EMA-based trend following strategies under Gaussian price dynamics. The mathematical framework provides closed-form expressions for expected returns, volatility, and Sharpe ratios as functions of the EMA parameter and underlying asset drift, offering theoretical grounding for practitioner choices about moving average length.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2590662>`__

Trend Following in Strategic Asset Allocation: A Long-Horizon Analysis
-----------------------------------------------------------------------

This paper examines trend following as a strategic component of asset allocation over long investment horizons, showing that trend signals add value even when held for years rather than months. The analysis demonstrates that trend following provides genuine diversification benefits and improves risk-adjusted returns in multi-asset portfolios across different market environments.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3257397>`__

A Century of Evidence on Trend-Following Investing
----------------------------------------------------

AQR's landmark study providing a century of evidence on trend following, testing the strategy from 1880 to the present across equities, currencies, commodities, and bonds. The paper shows that trend following has delivered consistent positive risk-adjusted returns with low correlation to traditional asset classes throughout the entire sample, including periods of market stress.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2660000>`__

Two Centuries of Trend Following
----------------------------------

This paper extends the trend-following evidence to over 200 years of data across multiple asset classes, achieving a t-statistic exceeding 10.0 for the trend premium. The extreme statistical significance makes it virtually impossible to attribute the trend premium to chance, providing the strongest available evidence that trend-following captures a genuine and persistent market phenomenon.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2718321>`__

Demystifying Managed Futures
-----------------------------

This paper shows that the returns of managed futures funds can be largely explained by dynamic trend-following exposures across asset classes. The authors demonstrate that a simple replication approach based on trend signals explains the time-series variation in CTA returns, demystifying the apparent complexity of managed futures and showing that trend following is the core alpha source.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2041960>`__

Rethinking Trend Following: Optimal Regime-Dependent Allocation
----------------------------------------------------------------

This paper develops a framework for regime-dependent time-series momentum allocation, showing that the optimal trend signal depends on the current market regime. The authors demonstrate that adapting trend parameters and allocations to the identified regime generates superior risk-adjusted performance compared to static trend following implementations.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3411948>`__

Quantitative Evaluation of Volatility-Adaptive Trend-Following Models in Cryptocurrency Markets
------------------------------------------------------------------------------------------------

This paper tests multi-horizon moving average trend signals combined with ATR-based volatility adaptation in cryptocurrency markets. The framework evaluates how adapting trend signals to current volatility conditions improves risk-adjusted performance for crypto trend following, with comprehensive backtesting across Bitcoin and major altcoins.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4150720>`__

A Trend Following Framework for Gold, Bitcoin, and Nasdaq
---------------------------------------------------------

A practical framework for systematic trend following across Gold, Nasdaq, and Bitcoin futures. The approach combines a Donchian Channel for trend detection with a Chandelier Stop for risk management. Key components include: volatility-targeted position sizing (risking 2% of equity per trade with stops at 3x ATR), a two-stage exit mechanism using both protective trailing stops and technical exits based on lowest low breakdowns.

The system targets "fat tails" while keeping maximum drawdown to -15%. With a 47% win rate but favorable risk/reward (average win 4.30% vs average loss 2.06%), the framework emphasizes that systematic execution beats emotional guessing. Assets are chosen for their high volatility, strong trends, and low correlation.

By Petr Podhajsky. Tools used: RealTest & Norgate Data.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_terrified-of-buying-the-top-in-gold-bitcoin-ugcPost-7424474305478000640-bV86/>`__

Testing the Low-of-Day Stop Loss Rule in Crypto Trend-Following
----------------------------------------------------------------

Research Article #76 from Trading Research Hub. Tests whether observations from discretionary swing traders can be systematically validated and applied to crypto trend-following strategies. The author takes the concept of a low-of-day stop loss rule, commonly discussed by practitioners on social media, and subjects it to rigorous backtesting.

The article bridges the gap between discretionary trading observations and systematic strategy development, demonstrating how to take qualitative market insights from experienced traders and test them quantitatively. This approach of mining practitioner wisdom for testable hypotheses represents a practical research methodology for systematic traders.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-low-of-day-stop-loss-rule-research>`__.

How Relaxing Signal Selection Constraints Doubled Strategy Returns
------------------------------------------------------------------

Research Article #75 from Trading Research Hub. Examines whether a trend-following strategy's signal selection can be improved by relaxing allocation constraints. The author discovered that the strategy was only allocating capital to a small subset of available signals, despite the remaining signals being equally profitable.

The article investigates how widening signal selection criteria affects overall strategy returns, testing whether there is signal decay with lower constraints. The results show that this simple capital allocation improvement led to approximately double the returns, highlighting how portfolio construction decisions can matter as much as the underlying signal quality.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/how-a-simple-improvement-to-signal>`__.

A Filtering Method that Increased Crypto Trend-Following Win Rate to 60%
------------------------------------------------------------------------

Research Article #74 from Trading Research Hub. Presents a method to increase the win rate of binary trend-following strategies in crypto markets from the 30% range up to 55-60%. The approach is inspired by observations from quasi-systematic and discretionary traders whose ideas haven't been properly backtested in the academic literature.

The article demonstrates how combining real-time practitioner observations with systematic backtesting can produce meaningful strategy improvements. It tests a specific filtering method that significantly improves closed-trade win rates while maintaining the core trend-following approach, showing the value of bridging discretionary insights with quantitative validation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/this-1-method-increased-crypto-trend>`__.

Applying Traditional Managed Futures Trend-Following to Crypto Markets
-----------------------------------------------------------------------

Research Article #70 from Trading Research Hub. Applies traditional trend-following methodologies, originally developed for commodities and futures markets, to cryptocurrency markets. The study examines whether the core principles that have driven managed futures returns for decades translate effectively to the unique characteristics of crypto assets.

The article tests established trend-following rules on crypto market data, evaluating their performance against benchmarks. It explores how the high volatility, 24/7 trading, and unique market microstructure of crypto markets affect the behavior of classic trend signals, providing insights for traders looking to adapt proven systematic approaches to digital assets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/traditional-trend-following-in-crypto>`__.

The EWMAC Crypto Strategy: Continuous Trend Signals for Better Position Sizing
-------------------------------------------------------------------------------

Research Article #68 from Trading Research Hub. Implements the Exponentially Weighted Moving Average Crossover (EWMAC) strategy in cryptocurrency markets. EWMAC is a well-established trend-following signal used by systematic macro funds, which measures the difference between fast and slow exponential moving averages to generate continuous position signals.

The article tests EWMAC across crypto assets, demonstrating how this simple yet effective signal captures trending behavior. The continuous nature of EWMAC signals, as opposed to binary on/off signals, allows for more nuanced position sizing that scales with trend strength, potentially improving risk-adjusted returns compared to simpler crossover implementations.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/simple-signals-superior-returns-the>`__.

Combining Trend Signals with Volatility Targeting for 1,127% Return at 67% Less Risk
--------------------------------------------------------------------------------------

Research Article #62 from Trading Research Hub. Demonstrates a systematic trading approach that achieved 1,127% total return while reducing portfolio volatility by 67% compared to the underlying market. The article emphasizes the principle that exposures should be dictated by the trader's risk framework, not by market conditions.

The strategy combines trend-following signals with strict volatility targeting to capture crypto upside while dramatically limiting drawdowns. The article walks through the portfolio construction and risk management methodology that enables such asymmetric risk-return outcomes, showing how systematic risk controls can transform raw crypto exposure into a more investable return stream.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/1127-return-with-67-less-volatility>`__.

2024 Performance Review of a Live Systematic Crypto Trend-Following Portfolio
------------------------------------------------------------------------------

Research Article #56 from Trading Research Hub. An honest performance review of a systematic crypto trend-following portfolio through 2024, analyzing the real-world results of deploying quantitative strategies with actual capital. The article examines both the successes and challenges encountered during a year that included various market regimes.

The review provides transparency into the performance characteristics of systematic trend following in crypto, including drawdown periods, recovery behavior, and the psychological challenges of managing a live portfolio. It serves as a practical reference for how theoretical strategy research translates into real-world trading outcomes across different market conditions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/heres-my-2024-trading-performance>`__.

Using Volume and Market Cap Rankings to Improve Crypto Trend Signal Selection
------------------------------------------------------------------------------

Research Article #55 from Trading Research Hub. Examines how market capitalization and dollar volume can be used as ranking features to improve crypto trend-following strategies. The study tests whether filtering or weighting trading signals based on these fundamental metrics leads to better execution efficiency and returns.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/crypto-trend-through-the-lens-of>`__.

Diagnosing and Fixing an Underperforming Trend Model
-----------------------------------------------------

Research Article #53 from Trading Research Hub. Documents the process of diagnosing and fixing an underperforming trend model that was generating less return than a simple buy-and-hold benchmark. The author walks through the investigative process of understanding why a systematically developed model was failing to capture available market returns.

The article provides a practical framework for debugging live trading strategies, including how to identify whether underperformance stems from signal quality, position sizing, execution costs, or portfolio construction issues. The diagnostic approach and eventual fix demonstrate the iterative nature of real-world systematic trading development.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/why-was-my-trend-model-underperforming>`__.

Finding the Most Effective Single-Rule Trend Signal for Crypto
--------------------------------------------------------------

Research Article #49 from Trading Research Hub. Explores single-rule trend-following systems to identify the most effective trend signal for cryptocurrency trading. The author, who has spent hundreds of hours backtesting and optimizing strategies, focuses on finding signals that maintain their edge beyond the backtest.

The article tests various trend indicators in isolation to understand their individual performance characteristics before combining them into more complex systems. This reductionist approach helps identify which core signals genuinely capture trending behavior in crypto markets versus those that merely appear profitable due to overfitting.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-best-crypto-trend-signal-research>`__.

Using Lower-Timeframe Exits to Improve Trend-Following Risk Management
----------------------------------------------------------------------

Research Article #47 from Trading Research Hub. Examines how incorporating multiple timeframes into trend-following rules affects strategy performance. Specifically, it tests whether exiting positions based on a lower timeframe signal while maintaining higher timeframe entries improves overall results.

The article uses the analogy of a farmer studying long-term weather patterns before making planting decisions to explain the logic of multi-timeframe analysis. The backtesting results show how combining higher timeframe trend detection with lower timeframe exit signals can improve trade timing and risk management in crypto trend-following strategies.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-47-multi-timeframe>`__.

Basic Trend Following
---------------------

A comprehensive primer on constructing a basic trend following program, shared freely with full transparency. The thread covers both the philosophy and exact implementation steps for building a systematic trend strategy that can be stacked on beta exposure.

The four-step framework includes: (1) Beta/Benchmark Selection, (2) Two-Speed Binary Trend signals, (3) Risk Parity allocation, and (4) Dynamic Leverage with Max Volatility Cap. The author argues that a basic trend program is one of the most defensible things an investor can do—intuitive, empirically backed, and suited to most investor psychology. The goal is to provide both a benchmark for measuring market strategy and an accessible portfolio solution for anyone with a brokerage account.

By Prometheus Macro (@aahan_prometheus).

`Read the thread <https://threadreaderapp.com/thread/2020234019108266368.html>`__

Testing the Turtle Trading System in Cryptocurrency Markets
-----------------------------------------------------------

Research Article #32 from Trading Research Hub. Backtests Richard Dennis's famous Turtle Trading system rules in cryptocurrency markets. The Turtle Trading strategy, which produced legendary returns in commodity futures during the 1980s, is based on Donchian Channel breakouts with specific position sizing and pyramiding rules.

The article implements the original Turtle Trading rules on crypto market data, evaluating how this classical trend-following methodology performs in the high-volatility, high-trending crypto environment. While the strategy rules are straightforward, the article notes the operational complexity involved in properly implementing the full system including the pyramiding and exit rules.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-32-turtle-trading>`__.

Does Adding a Short Book Improve Crypto Trend Following Returns?
----------------------------------------------------------------

Research Article #41 from Trading Research Hub. Examines the performance impact of adding short positions to a simple trend-following strategy in crypto markets. The study aims to determine whether the short side adds enough value to justify the additional exposure cost and complexity.

The article implements a long/short model with volatility targeting and tests whether the short book improves risk-adjusted returns compared to a long-only approach. The results provide data-driven guidance on whether crypto trend followers should invest the effort to incorporate short selling, considering the specific dynamics of perpetual futures markets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-41-longshort-crypto>`__.

Volatility Targeting: Transforming a -70% Drawdown Strategy into 1,328% Returns
--------------------------------------------------------------------------------

Research Article #39 from Trading Research Hub. A follow-up addressing the -70% drawdown from the previous moving average crossover study by applying volatility targeting techniques. The article provides a practical, detailed walkthrough of how to reduce strategy volatility while maintaining robustness and improving risk-adjusted returns.

The article demonstrates different volatility target levels and their effect on the strategy's equity curve, showing how a moderate risk target can transform a strategy with unacceptable drawdowns into one with more manageable risk characteristics while still capturing 1,328% total returns. The techniques presented are broadly applicable to any systematic trading strategy.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-39-achieving-1328>`__.

Testing Moving Average Crossovers on a Multi-Asset Crypto Portfolio
-------------------------------------------------------------------

Research Article #38 from Trading Research Hub. Tests a simple moving average crossover strategy on a multi-asset crypto portfolio. The author, who deliberately avoids holding strong opinions about any particular approach, tests this fundamental trend-following signal across multiple cryptocurrencies.

The article provides a systematic evaluation of various crossover parameters, analyzing the strategy's performance characteristics including returns, drawdowns, and risk metrics. The honest analysis of both strengths and weaknesses, including significant drawdowns, sets up the follow-up article on volatility targeting improvements.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-38-crypto-moving>`__.

Do Breakouts of Strong Swings Work? Testing 40 Futures Markets
---------------------------------------------------------------

A quantitative study testing whether breakouts of swing highs and lows provide a tradable edge across 40 futures markets over 15 years of historical data. While many traders focus on fading support and resistance levels, the research finds that holding positions mechanically in the direction of the breakout — even for just a few hours — produces a statistically significant edge. The post presents the methodology, results across different asset classes, and discusses why trend continuation at swing points tends to outperform counter-trend approaches.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/do-breakouts-of-strong-swings-work-i-tested-40-futures-markets-and-the-data-is-clear/>`__.

$576K in My First 8 Months Shorting Small Caps, and the Subtle Mistake that Cut It in Half
------------------------------------------------------------------------------------------

An X article by trader Walter Ego (@ItsWalterEgo) drawing on his background of over 10 years as a professional poker player to explain how premature profit-taking — the trading equivalent of skipping "thin value bets" in poker — systematically degrades strategy returns. The core argument is that taking partial profits at fixed R-multiple targets (2:1, 3:1, etc.) truncates a strategy's return distribution at precisely the points where outsized gains compound most. In poker, GTO solvers revealed that checking back marginal hands instead of betting for thin value left significant money on the table; analogously, backtesting showed that early exit rules consistently reduced terminal returns across both short-selling and trend-following strategies, despite producing smoother-looking equity curves.

`Read the article <https://x.com/ItsWalterEgo/article/2024781759498358824>`__

Leverage for the Long Run - A Systematic Approach to Managing Risk and Magnifying Returns in Stocks
----------------------------------------------------------------------------------------------------

Using leverage to magnify performance is an idea that has enticed investors and traders throughout history. The critical question of when to employ leverage and when to reduce risk, though, is not often addressed. Michael A. Gayed, CFA and Charlie Bilello, CMT establish that volatility is the enemy of leverage and that streaks in performance tend to be beneficial to using margin. The conditions under which higher returns would be achieved from using leverage are low volatility environments that are more likely to experience consecutive positive returns. The paper finds that Moving Averages are an effective way to identify such environments in a systematic fashion. When the broad U.S. equity market is above its Moving Average, stocks tend to exhibit lower than average volatility going forward, higher daily average performance, and longer streaks of positive returns. When below its Moving Average, the opposite is true: volatility rises, average daily returns are lower, and streaks in positive returns become less frequent. The Leverage Rotation Strategy (LRS) — employ leverage when the market is above its Moving Average, rotate to Treasury bills when below — shows better absolute and risk-adjusted returns than both a comparable buy-and-hold unleveraged strategy and a constant leverage strategy. Results are robust across leverage amounts from 1.25x to 3x, Moving Average periods from 10-day to 200-day, and across multiple economic and financial market cycles. The paper won the 2016 Charles H. Dow Award from the CMT Association.

Our summary: the paper's core insight is that the Moving Average should be treated as a volatility regime indicator rather than a trend-following tool. Above the Moving Average, S&P 500 annualized volatility averages around 14.7%; below it, volatility spikes to 26.5% (data from October 1928 to October 2015). This volatility differential explains the "constant leverage trap" — when daily returns seesaw between positive and negative, daily re-leveraging is mathematically destructive, and the more leverage applied the worse the outcome. The LRS sidesteps this by concentrating leverage in the low-volatility, high-streak regimes identified by the Moving Average. Critically, the paper shows that 67-74% of the worst 1% of trading days since 1928 occurred while the market was already below its Moving Average, which reframes the indicator as a downside protection tool. The Moving Average timing strategy — even without any leverage — beats buy-and-hold on a risk-adjusted basis in 69% of rolling three-year periods, and the unleveraged 200-day timing strategy cuts maximum drawdown from -86.2% to -49.5%.

Data: S&P 500 Total Return Index (Gross Dividends) from Bloomberg, October 1928 to October 2015. Treasury bill data from the Ken French data library. No public code repository identified.

Key metrics: the unleveraged 200-day Moving Average timing strategy achieves an annual return of 10.9% versus 9.1% for buy-and-hold, with a Sharpe ratio of 0.60 versus 0.30, a Sortino ratio of 0.86 versus 0.43, maximum drawdown of -49.5% versus -86.2%, and annual alpha of 5.0%. The LRS using 2x leverage with the 200-day Moving Average delivers an annualised return of 19.1%, Sharpe of 0.51, Sortino of 0.90, maximum drawdown of -78.7%, and alpha of 10.8% — versus 13.7% annual return, Sharpe 0.27, and maximum drawdown -98.8% for constant 2x leverage. Growth of $10,000 from October 1928 to October 2015: buy-and-hold grows to $19 million; LRS 1.25x to $270 million; LRS 2x to $39 billion; LRS 3x to $9 trillion.

Mentioned by `@MatiasScalbi <https://x.com/MatiasScalbi>`__ in `this discussion <https://x.com/MatiasScalbi/status/2049285538096538017>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2741701>`__

How to Manage an Intraday Trend Trade
--------------------------------------

Concretum Research examines how minor implementation details significantly impact trading strategy performance. The team tests an intraday trend-following system based on ATR band breakouts across four distinct exit mechanisms: Session Open, Session Midline, VWAP, and Parabolic SAR. Using the iShares Semiconductor ETF (SOXX) from January 2012 to May 2026, all configurations proved profitable with Sharpe ratios between 0.92-1.16, though exhibiting different risk-return tradeoffs.

Rather than selecting one exit policy, the authors recommend "ensembling" — allocating risk across all logically sound specifications. Annual Sharpe rankings rotate across years with no consistent winner, suggesting that superior performance in one metric often sacrifices performance in another. This approach embraces uncertainty about which configuration performs best going forward, avoiding fragile single-point choices and reducing potential decision points that could require future revision under market pressure.

By Concretum Research.

`Read the blog post <https://concretumgroup.substack.com/p/how-to-manage-an-intraday-trend-trade>`__

Demystifying Managed Futures
-----------------------------

Hurst, Ooi, and Pedersen (AQR / NYU Stern, Journal of Investment Management, 2013) argue that the returns of Managed Futures funds and CTAs can be explained by simple, implementable time-series momentum (TSMOM) strategies. They build TSMOM strategies that go long a market when its excess return over the past 1, 3, or 12 months is positive, and short otherwise, sized so that each asset targets a constant ex-ante volatility of 40% (the diversified portfolio is then scaled to 10% portfolio volatility). The economic motivation rests on behavioural under-reaction to news (anchoring, the disposition effect, slow institutional information diffusion) followed by delayed over-reaction (herding, feedback trading, confirmation bias), with eventual long-horizon reversal beyond one year.

The empirical core of the paper regresses Managed Futures index and individual fund returns on the diversified TSMOM strategy and on the four asset-class TSMOM sub-strategies (commodities, equities, fixed income, currencies). TSMOM produces large R-squares and very significant loadings on Managed Futures returns. Crucially, while CTAs and Managed Futures indices show statistically significant positive alphas against passive stock/bond/commodity benchmarks, those alphas collapse to zero (and in many cases turn negative) once TSMOM is included as a factor — meaning the apparent skill of even the largest, most successful managers is well explained by mechanical trend following. The diversified TSMOM strategy itself also delivers low correlation to traditional assets and exhibits the well-known trend-following "smile": it earns its best returns in sustained bull and bear markets and underperforms in flat, choppy regimes.

Our summary: this is the canonical practitioner reference establishing trend following / time-series momentum as the dominant factor behind Managed Futures returns. It is the bridge between the more academic Moskowitz–Ooi–Pedersen (2012) time-series momentum paper and the practical CTA industry: weekly (rather than monthly) rebalancing, multiple lookback horizons combined in equal-risk fashion, and an explicit accounting of fees and transaction costs. The "alphas-to-zero" result is what makes the paper structurally important — it reframes Managed Futures from an opaque skill-based asset class into a transparent, replicable trend-following premium, and it underpins the subsequent risk-premia / alternative-beta marketing of CTAs by AQR and others. The behavioural mechanisms section is also one of the clearest practitioner writeups of why trends persist.

Data: a liquid global futures and forwards universe — 24 commodity futures, 9 equity index futures, 13 government bond futures, and currency forwards — over January 1985 to June 2012, plus Managed Futures benchmark indices (BTOP50, Credit Suisse Managed Futures Hedge Fund Index, etc.) and the five largest Managed Futures funds in the Lipper/TASS database as of mid-2012. No public source code is released with the paper; the methodology follows Moskowitz, Ooi, and Pedersen (2012) closely enough to be reproducible from the equations in the text.

Key metrics: the diversified TSMOM strategy achieves a gross Sharpe ratio of approximately 1.8 (1985–2012) with realised volatility close to its 10% target, and a near-zero correlation to the S&P 500 (-0.02), modest correlation to the Barclays US Aggregate (0.23) and to the S&P GSCI commodity index (0.05). The 12-month strategy is best, followed by the 3-month, with the 1-month strategy still posting a Sharpe of 1.3. Average pairwise correlation across single-asset strategies is below 0.1 for each trend horizon, driving strong diversification benefits. After applying a simulated 2-and-20 fee structure (averaging ~6% per year given the high gross Sharpe) and 1–4% per year in transaction costs, the net Sharpe ratio of the diversified TSMOM strategy is close to 1.0, comparable to top CTAs. Regressions of Managed Futures index and manager returns on the TSMOM sub-strategies produce R-squares between 0.36 and 0.64, with manager Sharpe ratios in the underlying data ranging between 0.27 and 0.88.

Caveats and reproducibility: the headline 1.8 gross Sharpe is not a deliverable live number. The 1/3/12-month lookback horizons were already published in Moskowitz–Ooi–Pedersen (2012) and the authors themselves note the strategy "benefits from some hindsight" in choosing them. The CTA comparison universe (five largest Lipper/TASS funds as of 06/2012) is survivor-selected, and the sample period 1985–2012 is the historical golden era for trend-following, ending before the long 2011–2019 trend drought. The transaction-cost model is proprietary to AQR and assumes weekly closing-price executions with no scale impact. No source code or replication package is released; the signal definition and vol estimator are fully specified in equations (1)–(5), but the continuous-futures roll methodology is not, and the Lipper/TASS manager analysis is not reproducible without a paid subscription. After-fee (2-and-20, ~6%/yr drag) and after-cost (1–4%/yr) net Sharpe falls to ~1.0; modern cost models such as Frazzini, Israel & Moskowitz (2018) `"Trading Costs" <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3229719>`__ would land somewhere between the gross 1.8 and the paper's 1.0. The structural finding — that TSMOM drives CTA alphas to zero — is robust and independently confirmed by Baltas & Kosowski's `"Demystifying Time-Series Momentum Strategies" <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2140091>`__, while AQR's own out-of-sample retrospective `"You Can't Always Trend When You Want" <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3487134>`__ (Babu, Hoffman, Levine, Ooi, Schroeder, Stamelos, 2020) reports a substantially lower live Sharpe and attributes the post-2012 underperformance to a low-trend market regime rather than to factor decay. The foundational academic parent is the :doc:`Time Series Momentum <./momentum>` entry covering Moskowitz, Ooi & Pedersen (2012).

By Brian Hurst, Yao Hua Ooi, and Lasse Heje Pedersen.

Mentioned by `@MatiasScalbi <https://x.com/MatiasScalbi>`__ in `this discussion <https://x.com/MatiasScalbi/status/2060491224503472178>`__.

`Read the paper <http://docs.lhpedersen.com/DemystifyingManagedFutures.pdf>`__

You Can't Always Trend When You Want
-------------------------------------

Babu, Hoffman, Levine, Ooi, Schroeder, and Stamelos (AQR, *Journal of Portfolio Management*, March 2020) is AQR's out-of-sample retrospective on trend following, written to explain why the strategy underperformed its long-term average after 2010. The authors develop a decomposition framework that splits trend-following Sharpe ratio into three drivers: (1) the magnitude of market moves (measured as the absolute risk-adjusted return of each asset in each year), (2) trend efficacy — the strategy's ability to translate a given market move into profits, captured by an intercept α̂ and slope β̂ in a regression of trend P&L on market move magnitude, and (3) the diversification benefit across markets, captured by a multiplier D that depends on the realised cross-asset correlation of trend P&L.

Applied to a hypothetical 1880–2018 TSMOM portfolio rebalanced monthly across 67 markets, the decomposition shows that recent underperformance is almost entirely explained by factor (1) — the size of global market moves has been unusually muted in the 2010–2018 decade — and not by factor (2) or (3). The fitted α̂ and β̂ for 2010–2018 are statistically similar to the long-run fit, meaning trend following continues to extract roughly the same risk-adjusted profit per unit of underlying market move. The realised diversification multiplier is also broadly in line with history, contradicting the popular narrative that correlations have risen permanently post-2008. The empirical distribution of absolute market moves over 2010–2018 sits visibly to the left of the long-run distribution: 563 observations in the recent decade fall disproportionately into the smaller-move bins versus the 3,841 observations from 1880–2009.

Our summary: this is the definitive AQR response to the post-2010 "is trend dead?" debate and the most important out-of-sample replication of `"Demystifying Managed Futures" <http://docs.lhpedersen.com/DemystifyingManagedFutures.pdf>`__. The Sharpe-ratio numbers it documents — most strikingly the SG Trend Index's 0.05 Sharpe over 2010–2018 versus 0.28 since index inception in 2000 — are exactly the live-deliverable gap that the Hurst–Ooi–Pedersen backtest does not capture. The paper's structural contribution is the three-factor decomposition framework itself, which provides a way to test whether trend's underperformance reflects factor decay (β̂ shifting down) versus regime (lower input volatility of underlying moves). The conclusion that it is regime, not decay, is reassuring for the long-term thesis but is itself debatable: a decomposition done by the asset manager whose business depends on the answer is informative but not independent. Independent replications such as `Baltas & Kosowski (2019) <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2140091>`__ also document the post-2008 underperformance but attribute more of it to rising cross-asset correlations than this paper does.

Data: monthly returns for 67 markets across four asset classes — 29 commodities, 11 equity indexes, 15 bond markets, and 12 currency pairs — using daily futures prices going back as far as 1877 (with futures prices from manual transcription of the "Annual Report of the Trade and Commerce of the Chicago Board of Trade" through 1951), and electronic datasets thereafter. The trend-following strategy itself follows Hurst, Ooi, and Pedersen (2017) with monthly rebalancing. No public source code or replication package is released; the dataset construction is AQR-proprietary, though appendix A documents the per-market data sources.

Key metrics: the SG Trend Index realised an annualised Sharpe ratio of 0.05 from January 2010 to December 2018, versus 0.28 from index inception in January 2000 to December 2018, and -19.7% drawdown from its April 2015 peak through end-2018. The hypothetical trend-following strategy is described net of estimated transaction costs and gross of fees throughout the paper. The α̂ and β̂ fits for 2010–2018 are statistically close to the 1880–2018 long-run fits, with most of the realised Sharpe gap explained by a leftward shift in the empirical distribution of |SR| (absolute risk-adjusted return) across the 563 asset-year observations in the recent decade versus the 3,841 observations from 1880–2009. The diversification multiplier D shows no statistically significant decline in the recent decade.

By Abhilash Babu, Brendan Hoffman, Ari Levine, Yao Hua Ooi, Sarah Schroeder, and Erik Stamelos.

`Read the paper <https://images.aqr.com/-/media/AQR/Documents/Journal-Articles/JPM-You-Cant-Always-Trend-When-You-Want.pdf>`__
