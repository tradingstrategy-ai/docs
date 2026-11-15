.. meta::
   :description: Research papers and blog posts on trend following strategies, managed futures, and systematic CTA-style approaches.

Trend Following
~~~~~~~~~~~~~~~

Trend following is one of the oldest and most empirically robust systematic trading approaches, with evidence of profitability stretching back over two centuries. The strategy is conceptually simple: buy assets that have been rising and sell those that have been falling. In practice, systematic trend following programs — often called managed futures or CTAs — use diversified portfolios of futures contracts across equities, bonds, currencies, and commodities, applying trend signals at multiple time horizons with volatility-targeted position sizing.

The research here covers the historical evidence for trend following across asset classes and time periods, the theoretical explanations for why trends persist, practical implementation across different markets including cryptocurrencies, and the question of whether trend following remains viable as more capital has flowed into the strategy. Topics include exponential moving average crossovers, Donchian channels, volatility targeting for trend programs, regime-dependent allocation, and the relationship between trend following and managed futures returns.

Related topics include :doc:`Momentum <./momentum>` for cross-sectional and time-series momentum strategies, :doc:`Market Regimes <./market-regimes>` for regime-conditional trend allocation, and :doc:`Portfolio Construction <./portfolio-construction>` for position sizing and risk parity approaches used in trend programs.

For complete worked examples of trading strategies and individual factors, see :doc:`Strategy Examples <./strategy-examples>` and :doc:`Factor Examples <./factor-examples>`.

Catching Crypto Trends: A Tactical Approach for Bitcoin and Altcoins
---------------------------------------------------------------------

In recent years, cryptocurrencies have attracted significant attention from both retail traders and large institutional investors. As their involvement in digital assets grows, so does their interest in active and risk-aware investment frameworks. This paper applies a well-established trend-following methodology, successfully deployed for decades in traditional asset classes, to Bitcoin, and then extends the analysis to a comprehensive, survivorship bias-free dataset covering all cryptocurrencies traded since 2015, to evaluate whether its robustness persists in the emerging digital asset space. We propose an ensemble approach that aggregates multiple Donchian channel-based trend models, each calibrated with different lookback periods, into a single signal, as well as a volatility-based position sizing method. This model, applied to a rotational portfolio of the top 20 most liquid coins, achieved notable net-of-fees returns, with a Sharpe ratio above 1.5 and an annualized alpha of 10.8% versus Bitcoin. While assessing the impact of transaction costs, we propose a straightforward yet effective portfolio technique to mitigate these expenses. Finally, we investigate correlations between crypto-focused trend-following strategies and those applied to traditional asset classes, concluding with a discussion on how investors can execute the proposed strategy through both on-chain and off-chain implementations.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5209907>`__

Does Trend-Following Still Work on Stocks?
-------------------------------------------

This paper revisits and extends the results presented in 2005 by Wilcox and Crittenden in a white paper titled Does Trend Following Work on Stocks? Leveraging a survivorship-bias-free dataset of all liquid U.S. stocks from 1950 through November 2024, we examine more than 66,000 simulated long-only trend trades. Our results confirm a highly skewed profit distribution, with less than 7% of trades driving the cumulative profitability. These core statistics hold up out-of-sample (2005–2024), maintaining strong returns despite a modest decline in average trade profitability following the original publication. In the second part of this study, we backtest a long-only trend-following portfolio specifically aimed at capturing outlier returns in individual stocks. While the theoretical portfolio exhibits exceptional gross-of-fees performance from 1991 until 2024 (e.g., a CAGR of 15.19% and an annualized alpha of 6.18%), its extensive daily turnover poses a significant challenge once transaction costs are considered. Examining net-of-fee performance across various asset under management (AUM) levels, we find that the base trend-following approach is not viable for smaller portfolios (AUM less than $1M) due to the dampening effect of trading costs. However, by incorporating a Turnover Control algorithm, we substantially mitigate these transaction cost burdens, rendering the strategy attractive across all tested portfolio sizes even after fees.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5084316>`__

Following a Trend with an Exponential Moving Average: Analytical Results for a Gaussian Model
----------------------------------------------------------------------------------------------

We investigate how price variations of a stock are transformed into profits and losses (P&Ls) of a trend following strategy. In the frame of a Gaussian model, we derive the probability distribution of P&Ls and analyze its moments (mean, variance, skewness and kurtosis) and asymptotic behavior (quantiles). We show that the asymmetry of the distribution (with often small losses and less frequent but significant profits) is reminiscent to trend following strategies and less dependent on peculiarities of price variations. At short times, trend following strategies admit larger losses than one may anticipate from standard Gaussian estimates, while smaller losses are ensured at longer times. Simple explicit formulas characterizing the distribution of P&Ls illustrate the basic mechanisms of momentum trading, while general matrix representations can be applied to arbitrary Gaussian models. We also compute explicitly annualized risk adjusted P&L and strategy turnover to account for transaction costs. We deduce the trend following optimal timescale and its dependence on both auto-correlation level and transaction costs. Theoretical results are illustrated on the Dow Jones index.

`Read the paper <https://doi.org/10.1016/j.physa.2013.10.007>`__

Trend Following in Strategic Asset Allocation: A Long-Horizon Analysis
-----------------------------------------------------------------------

Traditional portfolio construction frameworks rely on static asset allocation and cross-asset diversification to manage risk and improve long-term outcomes. This paper investigates the role of trend following as a structural component of strategic asset allocation, rather than as a standalone return-seeking strategy. Using long-horizon historical data from 1979 to 2025, the authors examine whether systematic trend-based exposure management can complement traditional diversification by addressing risk from a different dimension: the temporal evolution of market trends.

The results suggest that incorporating trend following as a structural overlay can provide a complementary form of diversification — one based on time and regime dynamics rather than asset classes alone — potentially improving portfolio efficiency and resilience without relying on return forecasting or discretionary market timing. Simple equity trend filters such as 10-month moving averages or 12-1 momentum signals deliver comparable returns to buy-and-hold while substantially reducing maximum drawdown and improving risk-adjusted performance.

By Gabriele Galletta (Investimento Custodito).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2023797049141964889>`__: "Trend following is not about alpha. It's about risk control."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6177818>`__

A Century of Evidence on Trend-Following Investing
----------------------------------------------------

AQR's landmark study providing a century of evidence on trend following, testing the strategy from 1880 to the present across equities, currencies, commodities, and bonds. The paper shows that trend following has delivered consistent positive risk-adjusted returns with low correlation to traditional asset classes throughout the entire sample, including periods of market stress.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2993026>`__

Two Centuries of Trend Following
----------------------------------

Y. Lempériere, C. Deremble, P. Seager, M. Potters, and J.-P. Bouchaud push the historical evidence even further by studying trend-following strategies across commodities, currencies, stock indices, and bonds using both futures data since 1960 and spot series that go back to 1800 for some assets. The paper's framing is explicitly anomaly-focused: are long-horizon trend returns statistically strong enough to count as one of the major persistent irregularities in financial markets?

Our summary: this paper is the strongest statistical durability argument in the trend-following literature. The long sample lets the authors separate two issues that often get conflated: whether trends exist at all, and whether modern trend strategies have decayed. Their answer is nuanced: long trends remain statistically robust, but shorter trends have weakened in the recent era. The paper also documents signal saturation for very strong trends, consistent with the idea that fundamental traders only start leaning against price moves once the trend becomes extreme.

Key metrics: the paper reports an overall t-statistic of about 5 for excess returns since 1960 and about 10 since 1800, after accounting for the upward drift of markets. The authors describe the effect as stable across both time and asset classes.

`Read the paper <https://arxiv.org/abs/1404.3274>`__

Rethinking Trend Following: Optimal Regime-Dependent Allocation
----------------------------------------------------------------

Valeriy Zakamulin proposes a theoretical and empirical framework for trend following in which detected market regimes are treated as conditioning information and regime-specific exposures are chosen by directly maximizing the unconditional Sharpe ratio. Instead of taking standard time-series momentum and dynamic-speed momentum rules as fixed portfolio policies, the paper separates regime detection from position sizing and studies whether Sharpe-optimal allocation across Bull, Bear, Correction, and Rebound states improves out-of-sample performance. The empirical tests cover U.S. equity portfolios, 14 international equity markets, and 18 diversified portfolio datasets from Kenneth French's data library.

Our summary: the key contribution here is not a new momentum signal but a clean argument that much of the literature hard-codes the economically important part of the strategy: how much to hold once a regime is identified. Zakamulin shows that canonical trend-following rules often overcommit to symmetric long/short exposures, especially full short positions in bear markets, and that much of the performance improvement comes from letting the exposure map itself be estimated from data. That makes this paper especially relevant for practitioners who already have regime labels or momentum signals and want a principled way to translate them into portfolio weights.

Key metrics: the paper reports annualized out-of-sample Sharpe ratios rather than profit, drawdown, or win-rate statistics. On the total U.S. equity market, the two-regime optimal-allocation strategy improves Sharpe from 0.494 to 0.727 over 2004-2025, while the four-regime version improves Sharpe from 0.507 to 0.735 versus Dynamic Speed Momentum. Across 14 international markets, average Sharpe rises from 0.054 to 0.295 in the two-regime comparison and from 0.192 to 0.319 in the four-regime comparison. Across 18 diversified Kenneth French portfolio datasets, average Sharpe improves from 0.208 to 0.506 in the two-regime case and from 0.496 to 0.628 in the four-regime case, with estimated bear-regime weights typically close to zero rather than -1.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6376479>`__

Quantitative Evaluation of Volatility-Adaptive Trend-Following Models in Cryptocurrency Markets
------------------------------------------------------------------------------------------------

Ioannis Karassavidis, Lampros Kateris, and Maximos Ioannidis (SSRN, 2025) present a trend-following framework that adapts to volatility in high-frequency cryptocurrency markets, focusing on Bitcoin and Ethereum. The proposed system uses multi-horizon moving averages to detect trends, employs a multi-timeframe RSI filter to confirm momentum, and uses ATR scaling to manage risk based on current volatility, with trade exits combining ATR-based trailing stops and EMA slope reversal detection.

Our summary: this paper is notable for how closely its architecture maps to the kind of volatility-adaptive trend system that practitioners actually build. The combination of moving-average trend detection, RSI momentum confirmation, and ATR-based position sizing and exits is a design pattern that shows up repeatedly in production crypto trend-following systems. The paper evaluates these components quantitatively on BTC and ETH, addressing the extreme volatility, heavy-tailed return distributions, and structural inefficiencies that make crypto a natural but challenging test bed for momentum-based strategies.

Key metrics: the paper provides quantitative evaluation of the volatility-adaptive trend-following model on BTC and ETH, reporting performance across different configurations of the moving-average, RSI, and ATR components under realistic market conditions.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5821842>`__

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

.. _example-leverage-for-the-long-run-a-systematic-approach-to-managing:

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

.. _example-demystifying-managed-futures:

Demystifying Managed Futures
-----------------------------

Hurst, Ooi, and Pedersen (AQR / NYU Stern, Journal of Investment Management, 2013) argue that the returns of Managed Futures funds and CTAs can be explained by simple, implementable time-series momentum (TSMOM) strategies. They build TSMOM strategies that go long a market when its excess return over the past 1, 3, or 12 months is positive, and short otherwise, sized so that each asset targets a constant ex-ante volatility of 40% (the diversified portfolio is then scaled to 10% portfolio volatility). The economic motivation rests on behavioural under-reaction to news (anchoring, the disposition effect, slow institutional information diffusion) followed by delayed over-reaction (herding, feedback trading, confirmation bias), with eventual long-horizon reversal beyond one year.

The empirical core of the paper regresses Managed Futures index and individual fund returns on the diversified TSMOM strategy and on the four asset-class TSMOM sub-strategies (commodities, equities, fixed income, currencies). TSMOM produces large R-squares and very significant loadings on Managed Futures returns. Crucially, while CTAs and Managed Futures indices show statistically significant positive alphas against passive stock/bond/commodity benchmarks, those alphas collapse to zero (and in many cases turn negative) once TSMOM is included as a factor — meaning the apparent skill of even the largest, most successful managers is well explained by mechanical trend following. The diversified TSMOM strategy itself also delivers low correlation to traditional assets and exhibits the well-known trend-following "smile": it earns its best returns in sustained bull and bear markets and underperforms in flat, choppy regimes.

Our summary: this is the canonical practitioner reference establishing trend following / time-series momentum as the dominant factor behind Managed Futures returns. It is the bridge between the more academic Moskowitz–Ooi–Pedersen (2012) time-series momentum paper and the practical CTA industry: weekly (rather than monthly) rebalancing, multiple lookback horizons combined in equal-risk fashion, and an explicit accounting of fees and transaction costs. The "alphas-to-zero" result is what makes the paper structurally important — it reframes Managed Futures from an opaque skill-based asset class into a transparent, replicable trend-following premium, and it underpins the subsequent risk-premia / alternative-beta marketing of CTAs by AQR and others. The behavioural mechanisms section is also one of the clearest practitioner writeups of why trends persist.

Data: a liquid global futures and forwards universe — 24 commodity futures, 9 equity index futures, 13 government bond futures, and currency forwards — over January 1985 to June 2012, plus Managed Futures benchmark indices (BTOP50, Credit Suisse Managed Futures Hedge Fund Index, etc.) and the five largest Managed Futures funds in the Lipper/TASS database as of mid-2012. No public source code is released with the paper; the methodology follows Moskowitz, Ooi, and Pedersen (2012) closely enough to be reproducible from the equations in the text.

Key metrics: the diversified TSMOM strategy achieves a gross Sharpe ratio of approximately 1.8 (1985–2012) with realised volatility close to its 10% target, and a near-zero correlation to the S&P 500 (-0.02), modest correlation to the Barclays US Aggregate (0.23) and to the S&P GSCI commodity index (0.05). The 12-month strategy is best, followed by the 3-month, with the 1-month strategy still posting a Sharpe of 1.3. Average pairwise correlation across single-asset strategies is below 0.1 for each trend horizon, driving strong diversification benefits. After applying a simulated 2-and-20 fee structure (averaging ~6% per year given the high gross Sharpe) and 1–4% per year in transaction costs, the net Sharpe ratio of the diversified TSMOM strategy is close to 1.0, comparable to top CTAs. Regressions of Managed Futures index and manager returns on the TSMOM sub-strategies produce R-squares between 0.36 and 0.64, with manager Sharpe ratios in the underlying data ranging between 0.27 and 0.88.

Caveats and reproducibility: the headline 1.8 gross Sharpe is not a deliverable live number. The 1/3/12-month lookback horizons were already published in Moskowitz–Ooi–Pedersen (2012) and the authors themselves note the strategy "benefits from some hindsight" in choosing them. The CTA comparison universe (five largest Lipper/TASS funds as of 06/2012) is survivor-selected, and the sample period 1985–2012 is the historical golden era for trend-following, ending before the long 2011–2019 trend drought. The transaction-cost model is proprietary to AQR and assumes weekly closing-price executions with no scale impact. No source code or replication package is released; the signal definition and vol estimator are fully specified in equations (1)–(5), but the continuous-futures roll methodology is not, and the Lipper/TASS manager analysis is not reproducible without a paid subscription. After-fee (2-and-20, ~6%/yr drag) and after-cost (1–4%/yr) net Sharpe falls to ~1.0; modern cost models such as Frazzini, Israel & Moskowitz (2018) `"Trading Costs" <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2333776>`__ would land somewhere between the gross 1.8 and the paper's 1.0. The structural finding — that TSMOM drives CTA alphas to zero — is robust and independently confirmed by Baltas & Kosowski's `"Demystifying Time-Series Momentum Strategies" <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2140091>`__, while AQR's own out-of-sample retrospective `"You Can't Always Trend When You Want" <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3487134>`__ (Babu, Hoffman, Levine, Ooi, Schroeder, Stamelos, 2020) reports a substantially lower live Sharpe and attributes the post-2012 underperformance to a low-trend market regime rather than to factor decay. The foundational academic parent is the :doc:`Time Series Momentum <./momentum>` entry covering Moskowitz, Ooi & Pedersen (2012).

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

.. _is-trend-still-your-friend-paper:

Is Trend Still Your Friend? A Microstructural Account of the Demise of Short-Term Trend-Following
-------------------------------------------------------------------------------------------------

Jutta G. Kurth, Zoltan Eisler, Adam Rej, and Jean-Philippe Bouchaud (Capital Fund Management, Imperial College London, Institut Louis Bachelier / École polytechnique, and Académie des Sciences) investigate why systematic short-term trend-following — profitable for at least two centuries — has ceased to deliver reliable returns since approximately 2009. Using a cross-section of roughly 100 liquid futures contracts spanning 1995–2025 together with an industry-representative CTA proxy, they document the break and characterise its dependence on signal speed and asset class. They evaluate four candidate explanations — capacity constraints, market electronification, a regime change in CTA-versus-order-flow interactions, and a microstructural mechanism — and find that the first three fail on grounds of timing, magnitude, or cross-sectional heterogeneity.

Our summary: the central empirical finding is that the cross-sectional variable separating degraded from surviving trends is the volatility-normalised tick size. Post-2008 trend PnL has collapsed on small-tick contracts across all signal horizons while remaining essentially intact on large-tick ones, a dichotomy that neither asset class nor liquidity reproduces. The authors interpret this through a self-fulfilling feedback loop they place at the heart of the trend anomaly itself: trend signals trigger directional trades whose market impact reinforces the very price moves that generated the signal, so both the profitability and the persistence of trend depend on trend followers being able to execute aggressively at reasonable cost. They argue the post-crisis transition to HFT-dominated market making — whose liquidity-withdrawal behaviour in front of predictable directional flow has sharply different consequences for sparse (small-tick) versus dense (large-tick) limit order books — has broken this loop on small-tick contracts, while large-tick contracts retain enough residual depth for it to keep operating. A complementary price-impact analysis shows that passive execution offers no escape, since it forfeits the self-reinforcement channel while incurring adverse opportunity costs.

Data and reproduction: the study uses roughly 100 liquid futures contracts over 1995–2025, an SG CTA Index series (courtesy of Société Générale Prime Services & Clearing) rebased over 2000–2025, and a liquidity-weighted CTA proxy rescaled to industry AUM from BarclayHedge at ~12% annualised risk. Two volatility-scaled portfolios are built from EWMA-crossover signals (EWM-τ-4τ, clipped at ±2σ): an equal-risk (Type 1) and a liquidity-weighted (Type 2) construction. The paper is an econophysics empirical study rather than a strategy release; no public code or data package is provided, though the signal and portfolio definitions are specified in full. Published on arXiv (2607.01550), submitted 2 July 2026.

Key metrics: this is a diagnostic study, so the headline numbers are Sharpe ratios by signal speed across the break rather than a live strategy track record. For EWM-τ-4τ signals, pre-break (1995–2009) Sharpes are monotonically decreasing in τ — 0.84 (τ=5), 0.83 (τ=10), 0.79 (τ=20), 0.70 (τ=50) — while post-break (2009–2025) the ordering reverses: the fastest signal collapses to 0.12 and the slowest still delivers 0.40 (standard errors ≈0.25). The five-year rolling Sharpe of a fast EWM-5-20 portfolio falls from a historical range of roughly 1.0–2.5 to a level statistically indistinguishable from zero after 2010. By sector, trend has effectively vanished for equity indices (IDX) and currencies (FXR) while yields (YLD) and commodities (CMD) show no appreciable degradation. The CTA industry is estimated at under 1% of futures volume (cross-sectional median daily participation ~0.9%), which the authors use to rule out a naive capacity-crowding explanation.

Mentioned by Jean-Philippe Bouchaud (Capital Fund Management and Académie des Sciences) in `this LinkedIn discussion <https://www.linkedin.com/posts/jean-philippe-bouchaud-bb08a15_is-short-trend-still-your-friend-microstructure-share-7479079220518793216-fx_d/>`__, where he summarises the central result as the volatility-normalised tick size distinguishing degraded from surviving trends, and frames it through a self-fulfilling impact loop broken by the post-crisis shift to HFT-dominated market making on small-tick contracts.

`Read the paper <https://arxiv.org/abs/2607.01550>`__

Is Trend Still Your Friend? — Quantpedia's Review of the Microstructural Trend-Following Study
----------------------------------------------------------------------------------------------

Quantpedia's research write-up of Kurth, Eisler, Rej and Bouchaud's paper :ref:`Is Trend Still Your Friend? A Microstructural Account of the Demise of Short-Term Trend-Following <is-trend-still-your-friend-paper>`, which is catalogued in full above. The post distils the paper's core argument for a practitioner audience: across roughly 100 liquid futures contracts over 1995–2025, the post-2008 collapse in trend-following performance is highly selective, and the decisive variable is not asset class, liquidity, electronification, or crowding but volatility-normalised tick size.

The review restates the paper's mechanism clearly. Trend-following is sustained by a self-reinforcing feedback loop — trend signals generate directional trading, that trading moves prices through market impact, the move strengthens the signal, and later trend followers pile in — so both the persistence of trends and the profitability of trading them depend on aggressive directional flow translating into meaningful price impact. Quantpedia summarises the authors' explanation for the breakdown: on small-tick contracts, where order books are dense and spreads tight, high-frequency market makers increasingly withdraw liquidity in front of predictable directional order flow, choking off the impact channel, while large-tick contracts retain enough residual depth for the loop to keep working. The takeaway for practitioners is that modern trend portfolios are governed by market microstructure rather than by traditional asset classifications, so tick-size regime — not sector or liquidity — is the axis on which surviving trend exposure should be selected. See the entry above for the full data description and Sharpe-by-signal-speed metrics.

By Quantpedia.

`Read the blog post <https://quantpedia.com/is-trend-still-your-friend-a-microstructural-account-of-the-demise-of-short-term-trend-following/>`__.

Momentum Turning Points
--------------------------

Christian L. Goulding, Campbell R. Harvey and Michele G. Mazzoleni (Journal of Financial Economics, 2023) use slow and fast time-series momentum signals to characterise four stock market cycles — Bull, Correction, Bear and Rebound — defined by whether the two signals agree. A turning point is a month in which the slow and fast signals disagree about direction, which is where trend strategies place their worst bets: slow signals react late, while fast signals fire on noise. The paper analyses momentum strategies of intermediate "speed", formed as fixed-proportion blends of the slow and fast strategies, and shows both analytically and empirically that a blend earns a higher Sharpe ratio than the average of its two constituents. It also derives a model-free decomposition of time-series momentum alpha into market timing and volatility timing, and studies dynamic strategies whose speed changes each month with the observed market state.

Our summary: this is multi-scale momentum reached without any transform, and it is the benchmark any wavelet or filter-based construction should be measured against — it isolates the same fast/slow tension using nothing but two lookback windows and a mixing parameter. Three results transfer directly to a scale-decomposition design. First, the blending gain is analytical, not an artefact of one sample: intermediate speeds beat the average of slow and fast because the two disagree most in exactly the Correction and Rebound states where realised volatility is high, so the combination is doing something a single horizon cannot. Second, the alpha decomposition shows that roughly two-thirds of time-series momentum alpha on the U.S. market over the recent 50-year period comes from market timing and one-third from volatility timing — meaning a trend signal is partly a volatility-management overlay in disguise, a point that connects this entry to the volatility-managed portfolio literature. Third, skewness shifts with speed in the same direction as the Sharpe ratio, so the blend improves the tail rather than trading return for tail risk. The authors also push back on the claim that time-series momentum profitability is mostly a static long tilt: despite positive average tilts, these portfolios need not have positive market betas, and innate volatility timing explains the gap.

Data and reproduction: the core evidence uses monthly U.S. excess value-weighted market returns (Mkt-RF) from the Kenneth French Data Library over an evaluation period of January 1969 to December 2018, with slow signals from trailing 12-month returns and fast signals from trailing 1-month returns, blended as w(a) = (1−a)·w_SLOW + a·w_FAST. Robustness extends to 20 international equity markets. All inputs are public and the signal construction is fully specified, so replication is straightforward; no code release is advertised.

Key metrics: over 1969–2018 the long-only market delivers 5.91% annualised at 15.64% volatility for a Sharpe of 0.38, while pure SLOW gives 6.46% at Sharpe 0.41 and pure FAST 5.30% at Sharpe 0.34. Every intermediate speed beats both endpoints — a = 1/4 reaches Sharpe 0.48 and the equal blend (a = 1/2) peaks at 0.51 with 11.60% volatility, well below either constituent. Annualised alphas rise monotonically with speed from 5.58% (t = 2.55) at a = 1/4 to 6.66% (t = 3.09) at FAST, with the strongest t-statistic at the equal blend (6.12%, t = 3.73). Tail behaviour improves in the middle of the range: maximum drawdown falls from −54.36% for the market and −43.43% for SLOW to −34.43% at the equal blend, and skewness turns from −0.43 (SLOW) to +0.02. The alpha split at the equal blend is 3.96% market timing versus 2.15% volatility timing. Across 20 international markets the intermediate-speed Sharpe exceeds the average of slow and fast uniformly, and the dynamic-speed strategy beats the best static speed in most countries.

`Read the paper <https://doi.org/10.1016/j.jfineco.2023.06.001>`__

.. _example-breaking-bad-trends:

Breaking Bad Trends
----------------------

Christian L. Goulding, Campbell R. Harvey and Michele G. Mazzoleni (Financial Analysts Journal, 2023) quantify how trend breaks — turning points in the trajectory of asset prices — damage trend-following returns, and argue that a rise in turning-point frequency helps explain the weak performance of trend strategies after the global financial crisis. Applying the dynamic speed methodology of their companion Journal of Financial Economics paper to a multi-asset futures universe, they define Bull, Correction, Bear and Rebound states per asset from the signs of slow and fast momentum signals, and blend fast and slow trend returns with state-dependent weights that exploit the return-forecasting properties of corrections and rebounds.

Our summary: where the companion paper makes the analytical case for blending horizons, this one supplies the practitioner evidence and an economic diagnosis of why static trend following decayed. The central empirical relationship is clean: as the number of turning points an asset experiences in a year rises, the distribution of that year's trend-following Sharpe ratios shifts down, and for assets with six or more turning points in a year the median return to static 12-month trend is already negative — at eight or more, the vast majority of returns are negative. The post-GFC expansion saw the turning-point distribution shift upward, which links the mechanism to the performance decline rather than merely correlating with it. Notably, the fix is not to trade faster: the authors are explicit that faster signals increase the tendency to place bad bets because they often reflect noise rather than a genuine turn. What works is state-dependent blending. The turnover figures deserve attention before adopting the design — dynamic trend runs materially higher turnover than static 12-month trend, though far below a 1-month signal, and the paper offsets this against higher average excess return, lower volatility and lower gross leverage.

Data and reproduction: the evaluation covers 43 futures assets across asset classes from January 1990 to December 2022, equally weighted within asset class, with returns scaled to 10% annualised volatility in the main figures (the summary statistics table reports unscaled results). Slow and fast signals use trailing 12-month and 1-month returns, and mixing parameters require a warm-up period of return history before January 1990. The asset list and state definitions are specified in the paper; no code or data release accompanies it.

Key metrics: over the full 1990–2022 sample the dynamic trend strategy earns 4.7% annualised excess return at 5.9% volatility for a Sharpe of 0.80, against 0.64 for static 12-month trend (4.2% at 6.5%), 0.59 for an average of 1-, 3- and 12-month signals, and 0.36 for static 1-month trend. Worst drawdown is −13.2% for dynamic versus −18.8% for static 12-month. The advantage holds in every subsample: Sharpe 1.20 versus 1.07 through the GFC (1990–2008), 0.22 versus 0.06 post-GFC (2009–2022), and 0.34 versus 0.03 in the post-GFC expansion (2009–2019), where static 1-month trend is outright negative at −0.14. The cost is turnover — 399% annualised for dynamic against 229% for static 12-month, though well under the 1135% of static 1-month — partly offset by lower average gross leverage (85% versus 100%). In the COVID year of 2020 dynamic trend returned −4.9% against −8.5% for static 12-month trend.

`Read the paper <https://doi.org/10.1080/0015198X.2023.2270084>`__

The Intraday Seasonality of Market Trends
-------------------------------------------

Concretum Research asks when, during the trading session, the S&P 500 is most likely to generate trend-following profits, and whether that pattern has changed over time. The study was prompted by readers reporting qualitatively that SPY seemed to trend less consistently during certain parts of the session, and it sets out to test that hypothesis empirically. Rather than relying on a single model — whose results could be driven by its own rules — the authors build an ensemble of six intraday trend-following models, all trading SPY, all similar to what they run in their own portfolios. The stated logic for the ensemble is that combining several models which capture intraday trend continuation in slightly different ways gives a better chance of isolating the underlying market behaviour rather than a model artefact. The article then constructs an ensemble portfolio to reduce model-specific noise, evaluates intraday seasonality over the full sample, and checks whether the pattern has shifted in recent years.

The framing places the work in the lineage of Toby Crabel, Linda Raschke, Larry Connors and Monroe Trout from the early 1990s, whose intuition was that a significant intraday move away from a reference price may reflect a genuine supply-demand imbalance. Concretum's stated contribution over that earlier work is empirical rigour: intraday rather than daily data, explicit position-management rules, realistic trading frequencies, and published Python code in many of their previous articles. The headline given in the free preview is that intraday trend-following profits **have not disappeared, but have weakened during certain parts of the trading session** — with the author's own framing being that this may prompt intraday trend traders to revisit position-management assumptions that worked well until 2023.

Our summary: the design choice worth borrowing is the ensemble-as-instrument. Using six models to measure a property of the market, rather than one model to make money, is the right way to separate "this strategy decayed" from "the market changed" — a distinction most decay post-mortems fail to make. The 2023 breakpoint is the claim to watch, since it would place the weakening after the period covered by most published intraday trend research. Note the caveat below on access: the specific model descriptions, the seasonality results by session segment, and the recent-years comparison are all behind the paywall, so the direction of the finding is recorded here but none of the supporting numbers are verified.

Access note: this post is marked "for paid subscribers" on Substack despite the announcement tweet describing it as available to all readers. This entry and the archived PDF cover the free preview only — everything from the section "An Ensemble of Models" onward, including the six model definitions and all results, was not readable.

Mentioned by Concretum Research (@ConcretumR) in `this discussion <https://x.com/ConcretumR/status/2085704768240959929>`__, where they describe intraday trend following as one of the most valuable strategies they run — largely orthogonal to traditional equity exposures, performing well in high-volatility environments, and simple from an execution and infrastructure perspective — while also being one of the hardest to monitor because it is particularly sensitive to changes in market structure. They note having observed weaknesses across several of their intraday trend models over the past few months, which is what prompted the study.

By Concretum Research.

`Read the blog post <https://concretumgroup.substack.com/p/the-intraday-seasonality-of-market>`__.

Testing Larry Williams' Volatility Expansion Strategy in Crypto
---------------------------------------------------------------

Research Article #40 from Trading Research Hub. Tests and improves upon Larry Williams' Volatility Expansion Strategy, a momentum-based approach that enters positions when price volatility expands beyond recent ranges. The study applies this classic trading methodology to cryptocurrency markets with systematic modifications.

The article goes beyond simple implementation to test various improvements to the original strategy, including different parameter settings and additional filters. The in-depth analysis demonstrates how a strategy concept from traditional markets can be adapted and enhanced for the unique characteristics of crypto trading.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-40-larry-williams>`__.

Day Trading Volatility Breakouts Systematically - All Rules Included
--------------------------------------------------------------------

A complete rule set for systematically day trading volatility breakouts. The post provides all the mechanical rules needed to trade intraday breakouts driven by volatility expansion, including entry triggers based on ATR-derived levels, position sizing, stop placement, and exit criteria. The approach is designed to be fully systematic with no discretionary decisions, making it suitable for automation.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/day-trading-volatility-breakouts-systematically-all-rules-included/>`__.

Market Open Trend Strategy: Long Only Nasdaq
--------------------------------------------

A simple yet effective intraday trend-following strategy for Nasdaq futures that captures upward market trends by entering at the 9:30 AM market open. The strategy uses two filters before entry: price must be above yesterday's open (momentum filter) and above VWAP anchored at the 18:00 session open. Position sizing is adaptive, scaled by distance to VWAP — the closer price is to VWAP, the larger the position. Exits occur either at market close (4:00 PM) or on a 5-minute close below VWAP, whichever comes first.

The 15-year NQ backtest with cost and slippage included shows robust performance. The author also presents a compounding variant using percentage-based sizing (33% to 100% of account) instead of fixed contracts, which dramatically improves returns through compounding gains. The post includes a discussion of potential overfitting concerns: whether trading only the long side constitutes overfitting even when both long and short are profitable, and whether delaying entry by 15 minutes to avoid opening volatility is a legitimate filter or curve-fitting.

Mentioned by Rob (@BostonRobTrades) in `this discussion <https://x.com/BostonRobTrades/status/2048141906102845655>`__.

`Read the post <https://x.com/BostonRobTrades/status/2048141906102845655>`__.

Trend-Following Trading Strategies and Financial Market Stability
-----------------------------------------------------------------

A talk at the ICML 2019 AI for Finance workshop by Michael Wellman of the University of Michigan Strategic Reasoning Group, presenting work with Erik Brinkman and Uday Rajan. It asks under what conditions a market shock is amplified when some agents follow trends.

The method is empirical game-theoretic analysis (EGTA): define a strategy space, simulate strategy profiles in an agent-based financial market, induce an empirical game from the simulation data and characterise behaviour at its equilibria. The trend follower is a simple technical strategy, called a high-frequency trend follower on the slides. It continually looks for monotonic trends in transaction prices, takes the best price in the direction of the trend and resubmits at a more extreme price, and withdraws if its order stays untransacted for a long period. Shocks are modelled as the exogenous insertion of a large sell order.

When agents observe the current fundamental value, the market stabilises quickly after a shock. When they observe it with noise, beliefs are influenced by prices and the shock has a more persistent effect. In that noisy-observation model, market frictions contribute to mispricing, and longer trends signal profit opportunities, so a trend-following strategy is present in equilibrium. Trend followers reduce mispricing during trends, but they crowd out the use of transaction price information and increase adverse selection. The slides report the fraction of agents using transaction information as 100% and 54% in the two runs without trend followers against 23% with them. Trend following also amplifies the magnitude of a shock while shortening its duration, which the speakers call representative of flash crashes, and it helps recovery as measured by RMSD. The effects on volatility and price discovery are small and flagged as possibly artifacts.

**Data and code.** Simulation only, with no market data. No code is linked on the slides.

**Key metrics.** The slides report market efficiency of 50.7% and 50.3% without trend followers against 40.6% with them. The maximum price difference after a shock reaches 4,194 with trend followers at 100 shock orders. Volatility is 1,071 and 1,055 without trend followers against 1,013 with them, and mispricing is 573 and 571 against 595. The slides give no returns or Sharpe ratios for the strategy.

By Michael Wellman, Erik Brinkman, Uday Rajan.

`Watch the presentation <https://slideslive.com/38917472/trendfollowing-trading-strategies-and-financial-market-stability>`__.

A Decade of Evidence of Trend Following Investing in Cryptocurrencies
---------------------------------------------------------------------

Cryptocurrency markets have many of the characteristics of 20th century commodities markets, making them an attractive candidate for trend following strategies. We present a decade of evidence from the infancy of bitcoin, showcasing the potential investor returns in cryptocurrency trend following, 255% walkforward annualised returns. We find that cryptocurrencies offer similar returns characteristics to commodities with similar risk-adjusted returns, and strong bear market diversification against traditional equities.

The paper tests moving-average crossover rules on hourly BTCUSD spot prices from Bitstamp, from September 2011 to December 2019, and runs the same tests on the daily S&P 500 for comparison. It uses three trend filters: simple (SMA), exponential (EMA) and double exponential (DEMA) moving averages. A buy signal fires when the short average crosses above the long average, and a sell signal fires on the opposite cross. Short and long windows range from 1 to 1,000 hours for bitcoin and 1 to 50 days for the S&P 500. Each backtest starts with 10,000 USD and buys or sells the maximum volume on each signal. Window pairs are chosen to maximise the Sharpe ratio. The walk-forward test uses the best pair from year Y to trade year Y+1. Fees, spread, slippage and market impact are all assumed to be negligible. The best-performing short windows are generally above 200 hours. The authors find no profitable intraday trend-following strategies for BTCUSD spot. The conclusion says that simple moving averages of about 10 and 40 days work consistently, with yearly Sharpe ratios of about 0.5 to 1.5 and only one losing year. The results section is less upbeat. It reports variable walk-forward Sharpe ratios below 1 for the 2015 to 2018 training slices, some of them negative, and finds "no predictable and attractive Sharpe ratios" from one-year training windows.

The paper does not measure skew or convexity. It also does not split strategy returns into up and down markets. The "bear market diversification" claim rests on the low correlation between bitcoin and US equities. The authors themselves note that the sample covers a long equity bull market with no prolonged recession. The 255% annualised figure compounds parameters fitted in-sample each year, with zero costs, over bitcoin's early growth period. It is best read as an upper bound. The extracted text is complete. The paper is only 8 pages long.

**Data and code.** BTCUSD spot trades from Bitstamp, downloaded from bitcoincharts and resampled to hourly bars from 13 September 2011 to 12 December 2019. That gives 72,299 rows, of which 5,835 were missing and forward-filled (the mean date of the missing rows is March 2012). Daily S&P 500 OHLC data comes from Yahoo! Finance for the same period. Code is published at https://github.com/Globe-Research/bittrends.

**Key metrics.** The combined walk-forward SMA return over 2011 to 2019 is 73,700%, or 255% annualised. These are the best full-period, in-sample results (Table 1): SMA with 141/781-hour windows has a Sharpe of 1.09 and a Sortino of 0.80. EMA with 721/951 hours has a Sharpe of 1.35 and a Sortino of 12.98. DEMA with 791/981 hours has a Sharpe of 1.32 and a Sortino of 2.21. For EMA and DEMA, the optimal short and long window sizes have a correlation above 0.65. Bitcoin and S&P 500 daily returns show a small negative correlation that is not statistically significant. A bottom-up estimate puts maximum strategy capacity at $323m. The paper does not report maximum drawdown, win rate or skew.

By Evans Rozario, Samuel Holt, James West, Shaun Ng.

`Read the paper <https://arxiv.org/abs/2009.12155>`__

Systematic Trend-Following with Adaptive Portfolio Construction: Enhancing Risk-Adjusted Alpha in Cryptocurrency Markets
------------------------------------------------------------------------------------------------------------------------

Cryptocurrency markets exhibit pronounced momentum effects and regime-dependent volatility, presenting both opportunities and challenges for systematic trading strategies. We propose AdaptiveTrend, a multi-component algorithmic trading framework that integrates high-frequency trend-following on 6-hour intervals with monthly adaptive portfolio construction and asymmetric long-short capital allocation. Our framework introduces three key innovations: (1) a dynamic trailing stop mechanism calibrated to intra-day volatility regimes, (2) a rolling Sharpe-ratio-based asset selection procedure with market-capitalization-aware filtering, and (3) a theoretically motivated asymmetric 70/30 long-short allocation scheme grounded in the empirical positive drift of crypto markets. Through extensive out-of-sample backtesting across 150+ cryptocurrency pairs over a 36-month evaluation window (2022–2024), AdaptiveTrend achieves an annualized Sharpe ratio of 2.41, a maximum drawdown of −12.7%, and a Calmar ratio of 3.18, significantly outperforming benchmark trend-following strategies (TSMOM, time-series momentum) and equal-weighted buy-and-hold portfolios. We further conduct rigorous robustness analyses including parameter sensitivity, transaction cost modeling, and regime-conditional performance decomposition, demonstrating the strategy's resilience across bull, bear, and sideways market conditions.

The strategy trades Binance perpetual swaps on 6-hour candles. An asset enters long when its rate of change over a lookback window L exceeds a threshold, and enters short when it falls below the negative threshold. Each position has an ATR trailing stop: the stop moves to the higher of its previous level and price minus α times ATR, and the position closes when price crosses it. On the first day of each month the universe is rebuilt in two stages. Long candidates are the top 15 assets by market cap, and short candidates are the bottom assets by market cap. The threshold, α and L are then grid-searched on the previous month for each candidate. An asset is kept only if its fitted Sharpe is at least 1.3 for longs or 1.7 for shorts. Capital is split 70% to the long leg and 30% to the short leg, equal-weighted within each leg. The authors justify the long tilt by the positive drift of crypto and by the cost of borrowing for shorts.

The paper motivates its design by crypto's positive skew in bull markets and heavy left tails in crashes, but it does not report the skew of its own returns. The regime split, based on the rolling 60-day BTC return, shows where the money comes from. Bull periods return 68.3% annualised with a Sharpe of 3.42. Bear periods return −4.2% with a Sharpe of −0.31, and the full −12.7% maximum drawdown falls in the bear regime. So the strategy is not crisis alpha. It is close to flat in falling markets, while buy-and-hold BTC lost up to 64.1%, and most of its profit comes from rising markets. The paper has some internal inconsistencies. The text says the trailing stop is the biggest contributor (Sharpe +0.73), yet its own ablation table shows a larger drop (Sharpe −1.07) when monthly re-optimisation is removed. The cumulative return chart runs to October 2025, past the stated December 2024 out-of-sample end. The trailing-stop rule is written out for longs only. The short leg is drawn from the smallest-cap assets, which the authors say limits capacity.

**Data and code.** 6-hour OHLCV bars for 150+ Binance Futures perpetual swaps from January 2021 to December 2024, with daily market-cap data from the CoinGecko API. 2021 is used for initial calibration and January 2022 to December 2024 (36 months) is out-of-sample. The cost model has a 4 bps taker fee, slippage that scales linearly with trade size relative to 5-minute volume, and 8-hour funding charges. Sharpe ratios assume a 4.5% risk-free rate. No code is released.

**Key metrics.** Out-of-sample (Table 1): AdaptiveTrend 70/30 returns 40.5% annualised at 16.8% volatility, with a Sharpe of 2.41, maximum drawdown of −12.7%, Calmar of 3.18 and Sortino of 3.62. The 50/50 variant gives a Sharpe of 2.12 and a drawdown of −14.3%. Vol-scaled TSMOM gives a Sharpe of 1.83 and a drawdown of −16.1%. TSMOM-1M gives 0.65 and −34.8%, and TSMOM-3M gives 0.54 and −38.2%. Equal-weight buy-and-hold gives 0.07 and −72.4%, and BTC buy-and-hold gives 0.17 and −64.1%. Results by regime (bull / sideways / bear): returns of 68.3% / 18.7% / −4.2%, Sharpe of 3.42 / 1.87 / −0.31, maximum drawdown of −7.1% / −9.4% / −12.7%, win rate of 54.2% / 47.8% / 41.3%, and average trade PnL of +1.82% / +0.63% / −0.21%. Ablation Sharpe (drawdown): 1.68 (−22.4%) without the trailing stop, 2.05 (−17.8%) without the market-cap filter, 1.92 (−19.1%) without Sharpe selection and 1.34 (−28.6%) with fixed parameters. Sharpe is 2.87, 2.41, 2.01 and 1.62 at 0, 4, 8 and 12 bps cost. By timeframe, Sharpe is 1.54 on H1, 2.08 on H4, 2.41 on H6, 2.18 on H8, 1.91 on H12 and 1.63 on D1. H6 makes 142 trades per month with 134% turnover. Block-bootstrap p-values are 0.024 against vol-scaled TSMOM and below 0.001 against the other benchmarks. Estimated capacity is about $5 to 10M for the short leg. The long leg is not liquidity-bound up to $50M.

By Duc Bui, Thanh Nguyen.

`Read the paper <https://arxiv.org/abs/2602.11708>`__

The Convexity of Trend Following
--------------------------------

Much has been made recently of crisis alpha or crisis risk offset. And, in particular, of using trend following as a hedge of future downside moves in, mostly, equity markets. We demonstrate that trend following is mechanically convex relative to the underlying upon which one is trending, but, that the overall convexity offered by CTAs is mitigated by implementation steps that improve risk and execution cost adjusted returns. Trend Following should primarily be viewed as a highly statistically significant strategy, while the existence of convexity, albeit weak, should be considered a bonus feature to an investment in Trend Following.

This CFM technical note from February 2018 is subtitled "Protecting your assets but perhaps not as much as you would like!". It is the non-technical companion to the CFM academic paper "Tail protection for long investors: Trend convexity at work". Start with a toy trend follower whose position equals the price change since a start date. Its total P&L is exactly half the squared cumulative move minus half the sum of squared daily moves. In other words, trend P&L is long-timescale variance minus short-timescale variance. With an EMA trend signal the same identity holds after smoothing. An EMA of P&L over τ/2 is proportional to τ times the squared EMA of returns, minus an EMA of squared daily returns. Plot smoothed trend P&L against the smoothed return of the underlying and you get a U-shaped parabola. That parabola appears even for a random walk with zero Sharpe, so the convexity is mechanical and does not depend on trends being profitable. The note also states that the strategy is positively skewed on the trend timescale. It loses more often than it gains, but its gains are larger than its losses. The protection only covers moves that persist over a period comparable to the trend timescale.

The second half shows how standard CTA practice weakens convexity to any single market, such as equities. Diversifying across many instruments blurs the parabola against the S&P 500, though a lower envelope of the original parabola remains. Some equity convexity also survives because bonds tend to rally when equities crash. Capping positions, taken to the extreme of trading only the sign of the trend, flattens the U into a V and trims fat tails. Smoothing the signal with a second EMA to save costs delays trades and blunts the response to sudden moves. Each of these steps improves risk-adjusted or cost-adjusted returns at the expense of convexity. For the SG CTA Index the note uses a trend timescale of about 6 months, taken from an earlier replication. A naive plot of monthly CTA returns against monthly S&P 500 returns shows almost no convexity. Measured at the right timescales, the convexity is clear. The note also compares trend with buying index puts, which it calls a systematically negative strategy. Its conclusion is to hold trend following for its robustness and treat the protection as a bonus.

**Data and code.** Simulated random walks, a synthetic 9-instrument universe of independent random walks, about 35 years of S&P 500 E-mini futures (Bloomberg ESA) and first generic Wheat futures (Bloomberg W 1), and monthly SG CTA Index returns. P&L in the charts is normalised to 1% daily volatility. No code is provided.

**Key metrics.** For SG CTA Index returns against the S&P 500, the parabolic fit has R² = 0.02 using raw monthly returns. It rises to R² = 0.18 with the EMA method at the best-fitting trend timescale of about 6 months. The earlier CFM trend replication of the SG CTA Index reached about 85% correlation. The SG CTA Index was up 13.1% in 2008. The note gives expected Sharpe ratios of 0.3 to 0.4 for equities. It reports no strategy returns, Sharpe ratios or drawdowns of its own.

By Capital Fund Management (CFM).

`Read the paper <https://www.cfm.com/wp-content/uploads/2022/12/266-2018-The-Convexity-of-trend-following.pdf>`__

Making Fat Right Tails Fatter with Trend Following... Most of the Time
----------------------------------------------------------------------

Our prior work has demonstrated the mechanically convex behaviour of trend following that many in the investment industry have enthusiastically embraced as a possible protector of asset portfolios. In this short paper we develop and explain the consequences of these ideas in terms of how this convexity leads to a positively skewed returning strategy, which in turn then becomes a performance chaser's nightmare – selling after prolonged periods of inevitable disappointing performance before missing the next, unpredictable acceleration in positive performance. We contrast this with the P&Ls of most other strategies and assets that are predominantly negatively skewed. This opposing return pattern lures investors into a false sense of security and is equally dangerous to performance chasers. We argue that trend following should form a core and stably allocated component alongside traditional assets in a diversified portfolio. Performance chasers: beware!

This November 2018 CFM technical note follows up "The Convexity of Trend Following". It opens with February 2018, when CTAs failed to protect investors in a sharp equity sell-off. The S&P 500 fell 8.7% over six trading days from 2 February. The authors argue that in a sudden jump a trend follower has a 50% chance of being on either side of the move. Even the fastest signals could not have reacted in time. Trend following protects against long, drawn-out bear markets, and equally against long bull markets, but not against instantaneous crashes. For this reason the note says trend should not be compared with buying options or treated as a substitute for them. It then argues that convexity and positive skew are "one and the same thing". A strategy with infrequent large gains and frequent small losses has a positively skewed return distribution. Most assets and risk premia strategies are the reverse. Being long equities, or short a variance swap, makes many small gains and suffers occasional large losses. Trend is described as having both a positive Sharpe ratio and positive skew, so the investor receives a premium and gets protection, though only statistically.

The key technical point is that skew depends on the measurement timescale. On a random walk, the skew of daily trend returns is exactly zero. The skew rises as returns are sampled weekly, fortnightly and monthly, and peaks near the trend timescale. The note shows this for trend timescales of 2 months, 6 months and 1 year. An investor can therefore choose the timescale on which skew is largest. The note jokes that this might be the allocator's own performance review period. On about 40 real futures, the daily skew of a 100-day trend has moved from positive to negative. The authors link this to the fading of short-term (few-day) autocorrelation rather than to crowding. A 3-day trend on the same pool was historically profitable before costs but loses money after realistic costs. The behavioural conclusion is that positive skew punishes performance chasers, who invest after strong runs and redeem during the long flat periods. The note therefore recommends a stable core allocation with no attempt at timing.

**Data and code.** Random-walk simulations (for example a 50-day EMA of the P&L of a 100-day EMA trend), monthly BarclayHedge CTA Index returns since 1980 (541 programs), the SG CTA Index (20 largest CTAs, daily since 2000), a pool of about 40 futures for the 3-day and 100-day trend examples, and the inverted VIX and the P&L of a short SPX variance swap as the negative-skew example. Skewness is measured with Pearson's second skewness coefficient. No code is provided.

**Key metrics.** In February 2018 the SG CTA Index fell 6.3% and the BarclayHedge CTA Index fell 3.7%, while the S&P 500 fell 3.9%. The S&P 500 lost 2.1% on 2 February and 4.1% on the following Monday, and 8.7% over six trading days. Trend-following assets saw average inflows of nearly 15% per year since 2000. For daily returns with autocorrelation C(u) = q^u, the skew of daily trend returns is 6q + O(q²), which is zero for a random walk. The skew results are shown only as charts, with no numerical values, and the note reports no strategy returns or Sharpe ratios.

By Capital Fund Management (CFM).

`Read the paper <https://www.cfm.com/making-fat-right-tails-fatter-with-trend-following-most-of-the-time/>`__

Tail Protection for Long Investors: Trend Convexity at Work
-----------------------------------------------------------

The performance of trend following strategies can be ascribed to the difference between long-term and short-term realized variance. We revisit this general result and show that it holds for various definitions of trend strategies. This explains the positive convexity of the aggregate performance of Commodity Trading Advisors (CTAs) which – when adequately measured – turns out to be much stronger than anticipated. We also highlight interesting connections with so-called Risk Parity portfolios. Finally, we propose a new portfolio of strangle options that provides a pure exposure to the long-term variance of the underlying, offering yet another viewpoint on the link between trend and volatility.

This is the academic paper behind the two CFM technical notes above. For a toy trend whose position is proportional to the price change since time 0, P&L over T days is exactly λ/2 times the squared T-day move minus λ/2 times the sum of squared daily moves. In expectation this is the gap between long-term and short-term volatility, so trend makes money when returns are autocorrelated and loses when they mean-revert. The authors then derive a new exact identity for a volatility-normalised EMA trend with timescale τ. Averaged over τ' ≈ τ/2, the conditional P&L is Υ(τ)(T² − 1), where T is the normalised past trend. That is a parabola, which means positive convexity. When the position is capped to the sign of the trend, the profile becomes a V, ``λτ(|T| − √(2/π))``. Softer caps such as tanh fall in between. Because T is roughly Gaussian, the P&L on the trend timescale follows a χ² distribution, which is positively skewed even when the trend has zero expected return. Daily skew is only 6q for small autocorrelation q, and zero for a random walk. The paper is explicit about the limits of the hedge. A 6 to 9 month trend system rebalanced weekly cannot protect against a crash that lasts a few days, or against moves shorter than its rebalancing interval.

Empirically, the HFRI hedge fund composite shows a concave relationship with the S&P 500, meaning negative convexity: hedge funds do worse when volatility is high. Naive monthly plots of BTOP 50 and SG CTA returns against the S&P 500 show almost no convexity. A surrogate CTA runs an equal-risk 180-day EMA trend on 20 liquid futures, net of assumed costs and fees. It tracks the SG CTA Index with a correlation above 80% and a Sharpe ratio very close to the index's. Plotted at the right timescales (τ = 180, τ' ≈ 90), SG CTA returns show clear convexity against S&P 500 trends. Diversification reduces convexity against any single asset. However, the authors prove that diversified trend P&L is bounded below by a parabola in the trend of an equal-risk "risk parity" portfolio of the same assets. On that basis they argue trend is a hedge for risk parity or diversified stock-and-bond holders. Finally, an infinite, equally weighted strip of strangles pays exactly the same long-term variance as the toy trend. The strangles pay implied variance up front, while the trend pays realised short-term variance. A straddle protects better against a single-day shock, where trend is flat on average. However, long-volatility portfolios lost money over the previous two decades, apart from 2008. The paper concludes that trend is the cheaper hedge.

**Data and code.** For the single-asset illustration, rolled S&P 500 futures from January 1983 to October 2015, scaled to 1% daily P&L volatility. For the CTA replicator, 20 futures from January 2000 to October 2015: WTI, gold, copper and soybeans; the S&P 500, EuroStoxx 50, FTSE 100 and Nikkei 225; EUR, JPY, GBP, AUD and CHF against the USD; Euribor, Eurodollar and Short Sterling; and US 10Y, Bund, Gilt and JGB. Benchmarks are the SG CTA, Barclays BTOP 50 and HFRI Fund Weighted Composite indices, and the J.P. Morgan risk parity index. Volatility is normalised with a 10-day EMA (γ = 1.05). The replicator assumes 2% flat transaction costs, a 1% management fee, a 20% incentive fee, and the S&P/BGCantor 3-6 Month T-Bill index as the risk-free rate. Full derivations are in the appendix. No code is released.

**Key metrics.** Monthly CTA returns against the S&P 500 give a quadratic fit of R² = 0.02 for both the BTOP 50 and the SG CTA Index. With trend-matched averaging, the SG CTA Index gives R² = 0.18. The correlation between the replicator and the SG CTA Index peaks broadly around τ = 180 days, at above 80%. The equal-risk long-only proxy has an 89% correlation with the J.P. Morgan risk parity index. All diversified CTA points lie above the parabola predicted for trend on that portfolio. The paper cites CTA industry assets of about USD 300bn. It gives no numerical Sharpe ratio, return or drawdown figures for the replicator.

By Tung-Lam Dao, Trung-Tu Nguyen, Cyril Deremble, Yves Lempérière, Jean-Philippe Bouchaud, Marc Potters.

`Read the paper <https://arxiv.org/abs/1607.02410>`__

The Effectiveness of Technical Trading Rules in Cryptocurrency Markets
----------------------------------------------------------------------

We analyse various technical trading rules in the form of the moving average-oscillator and trading range break-out strategies to specifically test resistance and support levels and their trading performance using high-frequency Bitcoin returns. Overall, our results provide significant support for the moving average strategies. In particular, variable-length moving average rule performs the best with buy signals generating higher returns than sell signals.

The paper applies the classic Brock, Lakonishok and LeBaron (1992) tests to one-minute BTC/USD prices. It tests three rule families. The variable-length moving average (VMA) rule compares a short simple moving average of 1, 2, 5 or 10 minutes with a long one of 5 to 200 minutes. Every minute is classed as a buy when the short average is above the long one and as a sell when it is below. Each pair is run with no band and with a 1% band, which gives 48 tests. The fixed-length moving average (FMA) rule only looks at crossovers and records the return over the next 10 to 1,440 minutes, which gives 480 tests. The trading range breakout (TRB) rule buys when the price breaks above the high of the previous n minutes and sells when it breaks below the low, with n from 10 to 1,440 minutes and the same holding period, which gives 20 tests. Mean buy and sell returns are tested against the unconditional mean with a Bonferroni-adjusted 0.1% significance level. There is no bootstrap, no out-of-sample period and no transaction costs. The authors say liquidity and trading costs still need to be studied.

The paper covers Bitcoin only. VMA works in-sample: 43 of 48 buy-sell spreads are significant, a 1% band widens the spread, and the best results come from 1- and 2-minute short averages. FMA mostly fails, with negative or insignificant spreads in most of the 480 tests. TRB goes the wrong way for a trend follower. For holding periods up to 3 hours, returns after upside breakouts are lower than after downside breakouts, so short-term breakouts tend to reverse. Only at 720 and 1,440 minutes does the spread turn positive, and it is not significant there. "Buy signals beat sell signals" is a test of the buy-minus-sell spread, not a split of long versus short profit. In VMA, sell minutes are about as negative as buy minutes are positive, so the signal is roughly symmetric and a short side would earn about as much as the long side before costs. The paper does not compare long-only with long-short trading. Raw one-minute returns are strongly positively skewed, but the paper does not measure the skew or convexity of strategy returns and does not split results into up and down markets. Two cautions apply. First, the paper does not state clearly whether the return of a buy minute is measured after the signal or over the same minute that triggers it. With a 1-minute "short average", which is just the price, a 1% band means the price has just jumped, and 94% of those buy minutes are positive. The large banded figures should be read with this in mind. Second, the claim that technical trading earns "100 to 10,000 times" buy-and-hold compares mean returns per signal with the unconditional one-minute mean, not compounded strategy returns.

**Data and code.** One-minute USD close prices for Bitcoin on the Bitfinex exchange, bought from the Kaiko digital asset store. The sample runs from 1 January 2014 to 25 June 2018, which is 2,341,440 minutes. Minutes with no trade take the last traded price. Returns are log returns. This copy is the accepted manuscript from the Dublin City University repository. No code is released.

**Key metrics.** One-minute Bitcoin returns have a mean of 0.000195%, a standard deviation of 0.145%, a maximum of 46%, a minimum of −21.687%, skewness of 12.385 and kurtosis of 5,159.15. VMA (48 tests): 43 buy-sell spreads are significant. The average spread is 0.0224% with no band and 0.2637% with a 1% band. Mean buy returns are significantly positive in 46 tests and mean sell returns significantly negative in 42 tests. The average buy return is 0.072% and the average sell return is −0.071%. The share of positive buy returns ranges from 33% to 94%, and of positive sell returns from 7% to 48%. The best rule, (1, 5, 1% band), has 2,253 buy signals with a mean buy return of 1.0384%, a mean sell return of −1.0114% and a spread of 2.0498%. With a 10-minute short average and a 1% band, the spread is −0.0478% for the 20-minute long average and between 0.0000% and 0.0015% (not significant) for the others. FMA (480 tests): 87 spreads are positive and only 21 are significant at 5%. The average spread is −0.0428% with no band and −0.0135% with a band. TRB (20 tests): 4 spreads are positive and 1 is significant. Of the 16 negative spreads, 11 are significant. The average spread is −0.1245%. It is 0.0138% with no band and −0.2627% with a 1% band. The paper reports no Sharpe ratios, drawdowns or break-even costs.

By Shaen Corbet, Veysel Eraslan, Brian Lucey, Ahmet Sensoy.

`Read the paper <https://doi.org/10.1016/j.frl.2019.04.027>`__

Technical Trading and Cryptocurrencies
--------------------------------------

This paper carries out a comprehensive examination of technical trading rules in cryptocurrency markets, using data from two Bitcoin markets and three other popular cryptocurrencies. We employ almost 15,000 technical trading rules from the main five classes of technical trading rules and find significant predictability and profitability for each class of technical trading rule in each cryptocurrency. We find that the breakeven transaction costs are substantially higher than those typically found in cryptocurrency markets. To safeguard against data-snooping, we implement a number of multiple hypothesis procedures which confirms our findings that technical trading rules do offer significant predictive power and profitability to investors. We also show that the technical trading rules offer substantially higher risk-adjusted returns than the simple buy-and-hold strategy, showing protection against lengthy and severe drawdowns associated with cryptocurrency markets. However there is no predictability for Bitcoin in the out-of-sample period, although predictability remains in other cryptocurrency markets.

The paper follows Hsu, Taylor and Wang (2016) and tests 14,919 daily rules in five families. Moving average rules (7,980 variants) compare the price with one average, or a short average with a long one, using windows of 2 to 200 days. One variant uses three averages and takes a third of the position when two agree. Filter rules buy after a given rise from the most recent low and sell after a given fall from the most recent high. Support-resistance rules trade breaks of the prior high or low. Oscillator rules use the RSI as a contrarian signal. Channel breakout rules trade breaks out of a narrow price channel. Variants add bands of 0% to 5%, require the signal to hold for 1 to 5 days, and in some cases hold for a fixed 3 or 5 days. The position is +1, −1 or 0, and cash earns nothing. The series are two Bitcoin prices (the CoinDesk index and Bitstamp), Litecoin, Ripple and Ethereum, all up to 31 December 2017. Each rule gets a stationary bootstrap p-value from 1,000 resamples. These are then corrected for multiple testing with the Bonferroni, Holm, Benjamini-Hochberg and Benjamini-Yekutieli methods. Returns are gross. Costs are handled through break-even costs, which are compared with an estimated Bitcoin cost of about 50 basis points from Lintilhac and Tourin (2017). For the out-of-sample test, the best in-sample rule for each series is run over January to June 2018, a falling market.

In-sample, every rule family has significant positive average returns on every series. Filter and channel breakout rules do best, and support-resistance rules do worst. The two Bitcoin series give almost the same results. For Bitcoin, about 27% to 34% of rules stay significant after the strictest corrections. Average break-even costs for Bitcoin are 50 to 66 basis points for moving average, filter and channel breakout rules. However, only about 23% to 36% of rules in each family clear 50 basis points, so most rules would not survive costs of that size, and support-resistance rules almost never do. Only about 5% to 6% of Bitcoin rules beat buy-and-hold on return, while about a third beat it on Sortino and Calmar ratios. Out-of-sample, the best Bitcoin rule (a channel breakout rule with a fixed holding period on both series) loses money on both Bitcoin series. The best rules on Litecoin, Ripple and Ethereum stay positive. The authors suggest Bitcoin, as the most watched and liquid coin, is the most efficient. Profit comes from the long side. Average buy-signal returns are positive and significant for every family and coin. Average sell-signal returns are close to zero or slightly negative, and fewer than 1% of rules have a significant sell return. The average rule return is roughly the buy return plus the sell return, so the short side adds nothing. All five series have positively skewed daily returns. The paper does not measure the skew or convexity of strategy returns, and it does not report maximum drawdowns, although it says the higher Sortino and Calmar ratios show protection from drawdowns. The reported annualised returns are about 19 times (the square root of 365) the daily mean, not 365 times. For example, a daily mean of 0.40% is reported as 7.72% a year. Treat the annualised figures as scaled averages, not compounded returns.

**Data and code.** Daily prices to 31 December 2017. The CoinDesk Bitcoin price index starts 18 July 2010 (2,735 observations). The Bitstamp Bitcoin price starts 1 December 2012 (2,217 observations). Litecoin (from 28 April 2013, 1,710 observations), Ripple (from 4 August 2013, 1,624 observations) and Ethereum (from 7 August 2015, 877 observations) come from CoinMarketCap. Weekends and holidays are included. The out-of-sample period is the first six months of 2018. Simple returns are used. The risk-free rate comes from the Kenneth French data library. The paper is open access. No code is released.

**Key metrics.** Average annualised return by family for CoinDesk: moving average 7.72%, filter 10.24%, support-resistance 3.33%, oscillator 7.34% and channel breakout 10.11%. For Bitstamp: 5.82%, 7.97%, 2.63%, 5.07% and 7.89%. The highest family average is 16.45% for Ethereum filter rules. CoinDesk annualised Sharpe ratios by family are 0.03 to 0.10, annualised Sortino ratios 1.66 to 3.11, and Calmar ratios 1.28 to 3.91. The best single rule earns 13.42% a year on CoinDesk and 10.88% on Bitstamp (both channel breakout), and 22.15% on Ethereum (filter). Average break-even costs for CoinDesk are 54.86, 66.41, 11.42, 44.60 and 61.00 basis points for moving average, filter, support-resistance, oscillator and channel breakout rules. For Bitstamp they are 50.40, 57.51, 11.89, 38.74 and 54.12 basis points. Across all series they range from 7.88 (Litecoin support-resistance) to 147.56 (Ethereum filter). The share of rules with break-even costs above 50 basis points is 30.18% to 36.06% for CoinDesk and 22.79% to 28.15% for Bitstamp, excluding support-resistance (0.00% and 0.95%). Share of rules significant at 5% after Bonferroni, Benjamini-Hochberg and no correction: CoinDesk 33.61%, 50.41% and 57.65%; Bitstamp 27.11%, 46.28% and 58.64%; Litecoin 23.26%, 31.84% and 53.23%; Ripple 20.35%, 27.96% and 27.96%; Ethereum 23.37%, 32.68% and 32.68%. Fewer than 1% of rules have a significant sell return on any series. Share of rules beating buy-and-hold: on return, 6.12% for CoinDesk and 4.96% for Bitstamp; on Sortino, 32.83% and 32.14%; on Calmar, 28.58% and 32.72%. Out-of-sample in the first half of 2018 (annualised return, Sharpe, Sortino): CoinDesk −0.0010, −0.0502, −0.3470; Bitstamp −0.0091, −0.0641, −0.0553; Litecoin 0.0775, 1.3553, 2.1900; Ripple 0.0546, 0.7380, 1.2162; Ethereum 0.0631, 1.1900, 1.8500.

By Robert Hudson, Andrew Urquhart.

`Read the paper <https://link.springer.com/article/10.1007/s10479-019-03357-1>`__
