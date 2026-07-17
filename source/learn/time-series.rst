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
