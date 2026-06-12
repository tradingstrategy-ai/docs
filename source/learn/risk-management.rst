.. meta::
   :description: Research papers and posts on risk management, Kelly criterion, position sizing, stop losses, and drawdown control.

Risk Management
~~~~~~~~~~~~~~~

Risk management in systematic trading encompasses the decisions that determine how much capital to risk on each position, how to set stop losses, how to target portfolio volatility, and how to protect against catastrophic drawdowns. The foundational framework is the Kelly Criterion — the bet size that maximizes long-run wealth growth — but practical applications typically use fractional Kelly due to estimation uncertainty and the catastrophic consequences of overbetting. Volatility targeting, which scales position sizes inversely to recent volatility, is the modern standard for multi-asset systematic portfolios.

This collection covers the theoretical foundations of optimal bet sizing (Kelly and its Bayesian extensions), empirical evidence on the practical use of stop losses and their costs, frameworks for position sizing across different risk metrics, and practical case studies in identifying and fixing broken risk targeting implementations. A persistent theme is the gap between theoretically optimal approaches and practically robust ones: Kelly provides the maximum growth rate but its sensitivity to estimation error makes fractional approaches universally preferred.

Related topics include :doc:`Portfolio Construction <./portfolio-construction>` for portfolio-level risk and allocation decisions, :doc:`Volatility Modeling <./volatility>` for the volatility forecasts that feed into risk-targeting formulas, and :doc:`Backtesting & Research Methodology <./backtesting>` for evaluating strategy robustness before deployment.

Risk Beyond Volatility: A Conditional Framework for Downside Harm and Capital Loss
-----------------------------------------------------------------------------------

This paper develops a conditional framework for measuring downside risk that goes beyond symmetric volatility measures. The approach models the conditional probability and magnitude of capital loss below a threshold, providing risk measures that better align with investors' actual loss aversion and the asymmetric consequences of drawdowns.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851177>`__

The Kelly Criterion and the Stock Market
-----------------------------------------

This paper provides a practitioner-accessible introduction to the Kelly Criterion applied to stock market investing, covering the derivation of optimal bet sizing from first principles and the practical modifications needed for continuous-time markets. The paper bridges the gap between the theoretical optimality of Kelly sizing and the pragmatic use of fractional Kelly in portfolio management.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1265446>`__

Portfolio Choice and the Bayesian Kelly Criterion
--------------------------------------------------

This paper develops a Bayesian extension of the Kelly Criterion that incorporates uncertainty about the distribution of returns, producing more conservative leverage recommendations than the classical Kelly formula when parameter uncertainty is high. The Bayesian Kelly framework naturally leads to fractional Kelly sizing as the optimal solution under uncertainty.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851178>`__

Leverage and Uncertainty
--------------------------

This paper analyzes optimal leverage for investors who face genuine uncertainty (Knightian) about the return distribution, as opposed to risk where probabilities are known. The results show that fat-tailed return distributions and parameter uncertainty jointly imply fractional Kelly as the robust optimal strategy, providing a theoretical justification for the empirical practice of using less than full Kelly sizing.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851179>`__

Wasserstein-Kelly Portfolios
-----------------------------

This paper develops a distributionally robust version of the Kelly Criterion using Wasserstein distance ambiguity sets, providing portfolio sizing recommendations that are robust to uncertainty about the underlying return distribution. The approach hedges against model misspecification by optimizing against the worst-case distribution within a Wasserstein ball around the empirical distribution.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851180>`__

Credit Spread News and Financial Market Risk
--------------------------------------------

This paper shows that credit spread innovations carry information about equity market risk that is not captured by standard equity risk factors. Credit spread widening predicts equity market volatility and drawdown risk with significant lead times, providing a cross-market signal for equity risk management.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3827684>`__

Debugging a Volatility Target Miss: Realizing 20% When Targeting 40%
----------------------------------------------------------------------

A deep dive into debugging why a systematic crypto trading model was realizing only 20% annualized volatility despite targeting 40%. The author walks through multiple hypotheses tested and rejected, illustrating the diagnostic process of understanding what a trading system is actually doing on the backend versus what it is supposed to do.

The article covers the allocation formula fix that ultimately solved the problem, showing the before-and-after equity curves. It emphasizes that understanding the gap between targeted and realized volatility is critical for systematic traders, as it directly impacts absolute returns even when risk-adjusted metrics like Sharpe ratio look acceptable.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/targeting-40-vol-and-only-getting>`__.

Implementing Dynamic Stop Losses in a Multi-Signal Trading Strategy
--------------------------------------------------------------------

Research Article #71 from Trading Research Hub. Examines how dynamic stop loss mechanisms can be implemented within a multi-signal trading strategy framework. Rather than using fixed stop loss levels, the approach adjusts stops based on changing market conditions and the interaction between multiple trading signals.

The article tests various dynamic stop loss implementations and their impact on strategy performance, analyzing the trade-off between protecting capital and avoiding premature exits.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/dynamic-stop-losses-in-a-multi-signal>`__.

A Framework for Deliberate Position Sizing and Exposure Control
---------------------------------------------------------------

Research Article #65 from Trading Research Hub. Presents a systematic framework for position sizing that emphasizes controlling portfolio exposures deliberately rather than letting them be determined by market conditions. The core principle is that a trader's exposures should be dictated by their risk management rules, not by market movements.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-4-step-framework-to-size-almost>`__.

Optimal Bet Sizing: From the Kelly Criterion to Trading Position Management
---------------------------------------------------------------------------

Research Article #52 from Trading Research Hub. Explores optimal position sizing through the lens of probability and bankroll management. Using the classic example of a biased coin flip game (60% probability of winning with 2:1 payoff), the article demonstrates why optimal bet sizing is crucial for long-term wealth growth.

The article connects concepts from gambling theory, including Kelly Criterion principles, to practical trading position sizing. It demonstrates through simulation how over-betting can lead to ruin despite having a positive expected value, and how fractional approaches to optimal sizing can balance growth rate with drawdown risk.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-optimal-betting-method-for-responsible>`__.

The Hidden Costs and Return Erosion of Stop Losses in Systematic Trading
------------------------------------------------------------------------

Research Article #48 from Trading Research Hub. A deep dive into the hidden costs and effects of using stop losses in systematic trading strategies. The study examines how different stop loss implementations affect overall strategy performance, using historical market events including Black Monday as context for understanding tail risk management.

The article challenges common assumptions about stop losses by quantifying their impact on both risk reduction and return erosion. Through systematic backtesting, it demonstrates the trade-offs involved in using stops.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/exploring-the-effect-of-stop-losses>`__.

Vol-Based Stops: Stop Leaving Money on the Table
-------------------------------------------------

A practical Python script for calculating volatility-adjusted stop-loss distances for index futures (NQ, ES) and ETFs (QQQ, SPY). The script runs daily, downloading VIX, VXN, VIX9D, and price data to determine the current volatility regime and compute appropriate stop distances and position sizes.

The approach uses a severity score derived from realized volatility, VIX momentum, and VIX acceleration. These features are ranked, weighted, and bucketed into four regimes: LOW VOL, NORMAL, ELEVATED, and EXTREME. For each regime, the script outputs the appropriate stop distance and number of micro contracts to trade at 1% risk, helping traders avoid the common pitfalls of using stops that are too tight in high-volatility environments or too wide in low-volatility environments.

By AlgoFlows.

`Read the article <https://x.com/algoflows/status/2019143439485661382>`__

Degrossing: Systematic Exposure Reduction to Tame Crypto Volatility
--------------------------------------------------------------------

Explores the concept of degrossing as a portfolio risk management technique for cryptocurrency trading. Degrossing involves systematically reducing gross portfolio exposure during periods of high volatility to protect capital.

The article explains how to balance idiosyncratic asset selection with overall volatility control, demonstrating how automatically reducing position sizes during volatile periods can protect a portfolio from catastrophic drawdowns. The technique is particularly relevant for crypto portfolios where unchecked volatility can quickly overwhelm even well-researched individual position decisions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/crypto-portfolio-management-degrossing>`__.

The Math Needed for Position Sizing (Complete Roadmap)
------------------------------------------------------

A comprehensive guide to the essential math behind position sizing for systematic traders. The article walks through five position sizing methods in order of complexity: Fixed Dollar (almost never recommended), Fixed Percentage (the default starting point at 1-2% risk per trade), Equal Weighting for diversified portfolios, the Kelly Criterion (mathematically optimal but practically dangerous due to extreme sensitivity to estimation errors), and Volatility Targeting (the gold standard for multi-asset systematic trading).

For each method, the author provides the exact formulas, worked examples, and honest assessments of when to use or avoid them. The overarching principle: the best position size is one that lets you execute your strategy without emotional interference, which is often smaller than what the math suggests.

By Goshawk Trades (Mounir).

`Read the article <https://x.com/GoshawkTrades/status/2024873947414904842>`__

Why Volatility-Adjusted Sizing Matters More Than You Think
----------------------------------------------------------

An article on why most traders fail not because of bad signals but because of broken position sizing. The core argument is that trading a fixed number of contracts regardless of market conditions means volatility implicitly decides your risk — when volatility doubles, so does the danger of your position.

The article presents a volatility-adjusted sizing formula: Position Size = (Account × Risk%) / (ATR × Multiplier). This approach automatically scales positions down in high-volatility environments and up in low-volatility ones, keeping risk per trade consistent regardless of market regime.

By Algomatic Trading.

`Read the article <https://x.com/AlgomaticTrade/status/2028899660539281487>`__

A Survival-First Approach to Trading System Development
--------------------------------------------------------

An article framing markets as a survival game where the longevity of a portfolio determines its ability to capture favorable regimes. Using 2020-2021 as an example, the article argues that traders who preserved capital were the ones who profited from the massive bull market.

The article defines what constitutes a robust edge from a survival perspective: one that withstands minor market changes, survives different regimes, and can be exploited over long periods without catastrophic failure.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/survival-approach-to-developing-trading>`__.

Mastering the Calmar Ratio for Risk Analysis
---------------------------------------------

An educational article from Interactive Brokers' Quant News covering the Calmar ratio — a risk-adjusted performance metric that divides annualised return by maximum drawdown. The post explains the ratio's calculation, interpretation, and practical applications for evaluating trading strategies and fund performance.

`Read the blog post <https://www.interactivebrokers.com/campus/ibkr-quant-news/mastering-the-calmar-ratio-for-risk-analysis/>`__

Beyond the Average: Exploring Omega Ratio and Calmar Ratio
-----------------------------------------------------------

An article exploring two sophisticated investment performance metrics that go beyond traditional measures like the Sharpe ratio. The Omega ratio considers the probability of achieving a threshold return level, dividing gains above the threshold by losses below it and capturing the full return distribution without assuming normality. The Calmar ratio compares annualised compound returns to maximum drawdown.

By FasterCapital.

`Read the blog post <https://www.fastercapital.com/content/Omega-Ratio--Beyond-the-Average--Exploring-Omega-Ratio-and-Calmar-Ratio.html>`__

Advanced Trading Metrics: A 2026 Comprehensive Guide
-----------------------------------------------------

A definitive guide examining five essential risk-adjusted metrics for evaluating algorithmic trading strategies: Sharpe ratio, Sortino ratio, Calmar ratio, SQN (System Quality Number), and K-ratio. Each metric is presented with exact formulas, worked examples, professional benchmarks, and honest assessments of when to use or avoid them.

The guide provides a metric selection framework by trading profile: Calmar for conservative traders, Sortino for trend followers, SQN for scalpers, Sharpe for institutional fund managers, and K-ratio combined with SQN for system developers. A key warning: live Sharpe ratios typically run 30–50% lower than backtests.

By Rubén Villahermosa, Algo Strategy Analyzer.

`Read the blog post <https://algostrategyanalyzer.com/en/blog/advanced-trading-metrics/>`__

Optimal Betting Under Parameter Uncertainty: Improving the Kelly Criterion
--------------------------------------------------------------------------

This paper by Rose D. Baker and Ian G. McHale (2013, *Decision Analysis* 10(3):189-199) addresses the single biggest practical flaw in applying the Kelly criterion to real trading: Kelly assumes the edge (win probability / expected return) is known exactly, but in practice it is *estimated* from limited, noisy data. The authors derive the optimal bet fraction under that parameter uncertainty by integrating over the posterior distribution of the edge, and show it is systematically *smaller* than the naive Kelly stake computed from a point estimate — the less data you have, the more you should shrink the bet.

Our summary: this is the Bayesian-Kelly paper a systematic trader actually needs. It formalizes the folklore "use fractional Kelly" by deriving *how* fractional your sizing should be as a function of how uncertain your edge estimate is — turning an arbitrary 1/2- or 1/4-Kelly fudge into a principled shrinkage driven by the posterior. For crypto strategies, where edges are estimated on short, non-stationary samples and overbetting is ruinous, this is exactly the right framing: size from the posterior over your edge, not from the point estimate. Highly practitioner-relevant; pairs conceptually with the predictive-density foundation (Klein-Bawa) in the portfolio-construction file.

Data and code: a decision-theoretic paper with illustrative examples (including sports-betting and investment settings); no public code. Behind the INFORMS/*Decision Analysis* paywall — full PDF not retrievable in this run (browser and Sci-Hub unavailable); citation indexed for completeness.

Key metrics: the contribution is the closed-form/​numerical optimal bet fraction under parameter uncertainty and its shrinkage relative to full Kelly; the paper quantifies the growth-rate penalty of ignoring estimation risk rather than reporting a trading backtest.

`Read the paper <https://doi.org/10.1287/deca.2013.0271>`__
