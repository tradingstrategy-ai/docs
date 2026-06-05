.. meta::
   :description: Research papers and posts on portfolio optimization, hierarchical risk parity, correlation estimation, and allocation frameworks.

Portfolio Construction
~~~~~~~~~~~~~~~~~~~~~~

Portfolio construction is the discipline of combining individual trading signals and assets into a coherent portfolio that optimizes risk-adjusted returns while respecting practical constraints. The field has evolved from Markowitz's foundational mean-variance framework — still the theoretical baseline — through hierarchical risk parity, factor-based allocation, and deep reinforcement learning approaches. A persistent challenge in portfolio construction is that estimated expected returns and covariances are noisy, causing naive optimization to amplify estimation errors and produce unstable, concentrated portfolios.

This collection covers the full portfolio construction toolkit: Markowitz-based optimization with regularization and constraints, hierarchical risk parity (HRP) that avoids matrix inversion, clustering-based approaches for cardinality-constrained portfolios, dynamic Black-Litterman models, and the practical challenges of volatility targeting in multi-asset portfolios. Key themes include the trade-off between model complexity and estimation robustness, the role of correlation in position sizing, and how portfolio construction decisions can matter as much as the underlying signal quality.

Related topics include :doc:`Risk Management <./risk-management>` for position sizing and drawdown control, :doc:`Volatility Modeling <./volatility>` for the covariance inputs to portfolio optimization, and :doc:`Equity Factors <./equity-factors>` for factor-based allocation frameworks.

Building Diversified Portfolios that Outperform Out-of-Sample
--------------------------------------------------------------

The paper introducing Hierarchical Risk Parity (HRP), a portfolio allocation algorithm that uses hierarchical clustering of the asset correlation matrix to create more stable and diversified portfolios than classical mean-variance optimization. HRP avoids the matrix inversion that amplifies estimation errors in standard approaches, producing portfolios that consistently outperform out-of-sample.

By Marcos López de Prado.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2708678>`__

Clustering in Cardinality-Constrained Portfolio Optimization
------------------------------------------------------------

This paper combines cardinality constraints with the classical Markowitz mean-variance model, using spectral clustering to group stocks by their return characteristics. The clustering step reduces dimensionality and achieves an optimal balance of risk and return while keeping the portfolio manageable in terms of number of holdings.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4914246>`__.

Optimal Allocation to Cryptocurrencies in Diversified Portfolios
-----------------------------------------------------------------

This paper applies four quantitative methods for optimal allocation to Bitcoin and Ether within alternative and balanced portfolios. Using roll-forward historical simulations, all four allocation methods produce a persistent positive allocation to Bitcoin and Ether with a median allocation of about 2.7%, emphasizing the diversification benefits of cryptocurrencies as an asset class.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4217841>`__

Efficient Portfolio Estimation in Large Risky Asset Universes
--------------------------------------------------------------

This paper develops a constrained sparse regression approach for large-dimensional portfolio optimization that produces stable, interpretable portfolio weights without requiring full covariance matrix estimation. The method handles universes of hundreds or thousands of assets while maintaining the convexity properties needed for tractable optimization.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851174>`__

Covariance Implied Risk Factors
---------------------------------

This paper develops a heteroskedastic PCA approach that extracts equity risk factors from the covariance structure of returns, allowing factor loadings to vary with market conditions. The method identifies more stable and predictive risk factors than standard PCA, providing better covariance matrix estimates for portfolio construction.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3827687>`__

Asset Allocation: From Markowitz to Deep Reinforcement Learning
----------------------------------------------------------------

This paper benchmarks nine portfolio allocation strategies ranging from classical Markowitz mean-variance optimization to deep reinforcement learning approaches, providing a comprehensive comparison of their risk-adjusted performance across different market environments.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851166>`__

Optimizing Portfolio Performance through Clustering and Sharpe Ratio-Based Optimization
----------------------------------------------------------------------------------------

This paper combines K-means clustering of assets with Sharpe ratio-based optimization at the cluster level, creating a two-stage approach that first groups correlated assets and then optimizes across clusters. The method improves diversification and out-of-sample performance compared to single-stage optimization.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851175>`__

Dynamic Black-Litterman
------------------------

This paper extends the Black-Litterman framework to a continuous-time dynamic setting, allowing investor views to evolve and the model to adapt to changing market conditions. The dynamic formulation provides a principled way to incorporate time-varying beliefs about expected returns while maintaining the model's property of producing well-diversified portfolios.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851176>`__

Dynamic Mean-Variance Portfolio Allocation under Regime-Switching Jump-Diffusions with Absorbing Barriers
----------------------------------------------------------------------------------------------------------

This paper solves the dynamic mean-variance portfolio allocation problem under a regime-switching jump-diffusion model with absorbing barriers representing ruin. The optimal allocation policy depends on the current regime and adapts to regime transitions, providing a rigorous framework for regime-aware portfolio construction.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3827694>`__

Why Mean-Variance Optimization Breaks Down
------------------------------------------

Mean-Variance Optimization (MVO) is a central framework for portfolio construction, yet practitioners quickly encounter a paradox: the mathematically "optimal" portfolio built from estimated inputs is often unstable, highly leveraged, and disappoints out-of-sample. This is not a minor implementation detail—it is a structural consequence of combining a high-dimensional optimizer with noisy estimates of expected returns and covariances.

This article develops MVO from first principles and explains, in a mathematically explicit way, why raw MVO tends to maximize estimation error. It surveys the spectrum of practical fixes organized around two levers: improving or regularizing the inputs, and constraining or regularizing the optimizer. The unifying theme is that almost every successful fix works by injecting bias in exchange for a large reduction in variance of the resulting portfolio weights.

By VertoxQuant.

`Read the post <https://www.vertoxquant.com/p/why-mean-variance-optimization-breaks>`__

Fixing Position Sizing by Accounting for Inter-Asset Correlations
-----------------------------------------------------------------

A practical account of discovering and fixing a crude volatility targeting formula that was causing the portfolio to miss its risk targets. The author found that a simplistic position sizing approach was capping the portfolio too aggressively, resulting in realized volatility at roughly half of the intended target.

The article walks through the correlation fix that resolved the discrepancy, explaining how accounting for inter-asset correlations in the volatility targeting formula allowed the portfolio to properly hit its intended risk profile.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/i-wasted-months-sizing-positions>`__.

How Binary Signals Create Inefficient Capital Allocation in Multi-Asset Frameworks
-----------------------------------------------------------------------------------

An exploration of a bug encountered while building scalable trading infrastructure designed to handle multiple asset classes, exchanges, and strategy types from a centralized codebase. When testing a binary signal implementation, the system was producing a very low gross exposure profile with a mean of just 10.9% and a median of 5%.

The article explains how binary signals (on/off) can create inefficient capital allocation when combined with position sizing rules in a multi-asset framework. The author demonstrates how to rethink signal handling to improve exposure efficiency.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/binary-signal-efficiency-when-scalable>`__.

Strategic Drag: Accepting Lower Returns for Better Risk-Adjusted Performance
----------------------------------------------------------------------------

Research Article #69 from Trading Research Hub. Explores the concept of "strategic drag" in systematic trading, which refers to the intentional acceptance of reduced raw returns in exchange for improved risk-adjusted performance. The article examines how deliberate constraints on a trading strategy can paradoxically improve its overall utility.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-art-of-strategic-drag-research>`__.

Building Uncorrelated Strategy Portfolios and Detecting Edge Decay
------------------------------------------------------------------

An article exploring the author's evolving approach to seeking trading edge and the uncomfortable reality that many carefully constructed strategies will fail in live trading. The article contrasts the comfort of established time-tested strategies like trend-following and mean reversion with the challenges of developing new data-driven approaches. It discusses building robust, uncorrelated trading systems and the importance of rapid edge decay detection.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/in-search-of-alpha-navigating-the>`__.

Using Rolling Correlation to Hit Volatility Targets in Crypto Trend Following
------------------------------------------------------------------------------

A practical discussion on incorporating correlation estimates into position sizing for a long/short crypto trend following portfolio. The author was targeting 40% annualised volatility but consistently hitting only 20%, because the sizing formula assumed perfect correlation among positions.

The fix involved adding a rolling correlation estimate to the sizing formula. The author found R² values of 0.25–0.4 for correlation predictability in crypto — consistent with assumptions in Rob Carver's work — and confirmed that using the rolling correlation estimate allowed the portfolio to consistently hit its volatility target.

By pedma7.

`Read the post <https://x.com/pedma7/status/2020946617344389474>`__.

Portfolio Backtest and Trading Techniques
------------------------------------------

This post explores why combining multiple independent trading strategies into a capital-aware portfolio is more effective than searching for a single "holy grail" strategy. The author argues that over-optimizing, constant tweaking, and adding complex rules create great backtests that fail in live markets.

The real key is building a team of robust strategies that work well together across different market conditions. By mixing strategies across different assets, timeframes, frequencies, and styles, and ensuring they have low correlation, traders can create a portfolio that compounds returns while dramatically reducing drawdowns, referencing Parrondo's Paradox where combining "losing" strategies can create a winning approach.

By Build Alpha.

`Read the blog post <https://www.buildalpha.com/portfolio-backtest-trading/>`__.

Understanding Covariance Matrices for Systematic Portfolio Allocation
----------------------------------------------------------------------

An educational article explaining the covariance matrix and its role in systematic portfolio allocation. The article breaks down this key quantitative concept in accessible terms, explaining why understanding asset correlations is essential for managing portfolio risk.

The article demonstrates how high correlations between portfolio holdings increase the risk that the entire portfolio moves adversely during market stress. It covers how to construct and interpret a covariance matrix, and how this information can be used to build more diversified portfolios.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/what-is-a-covariance-matrix-for-optimal>`__.

Building a Multi-Asset Trading Model from Scratch
-------------------------------------------------

Part of a series on building a multi-strategy portfolio from scratch, this article covers the practical challenges of managing a multi-asset trading model. The author documents the process of developing and deploying an automated strategy portfolio.

The article addresses real-world implementation challenges including data management, signal aggregation across assets, and the operational complexity that grows as more instruments are added to a systematic trading portfolio.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/handling-a-multi-asset-model>`__.

Volatility Drag, the Kelly Criterion, and Portfolio Position Sizing
--------------------------------------------------------------------

A post examining the relationship between volatility drag, the Kelly criterion, and optimal portfolio construction. The key insight is that the highest expected compound growth rate is achieved when portfolio volatility equals the Sharpe ratio — which corresponds to Kelly criterion sizing.

The post also addresses how variance drag diminishes for individual positions within a diversified portfolio. Because the risk penalty to idiosyncratic risk scales with the square of the portfolio weight, a 10% allocation reduces the importance of a component's idiosyncratic variance by a factor of 100.

By Ptuomov.

`Read the post <https://x.com/ptuomov/status/2031639817574834344>`__

Robust Optimization of Strategic and Tactical Asset Allocation for Multi-Asset Portfolios
------------------------------------------------------------------------------------------

Artur Sepp, Ivan Ossa, and Mika Kastenholz present the ROSAA framework — a unified pipeline for strategic and tactical asset allocation of multi-asset portfolios. The paper addresses the practical challenges institutional investors face when constructing portfolios across heterogeneous asset classes with varying liquidity, rebalancing frequencies, and incomplete return histories. The framework integrates factor model covariance estimation, risk-budgeted strategic asset allocation (SAA), alpha signal computation, and tactical asset allocation (TAA) with tracking error constraints into a single coherent pipeline.

Our summary: The key methodological contribution is the Hierarchical Clustering Group LASSO (HCGL) factor covariance estimator, which builds sparse, structured covariance matrices for heterogeneous multi-asset universes by clustering assets and applying group LASSO regularization to factor loadings. For SAA, the framework uses constrained risk budgeting with group allocation limits, avoiding the instability of traditional mean-variance optimization. For TAA, an alpha-over-tracking-error optimization tilts the portfolio toward tactical signals while maintaining a risk budget relative to the strategic benchmark. The framework handles real-world complications including NaN-aware rolling backtesting for assets with missing data, drift-aware turnover accounting that measures trades against drifted holdings rather than stale baselines, and mixed-frequency rebalancing for illiquid positions.

Code: The ``optimalportfolios`` Python package on GitHub (`ArturSepp/OptimalPortfolios <https://github.com/ArturSepp/OptimalPortfolios>`__) is the reference implementation. It includes solvers for minimum variance, constrained risk budgeting, maximum diversification, maximum Sharpe, alpha-over-tracking-error, and CARA utility under Gaussian mixture, with end-to-end backtesting examples.

Published in the Journal of Portfolio Management, 2026, Volume 52, Issue 4, Pages 86-120.

Mentioned by `Artur Sepp on LinkedIn <https://www.linkedin.com/posts/artursepp_quantitativefinance-assetallocation-factorinvesting-ugcPost-7462115172703420416-eS1t>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5250221>`__

From Classical Optimization to Bayesian Integration: A Comprehensive Analysis of Systematic Portfolio Management
-----------------------------------------------------------------------------------------------------------------

This paper compares five portfolio construction approaches — mean-variance optimization, constrained optimization, Fama-French five-factor regression modeling, Monte Carlo simulation, and the Black-Litterman model — using ten U.S. stocks (TSLA, WMT, BAC, GS, LLY, MRK, GOOG, META, AAPL, XOM) over September 2023 to December 2025. The study examines how constraints, risk factors, simulated approximations, and market views affect portfolio allocation, performance, and stability.

The paper provides a structured walkthrough of each method's mechanics and trade-offs. Unconstrained mean-variance optimization produces concentrated "corner portfolios" dominated by AAPL (29%), XOM (28%), and GOOG (22%). Adding a 15% maximum weight constraint redistributes allocations across more assets and, surprisingly, improves out-of-sample performance. Fama-French five-factor regressions (both OLS and robust) characterize the constrained portfolio as defensive large-cap value with a profitability tilt (R² = 0.715). The Monte Carlo section demonstrates that simulation can approximate optimization results but struggles with box constraints due to the curse of dimensionality. The Black-Litterman model, incorporating investor views and market equilibrium, produces the most diversified and stable allocations by anchoring weights to market capitalization and adjusting only where views are strong.

The study uses daily adjusted closing prices from Yahoo Finance. Estimation period is September 2023 to September 2025, with out-of-sample testing from October to December 2025. The optimization is implemented using the ``cvxpy`` library. No code repository is provided.

Key out-of-sample metrics (October–December 2025): the constrained GMV portfolio achieved a 16.77% cumulative return, Sharpe ratio of 5.36, and maximum drawdown of -3.18%, outperforming the unconstrained GMV portfolio (15.85% return, 5.05 Sharpe, -2.76% max drawdown). The constrained portfolio's market beta was 0.81, with statistically significant loadings on value (HML = 0.20) and profitability (RMW = 0.12) factors, and no significant alpha. The estimated market risk aversion coefficient for the Black-Litterman model was δ = 6.79. Note that the reported Sharpe ratios are inflated by the extremely short 3-month out-of-sample window coinciding with a strong bull market; realistic long-term Sharpe ratios for passive large-cap portfolios are typically 0.5–1.0. The paper reads as a graduate-level pedagogical overview of standard portfolio theory rather than novel research, which is consistent with the authors' framing as a beginner review.

Mentioned by `Piotr Pomorski in this discussion <https://x.com/PtrPomorski/status/2061858884575199620>`__.

`Read the paper <https://arxiv.org/abs/2605.29413>`__

Building Meta-Strategies with Quantpedia API
---------------------------------------------

Meta-strategies apply portfolio construction rules to universes of trading strategies rather than individual securities. Instead of allocating capital across stocks or ETFs, a meta-strategy allocates across strategy return streams, treating each strategy's equity curve as a portfolio component. This post demonstrates the approach using the Quantpedia API to filter, retrieve, and allocate across a universe of 118 strategies (filtered for simple implementation, ETF-based instruments, and available QuantConnect source code).

The case study applies cross-sectional momentum to strategies: each month, all strategies are ranked by trailing 6-month cumulative returns, the top 10% are selected with equal weights, and the portfolio rebalances. The momentum meta-strategy is compared against equal-weight allocation and naive risk parity across the same universe. The post notes the core trade-off: broad equal-weight portfolios offer diversification but no responsiveness to performance shifts, while momentum overlays provide dynamism but concentrate exposure and increase drawdown risk during regime changes. The underlying research question — whether published anomalies and systematic strategies exhibit performance persistence — is supported by references to Huang's out-of-sample anomaly testing, Wang/Yan/Zheng on momentum in anomaly returns, and Ehsani's work on factor momentum.

By Quantpedia.

`Read the blog post <https://quantpedia.com/building-meta-strategies-with-quantpedia-api/>`__.
