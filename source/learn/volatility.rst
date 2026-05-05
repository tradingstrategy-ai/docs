.. meta::
   :description: Research papers and posts on volatility modeling, GARCH, HAR models, realized volatility forecasting, and stochastic volatility.

Volatility Modeling
~~~~~~~~~~~~~~~~~~~

Volatility modeling sits at the intersection of financial econometrics and practical risk management. From Engle's ARCH model through the HAR cascade to modern deep learning approaches, the field has progressively improved its ability to forecast the volatility that directly determines position sizes, risk capital allocations, and option prices. A central stylized fact — that volatility clusters, mean-reverts, and exhibits long memory — constrains the class of useful models and explains why simple GARCH(1,1) remains competitive with far more complex alternatives.

This collection spans the core modeling traditions: the ARCH/GARCH family and its extensions for conditional heteroskedasticity, the Heterogeneous Autoregressive (HAR) model as the standard realized-volatility benchmark, neural-network approaches from LSTM to convolutional architectures, regime-switching models including Markov-switching GARCH for Bitcoin, and stochastic volatility frameworks. Practical entries cover log-return normalization for options pricing and the volatility paradox in systematic crypto trading. The connecting theme is that volatility forecasting is high-stakes: getting it wrong by a factor of two has a direct and proportional impact on strategy returns.

Related topics include :doc:`Risk Management <./risk-management>` for volatility-targeting position sizing frameworks, :doc:`Market Regimes <./market-regimes>` for regime-switching volatility models, and :doc:`Portfolio Construction <./portfolio-construction>` for covariance estimation and portfolio volatility control.

Volatility-Managed Portfolios
------------------------------

Alan Moreira and Tyler Muir (Journal of Finance, 2017) show that managed portfolios which scale down exposure when volatility is high and scale up when volatility is low produce large alphas, higher Sharpe ratios, and large utility gains for mean-variance investors. They document the effect across the market factor, value, momentum, profitability, return on equity, investment, and betting-against-beta factors, as well as the currency carry trade. The mechanism is simple: changes in volatility are not offset by proportional changes in expected returns, so volatility timing adds value even without forecasting returns.

Our summary: this is the canonical reference for the idea that cutting risk in high-volatility regimes improves risk-adjusted performance almost universally across equity and macro factors. What makes the result powerful is its breadth — the same volatility-scaling overlay helps nearly every standard factor portfolio. For practitioners, the paper justifies the common CTA and risk-parity practice of volatility targeting as an ex-post optimal behaviour, and it is the natural companion to the Kim-Tse-Wald paper on TSMOM and volatility scaling, which asks how much of trend-following alpha is really the vol-scaling overlay rather than the direction signal.

Key metrics: volatility-managed versions of the market, value, momentum, and other factor portfolios produce statistically significant alphas relative to their unmanaged counterparts, with material improvements in Sharpe ratios. The effect is robust across the full sample (1926–2015 for equity factors) and across international markets and asset classes.

`Read the paper <https://conference.nber.org/confer/2016/LTAMs16/Moreira_Muir.pdf>`__

Early Birds Get the Vol: Morning Volatility Uncertainty and Variance Risk Premium
----------------------------------------------------------------------------------

This paper documents that morning-session implied volatility uncertainty — measured using VVIX, the volatility of the VIX — predicts the next-day variance risk premium with significant lead time. The finding suggests that the early-session options market efficiently incorporates information about forthcoming volatility regimes, providing a tradeable signal for variance-premium strategies.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851171>`__

A Simple Approximate Long-Memory Model of Realized Volatility
-------------------------------------------------------------

Fulvio Corsi proposes the Heterogeneous Autoregressive model of Realized Volatility (HAR-RV), an additive cascade of volatility components defined over daily, weekly, and monthly horizons. The model captures the empirically observed long-memory behavior of realized volatility through a parsimonious structure — a constrained AR model with three regressors: yesterday's daily RV, last week's average daily RV, and last month's average daily RV. Despite having no true long-memory mechanism, the HAR-RV successfully reproduces slow hyperbolic decay in the autocorrelation function, fat tails, and multi-scaling properties of financial returns. Published in the Journal of Financial Econometrics, Vol. 7, No. 2, 2009.

Our summary: this is the single most important baseline paper for anyone forecasting realized volatility. The HAR-RV is the benchmark that every subsequent model — HARNet, regime-switching HAR, machine-learning volatility forecasters — must beat. Its power comes from the Heterogeneous Market Hypothesis insight that traders operating at different frequencies (daily, weekly, monthly) create a cascade of volatility components. The model's practical appeal is that it requires only simple OLS estimation, is trivially reproducible, and still outperforms many far more complex alternatives.

Key metrics: the HAR-RV model outperforms standard AR, ARFIMA, and GARCH models in out-of-sample realized-volatility forecasting for the S&P 500 across daily, weekly, and monthly horizons.

`Read the paper <https://academic.oup.com/jfec/article-abstract/7/2/174/856522>`__

A Multiple Regime Smooth Transition Heterogeneous Autoregressive Model for Long Memory and Asymmetries
------------------------------------------------------------------------------------------------------

Michael McAleer and Marcelo C. Medeiros extend the HAR-RV model to a nonlinear multiple-regime framework using logistic smooth-transition functions. The resulting model simultaneously captures long-memory behavior through the HAR cascade structure and asymmetric, nonlinear volatility dynamics through regime-dependent coefficients. The paper develops a sequence of specification tests to determine the number of regimes and presents an estimation procedure for the smooth-transition HAR model. Published in the Journal of Econometrics, Vol. 147, No. 1, 2008.

Our summary: this is the first systematic extension of HAR to nonlinear regimes, and it answers whether adding regime-dependent behavior to HAR improves on the linear version. The smooth-transition mechanism allows model coefficients to change gradually as a function of an observable transition variable, which is more realistic than abrupt switching for capturing how markets transition between calm and turbulent states.

Key metrics: the multiple-regime smooth-transition HAR model improves in-sample fit relative to the linear HAR baseline, particularly for capturing sign and size asymmetries in volatility dynamics.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0304407608001280>`__

Forecasting Realised Volatility Using Regime-Switching Models
-------------------------------------------------------------

Yi Ding, Dimos S. Kambouroudis, and David G. McMillan extend standard AR and HAR models for realised-volatility forecasting to include nonlinearity through smooth transition and Markov-switching approaches. Using daily data for eight international stock markets over 2007-2021, the paper provides a comprehensive comparison using both statistical forecast evaluation metrics and economic (risk management) metrics including Value-at-Risk and Expected Shortfall. Published in the International Review of Economics & Finance, Vol. 101, 2025.

Our summary: this is the most up-to-date comparison of regime-switching approaches applied to HAR-style realized-volatility forecasting. The headline finding is nuanced: regime-switching models do improve both in-sample fit and out-of-sample forecasts, but the out-of-sample gains are less clear-cut at the daily horizon and become stronger at longer horizons. The paper also finds that Markov switching is preferred to smooth transition.

Key metrics: regime-switching HAR models outperform linear HAR in-sample and generally out-of-sample, with Markov-switching preferred over smooth transition. Daily-horizon gains are less clear-cut than weekly and monthly.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S105905602500334X>`__

Regime Changes in Bitcoin GARCH Volatility Dynamics
----------------------------------------------------

David Ardia, Keven Bluteau, and Maxime Rüede apply Markov-switching GARCH (MSGARCH) models to Bitcoin daily returns and find strong statistical evidence of regime changes in the volatility dynamics. The paper compares single-regime GARCH, EGARCH, GJR-GARCH, and TGARCH specifications against their two-state Markov-switching counterparts, testing both Normal and Student-t innovation distributions. The regime-switching models consistently outperform single-regime specifications for one-step-ahead Value-at-Risk forecasting. Published in Finance Research Letters, Vol. 29, 2019.

Our summary: this is the cleanest direct evidence that crypto volatility is genuinely regime-switching rather than merely persistent. The paper is short and focused, and the result is actionable: a two-state MSGARCH model produces better VaR forecasts than any single-regime GARCH variant for Bitcoin. The authors later released the MSGARCH R package, making this one of the more reproducible crypto volatility results.

Key metrics: MSGARCH models significantly outperform single-regime GARCH for Bitcoin one-day VaR forecasting. The two-state model identifies a low-volatility and a high-volatility regime with markedly different GARCH parameters. Likelihood ratio tests reject the null of a single regime across all specifications tested.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S1544612318303970>`__

Realized Volatility Forecasting with Neural Networks
----------------------------------------------------

Andrea Bucci compares feed-forward and recurrent neural-network architectures for realized-volatility forecasting, with particular emphasis on LSTM and NARX models against more traditional econometric baselines. The paper argues that volatility is a natural fit for neural methods because the target exhibits both long memory and nonlinear dependence, and evaluates whether those properties can be captured more effectively by recurrent architectures than by classical linear or semiparametric alternatives.

Our summary: this is one of the cleaner early references showing that neural nets can be genuinely useful for volatility forecasting rather than just fashionable. The important point is not simply that an LSTM beats a benchmark once, but that architectures designed to retain long-range temporal information consistently help when the volatility process becomes more unstable.

Key metrics: recurrent neural networks outperform the traditional econometric competitors in realized-volatility forecasting, with LSTM and NARX delivering the strongest results. The advantage is especially visible in highly volatile periods.

`Read the paper <https://academic.oup.com/jfec/article/18/3/502/5856840>`__

A Machine Learning Approach to Volatility Forecasting
-----------------------------------------------------

Kim Christensen, Mathias Siggaard, and Bezirgen Veliyev study realized-variance forecasting for Dow Jones Industrial Average constituents using a broad set of machine-learning methods, including regularized regressions, tree models, and neural networks, benchmarked against the HAR family. A key design choice is that the ML models are not given an unfair advantage through exhaustive tuning: the authors deliberately keep implementation simple and then ask whether generic ML still improves materially on the standard realized-volatility toolkit.

Our summary: the paper is useful because it shows that the gains from ML do not have to come from exotic feature sets or aggressive optimisation. Even with only daily, weekly, and monthly realized-variance lags, ML competes strongly and often wins, which suggests the main edge comes from learning a richer persistence structure than linear HAR models can express.

Key metrics: ML beats the HAR lineage even when the predictor set is restricted to daily, weekly, and monthly realized-variance lags, and the gains become larger at longer forecast horizons.

`Read the paper <https://academic.oup.com/jfec/article/21/5/1680/6612759>`__

Volatility Forecasting with Machine Learning and Intraday Commonality
---------------------------------------------------------------------

Chao Zhang, Yihuang Zhang, Mihai Cucuringu, and Zhongmin Qian forecast intraday realized volatility by pooling information across stocks and explicitly exploiting commonality in intraday volatility together with a market-volatility proxy. The paper moves beyond single-series forecasting and tests whether cross-sectional structure can be used to train models that generalize not just within a stock, but across previously unseen names as well.

Our summary: this is one of the more practically interesting volatility papers because it treats volatility as a partially shared phenomenon rather than a completely separate process for each asset. That framing matters in production settings where you want a single model to transfer across a universe instead of maintaining one bespoke forecaster per stock.

Key metrics: neural networks outperform linear regressions and tree-based models for intraday realized-volatility forecasting and the gains remain robust when applied to stocks absent from the training set.

`Read the paper <https://academic.oup.com/jfec/article/22/2/492/7081291>`__

HARNet: A Convolutional Neural Network for Realized Volatility Forecasting
--------------------------------------------------------------------------

Rafael Reisenhofer, Xandro Bayer, and Nikolaus Hautsch introduce HARNet, a convolutional architecture designed as a structured deep-learning extension of the classic HAR model. The model uses a hierarchy of dilated convolutions so the receptive field grows quickly without a comparable blow-up in parameters, and it is initialized so that before training it reproduces the corresponding HAR forecast exactly, making the transition from econometric baseline to neural refinement unusually transparent.

Our summary: HARNet is compelling because it does not ask practitioners to abandon the HAR intuition that has worked well for realized-volatility forecasting. Instead it starts from HAR, then adds learnable nonlinear filters on top of the same multi-horizon logic. That makes it one of the better examples of a finance-aware deep architecture: the gains come from extending a sensible domain prior rather than replacing it with an unconstrained network.

Key metrics: across three stock-market indexes, HARNet improves meaningfully on its HAR baselines in realized-volatility forecasting. Code and data available at `GitHub <https://github.com/mdsunivie/HARNet>`__.

`Read the paper <https://arxiv.org/abs/2205.07719>`__

DeepVol: Volatility Forecasting from High-Frequency Data with Dilated Causal Convolutions
------------------------------------------------------------------------------------------

Fernando Moreno-Pino and Stefan Zohren propose DeepVol, a dilated-causal-convolution model that forecasts next-day volatility directly from raw high-frequency intraday data rather than relying on precomputed realized measures alone. The paper is motivated by the idea that once the data are compressed into handcrafted realized-volatility features, some predictive information may already have been discarded, especially in the shape and timing of intraday volatility bursts.

Our summary: this is the closest match to the "raw input" version of volatility forecasting. The main contribution is not just a different architecture, but the end-to-end stance that the model should learn directly from intraday sequences instead of from manually aggregated volatility proxies.

Key metrics: using two years of NASDAQ-100 intraday data, DeepVol delivers more accurate day-ahead volatility forecasts and more accurate risk measures than traditional benchmarks. A one-day receptive field with 5-minute sampling gives the best overall forecasting accuracy.

`Read the paper <https://arxiv.org/abs/2210.04797>`__

Comparing Deep Learning Models for the Task of Volatility Prediction Using Multivariate Data
---------------------------------------------------------------------------------------------

Wenbo Ge, Pooia Lalbakhsh, Leigh Isai, Artem Lensky, and Hanna Suominen compare several deep-learning forecasters for multivariate volatility prediction across five assets: the S&P 500, NASDAQ 100, gold, silver, and oil. The paper benchmarks multilayer perceptrons, recurrent networks, temporal convolutional networks, and the Temporal Fusion Transformer against GARCH-style baselines, with the goal of understanding whether newer sequence architectures actually justify their added complexity.

Our summary: the value of this paper is comparative rather than methodological. It is useful when you already accept that deep models can forecast volatility and instead want to know which class of architecture tends to work best once you move from univariate to multivariate inputs.

Key metrics: the Temporal Fusion Transformer delivers the strongest overall performance among the tested deep-learning models, with temporal convolutional architectures typically next best.

`Read the paper <https://arxiv.org/abs/2306.12446>`__

Introducing NBEATSx to Realized Volatility Forecasting
------------------------------------------------------

Hugo Gobato Souto and Amir Moradi apply NBEATSx, a neural basis expansion model with exogenous variables, to daily stock realized-volatility forecasting over multiple horizons. They compare the architecture with LSTM, TCN, HAR, GARCH, and GJR-GARCH models across six stock indexes, three error measures, four statistical tests, and several robustness checks, making the paper unusually systematic for a single-model introduction.

Our summary: this is one of the stronger "modern forecasting architecture" papers in the volatility literature because the evaluation is broad and the results are reported in both accuracy and robustness terms. NBEATSx is attractive here not simply because it is newer than LSTM or TCN, but because its basis-expansion structure appears to work well when volatility persistence and exogenous effects both matter.

Key metrics: across six stock indexes, NBEATSx produces statistically more accurate and more robust forecasts than the competing models. On average, 13% and 8% better accuracy for medium- and long-term forecasts, plus robustness improvements of 43%, 60%, and 59% for short-, medium-, and long-term horizons respectively.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0957417423033043>`__

The Hybrid Forecast of S&P 500 Volatility Ensembled from VIX, GARCH and LSTM Models
-------------------------------------------------------------------------------------

Natalia Roszyk and Robert Ślepaczuk compare four approaches to forecasting S&P 500 volatility: a standalone GARCH model, a standalone LSTM, a hybrid LSTM-GARCH specification, and a hybrid model that also incorporates the VIX. The paper uses daily S&P 500 and VIX data from January 3, 2000 through December 21, 2023 and asks whether combining a classical volatility model with a neural sequence model and an implied-volatility signal produces a more useful risk forecast.

Our summary: the paper is a good example of the hybrid direction in current volatility research. Rather than framing ML and econometrics as mutually exclusive choices, it treats them as complementary components: GARCH supplies a disciplined volatility structure, LSTM adds nonlinear sequence modelling, and VIX contributes a market-implied state variable.

Key metrics: over the 2000-2023 sample, the hybrid LSTM models outperform the standalone GARCH benchmark, and adding VIX further improves forecasting performance beyond the plain LSTM-GARCH combination.

`Read the paper <https://arxiv.org/abs/2407.16780>`__

Realized Volatility and HAR Models: A New Paradigm for Volatility Forecasting
------------------------------------------------------------------------------

A comprehensive guide to realized volatility and the Heterogeneous Autoregressive (HAR) model for volatility forecasting. The article explains how high-frequency intraday data can be used to construct realized volatility measures that are more precise than traditional close-to-close estimators, and how the HAR framework captures the multi-scale, long-memory properties of volatility through a hierarchical cascade of daily, weekly, and monthly components.

The post covers key extensions of the base HAR model, including handling jumps (HAR-J), leverage effects, and realized semi-variance decomposition. It also discusses practical considerations such as microstructure noise, kernel-based estimators, and model evaluation using QLIKE and MSE loss functions. A Python implementation is provided for fitting HAR models and generating forecasts.

By Simone Menaldo.

Mentioned by Ralph Sueppel in `this discussion <https://x.com/macro_synergy/status/2021129224879288810>`__.

`Read the article <https://medium.com/@simomenaldo/realized-volatility-and-har-models-a-new-paradigm-for-volatility-forecasting-4a660f2530f3>`__.

Using Log Returns and Volatility to Normalize Strike Distances
--------------------------------------------------------------

A foundational tutorial on why log returns matter in financial and derivatives modeling. The article starts from first principles, explaining how the constant e represents continuous compounding and how the natural logarithm measures the time needed to reach a certain level of growth. This mathematical foundation is then applied to understanding why upside and downside price moves are not symmetric in compounded return space.

The practical application focuses on normalizing option strike distances. For a $100 stock, $150 and $50 are not equidistant in the world of compounding — $150 is closer. The article shows how to compute equivalent distances using log returns and extends this to normalizing for volatility, allowing traders to compare strikes across different assets with different volatility profiles.

By Kris Abdelmessih.

`Read the article <https://x.com/KrisAbdelmessih/article/2018698687665312013>`__.

The Volatility Paradox: How Lower Risk Produces Superior Returns in Crypto
--------------------------------------------------------------------------

Research Article #58 from Trading Research Hub. Examines the counterintuitive relationship between risk and return in cryptocurrency markets. The study explores how systematic approaches that target lower volatility can actually achieve superior risk-adjusted returns, challenging the traditional finance assumption that higher risk always correlates with higher returns.

The article presents a systematic trading framework that demonstrates how strategic risk management generates substantial risk-adjusted returns in crypto. By deliberately targeting lower portfolio volatility through position sizing and signal filtering, the strategy achieves better overall outcomes than unconstrained approaches, illustrating the volatility paradox in practice.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-volatility-paradox-cryptocurrency>`__.

Stochastic Volatility Models
-----------------------------

An in-depth exploration of stochastic volatility models, which offer a more sophisticated and realistic framework for capturing market dynamics than simpler constant-volatility assumptions. The article covers the foundational concepts of the basic stochastic volatility model, the widely used Heston model, and methods for their estimation and calibration.

The post explains how stochastic volatility models treat volatility as a latent random process driven by its own source of uncertainty, allowing them to capture key features of financial markets such as volatility clustering, mean reversion, and the leverage effect. Applications to derivatives pricing, risk management, and portfolio optimization are discussed.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/stochastic-volatility-models-a473e32d5519>`__.

Understanding Multivariate GARCH Models
----------------------------------------

An overview of Multivariate GARCH models for modeling and forecasting the volatility of multiple assets simultaneously. The article covers the progression from the foundational VEC and BEKK models to the more advanced Constant Conditional Correlation (CCC) and Dynamic Conditional Correlation (DCC) frameworks, with practical applications in portfolio risk management.

The post explains how these models capture time-varying correlations and volatility spillovers between assets, which are critical for portfolio construction, hedging, and risk measurement. The trade-offs between model flexibility and computational tractability are discussed, with the DCC model highlighted as the most practical choice for large-dimensional systems.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/understanding-multivariate-garch-models-39bab25b527c>`__.

Volatility Modeling: A Deep Dive into the ARCH Family
------------------------------------------------------

A comprehensive exploration of the ARCH family of volatility models, from the original ARCH model by Robert Engle to its many extensions. The article begins with the stylized facts of financial returns that motivate these models, including volatility clustering, fat tails, and the leverage effect, then covers ARCH, GARCH, EGARCH, GJR-GARCH, and IGARCH specifications.

The post provides detailed mathematical formulations, explains estimation via maximum likelihood, and discusses model selection and diagnostic testing. Practical considerations for applying these models to financial risk management, Value-at-Risk estimation, and options pricing are covered, with emphasis on choosing the right specification for different financial applications.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/volatility-modeling-a-deep-dive-into-the-arch-family-f361bafbb3f7>`__.

Why Your Volatility Forecast Matters More Than You Think
--------------------------------------------------------

Concretum Research, working with academics Walter Distaso and Antonio Mele, introduces NextVoL, a volatility forecasting framework designed for volatility targeting strategies. The core thesis builds on Charlie Munger's observation about compounding: investor behavior during volatility spikes, not lack of returns, interrupts long-term wealth accumulation. Volatility targeting mitigates this by scaling exposure inversely with predicted volatility. The article walks through why the forecasting methodology matters as much as the targeting mechanism itself, and introduces three innovations: short-horizon smoothing to reduce noise from transient spikes, dynamic overnight adjustment accounting for regime-dependent variance composition, and stabilization mechanisms for persistent deviation correction.

Testing seven forecasting approaches on SPY data from 2008 to 2025, NextVoL achieves 10.11% realized volatility against a 10% target, a volatility-of-volatility of just 0.26 (nearly half that of competitors), and a Sharpe ratio of 0.79 (highest among tested methods). It ranks first or second in 16 of 18 calendar years. Notably, the VIX-based approach systematically underdelivers by approximately 22% due to the embedded volatility risk premium, making it a poor foundation for targeting despite its popularity.

By Concretum Research.

`Read the blog post <https://concretumgroup.substack.com/p/why-your-volatility-forecast-matters>`__.
