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
