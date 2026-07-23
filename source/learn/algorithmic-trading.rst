.. meta::
   :description: Research papers and posts on algorithmic trading, execution, strategy development, live deployment, and operational aspects of systematic trading.

Algorithmic Trading
~~~~~~~~~~~~~~~~~~~

Algorithmic trading encompasses the full lifecycle of systematic strategy development: from theoretical research and backtesting through live infrastructure, execution, and ongoing operations. The gap between a profitable backtest and a profitable live system is substantial — execution costs, data pipeline failures, market capacity constraints, and the psychological challenges of trusting systems during drawdowns all require active management. The research here addresses both the theoretical frameworks for optimal execution and the practical realities of running automated trading at scale.

This collection covers optimal execution theory (Gârleanu-Pedersen on alpha decay and transaction costs, Lehalle-Neuman on signal-aware execution), practical case studies in execution cost reduction, infrastructure development for multi-asset portfolios, and the operational wisdom needed to run systematic trading as a business. A recurring theme is that execution-aware portfolio construction and robust live infrastructure are as important as signal research — a strategy that works in theory but generates excessive slippage or fails in production creates no value.

Related topics include :doc:`Backtesting & Research Methodology <./backtesting>` for strategy validation before deployment, :doc:`Portfolio Construction <./portfolio-construction>` for multi-asset capital allocation, and :doc:`Market Microstructure <./market-microstructure>` for the theoretical foundations of price formation and execution.

Can Day Trading Really Be Profitable? Evidence from Opening Range Breakouts
---------------------------------------------------------------------------

This paper examines the profitability of opening range breakout (ORB) strategies applied to a filtered portfolio of high-activity U.S. stocks over 2016-2023. The study provides rigorous empirical evidence on whether intraday day trading strategies can generate risk-adjusted alpha after accounting for transaction costs.

Key metrics: the study reports a 2.81 Sharpe ratio and 36% annualized alpha for a 5-minute ORB applied to stocks with unusual pre-market activity from 2016-2023.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4729284>`__

151 Trading Strategies
----------------------

This reference covers over 150 distinct trading strategies across equity, fixed income, currency, and commodity markets, organized by asset class and strategy type. Each strategy includes a description of the signal, implementation details, and academic references, making it the most comprehensive publicly available catalog of systematic trading approaches.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3247865>`__

Dynamic Trading with Predictable Returns and Transaction Costs
--------------------------------------------------------------

Nicolae B. Gârleanu and Lasse H. Pedersen (NBER Working Paper 15205, 2009; Journal of Finance, 2013) derive a closed-form optimal portfolio strategy when security returns are predictable and trading is costly. The optimal policy rests on two principles: "aim in front of the target" and "trade partially towards the current aim." The updated portfolio combines existing holdings with an aim portfolio that is itself a weighted average of the current Markowitz-optimal allocation and expected future allocations, with slower-decaying predictors receiving more weight.

Our summary: this is the canonical paper linking alpha signals, transaction costs, and optimal rebalancing in a tractable multi-period framework. Its most important insight is that with trading costs the optimal response to a signal is never to jump to the frictionless target portfolio; instead the investor trades partially toward a moving aim that already looks past the current signal and anticipates where the portfolio should be once the signal decays. That reframes position sizing as a control problem rather than a single-period optimization.

Key metrics: the authors derive the optimal trading rule in closed form and validate it on commodity futures, showing that the dynamic cost-aware policy produces better risk-adjusted returns than static Markowitz strategies that ignore transaction costs.

`Read the paper <https://www.nber.org/papers/w15205>`__

Incorporating Signals into Optimal Trading
-------------------------------------------

Charles-Albert Lehalle and Eyal Neuman (Finance and Stochastics, 2019) extend the optimal execution literature to include exogenous Markovian predictive signals alongside transient market impact. Building on the framework of Gatheral, Schied, and Slynko, they prove existence of an optimal strategy when a trader must liquidate a position while reacting to a signal that itself follows a Markov process, and they derive explicit solutions for the case of an Ornstein-Uhlenbeck signal.

Our summary: this paper is the natural companion to Gârleanu-Pedersen on the execution side. Rather than treating the trading schedule and the signal as separate problems, Lehalle and Neuman show that once you admit a predictive signal plus market-impact costs, the optimal trading rule is inherently continuous and state-dependent — there is no clean cutoff between "execution" and "alpha capture." It is the standard reference for anyone building signal-aware execution engines.

Key metrics: the authors empirically validate the model on nine months of tick-by-tick data from 13 European stocks, showing that order book imbalance has predictive power for future price moves and exhibits mean-reverting dynamics consistent with the Ornstein-Uhlenbeck assumption.

`Read the paper <https://doi.org/10.1007/s00780-019-00382-7>`__

On the Effect of Alpha Decay and Transaction Costs on the Multi-period Optimal Trading Strategy
-------------------------------------------------------------------------------------------------

Chutian Ma and Paul Smith (2025) study portfolio optimization for a single asset with long and short positions where transaction costs make frequent rebalancing unattractive and historical signal values carry predictive content. They frame the problem as an infinite-horizon Markov Decision Process and contribute a modified value iteration algorithm with a convergence proof, along with first-order approximations and asymptotic expansions for the optimal policy under small transaction costs.

Our summary: this is a recent refinement of the Gârleanu-Pedersen line of work, shifting the frame from closed-form linear-Gaussian solutions to dynamic programming under signal decay. For practitioners this matters because alpha decay is almost always the binding constraint in post-cost portfolio design, and the asymptotic formulas let you reason about how aggressively to trade as a function of the decay rate without simulating the full MDP.

`Read the paper <https://arxiv.org/abs/2502.04284>`__

Saving $200/Day in Execution Costs by Solving Market Capacity Constraints
--------------------------------------------------------------------------

A practical case study in dealing with market capacity constraints when scaling a trading strategy to larger capital allocations. The author describes hitting execution cost walls when increasing allocation to a strategy on a relatively new market, demonstrating the gap between theoretical backtesting and real-world execution.

The article covers the execution improvements built to reduce trading costs, showing savings of $200-400 per day on a single strategy. It reinforces that backtests are merely sanity tests and that managing execution costs is one of the most impactful optimizations a systematic trader can make, especially when scaling into new strategies and markets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/when-scaling-bites-back-a-200day>`__.

Why Trading is the Wrong Term for Systematic Portfolio Management
-----------------------------------------------------------------

Research Article #72 from Trading Research Hub. Reframes how systematic traders should think about their activity. The piece argues that the common understanding of "trading" as buying and selling misses the deeper reality of what profitable systematic trading actually involves as a business and research endeavor.

The article explores the systematic trading process from a business perspective, examining how the research, development, and risk management aspects of running trading systems are fundamentally different from the popular conception of trading. This reframing has practical implications for how traders allocate their time and build their operations.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/trading-is-the-wrong-term-for-what>`__.

Building Systematic Trading Infrastructure: From Backtests to Live Deployment
------------------------------------------------------------------------------

Research Article #54 from Trading Research Hub. Bridges the gap between theoretical trading strategy research and practical live deployment. The author discusses the transition from generating equity curves in backtests to actually deploying capital on live strategies, addressing the infrastructure requirements for systematic trading.

The article covers the key components needed for a production trading system, including data pipelines, signal generation, execution management, and monitoring. It emphasizes that the real challenge of systematic trading is not developing strategies but building the reliable infrastructure needed to run them continuously in live markets with real capital at risk.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/building-systematic-trading-infrastructure>`__.

The Realities and Operational Challenges of Running Algorithmic Trading Systems
-------------------------------------------------------------------------------

An article covering the operational realities of running automated trading systems, including infrastructure reliability, risk monitoring, and the management of live positions across multiple strategies. The piece addresses the gap between strategy research and the operational complexity of deploying and maintaining algorithmic trading systems in production.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-realities-of-running-algo>`__.

From Market Observation to Testable Hypothesis: Starting Steps of a Trading Model
----------------------------------------------------------------------------------

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

Multi-Model Diversification: Balancing Strategy Variety Against Over-Diversification
-------------------------------------------------------------------------------------

An article exploring the optimal approach to combining multiple trading strategies in a systematic portfolio. The piece examines the trade-off between diversification benefits from running many uncorrelated strategies and the operational complexity, research dilution, and diminishing returns that come from over-diversification.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/multi-model-diversification-balancing>`__.

Understanding Directional Edge Decay and System Robustness in Trading
----------------------------------------------------------------------

An article on the concept of edge decay in systematic trading — the gradual erosion of a strategy's profitability as market participants adapt, conditions change, or the signal becomes crowded. The article provides frameworks for detecting early signs of edge decay and building systems that remain robust across different market environments.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/understanding-edge-decay-systematic>`__.

Building Regime-Robust Trading Systems Through Market Cycle Analysis
--------------------------------------------------------------------

An article on building robust long-term trading systems, explaining the market dynamics of inventory accumulation and distribution. The article describes how a trading system with a reliable signal acts like a lighthouse, attracting market participants and creating the conditions for profitable trading through systematic inventory management.

The article emphasizes the importance of distinguishing between systems that work in specific market conditions (like 2020's bull market) versus those that are genuinely robust across different regimes.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-market-seas-the-art-and>`__.

What Constitutes Genuine Edge in Financial Markets
---------------------------------------------------

An article examining what separates genuine trading edge from random luck or temporary market inefficiencies. The piece explores the characteristics that make a trading edge durable — persistence across different market conditions, economic rationale, and robustness to small parameter changes.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/what-constitutes-genuine-edge>`__.

Building a Crypto Market Scanner in Python with Binance API
------------------------------------------------------------

A technical tutorial on building an automated cryptocurrency market scanner in Python using the Binance API. The article covers the practical implementation of a system that monitors a universe of crypto assets in real time, filtering for conditions that meet specific criteria for potential trading opportunities.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/building-a-crypto-market-scanner>`__.

Key Lessons from The Robot James on Quantitative Trading
--------------------------------------------------------

Research Article #24 from Trading Research Hub. A comprehensive compilation and analysis of key lessons from The Robot James, one of the most respected figures in online quantitative trading. The author spent nearly six hours reviewing publicly available content to distill the most important insights from an experienced practitioner.

The central theme revolves around finding profitable opportunities in uncompetitive niches, summarized by the principle of "doing useful things that suck." The article covers practical wisdom on systematic trading strategy development, risk management, and the business aspects of running a quantitative trading operation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-24-the-robot-james>`__.

The Signal Types Needed for Trading
-------------------------------------

An article classifying trading signals by type — binary (on/off), ensemble (combined scoring), and continuous (scaled exposure) — and explaining when each is appropriate for systematic portfolio management. The piece addresses how signal type affects portfolio construction, position sizing, and capital efficiency.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/signal-types-systematic-trading>`__.

Building a Crypto Trade Execution Model in Python
-------------------------------------------------

A practical article covering the construction of a trade execution model in Python for cryptocurrency trading. The article moves beyond theoretical strategy development to address the real-world challenge of converting signals into actual market orders.

The article covers common execution challenges including handling API connections, managing order states, dealing with partial fills, and general tips for making execution code as robust as possible. It provides a practical foundation for traders looking to automate their strategy execution, bridging the gap between backtested strategies and live trading systems.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/building-a-simple-crypto-trade-execution>`__.

Transitioning from Discretionary to Systematic Crypto Trading
--------------------------------------------------------------

An article presenting a systematic approach to trading for traders struggling with consistent losses. Drawing from the author's personal experience of nearly two years of consistent monthly losses before turning things around, the article outlines the framework that made the difference.

The article covers the transition from discretionary to systematic trading, emphasizing the importance of having a defined process, proper risk management, and realistic expectations. It provides a practical roadmap for traders looking to adopt a more disciplined, rules-based approach to cryptocurrency trading.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/stop-losing-money-trading-today-a>`__.

The CoinAlg Bind: Profitability-Fairness Tradeoffs in Collective Investment Algorithms
---------------------------------------------------------------------------------------

This paper analyzes the tension between profit maximization and fair treatment of investors in collective investment algorithms. The "CoinAlg Bind" describes the fundamental tradeoff where strategies that maximize aggregate portfolio returns may systematically disadvantage certain investor classes, with implications for the design of pooled investment vehicles and robo-advisors.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851168>`__

A Quantitative Trading Strategy Based on A Position Management Model
---------------------------------------------------------------------

This paper presents a quantitative trading strategy that integrates ARIMA-based return forecasting with a systematic position management model for gold and bitcoin. The framework translates probabilistic return forecasts into position sizing decisions that account for forecast confidence and current market conditions.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851167>`__

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

Market Data Is Social Data: From Fractals to Topological Data Analysis
----------------------------------------------------------------------

A price is what two strangers agreed on for one instant before they disagreed again. This post argues that market data is fundamentally social data, and any model that ignores the human participants gets the tail behaviour wrong. It walks through four frameworks that all converge on the same conclusion.

First, the Gaussian random walk fails on four counts: real moves are larger than predicted, volatility clusters in time, price changes carry exploitable structure, and the distribution itself drifts across decades. Mandelbrot's multifractal model (1997) keeps the randomness but changes the geometry — the scaling exponent ζ(q) bends into a curve for real markets, meaning small and large moves follow different rules, and heavy tails are baked into the scaling rather than patched on. Second, sentiment analysis (Bollen et al. 2010) showed Twitter mood correlating with DJIA direction at 87.6% accuracy, but the post is properly skeptical: one sample, one period, no transaction costs — the mechanism (attention clusters cause volatility clusters) is more durable than the headline number. Third, topological data analysis (Gidea & Katz 2018) treats price history as a point cloud and measures its shape via persistent homology; persistence landscapes spiked before the 2000 and 2008 crashes, but this is an in-sample demonstration on known events, not a validated forecast. Fourth, Schadner (2021) applies multifractal fluctuation analysis to sentiment itself and finds the same fingerprint: long memory, fat tails, with persistence strongest when fear dominates — crashes are more structured than rallies.

The post's bottom line: all four lenses agree markets are social, fat-tailed, memory-laden, and prone to phase transitions. None of them is selling a forecast. The fractal-to-topology arc is a reason to respect the tails and size for them, not a crystal ball.

Related papers added alongside this post: :ref:`multifractal-model-asset-returns` in :doc:`./time-series`, :ref:`twitter-mood-predicts-stock-market` and :ref:`wisdom-of-twitter-crowds` below, :ref:`tda-landscapes-of-crashes` in :doc:`./time-series`, :ref:`giotto-tda-toolkit` in :doc:`./code-repositories`, and :ref:`persistence-market-sentiment` in :doc:`./volatility`.

By Ali H. Askar (Aligrithm).

`Read the blog post <https://aligrithm.com/market-data-is-social-data-from-fractals-to-topological-data-analysis/>`__.

.. _twitter-mood-predicts-stock-market:

Twitter Mood Predicts the Stock Market
--------------------------------------

Bollen, Mao, and Zeng analyse whether collective mood states derived from Twitter feeds can predict the Dow Jones Industrial Average. They parse tweets through OpinionFinder (positive/negative) and Google-Profile of Mood States (six dimensions: Calm, Alert, Sure, Vital, Kind, Happy), then test Granger causality and a Self-Organizing Fuzzy Neural Network on daily DJIA changes.

The headline result is 87.6% accuracy predicting daily DJIA direction, with a 6% reduction in Mean Average Percentage Error when the "Calm" dimension is included. The result should be treated with appropriate scepticism: it is one sample of one period (Feb–Dec 2008), one market, no transaction costs, and every degree of freedom that sentiment pipelines quietly burn. What survives the scepticism is the mechanism — volatility clusters because attention clusters — not the specific accuracy number. Published in the Journal of Computational Science, Volume 2, Issue 1, 2011.

`Read the paper <https://arxiv.org/abs/1010.3003>`__

.. _wisdom-of-twitter-crowds:

The Wisdom of Twitter Crowds: Predicting Stock Market Reactions to FOMC Meetings via Twitter Feeds
--------------------------------------------------------------------------------------------------

Azar and Lo investigate whether Twitter sentiment contains predictive information about stock market reactions to Federal Open Market Committee (FOMC) meetings. The paper addresses the natural scepticism about social media data quality — anyone can tweet about markets regardless of expertise — and shows that despite the noise, aggregate Twitter sentiment around FOMC announcements does carry signal about subsequent market moves.

The key contribution is demonstrating that the "wisdom of crowds" effect operates even in the noisy, self-selected population of financial Twitter: aggregation across many low-quality signals can still produce useful information. Published in The Journal of Portfolio Management, Volume 42, Issue 5, 2016.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2756815>`__

Forecasting Model Selection by Time Horizon
--------------------------------------------

A practitioner's heuristic for choosing forecasting models in crypto and other fast-moving markets: use XGBoost for horizons of 5 minutes and below, and Ridge regression for 15 minutes and above. The rationale is that short horizons benefit from the non-linear feature interactions XGBoost captures, while longer horizons reward the regularisation and stability of Ridge. As an intermediate approach, fitting non-parametric regressions per feature on top of Ridge can capture non-linearities without the overfitting risk of a full gradient-boosted model. A further refinement is to add a hypothesis test before fitting: only fit the non-parametric model for a given feature if the hypothesis validates, reducing the degrees of freedom burned and keeping the model closer to the simpler Ridge baseline.

This is a concise distillation of practical experience rather than a formal study, but it aligns with a well-known pattern in quantitative finance: simpler models tend to dominate at longer horizons where noise overwhelms complex interactions, while tree-based models can exploit richer structure in high-frequency data where the signal-to-noise ratio is higher.

Mentioned by `Stat Arb (@quant_arb) in this discussion <https://x.com/quant_arb/status/2064277274451697953>`__.

`Read the post <https://x.com/quant_arb/status/2064277274451697953>`__

A London-Session Continuation Model: 9.5 Years, 3 Markets, Frozen Rules
----------------------------------------------------------------------

Oscar-K-Trader (@OKTrader14), a Netherlands-based day trader, shares a mechanical London-session continuation model summarised as "my whole trading style in one chart" — a single systematic strategy backtested over 9.5 years across three markets (the charts reference EURUSD, NAS100 and GER40). It is an ICT/"smart money"-style intraday setup, but frozen into fixed rules and run as a strategy tester rather than traded discretionarily. The stated appeal is transparency: real backtest trade lists with the equity curves attached, "not a signal service — just the system, with the receipts."

The rules, as described in the thread: take the higher-timeframe bias, wait for a pullback that sweeps liquidity into a 4H/1H fair-value gap, let the 5-minute structure shift back in the direction of the trend, and enter on the retest of that structure shift. The stop goes past the liquidity sweep, the target is a fixed R multiple, and every position is closed flat by night (no overnight risk). The edge is explicitly an asymmetric-payoff, low-win-rate design: across 1,343 trades, 62% move at least +0.5R in favour and 41% reach a full +1R, while the win rate is only 44% "low on purpose" — the winners are larger than the losers, which the author frames as "the whole game." A follow-up notes the indicator and strategy tester are built and a fully mechanical worked example was posted for a trade on 16 July.

The headline performance, on one account trading all three tickers: +251% trading through news events, or +163% if you sit out every FOMC / CPI / NFP day, with a maximum drawdown of about 12% and a worst single day over the full 9.5 years of −1.61%. As with any single-author, self-reported backtest of a discretionary-style setup rendered mechanical, the usual caveats apply — the numbers are the author's own and the concern is how faithfully the "frozen rules" capture what was historically a judgement-based read of liquidity and structure — but the thread is unusually specific about trade counts, R-distribution and the news-on/news-off split.

Posted by `Oscar-K-Trader (@OKTrader14) in this thread <https://x.com/OKTrader14/status/2079969531133415929>`__.

`Read the thread <https://x.com/OKTrader14/status/2079969531133415929>`__
