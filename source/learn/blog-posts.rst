.. meta::
   :description: Blog posts and articles about algorithmic trading.

Blog posts about algorithmic trading
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section contains various blog posts and articles related to algorithmic trading, quantitative finance, and systematic strategies.

.. note::

    For academic research papers, see the :doc:`Papers section <./papers>`.
    For AI and machine learning topics, see the :doc:`AI section <./ai-and-machine-learning>`.

How to avoid overfitting trading strategies
-------------------------------------------

Running a lossy trading strategy would be a very costly mistake, so we spend a lot of effort on assessing the expected performance of our strategies. This task gets harder when we have limited data for this evaluation or when we experiment with the strategy for a longer time and risk manually overfitting the strategy on the same out-of-sample data.

`Read the Quantlane blog post <https://quantlane.com/blog/avoid-overfitting-trading-strategies/>`__.

A Trend Following Framework for Gold, Bitcoin, and Nasdaq
---------------------------------------------------------

A practical framework for systematic trend following across Gold, Nasdaq, and Bitcoin futures. The approach combines a Donchian Channel for trend detection with a Chandelier Stop for risk management. Key components include: volatility-targeted position sizing (risking 2% of equity per trade with stops at 3x ATR), a two-stage exit mechanism using both protective trailing stops and technical exits based on lowest low breakdowns.

The system targets "fat tails" while keeping maximum drawdown to -15%. With a 47% win rate but favorable risk/reward (average win 4.30% vs average loss 2.06%), the framework emphasizes that systematic execution beats emotional guessing. Assets are chosen for their high volatility, strong trends, and low correlation.

By Petr Podhajsky. Tools used: RealTest & Norgate Data.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_terrified-of-buying-the-top-in-gold-bitcoin-ugcPost-7424474305478000640-bV86/>`__

Why Mean-Variance Optimization Breaks Down
------------------------------------------

Mean-Variance Optimization (MVO) is a central framework for portfolio construction, yet practitioners quickly encounter a paradox: the mathematically "optimal" portfolio built from estimated inputs is often unstable, highly leveraged, and disappoints out-of-sample. This is not a minor implementation detail—it is a structural consequence of combining a high-dimensional optimizer with noisy estimates of expected returns and covariances.

This article develops MVO from first principles and explains, in a mathematically explicit way, why raw MVO tends to maximize estimation error. It surveys the spectrum of practical fixes organized around two levers: improving or regularizing the inputs (expected returns and covariances), and constraining or regularizing the optimizer (the feasible set and objective). The unifying theme is that almost every successful fix works by injecting bias in exchange for a large reduction in variance of the resulting portfolio weights.

By VertoxQuant.

`Read the post <https://www.vertoxquant.com/p/why-mean-variance-optimization-breaks>`__

Short Scamtrash / Long Distinguished Crypto
-------------------------------------------

A practical investigation into the "quality factor" for cryptocurrency perpetuals trading. The core strategy is simple: short scammy, low-quality crypto perps while going long large-cap crypto against it. This works better in crypto than traditional equities because markets are less efficient and there are abundant opportunities to identify low-quality assets.

The post demonstrates how to build a simple "trashmetric" derived from trading volume to sort perpetuals into buckets by quality. Backtests show that trashier assets have worse average returns while more distinguished assets perform better. The strategy trades once a week, going long the least trashy third of the universe and short the most trashy third, with volatility-targeted position sizing. The author discusses ways to improve the strategy by adding more proxies for trashiness (instability, size, liquidity) and being smarter about portfolio turnover and trading costs.

By Robot James.

`Read the post <https://robotjames.substack.com/p/short-scamtrash-long-distinguished>`__

Simple Crypto Momentum Strategy: Buying Corrections
---------------------------------------------------

A straightforward crypto trading approach shared by Pavel demonstrating that simple strategies can work effectively in cryptocurrency markets. The strategy involves: buying corrections on the highest momentum coins, holding positions for one day, and applying a basic regime filter to avoid unfavorable market conditions.

The equity curve shown suggests consistent performance with this systematic approach. The strategy exemplifies how basic momentum and mean-reversion concepts can be combined—buying dips in strong trending assets while using regime filtering to stay out during adverse market conditions.

By Pavel (Robuxio).

`See the original discussion <https://x.com/PKycek/status/1966803799278055516>`__

Forecasting Market Regimes with the sUSDe Term Structure
--------------------------------------------------------

An exploration of how the sUSDe term structure on Pendle can serve as a forward-looking signal for crypto market sentiment and regime forecasting. The article explains how crypto prices are heavily influenced by leveraged trading in perpetual futures, and how Ethena's sUSDe effectively captures the basis from funding rates through delta-neutral strategies.

With multiple sUSDe expirations trading on Pendle, the market reveals implied yields across various maturities, producing an onchain term structure. This yield curve indicates whether markets expect rising funding rates (contango) or declining rates (backwardation). The article demonstrates that the term spread—the difference between back month and front month implied yields—is highly correlated with underlying yield regimes and produces a stronger signal for returns than the underlying yield alone. Historical analysis supports using this term structure as a leading indicator for changes in cost of carry and BTC price levels.

By Luke Leasure.

`Read the article <https://x.com/0xMether/article/2016201886395990198>`__

Using Log Returns and Volatility to Normalize Strike Distances
--------------------------------------------------------------

A foundational tutorial on why log returns matter in financial and derivatives modeling. The article starts from first principles, explaining how the constant e represents continuous compounding and how the natural logarithm measures the time needed to reach a certain level of growth. This mathematical foundation is then applied to understanding why upside and downside price moves are not symmetric in compounded return space.

The practical application focuses on normalizing option strike distances. For a $100 stock, $150 and $50 are not equidistant in the world of compounding—$150 is closer. The article shows how to compute equivalent distances using log returns and extends this to normalizing for volatility, allowing traders to compare strikes across different assets with different volatility profiles. This framework is essential for proper options analysis and understanding moneyness in a mathematically consistent way.

By Kris Abdelmessih.

`Read the article <https://x.com/KrisAbdelmessih/article/2018698687665312013>`__

Fixing Position Sizing by Accounting for Inter-Asset Correlations
-----------------------------------------------------------------

A practical account of discovering and fixing a crude volatility targeting formula that was causing the portfolio to miss its risk targets. The author found that a simplistic position sizing approach was capping the portfolio too aggressively, resulting in realized volatility at roughly half of the intended target.

The article walks through the correlation fix that resolved the discrepancy, explaining how accounting for inter-asset correlations in the volatility targeting formula allowed the portfolio to properly hit its intended risk profile. The historical equity curve improvement after the fix is demonstrated with real portfolio data.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/i-wasted-months-sizing-positions>`__.

Debugging a Volatility Target Miss: Realizing 20% When Targeting 40%
--------------------------------------------------------------------

A deep dive into debugging why a systematic crypto trading model was realizing only 20% annualized volatility despite targeting 40%. The author walks through multiple hypotheses tested and rejected, illustrating the diagnostic process of understanding what a trading system is actually doing on the backend versus what it is supposed to do.

The article covers the allocation formula fix that ultimately solved the problem, showing the before-and-after equity curves. It emphasizes that understanding the gap between targeted and realized volatility is critical for systematic traders, as it directly impacts absolute returns even when risk-adjusted metrics like Sharpe ratio look acceptable.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/targeting-40-vol-and-only-getting>`__.

How Binary Signals Create Inefficient Capital Allocation in Multi-Asset Frameworks
----------------------------------------------------------------------------------

An exploration of a bug encountered while building scalable trading infrastructure designed to handle multiple asset classes, exchanges, and strategy types from a centralized codebase. When testing a binary signal implementation, the system was producing a very low gross exposure profile with a mean of just 10.9% and a median of 5%.

The article explains how binary signals (on/off) can create inefficient capital allocation when combined with position sizing rules in a multi-asset framework. The author demonstrates how to rethink signal handling to improve exposure efficiency while maintaining the scalability benefits of a centralized trading system architecture.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/binary-signal-efficiency-when-scalable>`__.

Saving $200/Day in Execution Costs by Solving Market Capacity Constraints
-------------------------------------------------------------------------

A practical case study in dealing with market capacity constraints when scaling a trading strategy to larger capital allocations. The author describes hitting execution cost walls when increasing allocation to a strategy on a relatively new market, demonstrating the gap between theoretical backtesting and real-world execution.

The article covers the execution improvements built to reduce trading costs, showing savings of $200-400 per day on a single strategy. It reinforces that backtests are merely sanity tests and that managing execution costs is one of the most impactful optimizations a systematic trader can make, especially when scaling into new strategies and markets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/when-scaling-bites-back-a-200day>`__.

Testing the Low-of-Day Stop Loss Rule in Crypto Trend-Following
---------------------------------------------------------------

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

A Delta-Neutral Cross-Sectional Momentum Strategy in Crypto
-----------------------------------------------------------

Research Article #73 from Trading Research Hub. Explores a delta-neutral cross-sectional momentum strategy applied to cryptocurrency markets. Cross-sectional momentum ranks assets against each other based on their relative performance, going long the strongest performers and short the weakest to create a market-neutral portfolio.

The strategy aims to capture the momentum premium in crypto while eliminating directional market exposure. By maintaining delta neutrality, the approach seeks to profit from the spread between winners and losers regardless of overall market direction, making it particularly relevant for volatile crypto markets where directional risk can overwhelm individual alpha signals.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/a-delta-neutral-cross-sectional-momentum>`__.

Why Trading is the Wrong Term for Systematic Portfolio Management
-----------------------------------------------------------------

Research Article #72 from Trading Research Hub. Reframes how systematic traders should think about their activity. The piece argues that the common understanding of "trading" as buying and selling misses the deeper reality of what profitable systematic trading actually involves as a business and research endeavor.

The article explores the systematic trading process from a business perspective, examining how the research, development, and risk management aspects of running trading systems are fundamentally different from the popular conception of trading. This reframing has practical implications for how traders allocate their time and build their operations.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/trading-is-the-wrong-term-for-what>`__.

Implementing Dynamic Stop Losses in a Multi-Signal Trading Strategy
-------------------------------------------------------------------

Research Article #71 from Trading Research Hub. Examines how dynamic stop loss mechanisms can be implemented within a multi-signal trading strategy framework. Rather than using fixed stop loss levels, the approach adjusts stops based on changing market conditions and the interaction between multiple trading signals.

The article tests various dynamic stop loss implementations and their impact on strategy performance, analyzing the trade-off between protecting capital and avoiding premature exits. The multi-signal context adds complexity since different signals may have different optimal stop loss characteristics, requiring a unified framework that balances these competing demands.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/dynamic-stop-losses-in-a-multi-signal>`__.

Applying Traditional Managed Futures Trend-Following to Crypto Markets
----------------------------------------------------------------------

Research Article #70 from Trading Research Hub. Applies traditional trend-following methodologies, originally developed for commodities and futures markets, to cryptocurrency markets. The study examines whether the core principles that have driven managed futures returns for decades translate effectively to the unique characteristics of crypto assets.

The article tests established trend-following rules on crypto market data, evaluating their performance against benchmarks. It explores how the high volatility, 24/7 trading, and unique market microstructure of crypto markets affect the behavior of classic trend signals, providing insights for traders looking to adapt proven systematic approaches to digital assets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/traditional-trend-following-in-crypto>`__.

Strategic Drag: Accepting Lower Returns for Better Risk-Adjusted Performance
----------------------------------------------------------------------------

Research Article #69 from Trading Research Hub. Explores the concept of "strategic drag" in systematic trading, which refers to the intentional acceptance of reduced raw returns in exchange for improved risk-adjusted performance. The article examines how deliberate constraints on a trading strategy can paradoxically improve its overall utility.

The concept is particularly relevant in crypto trading where unconstrained strategies may produce impressive headline returns but with unacceptable drawdowns. The article demonstrates through backtesting how applying the right amount of drag through position limits, volatility targeting, or other risk controls can create a more robust and sustainable trading system.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-art-of-strategic-drag-research>`__.

The EWMAC Crypto Strategy: Continuous Trend Signals for Better Position Sizing
------------------------------------------------------------------------------

Research Article #68 from Trading Research Hub. Implements the Exponentially Weighted Moving Average Crossover (EWMAC) strategy in cryptocurrency markets. EWMAC is a well-established trend-following signal used by systematic macro funds, which measures the difference between fast and slow exponential moving averages to generate continuous position signals.

The article tests EWMAC across crypto assets, demonstrating how this simple yet effective signal captures trending behavior. The continuous nature of EWMAC signals, as opposed to binary on/off signals, allows for more nuanced position sizing that scales with trend strength, potentially improving risk-adjusted returns compared to simpler crossover implementations.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/simple-signals-superior-returns-the>`__.

Why Overbought RSI Readings Signal Continued Momentum in Crypto
---------------------------------------------------------------

Research Article #67 from Trading Research Hub. Challenges the conventional interpretation of the Relative Strength Index (RSI) by testing a contrarian approach where traditional "overbought" readings are used as buy signals rather than sell signals. The study examines whether high RSI values in trending crypto markets actually predict continued momentum rather than reversals.

The backtesting results demonstrate that in strongly trending crypto markets, high RSI readings often signal persistent momentum rather than imminent reversals. This counter-intuitive finding aligns with the broader momentum literature showing that strong assets tend to continue strengthening, challenging the typical retail trader assumption that overbought conditions automatically warrant selling.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/flipping-the-rsi-script-when-overbought>`__.

SMA Crossovers in Crypto: Why Simpler Trend Signals Outperform Complex Models
-----------------------------------------------------------------------------

Research Article #66 from Trading Research Hub. Demonstrates the effectiveness of simple moving average (SMA) crossover strategies in cryptocurrency markets. The study makes the case that simplicity in signal design often leads to more robust out-of-sample performance than complex multi-parameter models.

The article tests various SMA crossover configurations on crypto market data, evaluating performance across different lookback periods and market conditions. The results reinforce the principle that simple, well-understood trading rules with few parameters are less likely to be overfit and more likely to maintain their edge in live trading.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-edge-of-simplicity-trend-following>`__.

A Framework for Deliberate Position Sizing and Exposure Control
---------------------------------------------------------------

Research Article #65 from Trading Research Hub. Presents a systematic framework for position sizing that emphasizes controlling portfolio exposures deliberately rather than letting them be determined by market conditions. The core principle is that a trader's exposures should be dictated by their risk management rules, not by market movements.

The article outlines a practical step-by-step approach to sizing positions across different strategy types, ensuring that the overall portfolio risk remains within intended bounds. This framework is particularly important for crypto portfolios where uncontrolled position sizes can quickly lead to outsized drawdowns during volatile market conditions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-4-step-framework-to-size-almost>`__.

Parameter Diversification: Running Multiple Variations to Reduce Overfitting
----------------------------------------------------------------------------

Research Article #64 from Trading Research Hub. Makes the case for parameter diversification as a key technique for building robust trading strategies. Rather than optimizing for a single set of parameters, the approach involves running multiple parameter variations simultaneously and averaging their signals or allocations.

The article demonstrates how parameter diversification reduces the risk of overfitting and creates more stable performance across different market regimes. By blending signals from multiple parameter sets, the strategy becomes less sensitive to any single configuration being optimal, resulting in smoother equity curves and more reliable out-of-sample performance.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/parameter-diversification-the-key>`__.

Harvesting Funding Rates with a Delta-Neutral Crypto Strategy
-------------------------------------------------------------

Research Article #63 from Trading Research Hub. Details a market-neutral strategy that harvests funding rates from cryptocurrency perpetual futures. The author reports making 5% return on capital in 18 days (approximately 169% annualized) using a completely delta-neutral approach that generated positive returns every day.

The strategy involves taking offsetting long and short positions to eliminate directional exposure while capturing the funding rate differential between perpetual futures and spot markets. The article outlines the mechanics of the trade, including margin requirements management, and demonstrates how this systematic approach can generate consistent returns independent of market direction.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/market-neutral-funding-harvesting>`__.

Combining Trend Signals with Volatility Targeting for 1,127% Return at 67% Less Risk
------------------------------------------------------------------------------------

Research Article #62 from Trading Research Hub. Demonstrates a systematic trading approach that achieved 1,127% total return while reducing portfolio volatility by 67% compared to the underlying market. The article emphasizes the principle that exposures should be dictated by the trader's risk framework, not by market conditions.

The strategy combines trend-following signals with strict volatility targeting to capture crypto upside while dramatically limiting drawdowns. The article walks through the portfolio construction and risk management methodology that enables such asymmetric risk-return outcomes, showing how systematic risk controls can transform raw crypto exposure into a more investable return stream.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/1127-return-with-67-less-volatility>`__.

Systematic Momentum in Crypto: 249% Returns with 82% Less Volatility
--------------------------------------------------------------------

Research Article #61 from Trading Research Hub. Presents a systematic momentum strategy that delivered 249% returns with 82% less volatility than the broader crypto market. The article addresses the core challenge of crypto investing: extreme drawdowns exceeding 90% and volatility above 80% that make buy-and-hold approaches impractical for most investors.

The strategy uses a systematic momentum approach with volatility targeting to deliver steady growth while avoiding the worst of crypto's drawdown episodes. The article demonstrates how disciplined risk management can capture a significant portion of crypto's upside while making the return stream suitable for investors who cannot tolerate the asset class's native risk profile.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/249-returns-with-82-less-volatility>`__.

A Counter-Intuitive RSI Strategy Delivering 602% Returns at Half the Drawdown
-----------------------------------------------------------------------------

Research Article #60 from Trading Research Hub. Presents a systematic RSI-based trading strategy that achieved 602.91% total return while limiting maximum drawdown to -33.22% compared to the market's -92.58%. The strategy delivered a Sharpe Ratio of 0.9925, significantly outperforming benchmark risk-adjusted metrics.

The approach transforms traditional RSI interpretations by using a methodical, counter-intuitive framework that turns market volatility from a threat into an opportunity. Rather than relying on complex algorithms or high-frequency trading, the strategy demonstrates how systematic application of a well-tested RSI variant can capture meaningful crypto upside while maintaining remarkably lower risk metrics.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-contrarian-rsi-strategy-602-returns>`__.

EMA Rate-of-Change as a Trend Signal: 3,906% Returns with Controlled Drawdowns
------------------------------------------------------------------------------

Research Article #59 from Trading Research Hub. Presents a data-driven trend-following strategy using EMA derivatives that generated 3,906% total return with a maximum drawdown of just -27.25%, compared to the market's -92.58% drawdown. The strategy achieved an annualized return of 56.96% with a Sharpe Ratio of 1.5002.

The EMA-derivative approach captures crypto trends through the rate of change of exponential moving averages rather than simple crossovers, providing earlier trend detection while filtering out noise. The article demonstrates through rigorous backtesting that consistent profitability in cryptocurrency markets is achievable through disciplined systematic trading that manages volatility as a core feature.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/how-an-ema-derivative-strategy-delivered>`__.

The Volatility Paradox: How Lower Risk Produces Superior Returns in Crypto
--------------------------------------------------------------------------

Research Article #58 from Trading Research Hub. Examines the counterintuitive relationship between risk and return in cryptocurrency markets. The study explores how systematic approaches that target lower volatility can actually achieve superior risk-adjusted returns, challenging the traditional finance assumption that higher risk always correlates with higher returns.

The article presents a systematic trading framework that demonstrates how strategic risk management generates substantial risk-adjusted returns in crypto. By deliberately targeting lower portfolio volatility through position sizing and signal filtering, the strategy achieves better overall outcomes than unconstrained approaches, illustrating the volatility paradox in practice.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-volatility-paradox-cryptocurrency>`__.

Applying Faber's Relative Strength Framework to Cryptocurrency Markets
----------------------------------------------------------------------

Research Article #57 from Trading Research Hub. Applies the relative strength investing framework from Mebane Faber's 2010 paper "Relative Strength Strategies for Investing" to cryptocurrency markets. The study tests whether the momentum-based ranking and allocation rules that have worked in traditional markets translate to the unique dynamics of crypto assets.

The article implements the paper's methodology on crypto market data, comparing performance against benchmarks and analyzing how the extreme volatility and trending nature of crypto markets affect the relative strength signal. This cross-application of a proven equity market strategy to crypto provides practical insights for systematic traders seeking to adapt established quantitative approaches to digital assets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/relative-strength-in-cryptocurrencies>`__.

2024 Performance Review of a Live Systematic Crypto Trend-Following Portfolio
-----------------------------------------------------------------------------

Research Article #56 from Trading Research Hub. An honest performance review of a systematic crypto trend-following portfolio through 2024, analyzing the real-world results of deploying quantitative strategies with actual capital. The article examines both the successes and challenges encountered during a year that included various market regimes.

The review provides transparency into the performance characteristics of systematic trend following in crypto, including drawdown periods, recovery behavior, and the psychological challenges of managing a live portfolio. It serves as a practical reference for how theoretical strategy research translates into real-world trading outcomes across different market conditions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/heres-my-2024-trading-performance>`__.

Using Volume and Market Cap Rankings to Improve Crypto Trend Signal Selection
-----------------------------------------------------------------------------

Research Article #55 from Trading Research Hub. Examines how market capitalization and dollar volume can be used as ranking features to improve crypto trend-following strategies. The study tests whether filtering or weighting trading signals based on these fundamental metrics leads to better execution efficiency and returns.

The article addresses the practical challenge of automated trading requiring efficient capital allocation across a universe of crypto assets. By incorporating volume and market cap rankings into the signal generation process, the strategy aims to improve execution quality and avoid capacity-constrained markets where slippage would erode returns.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/crypto-trend-through-the-lens-of>`__.

Building Systematic Trading Infrastructure: From Backtests to Live Deployment
-----------------------------------------------------------------------------

Research Article #54 from Trading Research Hub. Bridges the gap between theoretical trading strategy research and practical live deployment. The author discusses the transition from generating equity curves in backtests to actually deploying capital on live strategies, addressing the infrastructure requirements for systematic trading.

The article covers the key components needed for a production trading system, including data pipelines, signal generation, execution management, and monitoring. It emphasizes that the real challenge of systematic trading is not developing strategies but building the reliable infrastructure needed to run them continuously in live markets with real capital at risk.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/building-systematic-trading-infrastructure>`__.

Diagnosing and Fixing an Underperforming Trend Model
----------------------------------------------------

Research Article #53 from Trading Research Hub. Documents the process of diagnosing and fixing an underperforming trend model that was generating less return than a simple buy-and-hold benchmark. The author walks through the investigative process of understanding why a systematically developed model was failing to capture available market returns.

The article provides a practical framework for debugging live trading strategies, including how to identify whether underperformance stems from signal quality, position sizing, execution costs, or portfolio construction issues. The diagnostic approach and eventual fix demonstrate the iterative nature of real-world systematic trading development.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/why-was-my-trend-model-underperforming>`__.

Optimal Bet Sizing: From the Kelly Criterion to Trading Position Management
---------------------------------------------------------------------------

Research Article #52 from Trading Research Hub. Explores optimal position sizing through the lens of probability and bankroll management. Using the classic example of a biased coin flip game (60% probability of winning with 2:1 payoff), the article demonstrates why optimal bet sizing is crucial for long-term wealth growth.

The article connects concepts from gambling theory, including Kelly Criterion principles, to practical trading position sizing. It demonstrates through simulation how over-betting can lead to ruin despite having a positive expected value, and how fractional approaches to optimal sizing can balance growth rate with drawdown risk in systematic trading portfolios.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-optimal-betting-method-for-responsible>`__.

Backtests Are Sanity Checks, Not Predictions: Rethinking Historical Testing
---------------------------------------------------------------------------

Research Article #51 from Trading Research Hub. Addresses the most commonly asked question in systematic trading: "How do I know my backtest will work?" The article explains why backtesting doesn't serve the purpose most traders believe it does, reframing how systematic traders should think about historical testing.

The article argues that backtests are not predictions of future performance but rather sanity checks that help identify obviously flawed strategies. It presents a more realistic framework for using backtests as part of a broader strategy validation process, helping traders avoid the trap of optimizing for historical performance at the expense of real-world robustness.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-truth-about-backtesting-to-find>`__.

A Single Robust Validation Method Worth More Than 100 Backtests
---------------------------------------------------------------

Research Article #50 from Trading Research Hub, the 50th edition in the series. Explores a methodology for building trading strategies with higher confidence in their forward performance. The article argues that a single robust validation method is more valuable than running hundreds of backtests with different parameters.

The article presents a practical framework for strategy development that goes beyond simple backtesting, incorporating techniques for assessing whether a strategy's edge is likely to persist in live markets. It addresses the fundamental challenge of distinguishing real trading signals from noise in historical data, offering a systematic approach to strategy confidence assessment.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/this-1-method-is-worth-more-than>`__.

Finding the Most Effective Single-Rule Trend Signal for Crypto
--------------------------------------------------------------

Research Article #49 from Trading Research Hub. Explores single-rule trend-following systems to identify the most effective trend signal for cryptocurrency trading. The author, who has spent hundreds of hours backtesting and optimizing strategies, focuses on finding signals that maintain their edge beyond the backtest.

The article tests various trend indicators in isolation to understand their individual performance characteristics before combining them into more complex systems. This reductionist approach helps identify which core signals genuinely capture trending behavior in crypto markets versus those that merely appear profitable due to overfitting.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-best-crypto-trend-signal-research>`__.

The Hidden Costs and Return Erosion of Stop Losses in Systematic Trading
------------------------------------------------------------------------

Research Article #48 from Trading Research Hub. A deep dive into the hidden costs and effects of using stop losses in systematic trading strategies. The study examines how different stop loss implementations affect overall strategy performance, using historical market events including Black Monday as context for understanding tail risk management.

The article challenges common assumptions about stop losses by quantifying their impact on both risk reduction and return erosion. Through systematic backtesting, it demonstrates the trade-offs involved in using stops, helping traders make more informed decisions about whether and how to implement stop loss rules in their crypto trading systems.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/exploring-the-effect-of-stop-losses>`__.

Using Lower-Timeframe Exits to Improve Trend-Following Risk Management
----------------------------------------------------------------------

Research Article #47 from Trading Research Hub. Examines how incorporating multiple timeframes into trend-following rules affects strategy performance. Specifically, it tests whether exiting positions based on a lower timeframe signal while maintaining higher timeframe entries improves overall results.

The article uses the analogy of a farmer studying long-term weather patterns before making planting decisions to explain the logic of multi-timeframe analysis. The backtesting results show how combining higher timeframe trend detection with lower timeframe exit signals can improve trade timing and risk management in crypto trend-following strategies.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-47-multi-timeframe>`__.

Testing the January Barometer as a Regime Filter for Crypto Trend Models
------------------------------------------------------------------------

Research Article #46 from Trading Research Hub. Tests the January Barometer effect in cryptocurrency markets. Originally introduced by Yale Hirsch in 1972 for equities, the January Barometer suggests that January's market performance predicts the trend for the rest of the year.

The article applies this calendar anomaly to crypto, testing whether January's performance in Bitcoin and other cryptocurrencies has predictive power for the remaining eleven months. It also examines whether the effect can be incorporated as a regime filter into a systematic trend-following model, assessing its practical impact on strategy performance.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-46-is-the-january>`__.

Turn-of-the-Month Seasonality Effect in Cryptocurrency Returns
--------------------------------------------------------------

Research Article #45 from Trading Research Hub. An in-depth exploration of the turn-of-the-month seasonality effect in cryptocurrency returns. Drawing inspiration from well-documented calendar anomalies in traditional equity markets, the study tests whether similar patterns exist in crypto.

The article examines historical crypto price data to determine if returns cluster around specific calendar dates, and whether this effect is statistically significant enough to be exploited by a systematic trading strategy. The practical implications for timing entries and exits based on calendar effects are tested against benchmark buy-and-hold performance.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-45-the-seasonality>`__.

My 7-Step Framework For Accurate Backtesting
--------------------------------------------

A practical guide presenting a seven-step framework for ensuring backtesting accuracy in systematic trading strategy development. The article addresses the gap between traders who discuss backtesting problems and those who actually work to ensure their backtests are as accurate as possible for live deployment.

The framework covers the key pitfalls that lead to misleading backtests, including look-ahead bias, survivorship bias, and improper cost modeling. Each step provides actionable guidance for systematic traders to improve the reliability of their historical testing, ultimately increasing confidence that strategies will perform as expected when deployed with real capital.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/my-7-step-framework-for-accurate>`__.

Backtesting Kullamagi's Episodic Pivot Setup in Crypto Markets
--------------------------------------------------------------

Research Article #44 from Trading Research Hub. A deep-dive backtesting Kristjan Kullamagi's Episodic Pivot (EP) trading setup, a strategy the famous swing trader claims made him millions in profits. The setup was originally discovered by Pradeep Bonde (Stockbee) and involves identifying stocks that gap up significantly on catalytic events.

The article systematically defines the EP setup rules, applies them to crypto market data, and evaluates the strategy's performance through rigorous backtesting. This approach of taking a successful discretionary trader's methodology and translating it into systematic rules demonstrates how qualitative trading insights can be quantified and validated.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-44-kristjan-kullamagis>`__.

Understanding Covariance Matrices for Systematic Portfolio Allocation
---------------------------------------------------------------------

An educational article explaining the covariance matrix and its role in systematic portfolio allocation. The article breaks down this key quantitative concept in accessible terms, explaining why understanding asset correlations is essential for managing portfolio risk.

The article demonstrates how high correlations between portfolio holdings increase the risk that the entire portfolio moves adversely during market stress. It covers how to construct and interpret a covariance matrix, and how this information can be used to build more diversified portfolios where risk is properly distributed across assets and strategies.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/what-is-a-covariance-matrix-for-optimal>`__.

Building a Multi-Asset Trading Model from Scratch
-------------------------------------------------

Part of a series on building a multi-strategy portfolio from scratch, this article covers the practical challenges of managing a multi-asset trading model. The author documents the process of developing and deploying an automated strategy portfolio, aiming to have it operational before the year's final quarter.

The article builds on previous work establishing a backtesting dashboard, extending the infrastructure to handle multiple assets simultaneously. It addresses real-world implementation challenges including data management, signal aggregation across assets, and the operational complexity that grows as more instruments are added to a systematic trading portfolio.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/handling-a-multi-asset-model>`__.

The Low-Volatility Anomaly Applied to Cryptocurrency Markets
------------------------------------------------------------

Research Article #43 from Trading Research Hub. Examines the low volatility anomaly applied to cryptocurrency markets. The well-documented volatility effect in equities suggests that lower-risk assets tend to outperform higher-risk counterparts on a risk-adjusted basis, defying the Capital Asset Pricing Model's prediction that higher risk should correlate with higher returns.

The article tests whether this anomaly persists in crypto markets, developing a strategy that targets lower-volatility assets with the aim of achieving competitive returns with significantly less risk. The study explores why the volatility effect exists and its implications for crypto portfolio construction and asset selection.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-43-the-volatility>`__.

Buying Crypto All-Time Highs: A Simple Strategy Beating Bitcoin 2x
------------------------------------------------------------------

Research Article #42 from Trading Research Hub. Tests a simple momentum strategy based on buying cryptocurrencies at their all-time highs, delivering more than 2x the annualized returns of Bitcoin. The author shares how this counter-intuitive finding emerged from moving away from overly complex models toward simpler, more robust approaches.

The article demonstrates through backtesting that buying assets making new highs, rather than waiting for pullbacks, captures strong trending behavior in crypto markets. The simplicity of the rule makes it less susceptible to overfitting, and the results challenge the common retail trader instinct to avoid buying assets at their most expensive levels.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-42-buying-cryptocurrency>`__.

Transitioning from Discretionary to Systematic Crypto Trading
-------------------------------------------------------------

An article presenting a systematic approach to trading for traders struggling with consistent losses. Drawing from the author's personal experience of nearly two years of consistent monthly losses before turning things around, the article outlines the framework that made the difference.

The article covers the transition from discretionary to systematic trading, emphasizing the importance of having a defined process, proper risk management, and realistic expectations. It provides a practical roadmap for traders looking to adopt a more disciplined, rules-based approach to cryptocurrency trading.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/stop-losing-money-trading-today-a>`__.

Building a Backtesting Dashboard for Multi-Strategy Portfolios
--------------------------------------------------------------

Part of a series on building a multi-strategy portfolio from scratch, this article covers the development of a backtesting dashboard interface. The author, who had no coding background, demonstrates that building automated strategy infrastructure is achievable with persistence and systematic effort.

The article walks through the practical implementation of a backtesting tab within a trading dashboard, covering how to visualize strategy performance, compare results across different configurations, and create the research tools needed for ongoing strategy development. It serves as a hands-on guide for traders building their own backtesting infrastructure.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/building-a-backtesting-tab>`__.

Does Adding a Short Book Improve Crypto Trend Following Returns?
----------------------------------------------------------------

Research Article #41 from Trading Research Hub. Examines the performance impact of adding short positions to a simple trend-following strategy in crypto markets. The study aims to determine whether the short side adds enough value to justify the additional exposure cost and complexity.

The article implements a long/short model with volatility targeting and tests whether the short book improves risk-adjusted returns compared to a long-only approach. The results provide data-driven guidance on whether crypto trend followers should invest the effort to incorporate short selling, considering the specific dynamics of perpetual futures markets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-41-longshort-crypto>`__.

Designing a Crypto Price Data Dashboard from Scratch
----------------------------------------------------

The first article in a series on building a multi-strategy portfolio from scratch, covering the design and implementation of a crypto price data dashboard. The author documents the process of building automated trading infrastructure from the ground up, starting with the most fundamental component: reliable price data.

The article covers practical aspects of connecting to exchange APIs, storing historical price data, and creating visual representations of market data. It serves as a starting point for traders who want to build their own automated systems, demonstrating that the process begins with proper data infrastructure before moving to signal generation and execution.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/designing-a-simple-crypto-price-data>`__.

Testing Larry Williams' Volatility Expansion Strategy in Crypto
---------------------------------------------------------------

Research Article #40 from Trading Research Hub. Tests and improves upon Larry Williams' Volatility Expansion Strategy, a momentum-based approach that enters positions when price volatility expands beyond recent ranges. The study applies this classic trading methodology to cryptocurrency markets with systematic modifications.

The article goes beyond simple implementation to test various improvements to the original strategy, including different parameter settings and additional filters. The in-depth analysis demonstrates how a strategy concept from traditional markets can be adapted and enhanced for the unique characteristics of crypto trading.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-40-larry-williams>`__.

Volatility Targeting: Transforming a -70% Drawdown Strategy into 1,328% Returns
-------------------------------------------------------------------------------

Research Article #39 from Trading Research Hub. A follow-up addressing the -70% drawdown from the previous moving average crossover study by applying volatility targeting techniques. The article provides a practical, detailed walkthrough of how to reduce strategy volatility while maintaining robustness and improving risk-adjusted returns.

The article demonstrates different volatility target levels and their effect on the strategy's equity curve, showing how a moderate risk target can transform a strategy with unacceptable drawdowns into one with more manageable risk characteristics while still capturing 1,328% total returns. The techniques presented are broadly applicable to any systematic trading strategy.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-39-achieving-1328>`__.

Building a Crypto Trade Execution Model in Python
-------------------------------------------------

A practical article covering the construction of a trade execution model in Python for cryptocurrency trading. The article moves beyond theoretical strategy development to address the real-world challenge of converting signals into actual market orders.

The article covers common execution challenges including handling API connections, managing order states, dealing with partial fills, and general tips for making execution code as robust as possible. It provides a practical foundation for traders looking to automate their strategy execution, bridging the gap between backtested strategies and live trading systems.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/building-a-simple-crypto-trade-execution>`__.

Testing Moving Average Crossovers on a Multi-Asset Crypto Portfolio
-------------------------------------------------------------------

Research Article #38 from Trading Research Hub. Tests a simple moving average crossover strategy on a multi-asset crypto portfolio. The author, who deliberately avoids holding strong opinions about any particular approach, tests this fundamental trend-following signal across multiple cryptocurrencies.

The article provides a systematic evaluation of various crossover parameters, analyzing the strategy's performance characteristics including returns, drawdowns, and risk metrics. The honest analysis of both strengths and weaknesses, including significant drawdowns, sets up the follow-up article on volatility targeting improvements.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-38-crypto-moving>`__.

Robustness Testing Methods to Validate Trading Strategy Integrity
-----------------------------------------------------------------

Research Article #37 from Trading Research Hub. Addresses the fundamental question every systematic trader faces: will a developed trading system actually make money when deployed live? The article focuses on securing model integrity against bad assumptions through systematic robustness testing.

The article presents multiple methods for validating that a trading strategy's edge is real rather than an artifact of overfitting or data mining. It covers practical robustness testing techniques that can be applied to any systematic strategy, helping traders tilt the odds in their favor before committing real capital.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-37-robustness-validation>`__.

The Dangers of Parameter Fitting: Generating Profitable Signals on Random Data
------------------------------------------------------------------------------

Research Article #36 from Trading Research Hub. Demonstrates the dangers of parameter fitting by generating trading signals on completely random data. The study provides a practical examination of how easily standard technical analysis tools can appear profitable when applied to noise.

The article is important because financial data contains significant randomness, making it difficult to distinguish real signals from spurious patterns. By showing how standard optimization techniques can produce impressive-looking equity curves on data with no real signal, the article provides a compelling warning against overfitting and a framework for testing whether observed patterns are genuine.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-36-fitting-signals>`__.

Signal Validation Techniques Inspired by Robert Carver's Systematic Trading
---------------------------------------------------------------------------

Research Article #35 from Trading Research Hub. Focused on testing and verifying trading signals effectively, inspired by Robert Carver's book "Systematic Trading." The article addresses the common question of whether a given trading signal actually makes sense, using examples like RSI-based rules.

The article presents a framework for signal validation that goes beyond simple backtesting to assess whether a signal has genuine predictive power. Drawing from established systematic trading literature, it helps traders develop a more rigorous approach to evaluating trading rules before incorporating them into live strategies.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-35-building-robust>`__.

Bitcoin Beta De-noising: Isolating Altcoin-Specific Trading Signals
-------------------------------------------------------------------

Research Article #34 from Trading Research Hub. Presents a step-by-step guide to isolating asset-specific signals by removing Bitcoin's dominant influence from altcoin price movements. The technique of "beta de-noising" separates the idiosyncratic component of an altcoin's returns from its correlation with Bitcoin.

The article demonstrates how this de-noised signal can improve predictive accuracy for trading strategies on assets like Ethereum. By stripping away the market-wide factor (Bitcoin's influence), traders can identify cleaner asset-specific signals that may provide genuine alpha rather than simply proxying for Bitcoin momentum.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-34-trading-strategies>`__.

Adaptive Multi-Signal Position Sizing for Crypto Trading
--------------------------------------------------------

Research Article #33 from Trading Research Hub. Explores how to optimize trade allocation through multi-signal analysis in cryptocurrency markets. Instead of relying on a single trend-following or momentum indicator, the strategy aggregates multiple signals and scales portfolio exposure based on combined signal strength.

The article demonstrates how combining multiple indicators into a composite signal allows for more nuanced position sizing that reflects conviction levels. When more signals align, the position is larger; when signals conflict, exposure is reduced. This adaptive approach to allocation represents a more sophisticated alternative to binary long/short decisions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-33-adaptive-signal>`__.

Testing the Turtle Trading System in Cryptocurrency Markets
-----------------------------------------------------------

Research Article #32 from Trading Research Hub. Backtests Richard Dennis's famous Turtle Trading system rules in cryptocurrency markets. The Turtle Trading strategy, which produced legendary returns in commodity futures during the 1980s, is based on Donchian Channel breakouts with specific position sizing and pyramiding rules.

The article implements the original Turtle Trading rules on crypto market data, evaluating how this classical trend-following methodology performs in the high-volatility, high-trending crypto environment. While the strategy rules are straightforward, the article notes the operational complexity involved in properly implementing the full system including the pyramiding and exit rules.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-32-turtle-trading>`__.

Building and Using Crypto Momentum Scanners for Systematic Trading
------------------------------------------------------------------

Research Article #31 from Trading Research Hub. Explains the construction and use of crypto momentum scanners for systematic trading. The article answers the frequently asked question of how to build and use tools that systematically identify short-term momentum across a universe of cryptocurrency assets.

The article covers the practical application of momentum scanners for gauging market sentiment and informing position decisions. By monitoring which assets are trending strongly in the short term, traders can gain a better perspective on overall market conditions and adjust their positioning accordingly, supporting both automated and semi-automated trading approaches.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-31-crypto-momentum>`__.

Does Bitcoin's January Performance Predict the Rest of the Year?
----------------------------------------------------------------

Research Article #30 from Trading Research Hub. Applies the January Barometer concept to Bitcoin, testing whether January's performance can forecast the remaining eleven months of the year. The author notes that while the original test in equities used a 152-year backtesting period, the Bitcoin data history is more limited.

The article provides a quantitative analysis of Bitcoin's January performance relative to subsequent year returns, including the author's own backtesting results on the S&P 500 for comparison. The study evaluates whether this well-known calendar anomaly from traditional finance translates to cryptocurrency markets with enough statistical significance to be useful for systematic trading.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-30-bitcoin-january>`__.

Testing the Pre-Holiday Return Anomaly in Bitcoin
-------------------------------------------------

Research Article #29 from Trading Research Hub. Tests the pre-holiday effect anomaly in Bitcoin, an effect originally documented in U.S. equity and international stock markets. The strategy based on this anomaly shows historical unleveraged returns of 226% in the backtesting period.

The article examines whether returns in the days leading up to major holidays show a systematic positive bias in Bitcoin, and whether this pattern is exploitable as a trading strategy. The study bridges the extensive academic literature on calendar anomalies in traditional markets with practical application in the cryptocurrency space.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-29-bitcoin-pre-holiday>`__.

The Turn-of-the-Month Effect in Bitcoin Returns
-----------------------------------------------

Research Article #28 from Trading Research Hub. Tests the turn-of-the-month effect in Bitcoin, a well-known calendar anomaly in equities where returns tend to be higher around the end and beginning of each month. The study examines whether this pattern, potentially driven by institutional fund flows and salary-based investing, exists in crypto markets.

The article applies systematic testing methodology to determine if Bitcoin's return distribution shows a statistically significant pattern around month boundaries. If the effect exists, it could serve as a timing signal or regime filter for systematic crypto trading strategies.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-28-turn-of-the-month>`__.

Testing the Sell-in-May Seasonal Pattern in Bitcoin
---------------------------------------------------

Research Article #27 from Trading Research Hub. Tests the "Sell in May and Go Away" seasonal anomaly in Bitcoin. This well-known traditional finance pattern suggests that equity returns are significantly lower during the May-October period compared to November-April, and the article examines whether it holds in cryptocurrency markets.

The article provides a systematic backtesting of seasonal trading rules on Bitcoin data, evaluating whether adjusting exposure based on this calendar effect would improve risk-adjusted returns. The study adds to the body of research exploring which traditional market anomalies transfer to the structurally different cryptocurrency market.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-27-bitcoin-sell>`__.

Adjusting Bitcoin Strategy Exposure Based on Volatility Regimes
---------------------------------------------------------------

Research Article #26 from Trading Research Hub. Studies how volatility regimes affect trading strategy performance in Bitcoin. The study examines how adjusting portfolio exposure based on the current volatility environment can improve risk-adjusted returns.

The article tests systematic approaches to identifying and responding to different volatility regimes, from calm to highly volatile periods. By targeting specific volatility conditions or adjusting position sizes based on the prevailing regime, the strategy aims to reduce drawdowns during turbulent periods while maintaining exposure during favorable conditions for trend-following.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-26-bitcoin-volatility>`__.

The Low-Volatility Factor in Cryptocurrency Asset Selection
-----------------------------------------------------------

Research Article #25 from Trading Research Hub. Studies the low volatility factor in cryptocurrency markets. The study examines whether selecting lower-volatility cryptocurrencies produces better risk-adjusted returns than investing in higher-volatility alternatives, as documented in traditional equity markets.

The article provides a factor-based analysis of crypto assets sorted by volatility, testing whether the low volatility premium documented in academic finance literature extends to digital assets. The practical implications for portfolio construction and asset selection in crypto are explored through systematic backtesting.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-25-low-volatility>`__.

Key Lessons from The Robot James on Quantitative Trading
--------------------------------------------------------

Research Article #24 from Trading Research Hub. A comprehensive compilation and analysis of key lessons from The Robot James, one of the most respected figures in online quantitative trading. The author spent nearly six hours reviewing publicly available content to distill the most important insights from an experienced practitioner.

The central theme revolves around finding profitable opportunities in uncompetitive niches, summarized by the principle of "doing useful things that suck." The article covers practical wisdom on systematic trading strategy development, risk management, and the business aspects of running a quantitative trading operation, drawn from someone with extensive theoretical and practical experience.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-24-the-robot-james>`__.

Harvesting Risk Premia Through Dual Momentum: Reviewing Antonacci's Framework
-----------------------------------------------------------------------------

Research Article #23 from Trading Research Hub. An in-depth review of Gary Antonacci's 2012 paper on dual momentum, which combines relative momentum (comparing assets against each other) with absolute momentum (an asset's own past performance) to harvest risk premia across asset classes.

The article explains how momentum has been documented across equities, currencies, bonds, and other asset classes, while acknowledging that the reasons for its persistence remain debated between rational (risk premia) and behavioral (herding, anchoring) explanations. The dual momentum framework is analyzed for its applicability to cryptocurrency portfolio construction and systematic trading strategies.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-23-risk-premia-harvesting>`__.

A Short-Term Breakout Trading Strategy for Cryptocurrencies
-----------------------------------------------------------

Research Article #22 from Trading Research Hub. Presents a short-term breakout trading strategy for cryptocurrencies with total returns of $121,950 in backtesting. The strategy focuses on identifying and trading price breakouts from consolidation ranges on shorter timeframes.

The article provides a systematic implementation of breakout detection rules, including entry triggers, position sizing, and exit criteria. The results demonstrate how short-term momentum captured through breakout signals can generate significant returns in crypto markets, though with the important caveat that short-term strategies face higher execution cost challenges.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-21-short-term-breakout-crypto>`__.

Degrossing: Systematic Exposure Reduction to Tame Crypto Volatility
-------------------------------------------------------------------

Explores the concept of degrossing as a portfolio risk management technique for cryptocurrency trading. Degrossing involves systematically reducing gross portfolio exposure during periods of high volatility to protect capital, illustrated through the story of a trader named Alex navigating crypto's extreme volatility.

The article explains how to balance idiosyncratic asset selection with overall volatility control, demonstrating how automatically reducing position sizes during volatile periods can protect a portfolio from catastrophic drawdowns. The technique is particularly relevant for crypto portfolios where unchecked volatility can quickly overwhelm even well-researched individual position decisions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/crypto-portfolio-management-degrossing>`__.

Distinguishing Genuine Trading Signals from Random Noise
--------------------------------------------------------

An article focused on understanding how to distinguish genuinely insightful trading signals from random noise. The article covers data standardization for accurate signal analysis, the use of Average True Range (ATR) for measuring signal impact, and how random simulations can misleadingly appear as strong signals.

The article provides practical backtesting results comparing common trading triggers and evaluates their true signal strength. It emphasizes the critical importance of benchmarking any signal against random alternatives, connecting to Nassim Taleb's concept of being "Fooled by Randomness" in the context of systematic trading strategy development.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/exploring-signal-strength-in-trading>`__.

From Market Observation to Testable Hypothesis: Starting Steps of a Trading Model
---------------------------------------------------------------------------------

An educational article covering the foundational steps of building a trading model from an initial idea. The article emphasizes the importance of understanding why a strategy works before implementing it, warning against randomly combining indicators without a coherent thesis.

Using the analogy of an ice cream store misinterpreting seasonal patterns for product quality, the article illustrates how incorrect assumptions about market signals can lead to strategy failure. It provides a practical framework for translating a market observation into a testable trading hypothesis, representing the critical first step in systematic strategy development.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/starting-steps-of-building-a-trading>`__.

Setting Up Automated Email Alerts for Trading Scanners with SMTP
----------------------------------------------------------------

A technical guide on implementing automated email alerts from trading scanners using the Simple Mail Transfer Protocol (SMTP). The article covers the basics of SMTP as an email-sending protocol and its specific application in trading system infrastructure.

The guide provides practical implementation details for setting up real-time market alert systems that notify traders about significant events or conditions detected by their automated scanners. This infrastructure component is essential for systematic traders who need timely notifications without constantly monitoring screens, supporting both fully automated and semi-automated trading operations.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/smtp-for-trading-alerts-a-comprehensive>`__.

Evaluating RSI as a Momentum Signal for Bitcoin and Altcoins
------------------------------------------------------------

An article examining the validity and usefulness of the Relative Strength Index (RSI) as a momentum signal for Bitcoin and altcoin trading models. The article addresses common misconceptions about how RSI should be interpreted and used in systematic trading.

The article measures the actual signal content of RSI through systematic testing, evaluating its effectiveness as a momentum indicator rather than the traditional overbought/oversold interpretation favored by retail traders. By analyzing how RSI values correlate with subsequent returns across crypto assets, the study provides data-driven guidance on whether and how to incorporate RSI into a quantitative crypto trading model.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/measuring-rsi-as-a-momentum-signal>`__.

Pairs Trading and Statistical Arbitrage Across Top Cryptocurrencies
-------------------------------------------------------------------

A comprehensive article on implementing pairs trading and statistical arbitrage strategies across the top 23 cryptocurrencies by market capitalization. The article covers the full implementation including data normalization, the Sum of Squared Differences (SSD) metric for measuring price divergence, and the formation and trading period methodology.

The article addresses practical challenges including the computational complexity of 253 possible pair combinations, the importance of proper price normalization for fair comparison, and the trade-off between data granularity and trading costs. It provides a thorough foundation for understanding how market-neutral statistical arbitrage strategies can be applied to the cryptocurrency market.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/strategy-16-cryptocurrency-pairs>`__.

BTC-ETH Pairs Trading: Correlation Analysis and Statistical Arbitrage
---------------------------------------------------------------------

An article exploring statistical arbitrage opportunities between Bitcoin and Ethereum through correlation analysis and linear regression. The study uses Pearson correlation coefficients on 4-hour interval data to understand the dynamic relationship between the two largest cryptocurrencies.

The article demonstrates how the BTC-ETH correlation fluctuates with market conditions, creating trading opportunities when the pair deviates from its historical relationship. It covers the mechanics of pairs trading including correlation measurement, spread calculation, and the important caveat that past correlations may not persist, especially in rapidly evolving cryptocurrency markets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-the-waves-of-correlation>`__.

Backtesting a Community-Sourced Momentum Strategy
-------------------------------------------------

Strategy Backtest #14 from Trading Research Hub. Tests a momentum-based trading strategy through systematic backtesting. Part of an ongoing series designed to make strategy research accessible by collecting backtests of different approaches in one place, saving readers hours of independent research time.

The article tests specific strategy rules from the community, providing honest performance analysis including both the promising and concerning aspects of the results. It emphasizes the importance of working with practitioners who have proven live track records, and the distinction between historical backtest performance and actual trading outcomes.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/strategy-backtest-14>`__.

A Framework for Separating Market Signal from Noise in Trading
--------------------------------------------------------------

An article deconstructing the concepts of signal and noise in systematic trading. The article defines signal as a component or set of elements that consistently generates a positive skew toward an investment position, while noise represents random data occurrences that appear to trigger market movements but lack a concrete basis.

The article provides a framework for distinguishing between genuine market signals and noise, using practical examples to illustrate how rules that appear profitable may have no fundamental basis. It emphasizes benchmarking supposed signals against random alternatives to test whether observed patterns reflect genuine market dynamics or are merely artifacts of data mining.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/decoding-the-market-understanding>`__.

Data Mining for Trading Alphas: Navigating Overfitting Risks
------------------------------------------------------------

An article navigating the complexities of data mining in trading strategy design. The author examines the paradox of searching for alpha: while the common wisdom is to start from a hypothesis to avoid overfitting, the very process of examining historical data to find effective parameters involves a form of data mining.

The article explores whether data mining is an overlooked virtue or a hidden pitfall in systematic strategy development. It addresses the tension between generalized machine learning approaches and more targeted creative analysis, and discusses how to build confidence in strategies discovered through data-driven exploration while managing the overfitting risks inherent in the process.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/striking-gold-in-the-data-mine-pursuing>`__.

Multi-Model Diversification: Balancing Strategy Variety Against Over-Diversification
------------------------------------------------------------------------------------

An article on the practice of deploying multiple trading models for risk mitigation and revenue growth. The article uses the analogy of a store that wouldn't sell only one product to explain why systematic traders need a diverse range of strategies to protect against individual system edge decay, overfitting, and regime changes.

The article also warns against over-diversification, drawing the parallel of a store trying to sell food, toys, and hardware simultaneously. It covers the practical challenges of multi-model portfolio management including the programming requirements for data handling, cross-model portfolio balancing, and maintaining a manageable number of strategies that can be properly monitored.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/broadening-the-horizons-the-art-of>`__.

Understanding Directional Edge Decay and System Robustness in Trading
---------------------------------------------------------------------

An article unraveling the complexities of directional trading models, edge decay, and the quest for system robustness. The article explains how directional models willingly embrace directional risk exposure and rely on two foundational assumptions: directional persistence after position entry and sustained price movement triggered by the signal.

The article contrasts directional models with arbitrage approaches and discusses the unique challenges of maintaining a directional edge over time. It covers the concepts of edge decay, system robustness across market regimes, and how to build trading systems that remain profitable even as market dynamics evolve.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-the-market-maze-understanding>`__.

Building Regime-Robust Trading Systems Through Market Cycle Analysis
--------------------------------------------------------------------

An article on building robust long-term trading systems, explaining the market dynamics of inventory accumulation and distribution. The article describes how a trading system with a reliable signal acts like a lighthouse, attracting market participants and creating the conditions for profitable trading through systematic inventory management.

The article emphasizes the importance of distinguishing between systems that work in specific market conditions (like 2020's bull market) versus those that are genuinely robust across different regimes. It argues that markets cycle continuously due to economic forces, and a trader's primary responsibility is to build systems that weather these transitions while preserving capital for more favorable conditions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-market-seas-the-art-and>`__.

Broadening Portfolio Exposure to Detect Strategy Edge Decay Faster
------------------------------------------------------------------

An article describing the process of broadening portfolio exposure for efficient detection of strategy edge decay and failure. The author's portfolio combines momentum and mean reversion strategies, with the goal of reducing outcome correlation across the portfolio.

The article explains the rationale for running multiple strategy types simultaneously: it enables faster identification of when individual systems lose their edge or fail due to overfitting. By maintaining diversified exposure, the trader can detect problems earlier and reduce dependence on any single strategy, creating a more resilient overall trading operation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-the-market-a-dynamic-approach>`__.

The Realities and Operational Challenges of Running Algorithmic Trading Systems
-------------------------------------------------------------------------------

An article providing an unvarnished look at the realities and challenges of algorithmic trading as a career. While algorithmic traders are freed from the daily grind of manual execution, the article argues that this freedom comes with its own unique set of challenges that can significantly impact a trader's operations and well-being.

The article covers the practical challenges facing algorithmic traders including system reliability, external risks such as exchange failures, infrastructure management, and the mental toll of monitoring automated systems. It serves as a realistic counterpoint to the glamorous portrayal of automated trading, providing valuable context for anyone considering building a systematic trading operation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-the-high-seas-of-algorithmic>`__.

Building Uncorrelated Strategy Portfolios and Detecting Edge Decay
------------------------------------------------------------------

An article exploring the author's evolving approach to seeking trading edge and the uncomfortable reality that many carefully constructed strategies will fail in live trading. The article grapples with two critical questions: how to quickly recognize when strategies underperform, and how to avoid over-reliance on a handful of strategies.

The article contrasts the comfort of established time-tested strategies like trend-following and mean reversion with the challenges of developing new data-driven approaches. It discusses building robust, uncorrelated trading systems and the importance of rapid edge decay detection as a core component of any systematic trading operation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/in-search-of-alpha-navigating-the>`__.

Systematic Regime Detection for Momentum Strategy Timing
--------------------------------------------------------

An article on the systematic approach to regime targeting for momentum trading strategies. The article argues that trading against the general market direction is one of the most common causes of losses, and presents a framework for identifying favorable market regimes.

The article covers how to define and detect market regimes, how to adjust strategy exposure based on the current regime, and how to avoid trading during unfavorable conditions. The practical framework helps momentum traders align their positions with the broader market trend while knowing when to reduce exposure or "go fishing."

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/optimizing-trading-strategies-mastering>`__.

A Survival-First Approach to Trading System Development
-------------------------------------------------------

An article framing markets as a survival game where the longevity of a portfolio determines its ability to capture favorable regimes. Using 2020-2021 as an example, the article argues that traders who preserved capital were the ones who profited from the massive bull market, while those who had blown up earlier missed the opportunity entirely.

The article defines what constitutes a robust edge from a survival perspective: one that withstands minor market changes, survives different regimes, and can be exploited over long periods without catastrophic failure. The framework combines edge robustness with risk management to maximize the probability of portfolio survival and long-term wealth accumulation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/survival-approach-to-developing-trading>`__.

What Constitutes Genuine Edge in Financial Markets
--------------------------------------------------

An article breaking down the concept of trading edge from first principles, starting with the fundamental nature of markets as venues where buyers and sellers agree on prices. The article explains how the speed of modern financial markets often causes traders to overlook this basic dynamic.

The article provides a framework for understanding what constitutes genuine edge in trading, covering how to identify situations where the odds favor one side of a trade. It connects the fundamental market mechanics of buying low and selling high to the practical implementation of systematic strategies that can consistently exploit these opportunities.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/finding-edge-in-the-financial-markets>`__.

Building a Crypto Market Scanner in Python with Binance API
-----------------------------------------------------------

A practical Python tutorial on building an automated cryptocurrency market scanner from scratch. The article explains two key motivations for building a scanner: identifying trending assets for capital allocation and gauging overall market sentiment without manually checking individual charts.

The tutorial covers the complete implementation including connecting to the Binance exchange API, fetching price data for multiple assets, computing relevant metrics, and creating visual representations of market conditions. It serves as a hands-on guide for automating the repetitive task of market monitoring, a fundamental building block for any systematic crypto trading operation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/how-to-build-a-crypto-market-scanner>`__.

Vol-Based Stops: Stop Leaving Money on the Table
-------------------------------------------------

A practical Python script for calculating volatility-adjusted stop-loss distances for index futures (NQ, ES)
and ETFs (QQQ, SPY). The script runs daily, downloading VIX, VXN, VIX9D, and price data to determine
the current volatility regime and compute appropriate stop distances and position sizes.

The approach uses a severity score derived from realized volatility (20-day SPY close-to-close), VIX momentum
(5-day change), and VIX acceleration. These features are ranked, weighted, and bucketed into four regimes:
LOW VOL, NORMAL, ELEVATED, and EXTREME. For each regime, the script outputs the appropriate stop distance
and number of micro contracts to trade at 1% risk, helping traders avoid the common pitfalls of using stops
that are too tight in high-volatility environments (getting stopped on noise) or too wide in low-volatility
environments (giving back gains unnecessarily).

By AlgoFlows.

`Read the article <https://x.com/algoflows/status/2019143439485661382>`__

Yield as a Risk Signal: Part II
-------------------------------

A data-driven analysis of market making vaults on perpetual DEXs, examining whether these products should be treated as cash-like instruments or risk assets. The article analyzes four vaults - Hyperliquid's HLP, Lighter.xyz's LLP, Paradex's Gigavault, and Ostium Labs' oLP - examining max drawdowns, underwater durations, APY vs realized paths, risk-adjusted returns, and tail risks.

The core finding is that MM vaults do not behave like cash. With 5-9% drawdowns for most vaults and months spent underwater after market shocks, these products are fundamentally incompatible with expectations of redeeming at par. The article demonstrates that while Sharpe ratios can be attractive (4.71 for LLP, 2.89 for HLP), early-life metrics are often front-loaded and compress over time as TVL grows. The piece also examines venue-level tail risks, including the JELLYJELLY incident on Hyperliquid where LPs became the backstop for structural failures. The conclusion: allocators should treat MM vaults as risk assets with structural edge, not cash substitutes.

By Chaos Labs.

`Read the article <https://x.com/chaoslabs/status/2019498892761374811>`__

Basic Trend Following
---------------------

A comprehensive primer on constructing a basic trend following program, shared freely with full transparency. The thread covers both the philosophy and exact implementation steps for building a systematic trend strategy that can be stacked on beta exposure.

The four-step framework includes: (1) Beta/Benchmark Selection, (2) Two-Speed Binary Trend signals, (3) Risk Parity allocation, and (4) Dynamic Leverage with Max Volatility Cap. The author argues that a basic trend program is one of the most defensible things an investor can do—intuitive, empirically backed, and suited to most investor psychology. The goal is to provide both a benchmark for measuring market strategy and an accessible portfolio solution for anyone with a brokerage account.

By Prometheus Macro (@aahan_prometheus).

`Read the thread <https://threadreaderapp.com/thread/2020234019108266368.html>`__

The Signal Types Needed for Trading
-----------------------------------

A comprehensive guide to the three signal types used in systematic trading: Binary, Ensemble, and Continuous signals. The article breaks down each type with practical examples and explains when to use each approach for building robust trading strategies.

Binary signals are the simplest form (ON/OFF), easy to implement but treat all signals equally regardless of conviction. Ensemble signals combine multiple weak learners using methods like Majority Voting, Equal-Weight Scoring, and Weighted Averaging to create stronger, more robust signals—based on Condorcet's Jury Theorem. Continuous signals output values on a spectrum (-1 to +1) that map directly to position size ("bet sizing"), allowing traders to express varying conviction levels and produce smoother equity curves. The article also covers critical concepts including the three sources of error in trading models (Bias, Variance, Irreducible Error), Bagging vs Boosting in financial applications, the Observation Redundancy Problem specific to financial data, and how these signal types connect in a complete trading pipeline.

By Goshawk Trades.

`Read the article <https://x.com/GoshawkTrades/status/2019810833904373805>`__

Gold Momentum Strategy
----------------------

A simple dual-momentum approach for timing gold investments. The strategy combines 12-month total return signals from both gold (GLD) and 10-year U.S. Treasuries (IEF) to filter out weak periods and reduce drawdowns.

The trading rules are straightforward: when both gold and Treasury returns are positive at month-end, go long gold; if either is negative, stay in cash. This deliberate simplicity—with minimal parameters—reduces the risk of overfitting. Based on research from Allocate Smartly's "Gold Cross-Asset Momentum," historical backtesting over 50 years shows the strategy has generally reduced exposure during losing phases and outperformed a basic gold-only momentum approach.

By QuantifiedStrategies.com.

`Read the post <https://x.com/QuantifiedStrat/status/2020152068422648277>`__

Vs Random Benchmarking: Detecting Lucky Backtests
--------------------------------------------------

A method for determining whether a backtested trading strategy has genuine edge or is simply the product of overfitting. The Vs. Random test, popularized by hedge fund manager Jaffray Woodriff of Quantitative Investment Management in his Hedge Fund Market Wizards chapter, works by building the best possible strategies using random signals and random data, then using the best random result as a baseline benchmark.

If a strategy cannot meaningfully exceed the performance of the best randomly generated strategy, there is a strong chance it is overfit to historical noise rather than capturing real market dynamics. The article covers common implementation mistakes including comparing against average random performance instead of best random, failing to match constraints between real and random strategy searches, and mismatching the fitness metric used for comparison. It also discusses how Build Alpha v3 automates this test as a pre-generation filter.

Mentioned by Build Alpha in `this discussion <https://x.com/buildalpha/status/2020940208091312594>`__.

`Read the blog post <https://www.buildalpha.com/vs-random-test/>`__.

A Simple Monthly Momentum Strategy for US Stocks
-------------------------------------------------

A beginner-friendly systematic trading strategy using monthly momentum on Nasdaq 100 stocks. The approach focuses on robustness over complexity, framing the strategy as premium harvesting of beta rather than alpha mining — fewer moving parts mean fewer things that can break compared to overoptimized, datamined strategies.

The exact rules: trade only when NDX is in an uptrend (Close > MA200), filter the Nasdaq 100 universe for stocks also in uptrend with positive 6-month returns, rank by 6-month return once a month, buy the top 5 equally weighted at 20% each, hold for one month, then repeat. No stop loss, no profit target. The author positions this as a solid core sleeve for a systematic portfolio that can be improved by combining it with uncorrelated strategies like long mean reversion or by adding better filters and ranking criteria.

By Petr Podhajsky.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_not-sure-where-to-start-with-systematic-trading-share-7426649340364046336-3mSb>`__.

Using Rolling Correlation to Hit Volatility Targets in Crypto Trend Following
------------------------------------------------------------------------------

A practical discussion on incorporating correlation estimates into position sizing for a long/short crypto trend following portfolio. The author was targeting 40% annualised volatility but consistently hitting only 20%, because the sizing formula assumed perfect correlation among positions — clearly wrong when the portfolio's rolling correlation sat around 0.1.

The fix involved adding a rolling correlation estimate to the sizing formula. The key question was whether past correlation is predictive enough to rely on, similar to how past volatility predicts future volatility. After analysing the data, the author found R² values of 0.25–0.4 for correlation predictability in crypto — consistent with assumptions in Rob Carver's work — and confirmed that using the rolling correlation estimate allowed the portfolio to consistently hit its volatility target.

By pedma7.

`Read the post <https://x.com/pedma7/status/2020946617344389474>`__.

Seasonality in Bitcoin Intraday Trend Trading
----------------------------------------------

An investigation into whether Bitcoin exhibits exploitable intraday trend-following dynamics and, critically, whether those dynamics vary by time of week. Concretum Research constructs a high-frequency Bitcoin trend-following benchmark and uncovers a clear intraweek seasonality pattern they call the "Monday Asia Open Effect."

The key finding is that intraday trend-following performance is strongly positive starting Sunday around 7:00 PM New York time, with elevated returns persisting for roughly 24 hours into Monday, aligning with the Monday open of Asian cash equity markets. In contrast, US Sunday morning is associated with negative benchmark performance, consistent with choppier price action and weaker trend persistence. The article demonstrates that incorporating this day-of-week filter can materially improve portfolio performance for intraday crypto trend-following strategies.

By Concretum Research.

Mentioned by Concretum Research in `this discussion <https://x.com/ConcretumR/status/2017289662902272327>`__.

`Read the article <https://concretumgroup.com/seasonality-in-bitcoin-intraday-trend-trading/>`__.

Detecting VIX Term Structure Regimes
-------------------------------------

A practical guide to analyzing the VIX term structure using Principal Component Analysis (PCA) and Hidden Markov Models (HMM) in Python. The article argues that a single VIX number tells you almost nothing about where risk sits in the market, but the term structure reveals whether the crowd expects a crisis next week or three months from now, and whether the market is bracing for a known event or pricing uncertainty across the entire curve.

The methodology uses PCA to reduce the dimensionality of the VIX term structure into interpretable components (level, slope, curvature), then applies a Gaussian Hidden Markov Model to classify the slope series into distinct regimes including contango, backwardation, and transition states. A complete Python notebook is provided for reproducing the analysis.

By Cristian Velasquez.

Mentioned by QuantSeeker in `this discussion <https://x.com/quantseeker>`__.

`Read the article <https://medium.com/@crisvelasquez/detecting-vix-term-structure-regimes-8f3b1a4ddf15>`__.

Realized Volatility and HAR Models: A New Paradigm for Volatility Forecasting
------------------------------------------------------------------------------

A comprehensive guide to realized volatility and the Heterogeneous Autoregressive (HAR) model for volatility forecasting. The article explains how high-frequency intraday data can be used to construct realized volatility measures that are more precise than traditional close-to-close estimators, and how the HAR framework captures the multi-scale, long-memory properties of volatility through a hierarchical cascade of daily, weekly, and monthly components.

The post covers key extensions of the base HAR model, including handling jumps (HAR-J), leverage effects, and realized semi-variance decomposition. It also discusses practical considerations such as microstructure noise, kernel-based estimators, and model evaluation using QLIKE and MSE loss functions. A Python implementation is provided for fitting HAR models and generating forecasts.

By Simone Menaldo.

Mentioned by Ralph Sueppel in `this discussion <https://x.com/macro_synergy/status/2021129224879288810>`__.

`Read the article <https://medium.com/@simomenaldo/realized-volatility-and-har-models-a-new-paradigm-for-volatility-forecasting-4a660f2530f3>`__.

Time Series Fundamentals
------------------------

A foundational overview of time series analysis for financial econometrics. The article covers the core concepts that underpin quantitative finance, including stationarity and unit root testing (ADF and KPSS tests), autocorrelation functions (ACF and PACF), lag selection criteria (AIC, BIC, HQIC), and an introduction to spectral analysis for identifying cyclical patterns in financial data.

The post emphasizes the practical importance of these tools for portfolio managers and risk analysts, explaining how stationarity assumptions affect model validity, how autocorrelation structure informs model selection, and how frequency-domain analysis can complement time-domain approaches for understanding market dynamics.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/time-series-fundamentals-4dfbbc5dc1d1>`__.

Market Microstructure Foundations
---------------------------------

A comprehensive introduction to market microstructure, the branch of financial economics that studies how investors' latent demands are translated into executed trades. The article covers the core building blocks including order-driven versus quote-driven markets, the role of market makers, price discovery mechanisms, and the concept of information asymmetry between market participants.

The post explores foundational theoretical models and their practical implications for trading decisions, risk management, and understanding the forces that shape asset prices. Topics include bid-ask spreads, transaction costs, market efficiency at the microstructure level, and the impact of market structure on price formation.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/market-microstructure-foundations-aabb765d9fd2>`__.

Strategic Trading Models
------------------------

An exploration of strategic trading models that provide rigorous frameworks for executing large orders while minimizing market impact and preserving informational advantages. The article covers foundational concepts including Kyle's Lambda estimation, the mechanics of price impact, and advanced execution tactics such as trade splitting, stealth trading, and the logic behind parent order strategies.

The post delves into how institutional traders balance the trade-off between execution speed and market impact, drawing on Kyle's 1985 seminal model and its extensions. It examines how informed traders optimally reveal their information through trading, and how these theoretical insights translate into practical algorithmic execution strategies used by quantitative trading firms.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/strategic-trading-models-baf99eecdf11>`__.

Information-Based Models in Market Microstructure
-------------------------------------------------

A comprehensive overview of information-based models in market microstructure, providing a framework for understanding how private information is incorporated into asset prices. The article traces the development of these models from Bagehot's foundational insights through to modern metrics like the Probability of Informed Trading (PIN) and Volume-Synchronized PIN (VPIN).

The post explores the theoretical underpinnings of information asymmetry, adverse selection, and the strategic behavior of informed and uninformed traders. It covers the Glosten-Milgrom sequential trade model, the Kyle continuous auction model, and how these frameworks explain the mechanics of price discovery, liquidity provision, and trading costs in modern markets.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/information-based-models-in-market-microstructure-6d8c7b8dbfa9>`__.

Stochastic Volatility Models
-----------------------------

An in-depth exploration of stochastic volatility models, which offer a more sophisticated and realistic framework for capturing market dynamics than simpler constant-volatility assumptions. The article covers the foundational concepts of the basic stochastic volatility model, the widely used Heston model, and methods for their estimation and calibration.

The post explains how stochastic volatility models treat volatility as a latent random process driven by its own source of uncertainty, allowing them to capture key features of financial markets such as volatility clustering, mean reversion, and the leverage effect. Applications to derivatives pricing, risk management, and portfolio optimization are discussed.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/stochastic-volatility-models-a473e32d5519>`__.

Inventory Models in Market Microstructure
-----------------------------------------

A comprehensive overview of inventory models in market microstructure, which provide a systematic framework for understanding how market makers quote bid-ask spreads to control inventory risk and maximize profitability. The article covers foundational models by Garman (1976), Stoll (1978), and Ho and Stoll (1981), as well as advanced topics such as optimal inventory control and the Avellaneda-Stoikov framework.

The post explores how uncontrolled inventory exposes market makers to adverse price movements, and how optimal quoting strategies dynamically adjust spreads based on current inventory levels, risk aversion, and market volatility. The Avellaneda-Stoikov model is presented as the modern standard for high-frequency market making, providing closed-form solutions for optimal bid-ask quotes.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/inventory-models-in-market-microstructure-2956ba9b31cb>`__.

Understanding Multivariate GARCH Models
----------------------------------------

An overview of Multivariate GARCH models for modeling and forecasting the volatility of multiple assets simultaneously. The article covers the progression from the foundational VEC and BEKK models to the more advanced Constant Conditional Correlation (CCC) and Dynamic Conditional Correlation (DCC) frameworks, with practical applications in portfolio risk management.

The post explains how these models capture time-varying correlations and volatility spillovers between assets, which are critical for portfolio construction, hedging, and risk measurement. The trade-offs between model flexibility and computational tractability are discussed, with the DCC model highlighted as the most practical choice for large-dimensional systems.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/understanding-multivariate-garch-models-39bab25b527c>`__.

Bid-Ask Spread Decomposition
-----------------------------

A detailed guide to decomposing the bid-ask spread into its fundamental components: order processing costs, inventory holding costs, and adverse selection costs. The article covers the theoretical models behind each component, methods for empirical estimation including the Roll (1984) and Madhavan-Richardson-Roomans (1997) approaches, and their behavior across different market conditions.

The post also examines time-varying spread dynamics, cross-sectional variation in spread components across different assets, intraday U-shaped spread patterns, and the impact of electronic versus floor trading on spread composition. Understanding these components informs execution strategies, transaction cost analysis, and market surveillance.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/bid-ask-spread-decomposition-1a5ddfd8f554>`__.

Volatility Modeling: A Deep Dive into the ARCH Family
------------------------------------------------------

A comprehensive exploration of the ARCH family of volatility models, from the original ARCH model by Robert Engle to its many extensions. The article begins with the stylized facts of financial returns that motivate these models, including volatility clustering, fat tails, and the leverage effect, then covers ARCH, GARCH, EGARCH, GJR-GARCH, and IGARCH specifications.

The post provides detailed mathematical formulations, explains estimation via maximum likelihood, and discusses model selection and diagnostic testing. Practical considerations for applying these models to financial risk management, Value-at-Risk estimation, and options pricing are covered, with emphasis on choosing the right specification for different financial applications.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/volatility-modeling-a-deep-dive-into-the-arch-family-f361bafbb3f7>`__.

Market Liquidity
----------------

An overview of essential measures of market liquidity, from classic spread-based measures to more advanced model-based indicators. The article covers effective spread, realized spread, quoted depth, Amihud illiquidity ratio, Kyle's Lambda, and other key metrics used to quantify the ease with which assets can be traded without significantly affecting their price.

The post explores the theoretical underpinnings and practical applications of each liquidity measure, explaining how they capture different dimensions of liquidity including tightness, depth, resiliency, and immediacy. In a world of fragmented markets and high-frequency trading, the ability to accurately gauge liquidity is presented as critical to both execution quality and risk management.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/market-liquidity-c66bd2c8ca5a>`__.

Cointegration and Error Correction Models
------------------------------------------

An exploration of cointegration and Error Correction Models (ECMs) for analyzing long-run relationships between financial time series. The article covers the problem of spurious regression, the Engle-Granger two-step method and Johansen test for cointegration testing, and the Vector Error Correction Model (VECM) framework for modeling both short-run dynamics and long-run equilibrium relationships.

The post demonstrates how these tools move beyond simple correlations to uncover deeper economic connections between non-stationary time series. Applications in quantitative finance include pairs trading strategies, cross-asset hedging, term structure modeling, and understanding the lead-lag relationships between related financial instruments.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/cointegration-and-error-correction-models-a03cfb900ed1>`__.

Limit Order Book Structure
--------------------------

A comprehensive overview of the limit order book (LOB), the fundamental data structure representing real-time supply and demand for financial instruments. The article covers key components including price-time priority, pro-rata allocation, order book depth, Level I/II/III market data, order book imbalance as a predictor of short-term price movements, queue position, and visible versus hidden depth.

The post explains how understanding LOB structure provides insights into market sentiment, liquidity, and short-term price dynamics. For traders and portfolio managers, this knowledge informs trading strategies, improves execution quality, and enhances risk management in modern electronic markets where the LOB is the central mechanism for price discovery.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/limit-order-book-structure-2aed9971e998>`__.

ARMA and ARIMA Models
---------------------

A foundational guide to Autoregressive Moving Average (ARMA) and Autoregressive Integrated Moving Average (ARIMA) models for financial time series forecasting. The article covers the theoretical framework from the seminal Box-Jenkins methodology, including model identification, parameter estimation via maximum likelihood, diagnostic checking, and the complete model selection process using ACF/PACF analysis and information criteria.

The post explains how these models capture temporal dependencies in financial data through autoregressive and moving average components, and how differencing extends them to handle non-stationary series. Practical applications in algorithmic trading, risk management, and investment strategy formulation are discussed, along with model limitations and extensions.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/arma-and-arima-models-f5ab52a191ba>`__.

Understanding Order Types
-------------------------

A detailed guide to the order types that translate trading strategies into executed trades in modern financial markets. The article covers market orders, limit orders, stop orders, stop-limit orders, iceberg orders, and more complex conditional and algorithmic order variants, examining their mechanics and strategic applications within the limit order book framework.

The post emphasizes that understanding order types is fundamental to managing execution costs, controlling market impact, and optimizing portfolio performance. Each order type is analyzed in terms of its interaction with the order book, its trade-off between execution certainty and price improvement, and its appropriate use cases in different market conditions.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/understanding-order-types-462f69e62a85>`__.

Perpetual Contracts Without Spot Markets: A Hidden Delisting Risk
-----------------------------------------------------------------

A cautionary analysis of a recurring pattern in crypto derivatives markets where tokens get listed on Binance with perpetual contracts but no spot market. Without spot trading, there is no natural price discovery — no real supply and demand anchoring the mark price. When funding rates spike negative, systematic strategies flag these as funding rate arbitrage opportunities, but the apparent yield is a trap.

The post describes how, within days or weeks, Binance announces a vote-to-delist, the token dumps sharply, and funding yield gets wiped out by drawdowns that no amount of price-based risk management could have anticipated. The tokens that blow up share a common fingerprint: perp without spot on the listing venue, thin liquidity, and single-exchange dependency. The author advocates for automated screening to filter out these structurally compromised tokens before they enter any trading pipeline.

By Margin Syndicate.

`Read the post <https://www.linkedin.com/posts/a-token-gets-listed-on-binance-with-a-perpetual-share-7427034487001083904-Ky2t/>`__.

List of Perpetual Futures DEXes
-------------------------------

A comprehensive ecosystem map of decentralized perpetual futures exchanges, categorizing platforms by their underlying architecture into three design families: orderbook-based, AMM-based, and exotic perps. The classification highlights that not all perp DEXes are built the same — orderbook-based platforms prioritize execution speed and price discovery through central limit order books, AMM-based platforms use liquidity pools and synthetic pricing for permissionless trading, and exotic perp platforms enable markets on non-traditional data feeds and novel asset types.

**Orderbook-Based:** `Hyperliquid <https://hyperliquid.xyz/>`__, `dYdX <https://dydx.exchange/>`__, `Vertex Protocol <https://vertexprotocol.com/>`__, `Aevo <https://aevo.xyz/>`__, `Paradex <https://www.paradex.gg/>`__, `Lighter <https://lighter.xyz/>`__, `Aster DEX <https://www.asterdex.com/>`__, `Backpack <https://backpack.exchange/>`__, `edgeX <https://edgex.exchange/>`__, `Nado <https://www.nado.xyz/>`__, `Pacifica <https://pacifica.fi/>`__, `GRVT <https://grvt.io/>`__, `Hibachi <https://hibachi.xyz/>`__.

**AMM-Based:** `GMX <https://gmx.io/>`__, `Gains Network <https://gains.trade/>`__, `Synthetix <https://synthetix.io/>`__, `Drift Protocol <https://drift.trade/>`__, `Ostium <https://www.ostium.com/>`__, `ApeX <https://www.apex.exchange/>`__.

**Exotic Perps:** `Overlay Protocol <https://overlay.market/>`__, `Variational <https://variational.io/>`__, `Extended <https://extended.xyz/>`__.

Mentioned by `Stacy Muur <https://x.com/stacy_muur>`__ in `this discussion <https://x.com/stacy_muur/status/2021216093394915574>`__: "Not all perp DEXs are built the same. Your eco map, by design."

`Read the post <https://x.com/stacy_muur/status/2021216093394915574>`__.

Why Cumulative Volume Delta Fails Traders
-----------------------------------------

An examination of why Cumulative Volume Delta (CVD), despite its apparent objectivity, consistently misleads traders. The post argues that CVD wins traders over in hindsight — after a session ends, the CVD chart appears to confirm moves cleanly — but in real time, the signal breaks down because CVD measures aggression totals, not who is actually in control of the auction.

The core issue is that CVD assumes aggressive buying should push price up and aggressive selling should push it down, but this ignores the role of passive absorption by limit orders. The post explains how time aggregation further distorts the picture, compressing meaningful microstructure dynamics into a single cumulative line. Instead of relying on CVD as a directional signal, the author advocates examining delta on lower timeframes to observe how aggression is being absorbed or accepted at specific price levels.

By Sierra Trading.

`Read the blog post <https://beyondcandlesticks.substack.com/p/why-cumulative-volume-delta-fails>`__.

A Simple Market Making Bot for 01 Exchange
-----------------------------------------------------------

An open-source TypeScript market making bot for `01 Exchange <https://01.xyz/>`__, a Solana-based perpetual futures DEX. The project demonstrates how to connect to 01 Exchange using the official SDK (@n1xyz/nord-ts) and implement a basic market making strategy. It places buy and sell orders symmetrically around a fair price derived from Binance mid-price, with a configurable spread (default 10 bps). When positions grow beyond a threshold, the bot switches to a close-only mode with tighter spreads (5 bps) to reduce exposure.

The repository includes a clean project structure with separate modules for quote generation, position tracking, price feeds (via Binance WebSocket), and order management. Configuration options cover spread size, order size in USD, close-mode thresholds, update throttling, and fair price calculation windows. The bot supports BTC and ETH markets and can be deployed via Docker Compose. A market monitor TUI is also included for observing orderbook state. The author notes this is intended for educational purposes and ran a $100 challenge generating $150k in volume by capturing wide spreads in a low-liquidity environment.

Mentioned by `URA <https://x.com/uradyor>`__ in `this discussion <https://x.com/uradyor/status/2018107463795720336>`__: ran a $100 challenge with the bot on a sub-account, generating $150k in volume by capturing wide spreads in a low-liquidity environment on 01 Exchange.

`View the repository <https://github.com/yat1ma30/zo-market-maker-ts>`__.

Time of Day Same Bar Trading
-----------------------------

A straightforward intraday momentum strategy for ES (E-mini S&P 500) futures using 30-minute bars. The approach analyzes absolute price moves (|Close-Open|) for each 30-minute time slot over a 120-day lookback, building historical distributions per slot. A signal triggers when the current bar's movement exceeds the 90th percentile of that slot's history, trading directionally with the impulse: long if Close > Open, short if Close < Open. The position is held for exactly one 30-minute bar, then exited at close.

The strategy deliberately excludes stop losses, profit targets, regime filters, transaction fees, and risk management to focus purely on the "raw tendency." The author emphasizes that this "extreme impulse by time-of-day effect" appears persistent across both long and short sides and multiple markets, positioning it as a foundational building block for systematic trading systems.

By Petr Podhajsky.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_im-interested-in-systems-built-on-one-simple-share-7427372617675763712-TuwD>`__.

Project Kintoun: A Regime-Filtered ORB Strategy
------------------------------------------------

A regime-filtered opening range breakout (ORB) strategy for NQ (Nasdaq-100) futures on 1-minute timeframes during US equity morning sessions. The strategy builds on classic ORB mechanics — trading price movements beyond the initial 15-minute range — but adds three validation layers to filter false breakouts: microstructure retest confirmation (price must return to the breakout level), VWAP slope regime filtering (trades align with intraday trend direction), and volume confirmation (breakouts require above-average participation).

Backtested from June 2022 through October 2025 across 1,062 trades, the strategy achieved a 1.47 profit factor, 2.28 Sharpe ratio, 57.24% annualized returns, and a maximum drawdown of -8.46% (6.76 Calmar ratio) on a 33.9% win rate. The implementation handles timezone alignment across daylight savings transitions, incorporates dynamic position scaling based on account equity changes, and uses multiple exit mechanisms including profit targets, stop losses, and time-based exits.

By Jeremy Hsu.

Mentioned by `Jeremy Hsu <https://www.linkedin.com/in/jerm04>`__ in `this discussion <https://www.linkedin.com/posts/jerm04_most-trading-strategies-fail-because-they-share-7423958468975407104-pZ7E>`__: "Most trading strategies fail because they assume the wrong probability model." Hsu describes how conditioning a strategy on market state — rather than optimizing parameters — cut trades in half while doubling risk-adjusted performance, arguing that losses often contain more information than wins and that edges are conditional on regime.

`Read the blog post <https://mrjerm.github.io/project_kintoun.html>`__.

Reverse Engineering propAMMs Pricing Curves
-------------------------------------------

A deep technical analysis of five proprietary automated market makers (propAMMs) on Solana — BisonFi, GoonFi, HumidiFi, SolFi, and Tessera — reverse-engineered using nothing but swap simulations and compute unit traces. Without access to source code, the researchers reconstructed each system's pricing logic by segmenting price curves via rate derivatives and compute unit analysis, then fitting candidate mathematical functions (linear, quadratic, cubic, sqrt-mixed, log-linear) using weighted least squares and Bayesian Information Criterion (BIC) for model selection.

The study achieved pricing reconstruction accuracies below 0.001% MAPE across most systems, revealing distinct architectural choices: some propAMMs use simple linear pricing while others employ more complex nonlinear curves. The methodology — combining on-chain simulation data with statistical model selection — provides a replicable framework for analyzing any black-box AMM. Future work includes longitudinal analysis of how these curves evolve over time and bidirectional (buy and sell) pricing reconstruction.

By moon shiesty.

`Read the article <https://x.com/i/article/2019626170774413312>`__.

Survivorship Bias in Backtesting
--------------------------------

An explanation of survivorship bias and why it matters in backtesting trading strategies. When historical databases only include stocks that still exist today, backtests can produce misleadingly optimistic results by ignoring companies that went bankrupt or were delisted. The post illustrates the problem with concrete examples and explains how to use survivorship-bias-free data from providers like Norgate Data to get more realistic backtest results.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/survivorship-bias/>`__.

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

NDX Momentum
------------

A momentum-based rotational strategy focused on Nasdaq-listed stocks. The system ranks stocks by their momentum scores and rotates into the strongest performers while applying a market regime filter to reduce exposure during unfavorable conditions. The post details the ranking methodology, rebalancing frequency, and historical performance characteristics of this systematic approach to capturing momentum in technology-heavy equities.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/ndx-momentum/>`__.

IV Mean Reversion
-----------------

A trading strategy based on implied volatility mean reversion. The approach identifies when implied volatility for individual stocks has moved significantly away from its historical average and takes positions expecting a reversion to the mean. The post covers how to measure IV deviation, set entry and exit thresholds, and combine the IV signal with directional filters for a complete trading system.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/iv-mean-reversion/>`__.

Interactive Brokers IV Downloader
---------------------------------

A practical tool for downloading implied volatility data from Interactive Brokers. The post provides code and instructions for systematically collecting IV data across multiple symbols, which can be used for research, strategy development, and monitoring volatility levels. This is a companion piece to the IV Mean Reversion strategy, providing the data infrastructure needed to implement volatility-based trading systems.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/interactive-brokers-iv-downloader/>`__.

Day Trading Volatility Breakouts Systematically - All Rules Included
--------------------------------------------------------------------

A complete rule set for systematically day trading volatility breakouts. The post provides all the mechanical rules needed to trade intraday breakouts driven by volatility expansion, including entry triggers based on ATR-derived levels, position sizing, stop placement, and exit criteria. The approach is designed to be fully systematic with no discretionary decisions, making it suitable for automation.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/day-trading-volatility-breakouts-systematically-all-rules-included/>`__.

Buying Short-Term Dips in Stocks
--------------------------------

An interactive backtester for exploring short-term dip-buying strategies in stocks. The tool allows users to adjust parameters like the dip threshold, holding period, and market regime filter to see how different configurations affect historical performance. The backtester demonstrates the core concept that buying temporary pullbacks in uptrending stocks can produce consistent returns when combined with proper market timing and position sizing.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buying-short-term-dips-in-stocks/>`__.

US Stock Momentum Trading System for Retail Traders
----------------------------------------------------

A comprehensive deep research report on building a US stock momentum trading system suitable for retail traders. The post was generated using ChatGPT Pro's Deep Research functionality and covers extensive academic and practical sources on momentum strategies. It addresses universe selection, momentum measurement, portfolio construction, rebalancing schedules, and risk management, providing a thorough starting point for retail traders looking to implement systematic momentum strategies.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/us-stock-momentum-trading-system-for-retail-traders-deep-research/>`__.

Deep Dip - Innovative Short-Term Mean Reversion
------------------------------------------------

A live trading model implementing a short-term mean reversion strategy called Deep Dip. The system targets stocks that have experienced unusually large short-term drawdowns and enters positions expecting a snap-back rally. The post describes the signal construction, filters used to avoid value traps, position sizing methodology, and real-time tracking of the model's performance as a live trading system.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/deep-dip-innovative-short-term-mean-reversion/>`__.

Finding an Edge in IPOs: Research and a Backtested Mechanical Trading System
----------------------------------------------------------------------------

Research into whether IPOs offer a tradable edge, backed by a fully backtested mechanical trading system. The post examines the well-documented IPO anomalies — initial underpricing and longer-term underperformance — and develops systematic rules to exploit these patterns. It covers the data challenges unique to IPO trading, the construction of entry and exit signals, and presents backtest results showing how a mechanical approach to IPO trading performs historically.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/finding-an-edge-in-ipos-research-and-a-backtested-mechanical-trading-system/>`__.

Comparing Affordable Intraday Data Sources: TradeStation vs. Polygon vs. Alpaca
--------------------------------------------------------------------------------

A practical comparison of three affordable intraday data sources for retail algorithmic traders: TradeStation, Polygon, and Alpaca. The post evaluates each provider on cost, data quality, coverage, API usability, and suitability for backtesting intraday strategies. It helps retail traders navigate the often confusing landscape of market data providers and make an informed choice based on their specific needs and budget.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/comparing-affordable-intraday-data-sources-tradestation-vs-polygon-vs-alpaca/>`__.

RealTest Code for SPX Momentum Rotational System
-------------------------------------------------

Complete RealTest code for an SPX momentum rotational system, backtested using Norgate Data with commissions and delisted stocks included. The system checks a market regime filter based on the balance between stocks with positive and negative longer-term momentum, then opens up to 10 positions ranked by momentum. The post provides the full implementation code for site supporters.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/realtest-code-for-spx-momentum-rotational-system/>`__.

Buying Short-Term Dips in Stocks - RealTest Code
-------------------------------------------------

The RealTest implementation code for the short-term dip buying strategy. This companion post provides the complete RealTest script for the mean reversion strategy that buys temporary pullbacks in uptrending stocks. The code handles position sizing, market regime filtering, and portfolio-level risk management, allowing traders to reproduce and extend the strategy using the RealTest backtesting platform.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buying-short-term-dips-in-stocks-realtest-code/>`__.

Downloading Stock/ETF Market Data with Python and Alpaca API
------------------------------------------------------------

A step-by-step tutorial on downloading stock and ETF market data using Python and the free Alpaca API. The post walks through setting up the API connection, requesting historical price data at various timeframes, handling pagination, and storing the data for backtesting. This is a foundational building block for any Python-based trading research workflow, providing the data pipeline needed before strategy development can begin.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/downloading-stock-etf-market-data-with-python-and-alpaca-api/>`__.

Intraday Breakout Strategy Backtester
-------------------------------------

A Python-based backtester for volatility-driven intraday breakout strategies. The tool generates raw trades from 1-minute data using ATR-based breakout levels, designed as one block in a complete modular research pipeline. The backtester handles data loading, signal generation, and trade tracking, outputting raw trade records that can then be fed into RealTest or other analysis tools for portfolio construction and performance evaluation.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/intraday-breakout-strategy-backtester/>`__.

Intraday Breakout Strategy - RealTest Analysis Script
-----------------------------------------------------

A RealTest script for importing, filtering, and analyzing raw trades generated by the Python intraday breakout backtester. This script handles portfolio construction, position sizing, market context filtering, and performance analysis. It serves as the analysis layer in a modular research pipeline, taking raw trade data from the Python backtester and evaluating it with proper portfolio-level constraints and realistic execution assumptions.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/intraday-breakout-strategy-realtest-analysis-script/>`__.

Intraday Volatility Breakout Blueprint
---------------------------------------

A comprehensive guide to building and testing simple intraday breakout systems using free Python tools, Alpaca data, and modular research steps. The blueprint covers the complete workflow from data acquisition through signal generation to backtest analysis, structured as a reproducible research pipeline. Each component is designed to be independent and reusable, allowing traders to swap in different data sources, signals, or analysis tools as their research evolves.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/intraday-volatility-breakout-blueprint/>`__.

Do Breakouts of Strong Swings Work? Testing 40 Futures Markets
---------------------------------------------------------------

A quantitative study testing whether breakouts of swing highs and lows provide a tradable edge across 40 futures markets over 15 years of historical data. While many traders focus on fading support and resistance levels, the research finds that holding positions mechanically in the direction of the breakout — even for just a few hours — produces a statistically significant edge. The post presents the methodology, results across different asset classes, and discusses why trend continuation at swing points tends to outperform counter-trend approaches.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/do-breakouts-of-strong-swings-work-i-tested-40-futures-markets-and-the-data-is-clear/>`__.

Portfolio Backtest and Trading Techniques
------------------------------------------

This post explores why combining multiple independent trading strategies into a capital-aware portfolio is more effective than searching for a single "holy grail" strategy. The author argues that over-optimizing, constant tweaking, and adding complex rules create great backtests that fail in live markets.

The real key is building a team of robust strategies that work well together across different market conditions. Some strategies perform in bull markets, others in bear markets; some thrive in calm conditions, others in crisis. By mixing strategies across different assets, timeframes, frequencies, and styles, and ensuring they have low correlation, traders can create a portfolio that compounds returns while dramatically reducing drawdowns. The post demonstrates this with examples showing how individually volatile strategies can combine to produce smooth, consistent returns, referencing Parrondo's Paradox where combining "losing" strategies can create a winning approach.

By Build Alpha.

Mentioned by Build Alpha in `this X article <https://x.com/buildalpha/status/2024162464426807631>`__ where they discuss how the goal isn't one perfect strategy but rather a team of strategies that work like pistons in a car's engine - some go up, some go down, but the car moves forward.

`Read the blog post <https://www.buildalpha.com/portfolio-backtest-trading/>`__.

Happy Farming: How Loopers Get Squeezed
-----------------------------------------

This article explains the dynamics of DeFi looping — a strategy where traders leverage exposure to an asset's yield by borrowing correlated assets, such as borrowing WETH against wstETH collateral. The piece walks through how looping works mechanically, the math behind leveraged yield positions, and how spread compression, price deviation, and withdrawal queue length can interact to produce dangerous squeezes for leveraged loopers.

The article covers the key risk factors: borrow rate spikes that compress or invert the carry spread, wstETH market price deviations from redemption value, and Ethereum beacon chain withdrawal queue delays. It then shows how these can combine into a self-reinforcing squeeze scenario and concludes with practical tools for managing risk, including Aave's E-Mode for higher LTV borrowing and flash loans for efficient position entry and exit.

By Joe Wait.

`Read the article <https://x.com/JoeWaitOfficial/article/2024781759498358824>`__.

The Math Needed for Position Sizing (Complete Roadmap)
-------------------------------------------------------

A comprehensive guide to the essential math behind position sizing for systematic traders. The article walks through five position sizing methods in order of complexity: Fixed Dollar (almost never recommended), Fixed Percentage (the default starting point at 1-2% risk per trade), Equal Weighting for diversified portfolios, the Kelly Criterion (mathematically optimal but practically dangerous due to extreme sensitivity to estimation errors), and Volatility Targeting (the gold standard for multi-asset systematic trading).

For each method, the author provides the exact formulas, worked examples, and honest assessments of when to use or avoid them. The volatility targeting section covers three sub-approaches: ATR-based sizing, percent volatility model, and fixed percentage with volatility adjustment — all of which automatically scale positions inversely to asset volatility. The article also includes practical guidance on calculating volatility using 20-day standard deviation annualized by the square root of 252. The overarching principle: the best position size is one that lets you execute your strategy without emotional interference, which is often smaller than what the math suggests.

By Goshawk Trades (Mounir).

`Read the article <https://x.com/GoshawkTrades/status/2024873947414904842>`__

The Overfitting Problem in Quant Finance
-----------------------------------------

A deep dive into why most impressive backtests are statistical illusions, covering the mathematical foundations of overfitting detection in quantitative trading. The post walks through walk-forward analysis and Walk-Forward Efficiency (WFE), explains how serial correlation can inflate annualized Sharpe ratios by over 65%, and introduces López de Prado's Probabilistic Sharpe Ratio and Deflated Sharpe Ratio as tools for accounting for multiple testing bias.

The post then covers Combinatorial Purged Cross-Validation (CPCV) as a more robust backtesting methodology that removes overlapping training data and adds embargo periods to block serial correlation leakage, producing a full distribution of out-of-sample Sharpe ratios instead of a single number. The key takeaway: with 5 years of daily data and more than roughly 45 strategy variations tested, finding a fake winner with a strong Sharpe ratio is virtually guaranteed — and the t-statistic bar for claiming a real edge should be 3.0, not the traditional 1.96.

By Alekzz (@AIexey_Stark), commenting on an `article by gemchanger <https://x.com/gemchange_ltd/status/2026300422483271733>`__ about Sharpe ratio illusions and prediction markets.

`Read the article <https://x.com/AIexey_Stark/status/2026373039839936982>`__

Systematic Allocation in International Equity Regimes
-----------------------------------------------------

A research article examining systematic tactical allocation between US equities and international markets (EAFE and Emerging Markets) using momentum-based signals. The study uses a 56-year dataset (1969–2025) to test whether a signals-based framework can systematically time exposure to EAFE equities amid changing macroeconomic conditions.

Two strategies are tested: a pure spread momentum approach using rate-of-change signals across 6, 12, 24, and 36-month lookback periods, and a trend-conditioned approach applying simple moving average filters for allocation signals. The research finds intermediate-term windows (12–36 months) generate optimal risk-adjusted returns by balancing signal responsiveness against noise, and that systematic overlays can generate alpha orthogonal to equity-market betas — particularly during major secular market transitions.

By Cyril Dujava, Quantpedia. Mentioned by Radovan Vojtko in `this discussion <https://x.com/quantpedia/status/2026951652809244711>`__.

`Read the article <https://quantpedia.com/systematic-allocation-in-international-equity-regimes/>`__

How to Simulate Like a Quant Desk: Every Model, Every Formula, Runnable Code
-----------------------------------------------------------------------------

A comprehensive, progressive tutorial on quantitative simulation techniques for prediction markets, structured as a narrative that builds from basic Monte Carlo to production-grade systems. The article starts with a simple coin flip analogy for Polymarket contracts, then develops increasingly sophisticated methods: Monte Carlo estimation of binary contract probabilities with confidence intervals, importance sampling for pricing extreme tail-risk contracts (achieving 100-10,000x variance reduction), and Sequential Monte Carlo particle filters for real-time probability updating during live events like election night.

The article then covers variance reduction techniques (antithetic variates, control variates, stratified sampling) that stack multiplicatively, copula-based dependency modeling for correlated prediction market portfolios (comparing Gaussian, Student-t, Clayton, and Gumbel copulas with vine copula extensions), and agent-based market simulation using zero-intelligence traders and Kyle's lambda for price impact. Each section includes runnable Python code. The final section outlines a five-layer production stack from WebSocket data ingestion through risk management and monitoring.

By gemchanger.

`Read the article <https://x.com/gemchange_ltd/status/2027744530124951831>`__

Why Low Beta Improves Value in US Small Caps
--------------------------------------------

A research note examining whether combining low-beta filtering with value factor selection produces superior risk-adjusted returns across US and European equity universes. Using Portfolio123 infrastructure and FactSet data across nine long-only universes segmented by geography and market capitalisation, the study compares top-30 value stock portfolios constructed separately from the low-beta and high-beta halves of each universe over January 2005 to February 2026.

The central finding is that low-beta value portfolios deliver higher Sharpe ratios in 8 of 9 universes tested. The effect is most dramatic in US Small Caps, where Low Beta Value nearly doubles the CAGR of High Beta Value (19.9% vs 10.2%) with a Sharpe of 0.68 vs 0.27. The study offers structural explanations for why this effect does not replicate in European Small Caps, attributing the asymmetry to differences in market depth, value trap concentration, and speculative retail activity between US and European small-cap segments.

By Ivan Blanco. Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2028513162149155197>`__.

`Read the article <https://www.ivanblanco.ai/notes/low-beta-value-factor>`__

Why Volatility-Adjusted Sizing Matters More Than You Think
-----------------------------------------------------------

An article on why most traders fail not because of bad signals but because of broken position sizing. The core argument is that trading a fixed number of contracts regardless of market conditions means volatility implicitly decides your risk — when volatility doubles, so does the danger of your position.

The article presents a volatility-adjusted sizing formula: Position Size = (Account × Risk%) / (ATR × Multiplier), where ATR (Average True Range) measures current market volatility. This approach automatically scales positions down in high-volatility environments and up in low-volatility ones, keeping risk per trade consistent regardless of market regime. The piece also covers regime-based thinking for volatility states (low, normal, elevated, extreme) and practical guidelines for implementation, including starting with 0.5% risk per trade and adding 10-day ATR smoothing to avoid whipsaws.

By Algomatic Trading.

`Read the article <https://x.com/AlgomaticTrade/status/2028899660539281487>`__

The Concentration Game: Understanding Portfolio Effects of U.S. Equity Market Concentration
-------------------------------------------------------------------------------------------

A research piece from D. E. Shaw examining how rising concentration in the S&P 500 affects equity portfolio management and alpha generation. The ten largest constituents now represent over 40% of the index's weight — the highest level in decades. Unlike the late 1990s dot-com era, which was driven primarily by valuation expansion, today's concentration reflects realized economic growth where both prices and earnings have increased substantially for mega-cap companies.

The article explores the risk implications: the top ten stocks now contribute over 50% of the S&P 500's total volatility, with aggregate volatility 1.5 times the index itself and betas above 1.0. For active managers, concentration constrains alpha generation through reduced transfer coefficients (long-only constraints limit the ability to express negative views on large holdings) and narrower breadth (increased correlation among remaining stocks reduces independent forecasting opportunities). The authors note that full reversion to pre-2020 concentration levels would require the remaining index constituents to return over 160%, suggesting markets may remain concentrated for an extended period.

By The D. E. Shaw Group.

`Read the article <https://www.deshaw.com/library/concentration-game>`__

Volatility Drag, the Kelly Criterion, and Portfolio Position Sizing
--------------------------------------------------------------------

A post examining the relationship between volatility drag, the Kelly criterion, and optimal portfolio construction. The key insight is that the highest expected compound growth rate is achieved when portfolio volatility equals the Sharpe ratio — which corresponds to Kelly criterion sizing. However, this may not be optimal for all investors: more risk-averse investors (with relative risk aversion greater than 1) should take less risk, while less risk-averse investors should take more.

The post also addresses how variance drag diminishes for individual positions within a diversified portfolio. Because the risk penalty to idiosyncratic risk scales with the square of the portfolio weight (-1/2 * RRA * idiosyncratic variance * w^2), a 10% allocation reduces the importance of a component's idiosyncratic variance by a factor of 100. This makes volatility drag concerns far less relevant for individual holdings within a well-diversified, rebalanced portfolio.

By Ptuomov.

`Read the post <https://x.com/ptuomov/status/2031639817574834344>`__

Fooled by Randomness, Over-fitting And Selection Bias
-----------------------------------------------------

Software programs that combine technical indicators with entry and exit conditions to design trading strategies can produce impressive equity curves — but due to data-mining bias, it is very difficult to distinguish random strategies from those with genuine predictive power. This article demonstrates how selection bias leads traders astray: when many strategy variations are tested, the best-performing one is almost certainly a statistical fluke rather than evidence of a real edge.

The post offers practical suggestions for minimizing the probability of having found a random strategy, including testing whether the underlying generation process is deterministic, stripping exit logic to evaluate entry timing intelligence, checking if performance degrades with small parameter changes, and comparing strategy results against random entry benchmarks. The core message is that without rigorous controls for data-mining bias, most backtested strategies are simply artifacts of randomness and overfitting.

Mentioned by `Michael Harris (@mikeharrisNY) <https://x.com/mikeharrisNY/status/2031735775356674454>`__ in a discussion about the explosion of overfitted strategy results posted by "pseudo quants."

By Michael Harris.

`Read the blog post <https://www.priceactionlab.com/Blog/2012/06/fooled-by-randomness-through-selection-bias/>`__

Bitcoin Price Formation and Signed Order Flow
----------------------------------------------

Bitcoin prices are strongly shaped by who is aggressively buying and selling — 60% of the variation in its daily returns can be explained by signed order flow. Unlike stocks, which have multiple price anchors beyond trade imbalances, Bitcoin's order flow explains substantially more variance. In this respect, Bitcoin resembles currencies more than equities: foreign exchange pairs show R-squared values exceeding 50%, indicating similarly heavy flow-driven dynamics.

The analysis, using Binance futures data, replicates prior research that found signed flow previously explained 85% of Bitcoin's variability. While order flow's explanatory power has decreased over time, it remains significant at 60% on average, with shorter timeframes revealing ranges from 40% to 80%. Bitcoin exhibits "reflexive, regime-like behavior" with "bursts, pauses, and cascades" driven by flow, positioning, and market depth rather than gradual fundamentals.

Mentioned by `Lev (@LeafiestParapet) <https://x.com/LeafiestParapet/status/2032226896834863165>`__ in a discussion about Bitcoin's flow-driven price dynamics.

By Lev.

`Read the thread <https://twitter-thread.com/t/2032226896834863165>`__

Order Flow Analysis of Cryptocurrency Markets
-----------------------------------------------

An analysis of Level II order book data from the BitMEX XBTUSD perpetual swap contract, examining how order flow imbalance influences price changes in cryptocurrency markets. The post defines and compares two measures: order flow imbalance (OFI), computed from changes in best bid/ask prices and quantities, and trade flow imbalance (TFI), computed from actual executed trades classified as buyer- or seller-initiated.

The key finding is that trade flow imbalance explains up to approximately 75% of price changes at hourly horizons — substantially higher than OFI at longer timescales. The analysis notes that crypto order books are particularly noisy due to spoofing and rapid cancellations, making trade-based measures more reliable than order-book-based ones. The relationship between flow imbalance and price change is linear, confirming classic microstructure price impact models in the crypto context. This work was later published as a formal paper in the Digital Finance journal (2019).

By Ed Silantyev.

`Read the blog post <https://medium.com/@eliquinox/order-flow-analysis-of-cryptocurrency-markets-b479a0216ad8>`__

Order Flow Imbalance — A High Frequency Trading Signal
--------------------------------------------------------

A step-by-step walkthrough of calculating order flow imbalance (OFI) from order book data and evaluating it as a high-frequency trading signal. Using Bitcoin data from Coinbase, the post builds a linear regression model to predict short-term returns from OFI — the net pressure from changes in bid/ask prices and quantities.

The OFI metric shows statistical significance in predicting price direction with an out-of-sample R² of approximately 3% (comparable to academic benchmarks) and a hit ratio of 53%. However, the standalone Sharpe ratio of 0.12 is far below profitable thresholds, and transaction costs would eliminate any edge. The practical takeaway is that OFI is better suited as an input to market-making or execution algorithms — informing quote placement and order timing — rather than as a standalone directional signal.

By Dean Markwick.

`Read the blog post <https://dm13450.github.io/2022/02/02/Order-Flow-Imbalance.html>`__

Dynamic Asset Allocation for Practitioners, Part 3: Risk-Adjusted Momentum
---------------------------------------------------------------------------

A comprehensive study testing 13 different risk-adjusted momentum indicators across 16,116 simulation variations to determine whether accounting for volatility and drawdowns improves momentum-based asset allocation. The metrics tested include Sharpe ratio, Omega ratio, Sortino ratio, Calmar ratio, DVR (Sharpe x R-squared of equity curve), VaR, CVaR, max loss ratio, average drawdown ratio, high-low differential, Ulcer Performance Index, gain-to-pain ratio, and fractal efficiency.

The key finding is that all 13 methods delivered virtually identical median results with an average pairwise correlation of 0.945, suggesting investors inherently exhibit risk awareness when expressing momentum preferences. However, risk-adjusted approaches showed much smaller dispersion than pure price momentum, and aggregating all approaches into a combined index delivered superior risk-adjusted performance with a Sharpe ratio of 1.29 — outperforming any single metric alone. The research demonstrates that diversifying across multiple highly correlated risk-adjusted momentum indicators provides measurable risk-reduction benefits without sacrificing returns.

By ReSolve Asset Management.

`Read the blog post <https://investresolve.com/dynamic-asset-allocation-for-practitioners-part-3-risk-adjusted-momentum/>`__

Dynamic Asset Allocation for Practitioners Part 2: Risk-Adjusted Momentum
--------------------------------------------------------------------------

The second installment in a series on dynamic asset allocation, investigating how 13 risk-adjusted momentum metrics compare to raw momentum for portfolio construction. The research tests across a 10-asset universe spanning commodities, gold, US/European/Japanese/emerging market stocks, international REITs, and treasuries from 1995 onward, using multiple portfolio concentrations (2–5 holdings) and systematic asset removal to minimise selection bias.

The DVR and return-to-max-loss ratio delivered the highest Sharpe ratios, while the Ulcer Performance Index achieved the best return-to-maximum-drawdown performance. A counterintuitive finding: risk-adjusted momentum portfolios exhibited lower Sharpe ratios than raw momentum systems from Part 1, suggesting that disaggregating risk management from momentum signals may produce better results. The gain-to-pain ratio demonstrated the greatest consistency across different asset universes and concentrations.

By Adam Butler, GestaltU.

`Read the blog post <https://www.gestaltu.com/2013/06/dynamic-asset-allocation-for-practitioners-part-2-risk-adjusted-momentum.html/>`__

Risk-Adjusted Momentum Oscillator (RAMO)
-----------------------------------------

An open-source TradingView indicator that combines traditional momentum calculation with real-time risk assessment, addressing a gap in conventional momentum indicators by incorporating drawdown metrics into momentum calculations. The core innovation is a self-regulating system that automatically adjusts signal sensitivity based on current risk conditions using the formula: Risk_Factor = 1 - (Current_Drawdown / Maximum_Drawdown × Scaling_Factor), with a floor of 0.05 to prevent complete signal suppression.

The indicator supports three momentum calculation modes (rate of change, price momentum, log returns) and employs adaptive EMA smoothing where the alpha parameter adjusts based on volatility percentile — faster response during volatile periods, stability during calm markets. Z-score normalisation clamps values to [-3.5, 3.5] for outlier handling. Additional features include momentum acceleration (second derivative) for early trend change detection, linear regression prediction for leading signals, and volume-based exhaustion detection for identifying potential reversals on declining volume. The risk environment classification (low/medium/high based on drawdown depth) filters long signals during high-risk conditions.

By EdgeTools.

`Read the blog post <https://www.tradingview.com/script/EdEL00bP-Risk-Adjusted-Momentum-Oscillator/>`__

Mastering the Calmar Ratio for Risk Analysis
---------------------------------------------

An educational article from Interactive Brokers' Quant News covering the Calmar ratio — a risk-adjusted performance metric that divides annualised return by maximum drawdown. The post explains the ratio's calculation, interpretation, and practical applications for evaluating trading strategies and fund performance, with guidance on what constitutes good, acceptable, and poor Calmar values.

The article positions the Calmar ratio alongside other risk metrics like the Sharpe ratio, Sortino ratio, and Sterling ratio, discussing when each is most appropriate. The Calmar ratio is particularly useful for drawdown-averse investors and strategies where peak-to-trough equity decline is the primary risk concern, though its sensitivity to a single worst drawdown event is noted as a limitation compared to metrics like the Burke ratio or Ulcer Performance Index that incorporate multiple drawdowns.

`Read the blog post <https://www.interactivebrokers.com/campus/ibkr-quant-news/mastering-the-calmar-ratio-for-risk-analysis/>`__

Beyond the Average: Exploring Omega Ratio and Calmar Ratio
-----------------------------------------------------------

An article exploring two sophisticated investment performance metrics that go beyond traditional measures like the Sharpe ratio. The Omega ratio considers the probability of achieving a threshold return level (minimum acceptable return), dividing gains above the threshold by losses below it and capturing the full return distribution without assuming normality. The Calmar ratio compares annualised compound returns to maximum drawdown, typically over a three-year period.

The key distinction is that the Omega ratio separates "good and bad volatility" by differentiating upside potential from downside risk, while the Calmar ratio specifically emphasises downside protection during market declines. Unlike the Sharpe ratio which uses risk-free rates as benchmarks, the Omega approach allows investors to set their own minimum acceptable return, making it a more personalised measure. Neither metric is inherently superior — the Calmar ratio suits conservative investors focused on stability and capital preservation, while the Omega ratio captures outsized gain potential without penalising volatility as heavily.

By FasterCapital.

`Read the blog post <https://www.fastercapital.com/content/Omega-Ratio--Beyond-the-Average--Exploring-Omega-Ratio-and-Calmar-Ratio.html>`__

Advanced Trading Metrics: A 2026 Comprehensive Guide
------------------------------------------------------

A definitive guide examining five essential risk-adjusted metrics for evaluating algorithmic trading strategies: Sharpe ratio, Sortino ratio, Calmar ratio, SQN (System Quality Number), and K-ratio. Each metric is presented with exact formulas, worked examples, professional benchmarks, and honest assessments of when to use or avoid them. The article also covers additional advanced metrics including Omega ratio, Ulcer Index, MAR ratio, and Information and Treynor ratios.

The guide provides a metric selection framework by trading profile: Calmar for conservative traders (direct return-to-drawdown measurement), Sortino for trend followers (recognises positive volatility as desirable), SQN for scalpers and high-frequency traders (values consistency and opportunity frequency), Sharpe for institutional fund managers (industry reporting standard), and K-ratio combined with SQN for system developers (detects overfitting and suspicious equity curves). A key warning: live Sharpe ratios typically run 30–50% lower than backtests, and the author provides a non-negotiable validation checklist requiring Sharpe >1.0, Sortino >1.5, Calmar >0.8, SQN >2.0, and K-ratio >1.5.

By Rubén Villahermosa, Algo Strategy Analyzer.

`Read the blog post <https://algostrategyanalyzer.com/en/blog/advanced-trading-metrics/>`__

The Quant Playbook for Polymarket
----------------------------------

A comprehensive guide to six quantitative formulas that hedge funds use to extract edge from prediction markets like Polymarket. The playbook covers the LMSR (Logarithmic Market Scoring Rule) pricing model that powers Polymarket's AMM, the Kelly Criterion for optimal position sizing, Expected Value gap analysis for detecting mispricings, KL-Divergence for scanning correlated market arbitrage, Bregman Projection for multi-outcome arbitrage optimisation, and Bayesian updating for dynamic probability adjustment in fast-moving markets.

Each formula is presented with mathematical definitions, practical examples from real Polymarket contracts, Python code for implementation, and risk warnings. The author also outlines a system integration pipeline covering data setup via Polygon API, backtesting with walk-forward validation, deployment with cron jobs and Telegram alerts, and risk management using fractional Kelly sizing with drawdown stops.

Mentioned by `0xRicker in this discussion <https://x.com/0xRicker/status/2032798292128522327>`__.

`Read the post <https://x.com/0xRicker/status/2032798292128522327>`__

Using AI to Improve the ADX Indicator for Breakout Trading
-----------------------------------------------------------

A video walkthrough demonstrating how AI-suggested modifications to the ADX (Average Directional Index) indicator can dramatically improve a breakout trading strategy's performance. Thomas Nissendal ("Mr. Breakout") takes an e-mini futures strategy built with his breakout trading formula and replaces its traditionally calibrated ADX filter with an AI-proposed approach: applying a simple moving average directly on ADX values with unified period lengths.

The iterative process shows how raw AI suggestions rarely work out of the box — the initial improvement was promising but insufficient, and trading experience was needed to refine the idea through steps like unifying the ADX and moving average periods and optimising with large increments to avoid overfitting. The final result nearly doubled net profit (from $87K to $200K), cut maximum drawdown almost in half (from $23K to $13K), and improved average trade size and profit factor. The author cautions that robustness testing (stress testing, walk-forward analysis) is still required before live deployment, but rates the AI-enhanced ADX moving average concept at 100% for inclusion in his trading arsenal.

By Thomas Nissendal, Breakout Trading Academy.

`Watch the video <https://www.youtube.com/watch?v=I1BWjv-03QQ>`__

Basic Trend Following: Primer
------------------------------

A practical walkthrough for constructing a basic trend-following program layered on top of a diversified beta benchmark. The author argues that a simple trend program stacked on beta is one of the most defensible investment approaches available: intuitive, empirically grounded, and designed to outperform a passive allocation over a full market cycle.

The construction follows four steps: (1) **Benchmark selection** — a 60/15/15/10 allocation across stocks, bonds, gold, and bitcoin, reflecting the Paul Tudor Jones-style portfolio while retaining bonds as a defensive asset; (2) **Two-speed, binary trend signal** — using 1-month and 6-month lookback windows, taking a full position when both are positive, a half position when signals conflict, and going flat when both are negative; (3) **Risk parity** weighting to equalise risk contribution across assets; and (4) **Dynamic leverage with a maximum volatility cap** to adjust exposure based on realised volatility. Shorts are deliberately excluded — the assets in the benchmark tend to drift upward over time, and successfully shorting them requires a more tactical approach. The 1-month and 6-month lookbacks are not mathematically optimal but are chosen to align with common investor behavioural tendencies.

By `@AahanPrometheus <https://x.com/AahanPrometheus>`__ (Prometheus Macro).

`Read the thread <https://threadreaderapp.com/thread/2020234019108266368.html>`__

Funding Rate Suppression Detection in Crypto Derivatives Markets
-----------------------------------------------------------------

A detailed analysis of funding rate manipulation on centralised crypto exchanges, with a focus on the BEAT token on Binance. The author identifies a stark anomaly: a 2:1 long/short ratio that should produce elevated positive funding, yet the rate sits pinned at 0.005% — flat and unresponsive to market conditions.

To systematically detect this behaviour, Margin Syndicate built a Funding Rate Suppression Detector with four layers: (1) **Cross-sectional analysis** — comparing a token's funding rate against its long/short imbalance relative to every other token on the exchange to flag statistical outliers; (2) **Event response** — checking whether funding moves after liquidation events (e.g. 179K in shorts liquidated with no rate movement suggests instant replacement); (3) **Variance analysis** — identifying tokens with near-zero funding variance over 24+ periods while the rest of the exchange fluctuates normally; and (4) **Cross-exchange comparison** — detecting divergences between venues (e.g. 0.60 short ratio on OKX vs 2.31 long ratio on Binance for the same token).

In a `follow-up discussion <https://www.linkedin.com/feed/update/urn:li:ugcPost:7441884273613246464?commentUrn=urn%3Ali%3Acomment%3A%28ugcPost%3A7441884273613246464%2C7441891124870500352%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287441891124870500352%2Curn%3Ali%3AugcPost%3A7441884273613246464%29>`__, the author maps these findings to MiCA Article 91 market manipulation provisions — covering wash trading ($5M reported volume vs $240 organic), artificial price positioning, dissemination of misleading volume figures, and cross-exchange manipulation via coordinated positions across venues. The mechanics are broken down: running opposing positions to keep the long/short ratio flat, timing around 8-hour settlement windows, instantly replacing liquidated shorts, and pinning the rate at a level too low to attract arbitrage traders but not negative enough to raise automated flags.

By Steven Paterson, `Margin Syndicate <https://marginsyndicate.co.uk/>`__.

`Read the post <https://www.linkedin.com/posts/steven-paterson-10a1619_why-is-the-funding-rate-on-binance-for-beat-ugcPost-7441884273613246464--e41>`__

Building a NASDAQ Pivot Point Breakout Strategy
------------------------------------------------

A step-by-step walkthrough of prototyping, robustness-testing, and cross-validating a pivot point breakout strategy on E-mini NASDAQ (NQ) futures. The setup is minimalist: calculate the daily Pivot S1 from the 4 PM Chicago close, add 2.2× ATR above it, and go long on a breakout — exiting at the close, trading only Mondays and Tuesdays. No indicators or filters beyond the day-of-week restriction.

The robustness testing is thorough. The Space metric (how many pivot-level and multiplier combinations produce positive results) scored 92% on R1 and 86% on S1. The selected 2.2× multiplier ranked first on walk-forward unseen data over three years, and neighbouring values (2.0, 2.4) remained profitable — evidence of a stable parameter region rather than a curve-fitted outlier. Cross-validation across five additional index futures (S&P, Dow, Nikkei, S&P 400, Russell) showed all six passing on both all-time and recent-year data, with Nikkei outperforming NASDAQ. The day-of-week filter was driven by data: Friday was consistently destructive and Thursday marginal, so restricting to Monday–Tuesday improved both average trade quality and net-profit-to-drawdown ratio.

Mentioned by `@onlybreakouts <https://x.com/onlybreakouts>`__ (Breakout Trading Academy) in `this discussion <https://x.com/onlybreakouts/status/2037229660803604972>`__.

`Watch the video <https://www.youtube.com/watch?v=PFI0xLCUx_4>`__

ML-Optimized Dynamic Position Sizing for Trading Strategies
------------------------------------------------------------

A practical demonstration of how machine learning can enhance a baseline trading strategy — not by changing the entry/exit logic, but by optimising position sizing. In a walk-forward out-of-sample test, the baseline and ML-optimised versions share a nearly identical 70% win rate and similar trade counts, yet the ML version delivers +83% higher total return (in R-multiples) while cutting maximum drawdown by 46%.

The edge comes from dynamic, conviction-weighted position sizing. The ML model assigns a probability to each trade and scales risk accordingly: 1.0R at 50–60% conviction, ramping to 2.5R above 70%. Crucially, the model also scales *down* in low-conviction environments, staying small during losing streaks and pressing only when the statistical edge is highest. The result is an asymmetric risk profile — bigger bets on the best setups, smaller exposure during drawdowns — demonstrating that ML's value in systematic trading can lie in bet sizing rather than signal generation. Built with a custom Python pipeline using Scikit-Learn.

Mentioned by `@Eddie_Fibonacci <https://x.com/Eddie_Fibonacci>`__ in `this discussion <https://x.com/Eddie_Fibonacci/status/2037875563180741006>`__.

`Read the post <https://x.com/Eddie_Fibonacci/status/2037875563180741006>`__

Intraday Market Making on Cointegrated Equity Pairs with Avellaneda-Stoikov and Kalman Filter
----------------------------------------------------------------------------------------------

A hands-on walkthrough of building an intraday market-making system that applies the Avellaneda-Stoikov optimal quoting framework to cointegrated equity pairs (WFC/AXP), with dynamic hedge ratio estimation via Kalman Filter on 619K minute bars. The pipeline covers pair selection via cointegration testing across S&P 100 constituents, Kalman Filter with EM calibration for hedge ratios, Avellaneda-Stoikov optimal quoting with fee floors, and out-of-sample validation with phantom fill prevention.

The author emphasises the gap between mathematical elegance and market reality — the first version produced a Sharpe of -11 before six structural bugs were identified and fixed. Out-of-sample results (2024–2026, net of costs) show a Sharpe Ratio of 1.21, net PnL of +$4,870 on $100K notional (peak capital deployed ~$36K, yielding 13.56% over 27 months or ~5.9% annualised), and a maximum drawdown of -2.49% with the model active on 100% of bars. Full source code is available on GitHub.

By `Duarte Abraços <https://www.linkedin.com/in/duarte-abracos>`__.

`Read the post <https://www.linkedin.com/posts/duarte-abracos_quantitativefinance-algorithmictrading-marketmaking-share-7443324306358505472-vSu1>`__

Liminal and Rysk: Two Approaches to Yield Generation on Hyperliquid
--------------------------------------------------------------------

A detailed comparison of two DeFi protocols building yield-generating products on Hyperliquid's perpetual futures infrastructure: Liminal and Rysk Finance. Liminal automates delta-neutral carry strategies by holding spot and shorting perpetuals to capture funding rate payments — a technique long used by professional trading desks. Since crypto perpetual funding rates are positive 85–90% of the time (longs pay shorts), Liminal positions users on the receiving end. The neutral funding rate on Hyperliquid has historically averaged around 10.95% annualised, with rates spiking significantly during high-leverage demand periods. Users deposit stablecoins and receive yield-bearing xTokens (xHYPE, xBTC) that appreciate as funding accumulates, with composability across DeFi lending markets enabling stacked yields.

Rysk takes a different approach, generating yield from options volatility premiums through covered calls and cash-secured puts. The protocol uses a Request for Quote (RFQ) system where market makers compete in 2-second auctions to price options, with settlement handled on-chain. Covered calls on BTC offer 10–142% annualised depending on strike distance, while cash-secured puts pay users a premium for committing to buy at a lower price — effectively monetising conviction while waiting. All options are European-style, physically settled, and fully collateralised. The article provides concrete examples with current pricing, making it a practical primer on how both funding rate capture and options writing work as systematic yield strategies in crypto derivatives markets.

Mentioned by `@0xMacroGuy <https://x.com/0xMacroguy>`__ in `this discussion <https://x.com/0xMacroguy/status/2038991439162413164>`__.

`Read the article <https://x.com/0xMacroguy/status/2038991439162413164>`__

Fat Tails in Crypto Markets and Implications for Market Making
--------------------------------------------------------------

A concise analysis of why standard Gaussian assumptions fail in crypto market microstructure and what this means for market making strategies. Standard financial literature models order arrivals as Poisson, uses Geometric Brownian motion for optimal control, and assumes normally distributed returns — but crypto markets, especially at high frequency, exhibit kurtosis an order of magnitude above Gaussian assumptions.

The post explains how fat-tailed distributions interact with crypto-specific dynamics: in markets with points or liquidity incentives where daily volume runs 10–20x open interest, prices behave like an Ornstein–Uhlenbeck process, which is part of why medium-frequency mean reversion works in perpetual futures. For market makers, fill sizes are extremely fat-tailed with larger fills carrying negative 5-second markouts, meaning naive linear-cost models produce equity curves that only go down. The practical takeaway: market making requires a convex payoff structure with respect to risk — a super-linear premium for taking it on and a sub-linear cost for exiting — along with contrarian treatment of signals like order imbalance by estimating reversal probabilities.

By `Alcibiades <https://x.com/0xAlcibiades>`__.

`Read the post <https://x.com/0xAlcibiades/status/2039679350572728376>`__

Most-Predictive: Which Microstructure Metric Best Forecasts Short-Term Crypto Returns
--------------------------------------------------------------------------------------

An interactive notebook from Aperiodic that tackles a deceptively simple question: across the full catalog of crypto microstructure metrics — order flow, book imbalance, funding rates, trade size distributions, spread dynamics — which single metric is the most predictive of short-term returns? The notebook provides a reproducible framework for ranking dozens of pre-aggregated metrics by their forecasting power across instruments and horizons, letting users run the same analysis to surface similar signals on their own.

The approach works because crypto perpetual futures have a relatively transparent microstructure where aggressive (taker) order flow is the primary short-term price driver. Market makers continuously adjust quotes in response to net buy/sell pressure, so metrics that capture directional flow imbalance — the difference between taker buy and taker sell volume — tend to carry strong predictive signal over intrabar and multi-bar horizons. Unlike derived indicators built on price alone, order flow metrics observe the cause (aggressive trading activity) rather than the effect (price movement), giving them a structural information advantage. The notebook demonstrates this empirically: flow-based features dominate book-state and derivatives-based features in out-of-sample predictive power, consistent with the broader academic literature on order flow and cryptocurrency returns. For practitioners, the key takeaway is that a single, well-constructed order flow metric can outperform complex multi-factor models for short-horizon alpha, especially in instruments with high taker-driven volume like BTC and ETH perpetuals.

The notebook sits within a broader framework described by the same author in `How Speculative Money Flows into Crypto <https://blog.unravel.finance/p/how-speculative-money-flows-into>`__, which maps the full chain of crypto liquidity drivers from the outside in: macro-level speculative flow (measured via Bitcoin's rolling correlation with gold versus tech equities), ecosystem-level capital inflows (stablecoin exchange deposits tracked across 40+ exchanges, spot ETF netflows), and leverage proxies (perpetual funding rates, liquidation volumes, long/short ratios, margin borrow rates). Each layer operates on a different timescale — macro factors are slow-moving regime indicators, stablecoin flows are medium-frequency positioning signals, and microstructure metrics like order flow imbalance update tick-by-tick.

This layered view explains why the "most predictive" metric for short-term returns comes from the innermost ring: at the shortest horizons, the macro and ecosystem layers are essentially constant, so all the predictive variation concentrates in order-level activity. The framework also highlights the risk management application — when ecosystem-wide leverage is elevated and capital inflows are drying up, even a small shock can cascade into forced liquidations. A composite speculative flow index that combines metrics across these layers shows meaningful predictive power for medium-term drawdown risk, complementing the short-horizon alpha signal that the most-predictive notebook isolates.

Mentioned by `Mark Aron Szulyovszky <https://www.linkedin.com/in/almostintuitive/>`__ in `this discussion <https://www.linkedin.com/posts/almostintuitive_its-kind-of-an-open-secret-in-crypto-microstructure-share-7444821512399781888-EEfI>`__: "It's kind of an open secret in crypto microstructure: one metric predicts short-term returns better than almost anything else."

By `Aperiodic <https://aperiodic.io>`__.

`Run the notebook <https://aperiodic.io/notebooks/most-predictive>`__

Cross-Sectional Alpha Factors in Crypto: 2+ Sharpe Ratio Without Overfitting
-----------------------------------------------------------------------------

An in-depth examination of how traditional quantitative finance factor models — originally developed for equities by Fama and French — can be adapted to cryptocurrency markets to generate alpha. The authors argue these factors still qualify as alpha in crypto because the market hasn't fully arbitraged them away. The methodology involves constructing long/short factor portfolios across the top 50 digital assets by market cap: ranking tokens daily by a chosen metric, going long the top 20% and short the bottom 20% to isolate factor exposure while maintaining zero directional market exposure.

The research focuses on two primary factors: cross-sectional momentum (which operates on ~30-day horizons in crypto, much shorter than the 6–12 months typical in equities) and carry (exploiting perpetual futures funding rate differentials using open-interest-weighted composite rates across exchanges). By combining momentum and carry into a multi-factor portfolio, the researchers achieve a 2+ Sharpe ratio. Key practical challenges addressed include survivorship bias from delisted tokens, extreme volatility dispersion between Bitcoin and memecoins, and limited reliable data before 2020. The authors apply inverse volatility weighting and volume filters to manage these issues, and find that diversification benefits plateau at roughly six factors with achievable Sharpe ratios around 2.5 for single portfolios.

By Mark Aron Szulyovszky and Daniel Szemerey.

`Read the blog post <https://blog.unravel.finance/p/cross-sectional-alpha-factors-in>`__

The Unreasonable Effectiveness of Volatility Targeting — and Where It Falls Short
----------------------------------------------------------------------------------

Part 1 of an investigative series on how quantitative risk management can enhance risk-adjusted returns. The post explores volatility targeting — a technique for maintaining consistent portfolio volatility through active exposure adjustments using inverse volatility scaling, where exposure decreases as an asset becomes more volatile. The author describes it as "among the very few effective, universal techniques in quantitative finance," alongside diversification.

A central paradox emerges: while high-volatility periods historically produce higher forward returns, volatility targeting paradoxically improves risk-adjusted performance by reducing exposure during these periods. The explanation lies in volatility drag — the mathematical distinction between cumulative returns (multiplicative) and average returns (additive). Applying volatility targeting to the S&P 500 typically yields 10–20% improvements in risk-adjusted returns. However, the author identifies critical blind spots: low-volatility regimes can mask systemic risks when market liquidity structurally declines, leverage across the financial system remains elevated, or implied volatility reaches historically suppressed levels. The August 2024 market disruption exemplified how synchronized de-leveraging events can overwhelm volatility-targeting protections. The post proposes incorporating forward-looking, exogenous risk factors alongside historical volatility metrics. An open-source Python package called "risklab" is referenced for transparent implementation.

By Mark Aron Szulyovszky.

`Read the blog post <https://blog.unravel.finance/p/the-unreasonable-effectiveness-of>`__

How Speculative Money Flows into Crypto
---------------------------------------

A framework for understanding and predicting speculative capital flows into cryptocurrency markets, structured across three concentric layers. The outermost layer examines macro/global factors including momentum spillover effects from other asset classes — particularly cloud computing sector momentum as a leading indicator for Bitcoin — and Bitcoin-Gold correlation as a proxy for institutional safe-haven perception. The middle layer tracks ecosystem entry points via stablecoin market capitalization, stablecoin exchange inflows (capital "parked for purchasing"), and Bitcoin spot ETF netflows representing institutional interest.

The innermost layer monitors internal leverage metrics: perpetual futures funding rates, liquidation volumes, long/short position ratios, and margin borrowing rates. The author recommends reducing directional exposure when speculative flows decelerate and proactively cutting positions during over-leveraged periods before liquidation cascades. These signals prove even more effective on smaller-cap, more speculative assets like Ethereum. The key insight is that traditional volatility-based risk management is insufficient given crypto's leverage concentration and lack of circuit-breakers — incorporating exogenous money-flow and liquidity metrics provides a superior risk framework for digital asset portfolio management.

By Mark Aron Szulyovszky.

`Read the blog post <https://blog.unravel.finance/p/how-speculative-money-flows-into>`__

Aperiodic: Democratizing Crypto Order Flow, Liquidity & Market Microstructure Metrics
--------------------------------------------------------------------------------------

An announcement and technical overview of Aperiodic, a cryptocurrency data platform designed to democratize access to institutional-grade market microstructure metrics. The authors identify a significant gap in the crypto data market where existing platforms provide incomplete solutions: building quantitative strategies requires point-in-time data, comprehensive liquidity metrics, unique microstructure indicators, full exchange coverage without survivorship bias, and locally-timestamped time series — and existing providers typically offer only one or two of these.

Aperiodic provides over 100 metrics including deep L2 order book imbalances across multiple depth levels, flow entropy (Shannon entropy measuring order flow predictability — low entropy indicates structured, trend-friendly markets; high entropy suggests choppy, mean-reverting conditions), slippage against live order books, Kyle Lambda (price impact per unit of signed order flow), and large trade reversal metrics distinguishing informed flow from uninformed liquidity-driven flow. The platform delivers pre-signed parquet files enabling unlimited concurrent downloads, with a lightweight Python wrapper for simplified access. This eliminates the need for organizations to independently purchase, store, and maintain terabytes of raw tick data.

By Mark Aron Szulyovszky and Daniel Szemerey.

`Read the blog post <https://blog.unravel.finance/p/aperiodic-democratizing-crypto-order>`__

Research Bits #1: The Most Underrated Metric in (Factor) Research
-----------------------------------------------------------------

A short research piece highlighting a critical but often overlooked insight in quantitative factor research: portfolio turnover deserves equal consideration alongside information coefficient (IC) when evaluating trading factors. The authors argue that "high IC is essential, but not sufficient by itself" — high-turnover and low-turnover factors operate as fundamentally different instruments and should not be directly compared without accounting for implementation costs and statistical significance.

The team's approach treats turnover as a first-class citizen in their research methodology by standardizing factors to target a specific daily turnover threshold (30–40% for high-turnover factors) before examining performance metrics. This prevents selection bias favoring high-turnover strategies and enables meaningful cross-factor comparisons. The practical example uses their highest-variance factor, Altair, which without smoothing exhibits approximately 100% daily turnover — impractical once transaction costs are included. Applying a 20-day moving average reduces turnover to target levels while preserving the underlying signal. The key takeaway is that enforcing turnover constraints upfront rather than through post-hoc performance analysis helps researchers avoid overfitting and produce comparable, deployable strategies.

By Mark Aron Szulyovszky and Daniel Szemerey.

`Read the blog post <https://blog.unravel.finance/p/research-bits-1-the-most-underrated>`__

The Delta-Neutral Funding Rate Mechanics Problem: Entry Rate vs. Settlement Rate
---------------------------------------------------------------------------------

A Twitter thread by @zirodelta examining a key flaw in delta-neutral funding rate strategies: the assumption that the rate you enter at is the rate you receive. Ethena's $3B AUM delta-neutral strategy proved the core thesis — short the perp, hold spot, collect funding — but leaves open a crucial mechanics problem: funding periods run every 1–8 hours depending on the exchange, and the published rate is continuously recalculated within that window. If you enter at 0.03% per 8h but the rate drifts to 0.01% before settlement, you settle at the time-weighted average, not the entry rate. Ethena hedges this across many symbols, but does not eliminate the basis — it hedges it with size.

The thread argues that sharp Sharpe ratios in delta-neutral backtests are misleading: if you backtest using the published 8h rate and assume that is what you receive, you are overstating yield. Direction is predictable (89% of extreme rates mean-revert within 24 hours across a dataset of 9.4M settlements), but magnitude is not — Ornstein-Uhlenbeck describes the direction of travel, not the landing point. The thread introduces "Settled," a protocol designed to address magnitude uncertainty through binary outcomes resolving against actual settled rates. The analogy drawn is to interest rate swaps, which decoupled direction from duration risk; funding rate derivatives do the same one layer down.

By `@zirodelta <https://x.com/zirodelta>`__.

`Read the thread <https://twitter-thread.com/t/2040067413002289243>`__
