.. meta::
   :description: Research papers and posts on machine learning methods for trading, including feature engineering, meta-labeling, and deep learning approaches.

Machine Learning
~~~~~~~~~~~~~~~~

Machine learning has transformed systematic trading research, offering tools to extract signals from high-dimensional data, model nonlinear relationships, and adapt to changing market dynamics. However, applying ML to financial markets requires careful attention to the unique challenges of financial data: low signal-to-noise ratios, non-stationarity, temporal dependence, and the danger of overfitting to historical data. The seminal work of Marcos López de Prado established a rigorous methodological framework addressing these challenges, including information-driven bars, triple-barrier labeling, meta-labeling, and purged cross-validation.

The research here covers both methodology — how to properly apply ML to financial time series without look-ahead bias or spurious overfitting — and specific applications: deep learning on limit order book data, meta-labeling to filter directional signals, ML approaches to volatility forecasting, regime detection through clustering and classification, and reinforcement learning for portfolio allocation. A consistent theme is the gap between impressive in-sample ML results and robust out-of-sample performance.

Related topics include :doc:`Backtesting & Research Methodology <./backtesting>` for overfitting detection and validation frameworks, :doc:`Time Series Forecasting <./time-series>` for forecasting-specific methods, and :doc:`Volatility Modeling <./volatility>` for ML approaches to volatility prediction.

The 10 Reasons Most Machine Learning Funds Fail
------------------------------------------------

Marcos López de Prado (Journal of Portfolio Management 2018) distils the ten most common methodological mistakes that cause quantitative ML funds to fail in practice. The paper is the canonical practitioner reference for the methodology family that follows: information-driven bars, triple-barrier labelling, meta-labelling, sample uniqueness, purged K-fold cross-validation, combinatorial purged CV, deflated Sharpe ratio, and probability of backtest overfitting.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3104816>`__

On technical trading and social media indicators for cryptocurrency price classification through deep learning
--------------------------------------------------------------------------------------------------------------

Predicting the prices of cryptocurrencies is a notoriously challenging task due to high volatility and new mechanisms characterising the crypto markets. In this work, we focus on the two major cryptocurrencies for market capitalisation at the time of the study, Ethereum and Bitcoin, for the period 2017–2020. We present a comprehensive analysis of the predictability of price movements comparing four different deep learning algorithms (MLP, CNN, LSTM, and ALSTM). We found an increase in accuracy for the daily classification task from a range of 51%–55% for the restricted model to 67%–84% for the unrestricted one.

`Read the paper <https://arxiv.org/pdf/2102.08189.pdf>`__.

Multi-source aggregated classification for stock price movement prediction
--------------------------------------------------------------------------

We propose a novel Multi-source Aggregated Classification (MAC) method for stock price movement prediction. MAC incorporates the numerical features and market-driven news sentiments of target stocks, as well as the news sentiments of their related stocks. To better represent real market sentiments from the news, we pre-train an embedding feature generator by fitting the news to real stock price movements. Moreover, MAC introduces a graph convolutional network to capture the news effects of related companies on the target stock.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1566253522002019>`__.

Clustering Market Regimes Using the Wasserstein Distance
---------------------------------------------------------

This paper introduces Wasserstein k-means clustering for identifying market regimes from return distributions. Unlike standard clustering that uses Euclidean distance on summary statistics, the Wasserstein approach operates directly on distributional properties, capturing the full shape of the return distribution in each period and identifying regime changes that conventional methods miss.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3830626>`__

Asset Allocation: From Markowitz to Deep Reinforcement Learning
----------------------------------------------------------------

This paper benchmarks nine portfolio allocation strategies ranging from classical Markowitz mean-variance optimization to deep reinforcement learning approaches, providing a comprehensive comparison of their risk-adjusted performance across different market environments. The study clarifies when traditional optimization approaches outperform ML alternatives and vice versa.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851166>`__

Clustered Feature Importance
-----------------------------

This paper addresses the problem of correlated feature importance in machine learning models applied to financial data. Standard feature importance measures are unreliable when predictors are correlated, a common situation in finance. The clustered feature importance approach groups correlated features and computes importance at the cluster level, providing more reliable attribution.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851167>`__

Does Meta-Labeling Add to Signal Efficacy?
-------------------------------------------

This paper provides an empirical evaluation of the meta-labeling methodology introduced by López de Prado, testing whether a secondary ML classifier that predicts the probability of a primary signal being correct actually improves trading performance. The paper quantifies the conditions under which meta-labeling adds value and when it does not.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851168>`__

Algorithmic Crypto Trading Using Information-Driven Bars, Triple-Barrier Labeling and Deep Learning
----------------------------------------------------------------------------------------------------

This paper implements the full López de Prado pipeline — information-driven bars, triple-barrier labeling, meta-labeling, and purged cross-validation — on cryptocurrency data with deep learning classifiers. The study provides one of the most complete empirical implementations of the AFML methodology, demonstrating how each component contributes to out-of-sample performance.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851169>`__

Stock Price Prediction Using Triple-Barrier Labeling and Raw OHLCV Data
------------------------------------------------------------------------

This paper applies triple-barrier labeling to generate target labels for stock price prediction from raw OHLCV data, without relying on financial features or alternative data. The study demonstrates that triple-barrier labels align the ML objective with actual trading outcomes, improving the practical utility of ML predictions compared to simple directional classification.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851170>`__

Nonlinear Time Series Momentum
--------------------------------

This paper applies machine learning methods to capture nonlinear features of time-series momentum signals, documenting that momentum signals exhibit nonlinear dynamics that linear models miss. The authors show that ML-enhanced momentum strategies outperform their linear counterparts, particularly in periods of regime change and when lookback window length interacts with current volatility.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3950660>`__

Beyond delta neutrality: Confidence-scaled hedging with machine learning forecasts
-----------------------------------------------------------------------------------

This paper develops a machine learning approach to options hedging that scales the hedge ratio by the model's confidence in its forecast. Rather than maintaining a constant delta hedge, the strategy reduces hedging intensity when the ML model has low confidence and increases it when confidence is high, improving risk-adjusted hedging performance.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851172>`__

Regularised jump models for regime identification and feature selection
-----------------------------------------------------------------------

A regime modelling framework that jointly performs regime identification and feature selection using regularised jump models. The framework identifies the active regime from market and macroeconomic variables while simultaneously selecting features that best distinguish between regimes, improving both interpretability and regime identification accuracy compared to standard jump models.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4950423>`__.

Dynamic Asset Allocation with Asset-Specific Regime Forecasts
--------------------------------------------------------------

This article introduces a novel hybrid regime identification-forecasting framework designed to enhance multi-asset portfolio construction by integrating asset-specific regime forecasts. The framework leverages both unsupervised and supervised learning to generate tailored regime forecasts for individual assets, combining a statistical jump model for historical label generation with a gradient-boosted decision tree classifier for real-time regime prediction.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4864358>`__

Using AI to Improve the ADX Indicator for Breakout Trading
-----------------------------------------------------------

A video walkthrough demonstrating how AI-suggested modifications to the ADX (Average Directional Index) indicator can dramatically improve a breakout trading strategy's performance. Thomas Nissendal ("Mr. Breakout") takes an e-mini futures strategy built with his breakout trading formula and replaces its traditionally calibrated ADX filter with an AI-proposed approach: applying a simple moving average directly on ADX values with unified period lengths.

`Read the article <https://x.com/buildalpha/status/2019143439485661382>`__

Signal Validation Techniques Inspired by Robert Carver's Systematic Trading
----------------------------------------------------------------------------

Research Article #35 from Trading Research Hub. Focused on testing and verifying trading signals effectively, inspired by Robert Carver's book "Systematic Trading." The article addresses the common question of whether a given trading signal actually makes sense, using examples like RSI-based rules.

The article presents a framework for signal validation that goes beyond simple backtesting to assess whether a signal has genuine predictive power.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-35-building-robust>`__.

Adaptive Multi-Signal Position Sizing for Crypto Trading
---------------------------------------------------------

Research Article #33 from Trading Research Hub. Explores how to optimize trade allocation through multi-signal analysis in cryptocurrency markets. Instead of relying on a single trend-following or momentum indicator, the strategy aggregates multiple signals and scales portfolio exposure based on combined signal strength.

The article demonstrates how combining multiple indicators into a composite signal allows for more nuanced position sizing that reflects conviction levels. When more signals align, the position is larger; when signals conflict, exposure is reduced.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-33-adaptive-signal>`__.
