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

Efficient Portfolio Estimation in Large Risky Asset Universes
--------------------------------------------------------------

This paper develops a constrained sparse regression approach for large-dimensional portfolio optimization that produces stable, interpretable portfolio weights without requiring full covariance matrix estimation. The method handles universes of hundreds or thousands of assets while maintaining the convexity properties needed for tractable optimization.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6059635>`__

Asset Allocation: From Markowitz to Deep Reinforcement Learning
---------------------------------------------------------------

This paper benchmarks nine portfolio allocation strategies ranging from classical Markowitz mean-variance optimization to deep reinforcement learning approaches, providing a comprehensive comparison of their risk-adjusted performance across different market environments. The study clarifies when traditional optimization approaches outperform ML alternatives and vice versa.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4148379>`__

Optimizing Portfolio Performance through Clustering and Sharpe Ratio-Based Optimization
----------------------------------------------------------------------------------------

This paper introduces a two-stage portfolio construction framework that combines K-Means clustering with Sharpe ratio-based weight optimisation. In the first stage, a universe of financial assets is segmented into clusters based on historical log-returns, grouping together assets with similar return characteristics. In the second stage, each cluster is treated as a sub-portfolio and Sharpe ratio maximisation is applied within each cluster to derive optimal weights — directly incorporating the return/volatility trade-off rather than relying on mean-variance optimisation's sensitivity to expected return estimates.

The framework is evaluated through a backtesting study across multiple asset classes, comparing the cumulative returns of optimised per-cluster portfolios against a traditional equal-weighted benchmark. The approach allows targeted portfolio construction within homogeneous asset groups while maintaining diversification across clusters.

Key metrics: Optimised portfolios outperform the equal-weighted benchmark in cumulative return terms across the backtest period. Specific Sharpe ratio, max drawdown, and annualised return figures are not reported in the abstract; the primary comparison is cumulative return trajectories per cluster versus the equal-weighted baseline.

Mentioned by `QFinancePapers <https://x.com/QFinancePapers>`__ in `this discussion <https://x.com/QFinancePapers/status/1882220409203962241>`__.

By Keon Vin Park, January 2025.

`Read the paper <https://arxiv.org/abs/2501.12074>`__

Dynamic Black-Litterman
------------------------

This paper generalises the classical Black-Litterman portfolio allocation model from a single-period to a continuous-time dynamic setting, allowing investors to trade continuously while incorporating expert views whose horizons may differ from the investment horizon. Using Bayesian graphical models, the authors derive the conditional distribution of asset returns under geometric Brownian motion, showing that conditioning on forward-looking views transforms the log-returns process from Brownian motion with drift into a mean-reverting process expressible as a multi-dimensional Brownian bridge. The conditional price process becomes an affine factor model where the conditional log-returns serve as factors, and explicit formulas are provided for the optimal dynamic investment policy via Hamilton-Jacobi-Bellman equations solved in closed form through a system of Riccati ODEs.

In Monte Carlo simulations on five S&P/ASX 50 assets with CAPM-derived expected returns and three forward-looking views over a one-year horizon, the Dynamic Black-Litterman (DBL) investor consistently dominates the Rebalanced Classical Black-Litterman (RCBL) investor across all rebalancing frequencies (continuous, daily, weekly, monthly). The efficient frontier generated by DBL lies strictly above RCBL, with the performance gap widening when expert views are more precise (lower view noise). DBL also achieves substantially lower portfolio turnover across all risk aversion levels, because its hedging demand offsets sensitivity to changes in the views covariate. Crucially, DBL performance is insensitive to rebalancing frequency, while RCBL deteriorates rapidly as the rebalancing interval increases. The paper further shows that anticipating view revisions (quarterly or mid-horizon updates) materially improves certainty equivalent returns.

By Anas Abdelhakmi and Andrew Lim. National University of Singapore.

`Read the paper <https://arxiv.org/abs/2404.18822>`__

Dynamic Mean-Variance Portfolio Allocation under Regime-Switching Jump-Diffusions with Absorbing Barriers
---------------------------------------------------------------------------------------------------------

This paper solves the dynamic mean-variance portfolio allocation problem under a regime-switching jump-diffusion model with absorbing barriers representing ruin. The optimal allocation policy depends on the current regime and adapts to regime transitions, providing a rigorous framework for regime-aware portfolio construction under realistic market dynamics.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6534579>`__

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

The case study applies cross-sectional momentum to strategies: each month, all strategies are ranked by trailing 6-month cumulative returns, the top 10% are selected with equal weights, and the portfolio rebalances. The momentum meta-strategy is compared against equal-weight allocation and naive risk parity across the same universe. The post notes the core trade-off: broad equal-weight portfolios offer diversification but no responsiveness to performance shifts, while momentum overlays provide dynamism but concentrate exposure and increase drawdown risk during regime changes.

The underlying research question — whether published anomalies exhibit performance persistence — draws on a body of work collected in :doc:`Momentum <./momentum>`: Huang & Huang show recursive selection of the best-performing anomaly outperforms the market after costs; Wang, Yan & Zheng document time-series and cross-sectional momentum in anomaly returns; Ehsani & Linnainmaa demonstrate that stock momentum emanates from factor momentum; Geczy & Samonov confirm momentum across asset classes over 215 years; Zaremba & Shemer find momentum in factor premia across 24 countries (though largely explained by stock-level momentum); and Blitz documents the decade-long underperformance of several factors in 2010–2019, a cautionary case for factor-rotation strategies.

By Quantpedia.

`Read the blog post <https://quantpedia.com/building-meta-strategies-with-quantpedia-api/>`__.

A Levered ETF Anomaly Explained
--------------------------------

Between January 2022 and December 2023, the S&P 500 Index rose 0.076%, yet the ProShares Ultra S&P500 (SSO, 2x leverage) lost 11.09% and the ProShares UltraPro S&P500 (UPRO, 3x leverage) lost 28.24%. This paper by Bianchi and Goldberg decomposes this counterintuitive underperformance into two components: volatility drag from compounding and a timing effect from leverage deviations.

The authors derive a closed-form approximation relating geometric return G to arithmetic return E and volatility V: G ~ (1+E)exp(-V^2/2) - 1. With annualized index arithmetic return of 1.92% and volatility of 19.40%, this formula alone predicts negative geometric returns for levered products. However, this "ideal constant leverage" estimate only explains roughly two-thirds of the actual shortfall. The remaining third arises from the covariance between the ETFs' daily return ratios (realized leverage) and the index return. This covariance is consistently negative for SSO (-2.242) and UPRO (-5.643), meaning leverage tends to decrease when returns are positive and increase when returns are negative -- a detrimental timing drag. The authors emphasize that levered ETFs are path-dependent volatility trades, not simple long-horizon leveraged exposure.

The study uses CRSP daily ETF return data (price returns, excluding dividends) for the S&P 500 Index, VOO, SSO, and UPRO over 501 trading days (January 3, 2022 to December 29, 2023). No code is provided.

Key metrics over the 501-day sample: S&P 500 cumulative return +0.076%, annualized volatility 19.40%, risk-adjusted return 0.099; SSO cumulative return -11.09%, annualized volatility 38.77%, risk-adjusted return 0.043; UPRO cumulative return -28.24%, annualized volatility 58.01%, risk-adjusted return 0.005. The ideal constant leverage model estimated SSO geometric return at -3.625% and UPRO at -10.580%, while the empirical estimate incorporating the covariance term yielded -5.694% and -15.226%, closely matching actual geometric returns of -5.707% and -15.288% respectively.

Mentioned by `Ivan Blanco on LinkedIn <https://www.linkedin.com/posts/ivanblancosanchez_new-research-ideas-sp-flat-2-etfs-share-7467881965510295552-G92N/>`__. He emphasizes that "these are path-dependent volatility trades, not long-horizon leveraged exposure" and cautions against using leveraged ETFs as a simple way to increase beta exposure.

`Read the paper <https://arxiv.org/abs/2604.27287>`__

Yau's Affine Normal Descent: Algorithmic Framework and Convergence Analysis
----------------------------------------------------------------------------

This paper by Yi-Shuai Niu, Artan Sheshmani, and Fields Medal winner Shing-Tung Yau introduces Yau's Affine Normal Descent (YAND), a geometric optimization framework in which search directions are defined by the equi-affine normal of level-set hypersurfaces. Unlike classical methods such as gradient descent or Newton's method that rely on Euclidean or locally quadratic models, YAND derives its search directions intrinsically from the geometry of the objective function's level sets. The resulting directions are invariant under volume-preserving affine transformations and naturally adapt to anisotropic curvature, making the method inherently robust to ill-conditioned coordinate scalings.

The paper establishes that for strictly convex quadratic objectives, affine-normal directions are collinear with Newton directions, implying one-step convergence under exact line search. For general smooth (possibly nonconvex) objectives, the authors characterize when affine-normal directions yield strict descent and develop a line-search-based YAND algorithm. They prove global convergence under standard smoothness assumptions, linear convergence under strong convexity and Polyak-Lojasiewicz conditions, and quadratic local convergence near nondegenerate minimizers. A key theoretical contribution is showing that YAND's search directions are completely unaffected by arbitrarily ill-conditioned affine transformations of the variables -- a property that gradient descent and quasi-Newton methods lack.

The method is directly relevant to portfolio optimization where objective functions (risk measures incorporating skewness, kurtosis, and tail risks) are highly anisotropic and where the number of assets creates severe scaling and conditioning challenges. YAND uses tensor-free computation of the affine normal direction (requiring only first and second derivatives, not full Hessian inversion) and determines optimal step sizes via polynomial line search rather than trial-and-error, addressing the computational scalability barrier in large-scale multi-asset allocation.

Numerical experiments are conducted in MATLAB on representative 2D problems. On well-conditioned quadratics, YAND-Exact converges in 1 iteration (matching Newton's method). Under affine scaling with condition numbers up to 10^4 (Hessian condition number up to 10^8), YAND-Exact still converges in 1 step while gradient descent with fixed step size hits the 200-iteration cap for condition numbers >= 10. On the Rosenbrock function, YAND converges in 12-20 iterations depending on line-search variant, while gradient descent requires 200+ iterations. On smooth nonconvex problems including saddle regions and multi-well landscapes, YAND follows the curvature of level sets and converges stably. The implementation uses analytic derivatives via automatic differentiation with no external optimization libraries. No code is publicly available.

Mentioned by `Luca Cai in this discussion <https://www.linkedin.com/posts/luca-cai-65a35b377_recently-fields-medal-winner-and-renowned-share-7465969764503351296-M9bT/>`__. Cai highlights that YAND addresses two major problems in portfolio optimization: risk characterization beyond normal distributions (volatility, skewness, kurtosis, tail risks) and computational scalability when the number of assets is large, noting that the method shifts optimization to affine-normal geometry with tensor-free computation and polynomial step-size determination.

`Read the paper <https://arxiv.org/abs/2603.28448>`__

Bayesian Methods in Finance
---------------------------

This handbook chapter by Eric Jacquier and Nicholas Polson ("Bayesian Methods in Finance," in *The Oxford Handbook of Bayesian Econometrics*, 2011) is the anchor survey for Bayesian portfolio construction and the single best map of how Bayesian updating threads through asset allocation. It lays out the canonical lineage: (a) Klein & Bawa (1976) — optimal portfolio choice under parameter uncertainty requires optimizing expected utility over the Bayesian *predictive* density, with plug-in point estimates being provably suboptimal; (b) Jorion (1985/1986) — empirical-Bayes (Bayes-Stein) shrinkage of estimated means toward the global minimum-variance portfolio mean; and (c) Black & Litterman (1991) — building the prior from market-equilibrium-implied returns and combining it with investor views, a scheme the chapter notes is curiously absent a formal likelihood (a gap Zhou 2008/2009 later fills).

Our summary: read this first if you want to understand *why* raw sample means produce unstable, extreme mean-variance weights and how a Bayesian treatment fixes it — by carrying estimation uncertainty into the optimization rather than optimizing a fragile point estimate. It is a theoretical chapter, but it is the connective tissue for the four classic papers indexed below (Klein-Bawa, Jorion, Black-Litterman, Zhou), and it frames the entire predictive-density approach that underlies Bayesian position sizing. High-value full read for anyone building an allocation layer over multiple signals or strategies.

Data and code: a survey/handbook chapter; no data or code. Freely hosted as a PDF on the author's site.

Key metrics: not applicable — this is a methodological survey, valuable for the framework and the literature map rather than any reported performance.

`Read the paper <https://people.bu.edu/jacquier/papers/bayesfinance.2011.pdf>`__

The Effect of Estimation Risk on Optimal Portfolio Choice
---------------------------------------------------------

This paper by Roger W. Klein and Vijay S. Bawa (1976, *Journal of Financial Economics* 3:215-231) is the seminal result on portfolio choice under parameter uncertainty and the theoretical root of Bayesian portfolio construction. Building on Zellner & Chetty (1965), the authors show that when the true return distribution parameters are unknown, the optimal strategy is to compute and then optimize expected utility with respect to the *Bayesian predictive density* — the parameter-uncertainty-integrated distribution of future returns — rather than plugging sample estimates into the utility as if they were the truth. Doing the latter ("estimation risk" ignored) leads to demonstrably suboptimal portfolios.

Our summary: this is the "why Bayesian at all" paper for allocation. The predictive-density argument is the formal justification for every downstream shrinkage and Bayesian-sizing method — including Bayesian Kelly — because it says uncertainty about your edge should change the allocation, not just be acknowledged. Worth knowing as the foundation even though the modern practitioner usually meets it through later shrinkage estimators (Jorion) or the Jacquier-Polson survey above.

Data and code: a theoretical paper; no public code. Behind the Elsevier/ScienceDirect paywall — we were unable to retrieve the full PDF (browser-based capture and Sci-Hub were both unavailable in this run); the abstract and citation are indexed here for completeness.

Key metrics: not applicable — a decision-theoretic result, not an empirical study.

`Read the paper <https://doi.org/10.1016/0304-405X(76)90004-0>`__

Bayes-Stein Estimation for Portfolio Analysis
---------------------------------------------

This paper by Philippe Jorion (1986, *Journal of Financial and Quantitative Analysis* 21(3):279-292), with its international-diversification companion (Jorion 1985, *Journal of Business* 58(3):259-278), is the practical workhorse of Bayesian portfolio estimation: it applies James-Stein/empirical-Bayes shrinkage to the vector of expected returns, pulling each asset's estimated mean toward the mean of the global minimum-variance portfolio. The shrinkage intensity is estimated from the data, so noisier, shorter samples are shrunk harder.

Our summary: this is the most directly usable classic in the Bayesian-allocation set — a few lines of code that materially stabilize mean-variance weights. Because sample means are the dominant source of error in Markowitz optimization, shrinking them toward a sensible target (the min-variance mean) reduces the extreme, error-maximizing positions that plague naive optimizers and produces more stable, better out-of-sample portfolios. Practitioner-relevant; pairs naturally with covariance shrinkage (Ledoit-Wolf) for a fully regularized optimizer.

Data and code: empirical study on international equity indices; no public code. Behind the JSTOR/Cambridge paywall — full PDF not retrievable in this run (browser and Sci-Hub unavailable); citation indexed for completeness.

Key metrics: Bayes-Stein portfolios are shown to dominate raw sample-estimate portfolios out-of-sample, with more stable weights and improved risk-adjusted performance; the paper reports estimation-error and out-of-sample comparisons rather than a single headline Sharpe.

`Read the paper <https://doi.org/10.2307/2331042>`__

Asset Allocation: Combining Investor Views with Market Equilibrium (Black-Litterman)
------------------------------------------------------------------------------------

This paper by Fischer Black and Robert Litterman (1991, *The Journal of Fixed Income* 1(2):7-18) is the canonical Bayesian portfolio model used across the institutional industry. The market-cap-weighted portfolio is reverse-engineered into a set of *equilibrium-implied* expected returns (by inverting the mean-variance first-order condition), and these serve as the Bayesian prior. The investor's own views — with explicitly stated confidences — act as the evidence, and the posterior blends prior and views in conjugate (Gaussian) form. The result avoids the wild, corner-solution weights that mean-variance optimization produces when fed raw return forecasts.

Our summary: this is the most influential applied instance of Bayesian updating in finance and the one a quant is most likely to deploy directly. The key idea worth internalizing is that the equilibrium prior anchors the optimizer, so your views only tilt the portfolio in proportion to your confidence — exactly the behaviour you want when blending uncertain alpha signals. The model's one formal gap, flagged by Jacquier & Polson, is the absence of an explicit likelihood; Zhou (2009) closes it. Essential practitioner reading.

Data and code: a methodological/applied paper (originating as Goldman Sachs research); no public code, but numerous open-source implementations exist. Behind the JFI/Portfolio Management Research paywall — full PDF not retrievable in this run (browser and Sci-Hub unavailable); citation indexed for completeness.

Key metrics: the paper demonstrates well-behaved, intuitively reasonable allocations versus the extreme weights of naive mean-variance optimization rather than reporting a backtested Sharpe/return series.

`Read the paper <https://doi.org/10.3905/jfi.1991.408013>`__

Beyond Black-Litterman: Letting the Data Speak
----------------------------------------------

This paper by Guofu Zhou (2009, *The Journal of Portfolio Management* 36(1):36-45; widely circulated as the 2008 working paper "An Extension of the Black-Litterman Model: Letting the Data Speak") closes the main theoretical gap in Black-Litterman. The original BL model combines an equilibrium prior with investor views but lacks a formal likelihood — it never lets the *historical data* update the posterior. Zhou adds a likelihood so the posterior expected returns reflect three sources at once: market equilibrium (prior), subjective views, and the sample evidence.

Our summary: this is the natural next read after Black-Litterman for anyone who wants their allocation to listen to the data rather than only to equilibrium plus hand-specified views. The "let the data speak" extension makes BL a fully coherent Bayesian updating scheme and is the bridge from the 1991 model back to the Klein-Bawa predictive-density foundation. Practitioner-relevant for systematic books where historical return information should temper both the equilibrium anchor and the trader's views.

Data and code: methodological extension with empirical illustration; no public code. Behind the JPM/Portfolio Management Research paywall — full PDF not retrievable in this run (browser and Sci-Hub unavailable); a working-paper version circulates under the "Letting the Data Speak" title. Citation indexed for completeness.

Key metrics: the paper reports improved out-of-sample portfolio performance from incorporating the data likelihood versus standard Black-Litterman rather than a single headline metric.

`Read the paper <https://doi.org/10.3905/jpm.2009.36.1.036>`__

When Simplicity Beats Optimization: Evidence from Factor Timing, Volatility Management, and the 1/N Benchmark
-------------------------------------------------------------------------------------------------------------

Xuan Feng (EDHEC Business School, forthcoming in Financial Markets and Portfolio Management, 2026) examines whether volatility management and factor-based mean-variance optimization improve out-of-sample portfolio performance relative to simple diversification benchmarks. Using nine equity factors from 1976 to 2025, the study compares recursive factor mean-variance portfolios, volatility-managed factors, equal-weight 1/N portfolios, and volatility-managed 1/N portfolios across multiple rolling windows, subperiods, and VIX regimes.

Our summary: this is a clean out-of-sample re-examination of the recurring "can you beat 1/N?" question, applied specifically to the modern factor-timing and volatility-management toolkit. The headline is negative for optimization: although volatility management improves the Sharpe ratios of several individual factors in isolation, those gains do not survive at the portfolio level once estimation risk and recursive (real-time) implementation are imposed. Optimized factor portfolios generally fail to beat simple diversified benchmarks, and dynamic factor-selection strategies are undermined by parameter instability and look-ahead bias. The mechanism is the familiar one that is easy to forget in a backtest: every optimization step estimates parameters, every estimate carries error, and out-of-sample that estimation error tends to consume whatever edge the in-sample optimization promised. The practical takeaway is that 1/N is not a naive strawman but a genuinely hard benchmark once estimation risk is on the table — which, as the accompanying discussion notes, makes the already-"modest" expected gains from factor timing even harder to bank in practice.

Data and reproduction: nine equity factors, 1976–2025, evaluated over multiple rolling windows, subperiods and VIX regimes; the comparison set is recursive factor MVO, volatility-managed factors, 1/N, and volatility-managed 1/N. Published in Financial Markets and Portfolio Management (DOI 10.1007/s11408-026-00499-8); SSRN preprint abstract 7005278, 44 pages. No public code package is referenced.

Key metrics: this is a horse-race study rather than a single-strategy backtest, so the result is comparative — volatility management raises the Sharpe ratios of several individual factors, but neither recursive factor mean-variance optimization nor dynamic factor timing produces robust portfolio-level Sharpe improvement over the 1/N and volatility-managed 1/N benchmarks out-of-sample, across rolling windows, subperiods and VIX regimes.

Mentioned by Ivan Blanco (Founder & CIO at Noax Capital, Associate Professor of Finance at CUNEF) in `this LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-ideas-nine-factors-50-years-share-7488530728323026944-Fy69/>`__, where he frames the result as making the "modest" expected improvements from factor timing even more important, and notes that 1/N "is not a naive baseline — it's a hard one to beat once estimation risk is on the table."

By Xuan Feng.

`Read the paper <https://ssrn.com/abstract=7005278>`__

Breadth, Correlation, and Sizing: What the Strategy Report Does Not Show
------------------------------------------------------------------------

A weekly recap from Build Alpha tying together four separate posts into a single argument about portfolio-level thinking. The four relations are the Fundamental Law of Active Management, IR ≈ IC × √N, where edge comes from breadth rather than signal strength — fifty signals at IC 0.05 deliver roughly three times the risk-adjusted edge of one signal at IC 0.10; the effective-breadth formula N_eff = N / (1 + (N−1)ρ), which caps how much diversification you can actually buy, since effective bets converge to 1/ρ and stop, so at ρ = 0.30 no number of systems gets you past about 3.3 real bets; an admission threshold for new strategies, Sₛ > Sₚ × (√(2 + 2c) − 1), which prices a candidate by its correlation to the existing book rather than by its own backtest; and volatility-based position sizing, Contracts = (Equity × Risk%) / (ATR × PointValue).

Entry discussion: the admission threshold is the one most likely to change behaviour, because it formalises an uncomfortable result — a genuinely profitable strategy can still make the book worse. The worked example is a 0.70 Sharpe candidate at 0.80 correlation to a 1.00 Sharpe book, which drags the combined result down to 0.90 despite being a winner standalone; the threshold says the candidate would have needed roughly 0.90 Sharpe to break even at that correlation, so the decision hinges on a number that appears nowhere on its own strategy report. The sizing point is the same argument applied to risk rather than return: fixed contract counts are implicitly a leveraged bet on calm markets, and when ES ATR moved from 20 to 200 during Q1 2020, an unchanged two-contract position carried ten times the risk it was originally sized for. The thread the author draws through all four is that the quantity determining the outcome is never on the report itself — Sharpe does not tell you portfolio value, strategy count does not tell you breadth, and contract count does not tell you risk, because standalone metrics describe a strategy in isolation and nothing is traded in isolation.

The post is a summary of four posts published over the preceding week; the individual posts are not linked from it.

By Build Alpha (@buildalpha).

`Read the post <https://x.com/buildalpha/status/2085708012161814584>`__.

Dynamic Strategies for Asset Allocation
---------------------------------------

André F. Perold and William F. Sharpe (1988, *Financial Analysts Journal* 44(1):16--27) give a compact framework for choosing how a portfolio should react to moves in its risky asset. The choice is not simply "buy dips" versus "cut losses"; it determines the portfolio's payoff shape and therefore which path of market returns it is designed to tolerate. They compare four rules: buy-and-hold, constant-mix rebalancing, constant-proportion portfolio insurance (CPPI), and option-based portfolio insurance (OBPI).

The mechanics are useful for implementation. Buy-and-hold leaves the initial stock and cash quantities untouched, giving a linear exposure. Constant mix continually restores a fixed risky-asset weight, mechanically selling after rises and buying after falls; it is a contrarian, concave-payoff rule that benefits from oscillating, mean-reverting markets but gives up ground when a market trends persistently. CPPI sets a floor ``F`` and puts ``m * max(V - F, 0)`` dollars into the risky asset, with the balance in the safe asset. It therefore cuts exposure after losses and adds after gains, creating a convex, trend-friendly payoff; OBPI obtains a similar protected payoff by holding the risky asset with a put option.

Our summary: the paper is a decision map, not a horse race with one winner. Constant mix is the appropriate bet when reversals and range trading dominate; CPPI and OBPI exchange that for downside protection and participation in sustained trends. The price of the insurance-style rules is whipsaw in reversals, and CPPI's floor is not a guarantee under discrete price gaps, trading frictions, or an inability to rebalance. In the example highlighted in the linked discussion, a USD 100 portfolio with a USD 75 floor and multiplier two starts with USD 50 in equities; after a 10% equity fall CPPI reduces its equity holding rather than rebalancing it upward.

Data and reproduction: analytical paper with payoff diagrams and stylised path comparisons; no underlying dataset or code. The canonical publisher page is paywalled, but a PDF is available from a Stanford course archive.

Key metrics: no annualised return, Sharpe ratio, or backtest is reported. The key parameters are the constant-mix target weight and, for CPPI, the floor and multiplier; results are conditional on the realised market path and omit implementation costs.

Mentioned by Matias Scalbi in `this X discussion <https://x.com/MatiasScalbi/status/2095669007177101478>`__, which uses a 10% equity decline to contrast constant mix's rebalancing purchase with CPPI's exposure reduction.

`Read the paper <https://doi.org/10.2469/faj.v44.n1.16>`__

.. _example-simple-dynamic-stock-bond-gold-portfolios:

Simple Dynamic Stock/Bond/Gold Portfolios
-----------------------------------------

Nikhil Devanathan, Alexandros E. Tzikas, and Stephen P. Boyd compare familiar annual-rebalanced 60/40 (SPY/AGG) and 50/30/20 (SPY/AGG/GLD) portfolios with monthly, long-only and unlevered allocations across SPY, AGG, GLD, and cash.  The 2006--2026 backtest uses public daily price and macroeconomic data, charges 5 bp for every rebalance, and measures returns, volatility, drawdowns, and turnover net of those costs.

The first modification is volatility control: each month the fixed-weight portfolio is diluted with cash to a 7% ex-ante volatility target.  The paper then considers ``Simple Markowitz'', which forecasts returns from trailing average returns, and a fuller Markowitz model which adds a small set of public macro and market features.  Both solve a constrained monthly mean--variance allocation with an explicit trading-cost term.  The design remains deliberately simple--no shorts, leverage, derivatives, proprietary data, or discretionary regime labels--but its 284% annual turnover is a material implementation and tax consideration.

The full Markowitz portfolio produced 11.6% annualised return at 9.0% volatility, a 1.08 geometric Sharpe ratio, and an 18.1% maximum drawdown.  By comparison, annual-rebalanced 60/40 returned 8.1% at 11.3% volatility (Sharpe 0.56; 33.7% maximum drawdown); the gold-augmented 50/30/20 portfolio returned 9.1% at 10.3% volatility (Sharpe 0.70).  Simple Markowitz remained strong at 10.4% return and a 0.91 Sharpe, while cash-based volatility control improved the fixed benchmarks but did not match the dynamic models.  The result is compelling but is still one three-asset, 20-year backtest, so the published walk-forward, bootstrap, and sensitivity code is especially useful for evaluating robustness.

The authors provide the full replication package, using Yahoo Finance, FRED, and Fama--French public data; running it requires a FRED API key.

`Source code <https://github.com/cvxgrp/simple-portfolio-code>`__

`Read the paper <https://web.stanford.edu/~boyd/papers/stock_bond_gold_portfolios.html>`__

Mitigating Return Drag and Regime Whipsaws in Sector Rotation: An Asymmetric Downside-Aware Nested Clustered Optimization Framework
-----------------------------------------------------------------------------------------------------------------------------------

Supriadi proposes Asymmetric Downside-Risk Nested Clustered Optimization with Sticky Regime Dynamics (Asym-Sticky-NCO) for tactical rotation across the 11 S&P 500 GICS sector ETFs. It replaces symmetric covariance with the Bawa-Lindenberg downside semi-covariance matrix and adds a Sticky Gaussian HMM with a persistence prior (kappa) and a confidence threshold (delta). Over 65 out-of-sample walk-forward months (August 2020 to December 2025), CAGR rises from 10.65% for Plain NCO to 13.41% and regime switches fall from 16 to 4.

Each month, a rolling 24-month window estimates semi-covariances and expected returns, and an expanding window fits a 2-state HMM on the S&P 500 return and standardised VIX. With kappa = 0.30, the regime flips only when the opposite state's posterior reaches delta = 0.65. Bull regimes maximise a Sortino utility and Bear regimes minimise downside variance.

The ablation credits the regime layer. Downside semi-covariance alone adds +44 bps of CAGR and deepens maximum drawdown from -14.48% to -20.32%, while the sticky HMM adds a further +232 bps and brings drawdown to -14.22%. The gains are relative to the NCO baselines: CAGR stays below SPY and Equal-Weight, volatility is the highest tested, and Sharpe and Sortino stay below SPY's. The author places the edge on maximum drawdown, Calmar and turnover, although Table I shows Min-Variance with a smaller drawdown and Plain NCO with lower turnover.

Section V.D applies Combinatorial Symmetric Cross-Validation to the nine-point kappa-delta grid and reports a PBO of 0.85, read as the in-sample best configuration being "not reliably stable out-of-sample". The author calls this economically immaterial, because six of the nine configurations produce identical portfolios, treats it as a warning against selecting hyperparameters by in-sample ranking alone, and says the single-market, 65-month sample limits the power of these diagnostics. Our reading: the grid was swept over the same 65 months reported as out-of-sample, and the paper does not say how kappa and delta were chosen or how tied configurations are ranked.

**Data and code.** Monthly data from August 2018 through December 2025 (89 monthly periods) for the 11 Select Sector SPDR ETFs, SPY, CBOE VIX and 13-week Treasury bill yields, from Yahoo Finance. Code is at `sp500-asymmetric-nco <https://github.com/obo-cloud/sp500-asymmetric-nco>`__, which the paper says holds the price data, backtesting pipelines and figure scripts, so the results should be reproducible. We have not run it.

**Key metrics.** The paper reports CAGR, Sharpe, Sortino, drawdown, Calmar and turnover, with no win rate. Figures are out-of-sample over the 65 months and before costs unless stated.

- CAGR: 13.41% for Asym-Sticky-NCO, against 10.65% for Plain NCO (+276 bps/year), 11.05% for Baseline Regime-NCO (+236 bps), 14.28% for Equal-Weight and 16.36% for SPY.
- Total return: 97.74%, against 72.99% for Plain NCO and 127.26% for SPY.
- Sharpe 0.63 and Sortino 1.07, against 0.86 and 1.47 for SPY and 0.58 and 0.97 for Plain NCO.
- Annualised volatility: 17.71%, against 15.58% for SPY and 14.03% for Plain NCO.
- Maximum drawdown: -14.22%, against -23.93% for SPY, -14.48% for Plain NCO and -13.52% for Min-Variance.
- Calmar: 0.94, the highest tested, against 0.68 for SPY (+38.2%) and 0.51 for Baseline Regime-NCO (+84.3%).
- Regime switches and turnover: 4 switches against 16 for the Baseline 1D-HMM (75.0% fewer), and 30.48%/month turnover against 60.78%/month for Baseline Regime-NCO and 26.99%/month for Plain NCO.
- Net CAGR at 20 bps costs: 12.60%, against 9.94% for Plain NCO and 9.43% for Baseline Regime-NCO.
- Overfitting diagnostics: DSR 0.9976 at K = 15 trials; PBO 0.85 on the nine-point grid (S = 16 groups, 12,870 splits); six grid points give 13.41% CAGR and three give 11.47%.

Mentioned by `Quant Beckman <https://x.com/quantbeckman>`__ in `this discussion <https://x.com/quantbeckman/status/2117871513831686200>`__, who says the PBO of 0.85 means the in-sample winning configuration is very likely to rank poorly out of sample under the study's cross-validation procedure. The paper reports 0.85 on the hyperparameter grid only and argues the instability is economically immaterial.

By Supriadi.

`Read the paper <https://arxiv.org/abs/2611.05310>`__

Admissible Portfolio Optimization: Information Constraints, Conditional Efficient Frontiers and the Price of Causal Identification
----------------------------------------------------------------------------------------------------------------------------------

The paper makes the conditioning information of mean-variance portfolio choice a decision variable under hard constraints. A contract declared before estimation requires availability at the decision time, no arbitrage, removal of common dependence between assets and, for interventional claims, invariance across regimes. A lexicographic order with no risk-return quantity selects the class, and the classical problem is solved inside it. On market data the condition holds on small sets of individual securities and fails on pre-diversified portfolios and on books of realistic size.

Separation is certified by the screening defect, the maximal absolute residual correlation after conditioning, on a block kept apart from estimation and evaluation. The consequence statistic gives the share of a portfolio's variance that a diagonal residual discards. On large books the maximum over pairs stops discriminating between representations and this statistic becomes the diagnostic. Sorted portfolios fail because a common residual survives averaging inside a basket while idiosyncratic noise cancels. Any rule selecting information by decision loss admits look-ahead information whenever it is offered, and with correctly dated series the same mechanism appears as overfitting.

The stated limits are specific. Moment errors move realized loss at second order and reported risk at first order, so certification changes what a risk model can say about itself and does not change what the portfolio realizes under the standard minimum-variance rule. The representations are contemporaneous: with drivers lagged one session the defect reduction on the twelve-equity panel falls from 50% to 4%. The interventional branch prices stability across observational environments, the primary panel carries survivorship, and the controlled experiments are Gaussian and affine.

**Data and code.** A simulated Gaussian system of eight assets and two common states; 147 S&P 500 constituents, daily, 2010-2024, 3,312 sessions, against 180 candidate series; 12 US equities, 2001-2023; sorted portfolios; 1,336 Spanish bonds, 2014-2018; 17 strategy indices. The paper mentions accompanying code and a repository but links no code repository. The equity, driver, individual-name and hedge-fund panels are licensed and not redistributed, so the market results cannot be reproduced from public data alone.

**Key metrics.** Mostly dependence, risk-calibration and realized-volatility statistics. Annualized return and drawdown appear only for the twelve-equity strategy paths, and there is no win rate. The first three bullets are certification-block values; the rest are out of sample, apart from promised volatility.

- Primary panel: maximal absolute residual correlation over 10,731 pairs of 0.90 before conditioning and 0.71 after twelve drivers, against a pair-calibrated tolerance of 0.34, with no window admissible.

- Across universes, 127 candidates, at most eight drivers, medians over windows, daily 2001-2023: 12 US equities 0.67 to 0.34 with 17% of windows admissible; 48 industries 0.92 to 0.76 and 25 US size/value portfolios 0.98 to 0.93, both with 0% admissible.

- Variance implied by the full residual relative to the diagonal model's prediction, primary panel: 1.14 times with 180 candidates and 2.39 at the median with the 127 macro series alone (interquartile range 1.71 to 3.83).

- Realized over predicted volatility of the held portfolio, primary panel, 180 candidates: 1.50 with the full residual and 1.76 with the diagonal restriction at 189 estimation sessions; 1.22 and 1.34 at 378.

- Loss-based selection of eight drivers: 2.6% promised against 12.0% delivered volatility on the primary panel, a ratio of 4.3; 7.6% against 14.4% on the twelve-equity panel.

- Long-only minimum-variance, primary panel, median realized volatility: least-defect drivers with thresholded residual 11.59% against DCC-NL 11.61% at 378 estimation sessions (p = 0.449); least-defect drivers with diagonal residual 12.48% against Ledoit-Wolf linear 11.57% at 189 (p = 0.755).

- Global minimum variance, twelve equities, 81 windows, medians, conditional against Ledoit-Wolf linear: volatility 14.22% and 14.20%, Sharpe 0.52 and 0.49, turnover 0.35 and 0.44; paired p = 0.007 for realized variance and 0.105 for Sharpe.

- Long-only twelve-equity strategy, 80 rebalances, November 2003 to March 2023, net of 10 basis points per unit of turnover: conditional return 5.24%, volatility 17.27%, Sharpe 0.38, maximum drawdown -50.2%; equal weights 7.51%, 22.42%, 0.44 and -67.3%.

- Price of invariance, primary panel with calendar regimes: 4 of 127 drivers pass, the attained defect rises from 0.83 to 0.90 and out-of-sample variance rises 16% at the median, in 81% of windows; with Federal Reserve target-rate regimes 2 drivers pass, at 17% of variance in 71% of windows.

Mentioned by `Quant Beckman <https://x.com/quantbeckman>`__ in `this discussion <https://x.com/quantbeckman/status/2115694222409883669>`__, who says the paper defines a separator as information making returns mutually conditionally independent and then ties it to zero maximum absolute conditional correlation, an equivalence he calls false without additional distributional assumptions. His post predates version 2 of the paper. Version 1 states that the defect is "equal to zero exactly for separators" under the mutual independence definition, which fits his objection. Version 2, summarised here, keeps the independence wording in Section 3.2 but limits the claim to a separator "in the second-moment sense", and Definition A.2 defines a separator by diagonal conditional covariance, reserving independence for a structural separator. No Gaussian or other distributional assumption is added for this step.

By Alejandro Rodriguez Dominguez.

`Read the paper <https://arxiv.org/abs/2610.00147>`__

Simple Portfolios that Deliver Consistent Decent Returns
--------------------------------------------------------

An empirical study of established portfolio construction methods under private-investor constraints: 59 liquid US ETFs, monthly trading at a 5 basis point spread, no shorting, no leverage and an 8% target volatility. It backtests fixed weights, volatility control and risk-based methods on small ETF portfolios, plus a Markowitz problem with momentum and moving-average signals on whole asset categories. The authors report that portfolios of as few as three ETFs deliver consistent, decent returns (6% to 10% a year) and outperform the 60/40 over 2005-2025.

Asset selection is in-sample. The authors backtest every equal-weight combination of three, four and five ETFs from a 23-ETF subset over the whole window, rank them by Sharpe and by Sharpe followed by LQ (the lower quartile of annual Sharpe ratios), and read off what the winners share: growth equities, government bonds and gold. The proposed portfolios follow from those findings and are reported on the same window. There is no train-test split or walk-forward re-selection of assets, and no multiple-testing adjustment is reported. "Without tuning" refers to parameters, which are round literature values fixed once. Our reading: the weights are causal, since risk and signals use trailing data, while the asset lists are chosen with hindsight.

The authors flag part of this. The best portfolio found, QQQ/XLP/TLT/GLD/IBIT, is called "a product of hindsight" and is not proposed. The category removals behind the Momentum Universe came from backtest results, so some improvement "is still due to selection". They consider that bias modest because Futures and Countries were argued against on structural grounds; Sectors, also removed, was a result they did not expect. IBIT and ETHA are extended back to 2017 with coin prices, although crypto could not be reached through an ordinary brokerage account before 2024. The universe is survivorship-biased and the bias is not estimated.

The sensitivity check drops the first or last five years, so both windows sit inside the selection period (our reading: no out-of-sample test). Section 6.4 says the ordering holds, yet in 2010-2025 the 60/40 has a higher Sharpe than equal-weight SPY/AGG/GLD. Forecasts are tested out of sample: ridge regression on three price features has negative R-squared at every regularization level, and the authors conclude it has no statistical support.

**Data and code.** Daily adjusted close prices from Yahoo Finance and the federal funds rate from FRED, 2005-01-01 to 2025-01-01, 5,032 trading days, 59 US-listed ETFs. Code is at https://github.com/AlexEmrik/consistent-decent-returns and the risk model package at https://github.com/oskaredenwallberg/covforge. Public data and open code make the results reproducible in principle; we have not rerun them.

**Key metrics.** The paper reports return (r), volatility (sigma), maximum drawdown (MDD), annual turnover (TO), Sharpe ratio (SR) and LQ. Figures are full-window backtests on assets selected over that same window, unless stated.

- Top equal-weight three-ETF portfolio by SR, QQQ/IEF/GLD: SR 0.81, LQ 0.44, MDD 0.22; the best four- and five-ETF portfolios both reach SR 0.84.
- QQQ/XLP/TLT/GLD: SR 0.91 and LQ 0.70 under inverse volatility, against SR 0.84 and LQ 0.62 under equal weights.
- Proposed SPY/AGG/GLD, equal weights: r 0.08, sigma 0.09, MDD 0.24, TO 0.17, SR 0.68, LQ 0.49.
- Proposed SPY/TLT/GLD/IBIT, maximum diversification: r 0.10, sigma 0.09, MDD 0.28, TO 0.42, SR 0.90, LQ 0.54; SR is 0.82 without IBIT.
- Proposed Momentum Universe (26 ETFs), Markowitz: r 0.08, sigma 0.08, MDD 0.16, TO 0.81, SR 0.78, LQ 0.40; SR is 0.43 on the full universe before the category removals, and 0.29 on the full universe without Crypto.
- 60/40 benchmark in Table 25: r 0.07, sigma 0.10, MDD 0.30, SR 0.52, LQ 0.13. Section 6.2 and Table 28 instead give the 60/40 SR 0.51 and MDD 0.36. Our observation: the Table 25 row matches the 50/50 row of Table 28, which may be a labeling error.
- SR in 2010-2025: 60/40 0.78, SPY/AGG/GLD 0.75, Momentum Universe 0.86, SPY/TLT/GLD/IBIT 1.02.
- SR in 2005-2020: 60/40 0.58, SPY/AGG/GLD 0.71, Momentum Universe 0.83, SPY/TLT/GLD/IBIT 1.09.
- Regret bound, using realized future returns with yearly trading and not implementable: SR 1.57, MDD 0.36.

Mentioned by `Quant Beckman <https://x.com/quantbeckman>`__ in `this discussion <https://x.com/quantbeckman/status/2115332182633750916>`__, who says a portfolio that performed well historically is a different thing from showing that the portfolio-selection process will work out of sample. The paper does not run that test on its selection process, and its authors call their best-found portfolio a product of hindsight.

By Oskar Edén Wallberg and Alexander Karolin.

`Read the paper <https://arxiv.org/abs/2610.36491>`__

Trading Volume Alpha
--------------------

We model the economic consequences of predicting individual stock trading volume by translating volume forecasts into a component of expected trading costs, and analyzing their value via portfolio optimization that trades off tracking error versus net-of-cost performance. Incorporating economic losses directly into the prediction problem yields substantial improvements in out-of-sample performance. Economic losses, unlike statistical losses, are asymmetric and vary with fund size. Applying these insights with machine learning to real data, we find that volume prediction can be as valuable as return prediction for portfolio decisions, highlighting the potential role for predicting non-price-based variables for asset pricing.

Price impact is modelled as linear in the participation rate (the trader's dollar trade divided by the stock's total dollar volume), a simple version of Kyle (1985) calibrated to Frazzini, Israel and Moskowitz (2018). Volume is the one part of that cost that does not depend on who is trading, so a volume forecast is a cost forecast any trader can use. The portfolio takes a pre-cost target position as given and chooses each day how far to trade toward it, balancing price impact against tracking error to the target. Because impact is unbounded as volume approaches zero, overestimating volume costs more than underestimating it over most of the volume distribution, and the cost of errors grows with fund size. The optimal policy therefore trades conservatively, which the authors offer as an additional source of limits to arbitrage. The framework needs no return forecast, so it also applies to hedging, index tracking, constraints such as ESG, and executing an arbitrage.

The prediction target is the log dollar volume shock: today's log dollar volume minus its five-day moving average. The 175 predictors are added in groups: lagged returns and volume, firm characteristics from the Jensen-Kelly-Pedersen (JKP) dataset, calendar dummies (early closes, double and triple witching, Russell rebalancing) and earnings release timing. Models are OLS, a three-layer feed-forward network and an LSTM. Each is first trained on mean squared error and then fine-tuned on the portfolio's economic loss, a form of transfer learning. Fine-tuning makes the forecasts statistically worse, often below the moving-average baseline in R-squared, but cuts the out-of-sample economic loss to 43% to 70% of the way to a perfect forecast.

The revised version (July 2026) adds a test that needs no cost model: forecasting each stock's VWAP from predicted volume, taking prices as given. It then runs two trading experiments. The first is a daily long-short target with a 13.9% before-cost return and a Sharpe ratio of about 7, at fund sizes from $10 million to $10 billion. Trading it every day without regard to volume loses all capital at $1 billion and above. The second is 153 monthly-rebalanced long-short JKP factor portfolios at $10 billion. Factors with high turnover and fast-decaying alpha, such as short-term reversal and momentum, benefit most; low-turnover factors such as profitability benefit least. The authors discuss which assumptions bias the result. A concave (square-root-like) impact function would shrink the benefit, especially at large fund sizes. A longer sample, a larger Kyle's lambda estimated from TAQ data, or intraday and signed volume would likely enlarge it. Price impact is the only cost modelled; bid-ask spreads are left out.

**Data and code.** Daily stock-level dollar trading volume for US stocks, 2018 to 2022 (1,258 days, about 4,700 stocks, 4.4 million stock-days), with JKP firm characteristics and earnings dates from Capital IQ Key Developments. The first three years are used for training and the last two for testing, with a single fit and no rolling re-estimation; hyperparameters are not tuned. No code is published, and the volume and Capital IQ data are commercial.

**Key metrics.** All figures are out of sample, 2021-2022, net of modelled price impact. The baseline (ma5) predicts volume with its five-day moving average; "oracle" knows tomorrow's volume.

- Volume prediction: the five-day moving average explains 93.68% of log dollar volume. Of the shock left over, OLS with all predictors explains 15.99%, the feed-forward network 18.45% and the LSTM 19.86%.
- VWAP forecast error over a month: 1.33% (ma5) to 1.03% (LSTM) equal-weighted across stocks, and 0.58% to 0.43% volume-weighted; micro caps see errors of 4-5% or more.
- Daily strategy, $10 billion AUM: ignoring volume loses more than 100%; return rises from 3.88% (ma5) to 4.68% (LSTM fine-tuned on the economic loss, all predictors) and Sharpe from 2.00 to 2.50, against 6.47% and 3.05 for the oracle.
- Daily strategy, $1 billion AUM: return 6.47% to 8.95%, Sharpe 2.21 to 4.53; oracle 9.89% and 4.97.
- Daily strategy, $100 million AUM: Sharpe 5.47 to 5.85. At $10 million: Sharpe 6.55 to 6.68 (ignoring volume: 2.34).
- Factor portfolios at $10 billion, gain over ma5 by style cluster: 0.23 percentage points a year (size) to 0.94 (short-term reversal), with Sharpe gains of 0.04 to 0.32.

Mentioned by `Ivan Blanco <https://es.linkedin.com/in/ivanblancosanchez>`__ in `this discussion <https://www.linkedin.com/posts/ivanblancosanchez_most-of-what-it-costs-to-trade-a-stock-activity-7527030078086524928-TldR>`__, who summarises the paper as showing that predicting volume is worth about as much as predicting returns. His reading is that execution is not an afterthought in a systematic strategy: it looks like part of the alpha and deserves as much research time as the signals.

By Ruslan Goyenko, Bryan T. Kelly, Tobias J. Moskowitz, Yinan Su and Chao Zhang.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4802345>`__
