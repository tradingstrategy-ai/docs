.. meta::
   :description: Research papers and posts on algorithmic trading, execution, strategy development, live deployment, and operational aspects of systematic trading.

Algorithmic Trading
~~~~~~~~~~~~~~~~~~~

Algorithmic trading encompasses the full lifecycle of systematic strategy development: from theoretical research and backtesting through live infrastructure, execution, and ongoing operations. The gap between a profitable backtest and a profitable live system is substantial — execution costs, data pipeline failures, market capacity constraints, and the psychological challenges of trusting systems during drawdowns all require active management. The research here addresses both the theoretical frameworks for optimal execution and the practical realities of running automated trading at scale.

This collection covers optimal execution theory (Gârleanu-Pedersen on alpha decay and transaction costs, Lehalle-Neuman on signal-aware execution), practical case studies in execution cost reduction, infrastructure development for multi-asset portfolios, and the operational wisdom needed to run systematic trading as a business. A recurring theme is that execution-aware portfolio construction and robust live infrastructure are as important as signal research — a strategy that works in theory but generates excessive slippage or fails in production creates no value.

Related topics include :doc:`Backtesting & Research Methodology <./backtesting>` for strategy validation before deployment, :doc:`Portfolio Construction <./portfolio-construction>` for multi-asset capital allocation, and :doc:`Market Microstructure <./market-microstructure>` for the theoretical foundations of price formation and execution.

For complete worked examples of trading strategies and individual factors, see :doc:`Strategy Examples <./strategy-examples>` and :doc:`Factor Examples <./factor-examples>`.

.. _example-can-day-trading-really-be-profitable-evidence-from-opening-r:

Can Day Trading Really Be Profitable? Evidence from Opening Range Breakouts
---------------------------------------------------------------------------

This paper examines the profitability of opening range breakout (ORB) strategies applied to a filtered portfolio of high-activity U.S. stocks over 2016-2023. The study provides rigorous empirical evidence on whether intraday day trading strategies can generate risk-adjusted alpha after accounting for transaction costs.

Key metrics: the study reports a 2.81 Sharpe ratio and 36% annualized alpha for a 5-minute ORB applied to stocks with unusual pre-market activity from 2016-2023.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4729284>`__

151 Trading Strategies
----------------------

This reference covers over 150 distinct trading strategies across equity, fixed income, currency, and commodity markets, organized by asset class and strategy type. Each strategy includes a description of the signal, implementation details, and academic references, making it the most comprehensive publicly available catalog of systematic trading approaches.

`Read the paper <https://doi.org/10.1007/978-3-030-02792-6>`__

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

`Read the paper <https://arxiv.org/abs/2601.00523>`__

A Quantitative Trading Strategy Based on A Position Management Model
---------------------------------------------------------------------

This paper presents a quantitative trading strategy that integrates ARIMA-based return forecasting with a systematic position management model for gold and bitcoin. The framework translates probabilistic return forecasts into position sizing decisions that account for forecast confidence and current market conditions.

`Read the paper <https://doi.org/10.54097/ajst.v2i1.901>`__

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

Why the Optimal Path for a Hedge Fund Ends Up Looking Like a Prop Firm
------------------------------------------------------------------------

A two-post X thread by 0xFaust (@0xFaust12), a quant who describes himself as building a quantitative overlay from scratch inside a fundamental hedge fund, arguing that the hedge fund industry — single-manager long/short funds, the Tiger cubs, and eventually the multi-manager platforms — is structurally outcompeted by vertically integrated proprietary trading firms, Jane Street specifically. The argument is not that prop firms have better alpha but that they already own the risk-model, portfolio-optimisation and execution stack that a fundamental fund would have to build from nothing, and that the build is close to impossible for the fund to justify. The thread grew out of a quote-chain worth reading in order: Ethan Kho's excerpt from Alix Pasquet (Prime Macaya) on the three sources of investment edge — analytical, informational and behavioural — with Kho's gloss that the best hedge funds "sell one behavioural advantage twice: they don't panic sell ... and they can explain the drawdown well enough that you don't either. The fee is for confidence."

**The bearish case.** 0xFaust's first post takes Kho's framing and argues the confidence fee is running out. Most pods are playing a "fundamental mean-reversionary game" that a firm like Jane Street can subsume while extending its holding periods from hours to days and weeks, which puts it in direct competition with incumbent long-only and single-manager funds. The Tiger cubs are, in his view, the best positioned to harvest longer-horizon alpha because of their open mandates, but "so god awful at portfolio construction, market impact, risk management with little desire to change" that he doubts they will. His own experience building the overlay is that "the optimization, risk modelling, and optimal execution edge that the prop firms have is so much larger than most can even appreciate due to lack of technical understanding." The niche he sees is a fund with a Tiger-style mandate plus the technical ability to build risk models, an optimiser and an impact-aware execution layer without the drawdown limits and incremental style of the pods — "that is until the music stops." Asked how Jane Street does this, he offers a working theory: pushing stat-arb into longer horizons ("days → weeks stat arb + VC") and condensing the fundamental research process into an automatable problem, which he thinks is now tractable.

**The build-out argument.** The second post (labelled 1/2; no 2/2 had been posted at the time of cataloguing) walks the transition from the fund's side to show why it fails. A modal L/S fund has at most a data scientist and a software engineer of uncertain quality. To change, it must outlay significant capital for infrastructure and hire 1–2 real quant researchers and 1–2 real engineers — ideally also a risk quant and a microstructure quant — in a market where it will be outbid for top talent and where "mid to low quality is arguably worse than nobody," while convincing its LPs and GPs that the expense is not a red flag or strategy drift. Assuming that succeeds, the team must build or buy a risk model and a portfolio optimiser, only to discover that correct optimisation requires a calibrated market-impact model, which requires a dataset of the fund's own trades and the market's response to them, which will reveal that the fund has been overtrading without ever thinking about TCA, temporary or permanent impact — and that its long-horizon alphas would have a better transfer coefficient with short-term execution alphas overlaid. That leads to three walls: microstructure-scale research needs far more complex infrastructure and expensive data; it effectively needs a dedicated stat-arb signal team inside a medium- to long-term fundamental shop; and even with one, the fund is now trading against market makers and HFT firms with rebates and colocation it cannot afford. "What this optimal path ends up looking like is exactly a prop firm," which is why he expects the prop firms to outcompete "even the Citadels/Millenniums/Balys of the world." In the replies he goes further: on a long enough timeline even the top multi-managers are in trouble, and competing would take "something like Cit Sec needing to merge with Citadel the HF" to produce a vertically integrated risk-taking firm.

**The pushback.** The thread drew substantive disagreement. Loserstar argues the top three or four multi-strats have invested heavily in optimisation and execution research and are willing to change their objective function. @borkborkborkx makes the sharpest structural point: the decent pod shops already execute into a central risk book or market-making arm, so they are already vertically integrated and need no transformation. MatsuiHOF and ctsr reject the premise outright — a long/short fund's reason to exist is a differentiated research process or informational edge, and "long horizon LS HFs do not need any quants, never did and never will." @not_dsr raises corporate access as a fundamental edge that depends on firm type; 0xFaust replies that he is unconvinced, since features can now be extracted from unstructured management data, insider purchases, executives' prior track records, guidance hit rates and conference Q&A. Terminal Value notes some Tiger grand-cubs are trying to be thoughtful about risk and portfolio construction but lack the scale to hire beyond off-the-shelf tooling, and @aanalystbro adds that public equities are "low key dead" for smid-cap fundamental PMs, with the single managers running large private books alongside. On the supporting side, Agustin Lebron (author of *The Laws of Trading*, ex-Jane Street) calls the thesis "entirely correct," adding that the pod structure "induces incentives against tight collaboration" that disadvantages multi-managers against prop firms; Scott Phillips says he is building exactly this stack, "right down to the 2 kwants, 2 devs and one microstructure kwant"; and Hank Rearden suggests the claim is empirically testable — scaled frontier players should crowd out non-frontier alpha in the large-cap opportunities they share.

**Our reading.** The useful content is the dependency chain in the second post, which is a compact statement of why quantitative infrastructure is not modular: an optimiser is only as good as its impact model, an impact model needs the fund's own execution data, and once you have that data the rational next step is execution alpha, which drags a fundamental fund into a game it cannot win on speed or cost. That chain is the practitioner version of the Gârleanu–Pedersen result catalogued above in "Dynamic Trading with Predictable Returns and Transaction Costs" and "On the Effect of Alpha Decay and Transaction Costs on the Multi-period Optimal Trading Strategy" — slow alphas and fast execution signals are jointly optimised, and the transfer coefficient of a long-horizon signal depends on how it is traded — and of the breadth-and-correlation logic in :doc:`Breadth, Correlation, and Sizing <./portfolio-construction>`, where a firm with more independent signals and better sizing compounds a structural advantage. The weaker part is the conclusion. The thread does not distinguish between the cost of building this stack and the cost of renting it (prime brokers, execution vendors and risk-model providers exist precisely so that a fund need not), and the reply that the large pod shops already internalise flow into a central risk book undercuts the claim that they lack vertical integration. Nor does it engage with the behavioural edge that started the chain: if the hedge fund fee is for confidence during drawdowns, that is a product a prop firm trading its own capital does not sell and has no need to, so the two may be competing for alpha but not for the same clients. Read it as a well-argued statement of where the technical frontier sits and how far the median fundamental fund is from it, not as a forecast.

Root of the quote chain: `Ethan Kho (@ethanrkho) <https://x.com/ethanrkho/status/2099947930824098258>`__, September 15, 2026. First 0xFaust post: `"Increasingly secularly bearish on the hedge fund industry" <https://x.com/0xFaust12/status/2100704821108150762>`__, September 17, 2026, with replies. Quote-tweeted with agreement by `Agustin Lebron (@AgustinLebron3) <https://x.com/AgustinLebron3/status/2100842745074004157>`__ and `Scott Phillips (@ScottPh77711570) <https://x.com/ScottPh77711570/status/2100759902415438030>`__.

By 0xFaust (@0xFaust12).

`Read the thread <https://x.com/0xFaust12/status/2100743670651924652>`__.

Designing a Crypto Price Data Dashboard from Scratch
----------------------------------------------------

The first article in a series on building a multi-strategy portfolio from scratch, covering the design and implementation of a crypto price data dashboard. The author documents the process of building automated trading infrastructure from the ground up, starting with the most fundamental component: reliable price data.

The article covers practical aspects of connecting to exchange APIs, storing historical price data, and creating visual representations of market data. It serves as a starting point for traders who want to build their own automated systems, demonstrating that the process begins with proper data infrastructure before moving to signal generation and execution.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/designing-a-simple-crypto-price-data>`__.

Comparing Affordable Intraday Data Sources: TradeStation vs. Polygon vs. Alpaca
-------------------------------------------------------------------------------

A practical comparison of three affordable intraday data sources for retail algorithmic traders: TradeStation, Polygon, and Alpaca. The post evaluates each provider on cost, data quality, coverage, API usability, and suitability for backtesting intraday strategies. It helps retail traders navigate the often confusing landscape of market data providers and make an informed choice based on their specific needs and budget.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/comparing-affordable-intraday-data-sources-tradestation-vs-polygon-vs-alpaca/>`__.

Downloading Stock/ETF Market Data with Python and Alpaca API
------------------------------------------------------------

A step-by-step tutorial on downloading stock and ETF market data using Python and the free Alpaca API. The post walks through setting up the API connection, requesting historical price data at various timeframes, handling pagination, and storing the data for backtesting. This is a foundational building block for any Python-based trading research workflow, providing the data pipeline needed before strategy development can begin.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/downloading-stock-etf-market-data-with-python-and-alpaca-api/>`__.

How to Simulate Like a Quant Desk: Every Model, Every Formula, Runnable Code
----------------------------------------------------------------------------

A comprehensive, progressive tutorial on quantitative simulation techniques for prediction markets, structured as a narrative that builds from basic Monte Carlo to production-grade systems. The article starts with a simple coin flip analogy for Polymarket contracts, then develops increasingly sophisticated methods: Monte Carlo estimation of binary contract probabilities with confidence intervals, importance sampling for pricing extreme tail-risk contracts (achieving 100-10,000x variance reduction), and Sequential Monte Carlo particle filters for real-time probability updating during live events like election night.

The article then covers variance reduction techniques (antithetic variates, control variates, stratified sampling) that stack multiplicatively, copula-based dependency modeling for correlated prediction market portfolios (comparing Gaussian, Student-t, Clayton, and Gumbel copulas with vine copula extensions), and agent-based market simulation using zero-intelligence traders and Kyle's lambda for price impact. Each section includes runnable Python code. The final section outlines a five-layer production stack from WebSocket data ingestion through risk management and monitoring.

By gemchanger.

`Read the article <https://x.com/gemchange_ltd/status/2027744530124951831>`__

The Quant Playbook for Polymarket
---------------------------------

A comprehensive guide to six quantitative formulas that hedge funds use to extract edge from prediction markets like Polymarket. The playbook covers the LMSR (Logarithmic Market Scoring Rule) pricing model that powers Polymarket's AMM, the Kelly Criterion for optimal position sizing, Expected Value gap analysis for detecting mispricings, KL-Divergence for scanning correlated market arbitrage, Bregman Projection for multi-outcome arbitrage optimisation, and Bayesian updating for dynamic probability adjustment in fast-moving markets.

Each formula is presented with mathematical definitions, practical examples from real Polymarket contracts, Python code for implementation, and risk warnings. The author also outlines a system integration pipeline covering data setup via Polygon API, backtesting with walk-forward validation, deployment with cron jobs and Telegram alerts, and risk management using fractional Kelly sizing with drawdown stops.

Mentioned by `0xRicker in this discussion <https://x.com/0xRicker/status/2032798292128522327>`__.

`Read the post <https://x.com/0xRicker/status/2032798292128522327>`__

Opening Range Breakout (ORB) Strategy for NQ Futures
----------------------------------------------------

Rob (@BostonRobTrades) shares his implementation of an Opening Range Breakout strategy for NQ (NASDAQ-100) futures. The strategy trades the break of the first 15-minute range after market open at 9:30 AM, using VWAP as a directional filter: long when price breaks above the range and is above VWAP, short when price breaks below the range and is below VWAP. Entry triggers on a 5-minute candle close outside the range, with exits at end of day or on a 5-minute close back through VWAP or the opposite side of the range. Position sizing is 1–3 contracts, scaled by momentum, range size, and VWAP distance. The author claims a 15-year backtest on this logic.

The ORB concept is one of the oldest intraday strategies in the practitioner literature. Its theoretical basis is sound: the opening period concentrates the highest volume and institutional order flow of the day, and the resulting range reflects where the market aggregates overnight information into a price consensus. Breaking out of that range signals directional conviction. Academic support exists: Zarattini, Barbon, and Aziz (SSRN 4729284, 2024) demonstrate that a 5-minute ORB applied to a filtered portfolio of high-activity U.S. stocks achieved a 2.81 Sharpe ratio and 36% annualized alpha from 2016–2023. Earlier work by the same group on SPY intraday momentum (SSRN 4824172, 2024) showed 19.6% annualized returns and a 1.33 Sharpe from 2007–2024. Timely ORB strategies on five major index futures (DJIA, S&P 500, NASDAQ, HSI, TAIEX) achieved statistically significant 8%+ annual returns from 2003–2013 (IEEE Xplore, 2019).

However, several caveats apply to the strategy as described. First, raw ORB without stock or instrument selection filters has largely been arbitraged away on liquid index futures; the strongest recent academic results come from applying ORB to "Stocks in Play" (stocks with unusual pre-market activity), not broad index futures. Second, the 15-minute opening range is sensitive to regime: on low-volatility days the range is tiny and produces frequent false breakouts, while on high-volatility days the range is wide and the risk-reward deteriorates. Third, using a fixed number of contracts rather than volatility-adjusted sizing means outsized losses on small-range sessions and undersized positions on high-conviction setups; the post mentions scaling by range size and momentum but does not describe a formal risk model. Fourth, the VWAP confirmation filter adds value—it aligns the trade with institutional flow direction—but VWAP in the first 15 minutes is dominated by the opening print and is less informative than later-session VWAP. Fifth, no out-of-sample metrics, transaction cost assumptions, or drawdown figures are provided; a 15-year backtest claim without published equity curves, Sharpe ratios, or maximum drawdowns cannot be independently evaluated.

The broader intraday momentum literature provides context: Gao, Han, Li, and Zhou (Journal of Financial Economics, 2018) show that first-half-hour returns predict last-half-hour returns, consistent with the ORB thesis. Rosa (Journal of Futures Markets, 2022) finds intraday momentum strategies across 62 futures markets achieve Sharpe ratios of 0.87–1.73 at the asset-class level, with stronger performance during recessions. This suggests the ORB edge is real but regime-dependent and likely smaller on a single liquid instrument (NQ) than across a diversified futures portfolio.

Mentioned by Rob (`@BostonRobTrades <https://x.com/BostonRobTrades>`__) in `this discussion <https://x.com/BostonRobTrades/status/2046770986599461326>`__: "Here is a profitable trading strategy that works. ORB - Opening Range Breakout. I have seen many people teach strategies and concepts about trading the opening range but rarely a 15 year backtest on their logic."

`Read the post <https://x.com/BostonRobTrades/status/2046770986599461326>`__.
