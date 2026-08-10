.. meta::
   :description: Research papers and posts on time series analysis, ARIMA, cointegration, error correction models, and forecasting for financial data.

Time Series Forecasting
~~~~~~~~~~~~~~~~~~~~~~~

Time series analysis provides the statistical foundations for modeling and forecasting financial data. The discipline covers stationarity testing, autocorrelation structures, model identification and estimation, and the treatment of non-stationary series through differencing and cointegration frameworks. For quantitative finance, time series tools are prerequisites for virtually all systematic strategy research: ARIMA models for price and volatility forecasting, cointegration for pairs trading and hedging, and error correction models for capturing long-run equilibrium relationships.

This collection covers the foundational theoretical frameworks — ARMA/ARIMA, cointegration and error correction, stationarity testing — along with modern deep learning approaches for financial time series forecasting including Temporal Fusion Transformers, and practical tools such as fractional differencing for preserving memory in machine learning feature engineering. A key theme is the challenge of applying classical time series tools to financial data, where non-stationarity, heavy tails, and regime changes can invalidate standard assumptions.

Related topics include :doc:`Volatility Modeling <./volatility>` for GARCH and realized volatility forecasting models, :doc:`Statistical Arbitrage <./statistical-arbitrage>` for cointegration-based pairs trading applications, and :doc:`Machine Learning <./machine-learning>` for deep learning approaches to return and volatility forecasting.

On Covariance Estimation of Non-Synchronously Observed Diffusion Processes
---------------------------------------------------------------------------

This paper addresses the problem of estimating covariances between assets that do not trade simultaneously or at the same frequency, a ubiquitous problem in multi-asset portfolio construction when assets trade across different exchanges or time zones. The method provides consistent covariance estimates without the bias introduced by naive synchronization approaches such as last-price imputation.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851172>`__

Time Series Fundamentals
------------------------

A foundational overview of time series analysis for financial econometrics. The article covers the core concepts that underpin quantitative finance, including stationarity and unit root testing (ADF and KPSS tests), autocorrelation functions (ACF and PACF), lag selection criteria (AIC, BIC, HQIC), and an introduction to spectral analysis for identifying cyclical patterns in financial data.

The post emphasizes the practical importance of these tools for portfolio managers and risk analysts, explaining how stationarity assumptions affect model validity, how autocorrelation structure informs model selection, and how frequency-domain analysis can complement time-domain approaches for understanding market dynamics.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/time-series-fundamentals-4dfbbc5dc1d1>`__.

ARMA and ARIMA Models
---------------------

A foundational guide to Autoregressive Moving Average (ARMA) and Autoregressive Integrated Moving Average (ARIMA) models for financial time series forecasting. The article covers the theoretical framework from the seminal Box-Jenkins methodology, including model identification, parameter estimation via maximum likelihood, diagnostic checking, and the complete model selection process using ACF/PACF analysis and information criteria.

The post explains how these models capture temporal dependencies in financial data through autoregressive and moving average components, and how differencing extends them to handle non-stationary series. Practical applications in algorithmic trading, risk management, and investment strategy formulation are discussed, along with model limitations and extensions.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/arma-and-arima-models-f5ab52a191ba>`__.

Cointegration and Error Correction Models
------------------------------------------

An exploration of cointegration and Error Correction Models (ECMs) for analyzing long-run relationships between financial time series. The article covers the problem of spurious regression, the Engle-Granger two-step method and Johansen test for cointegration testing, and the Vector Error Correction Model (VECM) framework for modeling both short-run dynamics and long-run equilibrium relationships.

The post demonstrates how these tools move beyond simple correlations to uncover deeper economic connections between non-stationary time series. Applications in quantitative finance include pairs trading strategies, cross-asset hedging, term structure modeling, and understanding the lead-lag relationships between related financial instruments.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/cointegration-and-error-correction-models-a03cfb900ed1>`__.

Fractional Differencing: How to Save Time Series Memory
--------------------------------------------------------

Zaur T explains fractional differencing, a technique from Marcos Lopez de Prado's Advances in Financial Machine Learning, and walks through implementing it from first principles in Python and Polars. The core problem is that standard differencing — computing returns via `.diff()` or `.pct_change()` — makes a financial time series stationary but destroys its historical memory. Today's price is not random; it is shaped by institutional momentum, past events, and sequential trades, and eliminating that context leaves a machine learning model with amnesia. Fractional differencing solves this by applying an exponent between 0 and 1 rather than an integer, generating a weighted average of all historical prices with slowly decaying coefficients that never fully reach zero.

The post builds the math from the Backward Shift operator and the Binomial Theorem, derives Newton's generalization for non-integer exponents, and explains the morphing ratio that avoids factorial overflow for decimal powers. The author then implements the algorithm in Polars with a per-ticker window function to prevent look-ahead bleed between assets. Two statistical traps receive careful attention: hardcoding ADF test lags (which confuses institutional momentum with non-stationarity) and computing the optimal d on the full dataset (which leaks future volatility into the training window). The solution is to find a global d on the training split only, then apply it blindly to the test period. At d=0.4, the transformed series passes the ADF stationarity test while retaining 85.47% of the original price memory.

By Zaur T, Notes on ML.

`Read the blog post <https://zaurtarunov.substack.com/p/fractional-differencing>`__.

Transformer Models for Financial Time Series
---------------------------------------------

This article discusses Transformer-family models for financial time series, including the motivation for moving beyond recurrent architectures such as LSTMs. It frames attention mechanisms and architectures like TFT as tools for learning longer-range dependencies and richer feature interactions in market data.

The piece is useful as practitioner context for why TFT is appealing in trading research: it can combine multiple covariates, provide multi-horizon forecasts, and offer some interpretability. It is not a substitute for a peer-reviewed comparison or a reproducible trading backtest, but it is a readable overview for researchers deciding whether to test Transformer models in a finance pipeline.

By Nordvarg.

`Read the blog post <https://nordvarg.com/blog/transformer-models-financial-timeseries>`__.

Transformer Models for Price Prediction: Beyond LSTM
-----------------------------------------------------

TradingMaster's article introduces Transformer models for price prediction and contrasts them with LSTM-style recurrent models. It discusses how attention-based architectures, including TFT-style workflows, can be used with market features and PyTorch Forecasting-style tooling.

The article is useful for readers who want a trading-oriented conceptual overview before reading code or papers. Its limitations are the usual ones for strategy-facing blog material: the real question is not just forecast accuracy, but whether the forecast can be converted into a robust signal after accounting for costs, latency, turnover, and adverse selection.

By TradingMaster.

`Read the blog post <https://tradingmaster.app/blog/transformer-models-for-price-prediction>`__.

Time-Series Forecasting: Deep Learning vs Statistics - Who Comes Out on Top?
-----------------------------------------------------------------------------

This article compares deep-learning forecasting models with classical statistical approaches, including discussion of Temporal Fusion Transformer as an interpretable deep time-series model. The framing is broader than trading, but the comparison is directly relevant to financial forecasting where simple baselines often remain hard to beat.

For trading researchers, the most useful takeaway is methodological humility. TFT and related deep models are flexible, but they should be benchmarked against strong statistical baselines and simple market-specific rules rather than only against weaker neural models. This is especially important in volatility forecasting, where GARCH, HAR, and realized-volatility baselines are durable competitors.

`Read the article <https://readmedium.com/time-series-forecasting-deep-learning-vs-statistics-who-wins-c568389d02df>`__.

.. _multifractal-model-asset-returns:

A Multifractal Model of Asset Returns
--------------------------------------

Mandelbrot, Fisher, and Calvet introduce the Multifractal Model of Asset Returns (MMAR), which deforms calendar time through a multifractal trading time to capture two empirical facts the Gaussian random walk misses: returns exhibit long memory (volatility clusters in runs of calm and storm), and tails remain heavy at every horizon. The model generates the key stylized facts of financial returns — fat tails, volatility clustering, and long-range dependence — from a single mechanism rather than bolting each on separately.

The test is the scaling function: take the q-th moment of absolute returns over intervals of length Δt and measure how it grows. For a plain random walk, the scaling exponent ζ(q) = q/2 is linear. For real markets, ζ(q) bends into a concave curve, meaning small and large moves scale by different rules. That curvature is the empirical content of "multifractal." The model describes the statistics of wildness — it does not forecast. Published as Cowles Foundation Discussion Paper No. 1164, Yale University, 1997.

`Read the paper <https://users.math.yale.edu/~bbm3/web_pdfs/Cowles1164.pdf>`__

.. _tda-landscapes-of-crashes:

Topological Data Analysis of Financial Time Series: Landscapes of Crashes
--------------------------------------------------------------------------

Gidea and Katz apply persistent homology — a tool from topological data analysis — to sliding windows of daily returns from major U.S. stock market indices around the 2000 dot-com crash and the 2007–2009 financial crisis. They embed each window as a point cloud in high-dimensional space and track the birth and death of topological features (loops, voids) as the resolution parameter varies. The persistent features are summarised as "persistence landscapes," and their Lp-norms serve as a single time series measuring topological complexity.

The headline finding is that persistence landscape norms exhibit a strong rising trend for approximately 250 trading days prior to both crashes, suggesting TDA can serve as an early-warning indicator. The appropriate scepticism: this is demonstrated in-sample on two well-known events. A turbulence indicator that lit up before the two crashes everyone already studies has not yet proven it will light up before the next one without crying wolf in between. TDA gives a turbulence diagnostic, not a forecast. Published on arXiv, 2017.

`Read the paper <https://arxiv.org/abs/1703.04385>`__

Bayesian Forecasting in Economics and Finance: A Modern Review
--------------------------------------------------------------

This survey by Gael M. Martin, David T. Frazier, Worapree Maneesoonthorn, Rubén Loaiza-Maya, Florian Huber, Gary Koop, John Maheu, Didier Nibbering and Anastasios Panagiotelis (*International Journal of Forecasting* 40(2):811-839, 2024; arXiv:2212.03471) is the recommended modern anchor for the whole Bayesian-in-trading literature: a peer-reviewed, state-of-the-art overview of Bayesian forecasting written with explicit attention to computation and implementation. It covers the modern toolkit — MCMC, variational and approximate Bayesian methods — and, most relevant to state-space trading models, gives a full algorithmic treatment of sequential Monte Carlo / particle filtering, including particle marginal Metropolis-Hastings (PMMH, Andrieu et al. 2011) for estimating models where the likelihood is only available through a particle filter.

Our summary: if you read one survey to orient yourself in Bayesian time-series methods for trading, make it this one. Unlike older reviews it is deliberately implementation-aware ("sufficient computational detail to assist the reader with implementation"), which is what a developer actually needs to go from equations to working filters. The SMC/PMMH material directly supports the regime-switching stochastic-volatility and nonlinear-spread models elsewhere in this collection (Bao-Chiarella-Kang, Zhang). Theoretical survey, but the most practically useful one for building Bayesian estimation into a systematic stack.

Data and code: a review article with algorithmic appendices (PMMH given as Algorithm 3); no single dataset or repository, but it points to the standard computational methods and references.

Key metrics: not applicable — a survey. Value is breadth, currency (2024), and the implementation-oriented treatment of SMC/particle methods.

`Read the paper <https://arxiv.org/abs/2212.03471>`__

Matrix Profiles for Pattern Recognition in Financial Time Series
----------------------------------------------------------------

Andreas Steiner demonstrates a Matrix Profile-based pattern-recognition engine for financial data, built as a transparent, inspectable toolkit inside Excel (via his ApaLibNET add-in) rather than a black-box ML model. The worked example runs on the daily prices of a major listed Swiss insurance company. For every fixed-length window in the return series (here 10 bars), the Matrix Profile computes a distance (profile value) to the window's nearest neighbour elsewhere in the series and records that neighbour's index. Low profile values flag recurring local patterns (motifs); high values mark discords — unusual sequences of returns with no close historical analogue — while the nearest-neighbour index lets you pull out concrete "pattern pairs" instead of abstract statistics.

The post walks through turning those pairs into side-by-side windows of data in both raw and standardised form, making it visually clear that the method compares shapes rather than levels: 10-bar paths that look strikingly similar once mean and volatility are removed, answering the literal question "when did the market trade through a similar micro-path?". Charts overlay profile values against cumulative returns so motif-rich and anomaly-rich periods line up with the market's trajectory, and show the most similar patterns in raw and standardised space — surfacing regime signatures and recurring micro-structures that are hard to spot with traditional tools. Steiner's stated goal is to bring state-of-the-art time-series motif and anomaly detection to non-programmers, deliberately restricting himself to the more rudimentary methods to keep the toolkit understandable.

By Andreas Steiner.

`Read the post <https://www.linkedin.com/posts/andreassteiner_coulnt-resist-to-starting-on-another-topic-share-7481611775717654528-HPLK/>`__.

.. _forecasting-with-hyper-trees:

Forecasting with Hyper-Trees
----------------------------

Alexander März and Kashif Rasul (Morgan Stanley Research) introduce Hyper-Trees (arXiv:2405.07836, first published May 2024, revised through May 2026): a framework that repurposes gradient boosted decision trees from forecasting time series directly to learning the *parameters* of a classical time series model — AR, ARMA, ETS, STL, VAR — as functions of features. The name transfers the concept of hypernetworks (a model that generates the parameters of another model) from deep learning to GBDTs: the tree takes calendar features, categoricals and exogenous drivers and outputs, say, AR(p) coefficients that vary across series and over time; the AR model then generates the forecast through its own recursion. The tree does parameter estimation, the classical model does the forecasting, and the GBDT never forecasts the target directly. Training is end-to-end: the loss is evaluated on the target model's forecast, and gradients and Hessians flow back through the target model to the tree via automatic differentiation (PyTorch), with a Gauss-Newton Hessian approximation to keep the recursive ETS case numerically stable. To scale to target models with many parameters (e.g. VAR coefficient matrices), a hybrid "Hyper-TreeNet" uses the GBDT as a feature encoder whose one-dimensional embedding is decoded by a shallow MLP into the parameter vector, trained jointly on the same computational graph — keeping runtime nearly constant in the number of parameters where the one-tree-per-parameter strategy scales roughly linearly.

Our summary: the design wins four properties that matter for anyone using LightGBM-style models on time series. Extrapolation — forecasts come from the parametric model, not the tree's piecewise-constant output, so trends continue beyond the training range without differencing, detrending or linear-tree workarounds. Cross-learning — one global model learns the feature-to-parameter mapping jointly across all series while each series still gets its own parameters. Interpretability — forecasts are produced by classical models whose parameters retain statistical meaning, and the tree's SHAP values and feature importances explain each parameter. Full GBDT functionality — missing-value handling, categoricals and monotonicity constraints carry over unchanged. Notably, the framework deliberately excludes all target-derived features (lags, rolling means), relying on the target model's inductive bias to capture temporal dynamics. The authors are candid that Hyper-Trees do not beat every model everywhere — the honest framing is a new perspective on GBDTs for forecasting, with accuracy depending on choosing a target model whose assumptions match the data (their multiplicative-seasonality ETS visibly degrades on the heterogeneous Tourism dataset).

Used data and code: all experiments use public benchmark datasets — Air Passengers, Australian Electricity Demand, Australian Retail Turnover, M3 Monthly/Yearly, M5 (aggregated to 70 store-department series), Rossmann Store Sales and Tourism — against AR/ARIMA/ETS, LightGBM variants, Deep-AR, Temporal Fusion Transformer, and the Chronos foundation model as baselines. The reference implementation is open source (see the :ref:`Hyper-Trees repository <hyper-trees-repository>` entry), installable via ``pip install hypertrees-forecasting``.

Key metrics: this is a forecasting-methodology paper, so results are forecast errors rather than trading statistics. On Air Passengers, Hyper-Tree-AR is best across all five metrics (MAPE 2.52 vs 4.18 for AutoARIMA and 3.07 for LightGBM). In local evaluation, Hyper-TreeNet-AR leads Australian Electricity Demand (MAPE 2.93) and most Tourism metrics. In global evaluation, Hyper-Tree-AR is the most accurate model on the operationally complex Rossmann dataset — beating conventional GBDTs on their home turf — while Chronos wins M3 Monthly and Deep-AR wins M5, with Hyper-TreeNet-AR competitive at faster runtimes.

Mentioned by Alexander März in `this LinkedIn discussion <https://www.linkedin.com/posts/alexander-m%C3%A4rz_hypertrees-forecasting-share-7483515255164387328-BWjm/>`__, where he summarises the idea ("the tree does the parameter estimation, while the classical model does the forecasting") and announces the v0.2.0 release adding VAR models, an ARMA extension, intermittent-demand (TSB) and conformal forecast intervals.

`Read the paper <https://arxiv.org/abs/2405.07836>`__

.. _the-sandwich-laplace-coordinates:

The Sandwich: Running Any Forecasting Model in Laplace's Coordinates
--------------------------------------------------------------------

Peter Cotton's ``skaters`` project documents a composition pattern it calls the "laplace sandwich": instead of replacing an existing forecaster, you wrap it. The bottom slice is the ``laplace`` forecaster's causal bijection on paths — the Rosenblatt transform of each observation under the predictive distribution issued for it, which turns a raw series into a near-i.i.d. standard normal ``z`` stream with drift and conditional volatility already removed. The filling is any model you like — Prophet, ETS, AutoARIMA, GARCH, a tabular foundation model, a PyMC program — fitted on ``z`` rather than on the raw data. The top slice is the exact inverse: ``log f₁(y) = log f₂(z) + log fₜ(y) − log φ(z)``, so the sandwiched density is reported in the original units with no approximation in the accounting. Nothing is retrained and no calendar or seasonality machinery inside the wrapped model is discarded; it simply operates on a stationarised, unit-scale input.

The page's value is the measured lifts rather than the idea. On the FRED-30 universe, ETS, AutoARIMA, GARCH(1,1) and Prophet all trail plain ``laplace`` by roughly two nats per observation raw, and all land within ±0.05 nats of it once sandwiched. On a pre-registered 921-series run, Prophet's median gap of 0.76 nats (4.6 family-weighted) collapses to 0.02 — about 97% of the density gap closed without retraining, packaged as ``prophet-laplace``. The interesting cases are the positive epsilons: a TabFM classifier head reaches +0.87 nats family-weighted (+1.99 on repeat-heavy series) and a Student-t lag regression in PyMC reaches +0.04 median while beating ``laplace`` on 65% of series, with a single pre-test ADVI fit frozen across 150 test steps still tying it — evidence that in ``z`` coordinates, refit staleness costs almost nothing and that the residual structure the wrapped model recovers is real. Anomaly detectors locate the boundary of the trick: DSPOT's UCR accuracy roughly doubles (0.120 to 0.232), RRCF is a wash because it carries its own normaliser, and a left-discord matrix profile is actively hurt (0.587 to 0.427) because whitening destroys the templates it matches on. The sandwich transfers the forecaster's competence in both directions — it helps methods whose theorems assume a stationary, calibrated input, and hurts shape matchers.

By Peter Cotton (``skaters``, microprediction).

`Read the blog post <https://skaters.microprediction.org/sandwich.html>`__

.. _transforms-all-the-way-down:

Transforms All the Way Down: Automatic Online Distributional Forecasting by Conjugation
----------------------------------------------------------------------------------------

Peter Cotton's methods paper for the :ref:`skaters library <skaters-repository>` (August 2026, SSRN). Every node in the system — transform, ensemble or leaf — is a pure function ``(y, state) -> ([Dist], state)`` that consumes one observation and emits one predictive distribution per horizon, where a ``Dist`` is a weighted Gaussian mixture. Because that type is closed under composition, an entire model is a stack of invertible transforms ("transforms all the way down") sitting on a single distributional leaf fitted by a proper scoring rule, and the whole collection collapses into one forecast function with no exposed tuning parameters, called ``laplace``. The paper's three contributions are a pluggable objective (the leaf's scoring rule is a knob at the base of the recursion, not a property of the method — pointing the terminal leaf at CRPS while the trunk stays likelihood-weighted makes the same forecaster competitive with a CRPS specialist *and* stronger on likelihood); distributional structure that survives composition (a mean-preserving lattice projection that places atoms on values a series revisits and vanishes on continuous data, an online Yeo-Johnson coordinate search, composable GARCH and Ornstein-Uhlenbeck blocks, and a multi-scale granularity mixture that extends likelihood weighting to the sampling clock itself); and a benchmark against twelve distributional baselines chosen to be hard to beat.

Our summary: the framing worth taking away is No-Free-Lunch treated as an engineering constraint rather than a caveat. Every candidate model is an explicit operational prior over series behaviour, likelihood weighting drains the weight of a bad prior as evidence accumulates, and the scope of the resulting claim is stated rather than averaged away. That discipline shows up most clearly in how the price case is handled: asset returns are hard not because of heavy tails (the scale-mixture leaf already models those) but because they are close to martingales, so the conditional mean carries almost no signal and what skill remains lives in the conditional variance, where a dedicated GARCH(1,1)-t recursion still tracks volatility clustering better. The paper reports that as a split, recommends GARCH-t on prices, and then generalises the price label into a continuous *martingality* axis along which the whole contest is governed — a more useful object than the binary. Two other results transfer beyond this package: Bayesian model averaging preserves mean and variance but washes kurtosis out, so adding heavy-tailed candidates to a pool does not help and a terminal scale-mixture leaf is needed instead; and the sandwich construction (Rosenblatt-transform to a near-i.i.d. N(0,1) stream, run any model there, map back through the exact Jacobian) turns the forecaster into a residual test on other people's models, described further in :ref:`the sandwich write-up <the-sandwich-laplace-coordinates>`.

Used data and code: the benchmark universe is FRED — a 7,607-series sweep across daily, weekly and monthly frequencies, restricted for the headline tables to the 5,402 continuous non-price daily change-series (those with under 5% exactly-repeating one-step changes, grouped into 1,213 correlated leading-letter families), plus a 2,500-series stratified sample of equity/FX/commodity returns for the price arm. Baselines are the real implementations rather than ports: ``statsforecast`` AutoARIMA and AutoETS, R's ``auto.arima``, ``thetaf``, Svetunkov's ADAM and ``nnetar``, GARCH(1,1)-t from both ``arch`` and ``rugarch``, split-conformal and ACI residual variants, and conformal seasonal pools, with every method converted into the same ``Dist`` and scored through one protocol. Everything runs from a single harness (``benchmarks/study.py sota``) in the repository, with a multi-step harness alongside; note that reproducing the paper's tables exactly requires ``laplace(scale_alpha=0.01)``, since the shipped default was raised to 0.03 after submission.

Key metrics: this is a forecasting paper, so the results are scores rather than trading statistics. On the non-price universe ``laplace`` wins the per-series held-out log-likelihood race against eleven of twelve baselines, typically on 82–98% of series and surviving family-clustering (ADAM 98%, ``nnetar`` 97%, AutoETS 95%, ``thetaf`` 92%, ``rugarch`` GARCH-t 90%, AutoARIMA 87%, R ``auto.arima`` 84%, conformal variants 82–84%, CSP 98%). Paired per-series log-score differences are positive against all twelve, from +0.003 nats median against the ``arch`` GARCH-t to +1.60 against ``nnetar``. The lone exception is that ``arch`` GARCH-t, a 51/50 coin-flip that resolves along the martingality axis: ``laplace`` wins 78% of the low-martingality tercile (+0.182 nats) but only 31% of the high tercile, and on the 2,500 price series GARCH-t wins the likelihood race 9 to 1 (swapping in the library's own ``garch_leaf`` roughly halves the paired deficit without closing it, while both variants still beat AutoARIMA and AutoETS on 68% of those same price series). CRPS is more mixed, as usual: comfortable wins over the mean-model and state-space baselines (63–82% family-weighted) but roughly even against the GARCH-t specialist (48%) and slightly behind the CRPS-optimised conformal variants (49%).

`Read the paper <https://github.com/microprediction/skaters/blob/main/papers/skaters-jss.pdf>`__

.. _conformal-information-gap:

An Empirical Study of the Conformal Information Gap
-----------------------------------------------------

Every forecasting architecture restricts the information its predictive law is allowed to use. Peter Cotton (August 2026, SSRN preprint, under journal review) makes the cost of that restriction exact: under logarithmic loss, replacing the full information ``X`` by a retained representation ``T(X)`` decomposes the excess risk into a *representation regret* — the conditional mutual information ``I(Z; X | T)``, which the paper calls the **information gap** — plus a within-representation regret measuring how far the fitted forecast sits above the best forecast the architecture permits. The first term is irreducible: it vanishes only when the representation is sufficient. Applied to conformal prediction the decomposition lands with unusual force, because residual pooling fixes the representation by construction, so the floor becomes the mutual information ``I(R; X)`` between residual and input, and Theorem 11 extends this to pooling in any state-dependent coordinate system. The identity itself is classical in substance (value-of-information, Blackwell sufficiency, White's misspecification decomposition); the contribution is stating it for conformal systems and then *measuring* it.

Our summary: the paper's most useful reframing is that methods which look philosophically opposed are just different stopping rungs on one ladder. A full transform stack composes location, scale, seasonal, serial and coordinate transformations until what remains is as close to white as the grammar permits; signed-residual conformal predictive systems pool raw residuals immediately after the point forecast; symmetric split-conformal pools their absolute values; normalized variants stop one rung later. Residual pooling, on this reading, *is* early stopping — and the marginal coverage guarantee is indifferent to where you stop, which is exactly why the temptation exists. That separates two decisions that are usually conflated: whether to pool is an estimation trade-off between an empirical law and a fitted family, and either can win at a given sample size; *what* to pool fixes the coordinates, and with them a floor no estimator of either kind can cross. The paper is careful about what its own measurement identifies — the ladder is an architecture ablation in which successive rungs change the whole forecaster, so the measured values price architectures rather than isolating a fixed-predictor pooling floor, which is what the separate matched-predictor experiment is for. It is equally careful that the numbers are relative to a benchmark distribution: the near-zero seasonal rung is a fact about adjusted FRED change-series, not about seasonality.

Used data and code: 572 continuous FRED change-series, scored one step ahead on held-out data, with a nested transform grammar declared in advance; the matched-predictor grid holds the point predictor fixed and crosses four representation depths (constant, scale, +serial, +shape) against fitted versus empirical residual-law estimators, settled by a 99-point quantile approximation to CRPS. A small i.i.d. simulation (400 replications, 20,000 test points each, ``check_conformal_sim.py``) completes the story in the setting where split-conformal validity actually applies. The ``skaters`` library is the measurement instrument and the experiment scripts live in its ``benchmarks/`` directory.

Key metrics: the full grammar recovers a positive gain over the trivial architecture on all but one of the 572 series, mean 0.49 nats per observation (quartiles 0.13 / 0.24 / 0.60). Attribution by rung: conditional scale is the largest and by far the most reliable component at +0.218 nats (44% of the mean gain, improving 95% of series), followed by the final-system bundle at +0.138 (28%, 85% of series) and location at +0.114 (23%) — but location is bimodal, with a median of zero, improving only 55% of series, and worth 0.50 nats on average on the 23% where it matters at all. Serial structure is small but consistent (+0.018, 74% of series) and seasonal is essentially nil on this corpus (+0.003, 16%). In the matched-predictor grid the empirical estimator beats its fitted counterpart at every depth (86%, 80%, 98%, 88% of series at depths 0–3), the best cell is scale-normalized empirical pooling — the predictive core of normalized conformal — and, with the point predictor held fixed, it beats raw empirical pooling on **90% of the 572 series**, trailing by 2.1% of the pooled score on average. The simulation shows why the certificate does not save you: raw and normalized split conformal both hit 90.1% marginal coverage, but raw pooling overcovers the calm scale quartile at 99.8% and covers only 76.7% of the most volatile, at wider intervals (5.37 vs 4.96) and worse interval score (7.26 vs 6.21) — identical order-statistic rule, different coordinates.

`Read the paper <https://github.com/microprediction/conformalprediction/blob/main/papers/frontier/frontier.pdf>`__

.. _skaters-joss-paper:

skaters: Online Distributional Time-Series Forecasting by Conjugation, in Python and JavaScript
------------------------------------------------------------------------------------------------

The short software paper for the :ref:`skaters package <skaters-repository>` (Peter Cotton, August 2026, under review at the *Journal of Open Source Software*). It states the design contract compactly: every forecaster is a pure function ``(y, state) -> (dists, state)`` whose state is an explicit dictionary rather than hidden object internals, so a model can be checkpointed as JSON, resumed elsewhere, or handed across a language boundary mid-stream. Conjugation is then just function composition under that protocol — a transform wraps an inner skater, the wrapped object satisfies the same protocol, so models nest to any depth and an ensemble is simply another skater. Since v0.13.0 every predictive also carries generalized-Pareto tails fitted online by censored maximum likelihood.

Our summary: read this rather than the methods paper if you want the positioning argument in two pages. Its "state of the field" section is the clearest statement of the gap the package aims at: ``statsmodels`` and ``darts`` are batch-refit and largely point- or interval-oriented, Prophet targets batch seasonal decomposition, ``GluonTS`` is distributional but assumes a deep-learning stack and offline training, and ``river`` is natively online but centred on point prediction — none supplies an online predictive *density* as a single dependency-free function, and none runs unchanged in a browser. The paper is also unusually forthright in a way worth noting given how much of this collection is now LLM-adjacent: it carries an explicit AI-usage disclosure stating that portions of the source, the multi-language ports, the parity and test suites and drafts of the manuscript were produced with LLM assistance under the author's direction, and leans on the cross-language parity suite and reproducible benchmark scripts as the mechanism that makes those claims checkable rather than trusted.

Used data and code: the same FRED benchmark harness as the methods paper (the JOSS summary quotes a 894-series continuous non-price subset and the companion paper's 5,402-series universe), with the UCR Anomaly Archive supporting the calibration studies. The manuscript source is ``papers/joss/paper.md`` in the repository.

Key metrics: tail calibration is the headline number here — on 142 economic series the nominal 99.9% central interval covers 99.85% empirically, where a Gaussian read of the same forecaster covers 99.13%. The calibration state converts directly into an anomaly detector with a stated false-alarm budget (alarm when ``erfc(|z|/sqrt(2)) < alpha``), with measured rates near nominal on economic series. The parity suite checks roughly 100,000 probe values to 1e-6 agreement across five language ports on every CI run.

`Read the paper <https://github.com/microprediction/skaters/blob/main/papers/joss/paper.md>`__
