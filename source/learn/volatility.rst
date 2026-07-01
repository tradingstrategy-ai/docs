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

Forecasting Realized Volatility in Turbulent Times using Temporal Fusion Transformers
-------------------------------------------------------------------------------------

Johannes Frank (Friedrich-Alexander University Erlangen-Nuremberg, 2023) analyses the performance of temporal fusion transformers in forecasting annualised weekly and monthly realized volatility (RV) of 355 individual stocks listed in the S&P 500 from January 2000 to June 2022. The TFT is trained on three different feature sets: company-specific data only (F1), extended with S&P 500 index returns and VIX (F2), and further augmented with macroeconomic variables including the effective federal funds rate, 30-year Treasury yield, Economic Policy Uncertainty index, credit spreads, and sectoral employment data (F3). Models are trained using three approaches — individual (per-stock), sectoral pooling, and overall pooling — and benchmarked against LSTM, Random Forest, and GARCH(1,1)/GARCH-X models using RMSE and Diebold-Mariano tests.

Our summary: this is one of the first rigorous applications of TFT to realized volatility forecasting for individual equities at scale. The headline finding is that TFT significantly outperforms LSTM, Random Forest, and GARCH benchmarks, with the advantage becoming strongest under pooling. The most important practical insight is that sectoral and overall pooling substantially improve all ML models — the data-hungry TFT architecture particularly benefits from the larger training samples that pooling provides. The best-performing configuration uses the F2 feature set (company data plus S&P 500 returns and VIX) with overall pooling on weekly data, achieving mean RMSE of 0.0699. The inclusion of macroeconomic variables (F3) consistently reduces forecast errors relative to company-only features (F1) but does not reliably beat F2.

Data: Refinitiv daily stock data for 355 S&P 500 constituents (January 2000-June 2022), 5,660 trading days. 70/30 train-test split with 10% validation holdout. Macroeconomic data from FRED and PolicyUncertainty.com. No public code repository. FAU Discussion Papers in Economics 03/2023.

Key metrics: TFT with overall pooling and F2 features achieves mean RMSE 0.0699 (weekly) and 0.1003 (monthly). Relative RMSE versus TFT: Random Forest 1.58-1.63x and LSTM 1.19-1.27x on weekly data with pooling, confirming TFT superiority. TFT consistently beats GARCH(1,1) and GARCH-X regardless of training approach and frequency.

`Read the paper <https://ideas.repec.org/p/zbw/iwqwdp/032023.html>`__

Volatility Calibration: Structural Rigidity vs. Local Adaptivity
-----------------------------------------------------------------

Alexander Nevolin discusses the central tension in volatility surface calibration: balancing structural rigidity against local adaptivity. Too much rigidity suppresses genuine market signals, while excessive flexibility absorbs microstructure noise. The post contrasts two approaches: rigid prior geometry from classical parametric models (SSVI/SABR), which create globally smooth, low-dimensional surfaces where the admissible manifold acts as a filter preventing unwanted deformations; and flexible prior geometry from arbitrage-constrained deep learning, which relaxes geometric restrictions while maintaining no-arbitrage constraints, allowing higher-dimensional deformations.

Nevolin categorizes observed market data into three types — genuine outliers rejected by both approaches, inference-sensitive anomalies handled differently by each method, and prior-sensitive local propagation where flexibility introduces non-local consequences. He advocates for hybrid modeling that preserves analytical geometry as a backbone while learning residual deformations, referencing two recent papers: "Meta-Learning Neural Process for Implied Volatility Surfaces with SABR-induced Priors" (Zhuang & Wu, 2025) and "A Geometry-Aware Residual Correction of Hagan's SABR Implied Volatility Formula" (Reghai, Tarsissi, Biau & Lipton, 2026).

By Alexander Nevolin.

`Read the post <https://www.linkedin.com/posts/alexander-nevolin-0ba0105_in-volatility-calibration-the-central-challenge-share-7465334001436774400-NU34/>`__

Meta-Learning Neural Process for Implied Volatility Surfaces with SABR-induced Priors
--------------------------------------------------------------------------------------

Jirong Zhuang and Xuan Wu (University of Macau) propose two principles for implied volatility surface (IVS) reconstruction: a meta-learning framework that trains across multiple trading days to learn a procedure mapping sparse option quotes to complete surfaces via conditional prediction, eliminating daily recalibration; and structural priors via transfer learning by pre-training on SABR-generated synthetic data then fine-tuning on historical market data. Their model, Volatility Neural Process (VolNP), uses an attention-based Neural Process architecture to produce a complete IVS from a sparse context set in a single forward pass.

Our summary: VolNP is a compelling example of the hybrid direction in volatility surface modeling — combining the structural discipline of a classical parametric model (SABR) with the flexibility of neural networks. The SABR pre-training acts as a physics-informed prior that regularises the network in data-sparse regions (long maturities, deep out-of-the-money strikes), while the meta-learning formulation across trading days means the model learns a general calibration procedure rather than memorising a single day's surface. The result is a method that generalises better to new market conditions without the fragility of daily recalibration.

Data: SPX options data. Published on arXiv (September 2025, arXiv:2509.11928).

Key metrics: on SPX options, VolNP outperforms SABR, SSVI, and Gaussian process baselines. The SABR-induced prior reduces RMSE by approximately 40% relative to an ablation trained only on market data and suppresses large errors, with pronounced gains at long maturities where quotes are sparse.

Mentioned by Alexander Nevolin in `this discussion <https://www.linkedin.com/posts/alexander-nevolin-0ba0105_in-volatility-calibration-the-central-challenge-share-7465334001436774400-NU34/>`__.

`Read the paper <https://arxiv.org/abs/2509.11928>`__

A Geometry-Aware Residual Correction of Hagan's SABR Implied Volatility Formula
---------------------------------------------------------------------------------

Adil Reghai, Lama Tarsissi, Gérard Biau, and Alex Lipton present a hybrid approach combining Hagan's classical SABR analytical approximation with a neural network that learns the residual error. Rather than replacing the analytical formula entirely, the network is trained to correct higher-order effects absent from asymptotic expansions. The key innovation is augmenting the neural network input with geometric features derived from the SABR stochastic differential equations, maintaining interpretability while capturing effects that analytical approximations miss.

Our summary: this paper exemplifies the hybrid paradigm that Alexander Nevolin advocates — preserving the analytical backbone (Hagan's SABR formula) while learning residual deformations with a lightweight neural network. The geometry-aware input representation is the critical design choice: by feeding the network features derived from the SDE structure rather than raw parameters, the model converges faster and generalises better across parameter regimes, including stressed scenarios where pure analytical approximations break down. The lightweight correction is designed to be suitable for real-time trading applications where latency matters.

Data: numerical experiments across realistic and stressed SABR parameter domains. Published on arXiv (May 2026, arXiv:2605.06604). 33 pages, 17 figures.

Key metrics: the geometry-aware residual correction demonstrates improved accuracy and robustness compared to both pure analytical methods and standard neural network approaches across realistic and stressed parameter domains.

Mentioned by Alexander Nevolin in `this discussion <https://www.linkedin.com/posts/alexander-nevolin-0ba0105_in-volatility-calibration-the-central-challenge-share-7465334001436774400-NU34/>`__.

`Read the paper <https://arxiv.org/abs/2605.06604>`__

.. _persistence-market-sentiment:

On the Persistence of Market Sentiment: A Multifractal Fluctuation Analysis
----------------------------------------------------------------------------

Schadner applies multifractal detrended fluctuation analysis (MF-DFA) to U.S. and European stock market sentiment derived from financial option data and surveys. The paper measures sentiment the way Mandelbrot measured prices (see :ref:`multifractal-model-asset-returns` in :doc:`./time-series`) and finds the same fingerprint: long memory, fat tails, and pronounced multifractality.

The key asymmetry: investor fear is associated with overreaction (anti-persistent sentiment), while optimism drifts closer to a random walk. The expected Hurst exponent fluctuates strongly, implying nonlinear dynamics in return expectations. The paper argues that while heavy-tailed distributions are known to destabilise markets, this nonlinear behaviour is a potentially greater amplifier of market meltdowns — crashes are more structured than rallies. The multifractal spectrum width is substantial in both markets, confirming that no single persistence parameter characterises sentiment dynamics. Published in Physica A, Volume 581, 2021.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0378437121005343>`__

The Implied Volatility Edge: Why a Structural Edge Is Rarely a Constant Edge
----------------------------------------------------------------------------

Gilberto Pellerano builds a real-time stochastic differential equation (SDE) engine in Python to visualise a hard truth about quant finance: having a mathematically verifiable edge does not guarantee a smooth, predictable P&L. The simulation contrasts a baseline pure Geometric Brownian Motion path (the Black-Scholes world of continuous prices and constant volatility) against a "real market" path fed the same Gaussian shocks but injected with two harsh realities — stochastic volatility that clusters into calm and stressed regimes, and Poisson jumps implemented as Merton jump-diffusion with a martingale compensator so jumps add genuine variance without dragging price to zero.

Because of those jumps and fat tails, the market demands a Volatility Risk Premium (VRP): implied volatility prices higher than realized volatility on roughly 70-80% of days, so systematically selling volatility to harvest the spread is a true structural edge. The post's central lesson comes from the short-vol P&L panel: weeks of slowly grinding upward collecting premium are punctuated by violent drawdowns when a Poisson jump triggers, giving back large chunks of profit in seconds. The edge is real over a large sample but aggressively discontinuous in the short term — surviving the jumps and sizing the book so a non-constant edge does not wipe you out is what actually pays. The environment is built entirely in Python (pygame for 60fps interactive rendering, math/random for the SDE core, imageio/threading for async MP4 encoding) rather than static charting libraries.

By Gilberto Pellerano.

`Read the post <https://www.linkedin.com/posts/gilberto-pellerano-46b4b0174_i-built-an-implied-volatility-edge-simulation-ugcPost-7470861515563380736-UkJA/>`__

OTM Crypto Options Performance Screener: The "Lottery Ticket" Experiment
-----------------------------------------------------------------------

Pawel Lachowicz, PhD (CEO of Halcyon Waters) runs a continuous, live experiment screening cheap out-of-the-money (OTM) crypto options on Deribit and publishes the realised results on his Cayo Largo dashboard. In derivatives trading, cheap OTM options with high convexity per dollar are sometimes called "lottery tickets" for their asymmetric risk profile: a small fixed loss (the premium) against a large potential gain from gamma repricing or volatility expansion. Every option shown is an *expired* contract scored across six dimensions — gamma efficiency, vega efficiency, volatility regime, catalyst strength, cheapness, and liquidity — so there are no forward-looking signals, only outcomes. The framing question is whether the probability of winning this "OTM lottery" is better or worse than a classical 6-from-49 lotto.

The screener data (cayolargo.fi/options-otm-performance, BTC-focused with ETH, SOL, XRP, AVAX and TRX also tracked), captured here, covers **244 expired options** with **51 winners of 2x or more, a 20.9% overall win rate**, and a **best return of 93.33x**. The outcome distribution is the core of the lottery-ticket thesis: 30 JACKPOT outcomes (avg 45.17x), 4 BIG WINs (avg 5.71x), 17 WINNERs (avg 2.97x), 44 BREAKEVEN (avg 1.31x) and 149 LOSSes (avg 0.65x) — i.e. roughly 61% of trades lose money, but the rare jackpots are large enough to carry the aggregate payoff. The dealer-gamma regime is the key conditioning variable: in the entry-versus-exit regime transition matrix, near-flip ("FLIP") entries win 21% (31/148), positive-gamma entries win 28% (11/40), and negative-gamma entries only 16% (9/56). The regime breakdown shows the dominant winning cohort is NEAR_FLIP / NORMAL-IV / FAIR-VRP (135 candidates, 21% win rate, 8.96x average return), while the NEGATIVE_GAMMA / NORMAL / FAIR cohort had a lower 15% win rate but a still-high 5.18x average return. Daily performance is heavily clustered: late-May to early-June produced the outsized payoffs (1 Jun: 50% win rate, 43.30x average, 93.33x best; 31 May: 64% win rate, 38.33x average; 30 May: 58% win rate, 25.04x average), whereas much of mid-June was flat-to-negative. The dashboard also charts score-versus-return, dimension importance, the days-to-expiry sweet spot, the optimal OTM-distance range, a rolling 7-day win rate, coin beta comparison, and touched-strike (gamma repricing versus intrinsic value).

These aggregate figures sit slightly below the more optimistic headline numbers in the launch post, which cited a win rate reaching 35% for options expiring within 10–15 days and BTC jackpot winners with a 46.3x factor — a reminder that the dataset is live and the read changes with the sample and the recent regime.

By Pawel Lachowicz, PhD.

Mentioned by Pawel Lachowicz, PhD in `this LinkedIn discussion <https://www.linkedin.com/posts/pawel-lachowicz_we-are-running-a-continuous-experiment-with-share-7474011664561123328-8kb4/>`__: cheap OTM crypto options on Deribit behave like lottery tickets, the win rate reaches 35% for options expiring within 10–15 days, the near-flip gamma regime powers most winning trades, and BTC records jackpot winners with a 46.3x factor.

`View the OTM options screener <https://cayolargo.fi/options-otm-performance>`__

Variance Swaps: Trading Commodity Volatility Directly
-----------------------------------------------------

Vitor Gaspar (commodity trader, derivatives and hedging) lays out a practitioner's primer on variance swaps as a way to trade commodity volatility directly, without routing the view through options. Most commodity vol exposure is still expressed via options — buy a straddle, delta-hedge, and collect the gap between implied and realized volatility — but that path is noisy: strike selection, time decay, and delta-hedging costs all leak P&L away from the pure volatility view. A variance swap removes the option layer entirely: one leg pays the realized variance of the underlying over a period, the other pays a fixed strike, and the long-variance side profits when realized variance exceeds the strike.

The post is organised as "five things to understand." (1) What it is — a direct swap on realized variance with no options and no delta hedging. (2) Why it is cleaner than a straddle — a straddle is a vega bet contaminated by gamma, theta, skew dynamics, and hedging cost, whereas the variance swap isolates the variance exposure exactly, with no strike to choose and no delta to hedge. (3) Where the liquidity is — concentrated in deep energy markets (Brent and WTI crude, Henry Hub and TTF natural gas), with limited but real liquidity in gold and copper and almost none in agricultural commodities, where vol exposure stays in straddle form. (4) The tail risk — because variance is the sum of squared returns, a single large move contributes disproportionately, so short-variance positions carry effectively unbounded exposure to one big move; the author cites the 2020 oil collapse and the 2022 Russia gas dislocation as events that drove variance-swap losses far beyond any reasonable strike. (5) Who uses them — institutional vol sellers (as an alternative to listed straddle strategies) and some energy-macro hedge funds, but rarely corporates, for whom the operational complexity outweighs the benefit ("the structure exists for the trading floor, not the treasury floor").

His bottom line is that the variance swap is the cleanest instrument for a pure volatility view but also carries the most asymmetric tail: the clean vega exposure cuts both ways, because there is nothing else in the P&L to dilute a bad outcome. It is worth knowing for traders who run vol systematically, while those who trade vol opportunistically are usually better served by options. He closes by asking practitioners where they set the tail cap and how they size around it.

By Vitor Gaspar.

In the discussion, ex-Goldman Sachs exotics trader Eric Barthe adds an important precision: the variance swap is "the cleanest instrument to express a pure variance view, but not a pure vol view" — variance and volatility differ by a convexity term, so the payoff is linear in variance rather than in volatility itself. Taylor Lukof (ABR Dynamic Funds) cautions against the counterparty risk embedded in a tail-event product — "the worst thing would be to not get paid your insurance when you need it most."

`Read the post <https://www.linkedin.com/posts/vitor-augusto-barbosa-gaspar_variance-swap-trading-commodity-volatility-share-7472618614324645888-z048/>`__

Normalizing volatility transform for Normal implied volatility
--------------------------------------------------------------

The Normal (Bachelier) volatility model is the de facto market standard for quoting implied volatilities in fixed-income markets, where negative interest rates make the log-normal Black-Scholes quoting convention break down. Vladimir Lucic (Imperial College London) and Parviz Rakhmonov (Marex) revisit static arbitrage in this Normal implied volatility model and introduce the *normalizing volatility transform* (NVT), defined on a single maturity slice as f(k) = k / σ(k), where k = K - F_T is the moneyness (strike minus forward) and σ(k) is the Normal implied volatility. The construction is the Bachelier-model analogue of Masaaki Fukasawa's (2012) normalizing transformation of the log-normal implied-volatility smile, and the paper links the two settings explicitly.

The authors restate call and put prices through the NVT and prove a sequence of arbitrage characterisations. First, a slice that is free of vertical-spread arbitrage has a monotonically increasing NVT f(k) (Theorem 2.1), mirroring Fukasawa's log-normal result. Second, for large-strike (wing) arbitrage they derive an exact asymptotic condition — f(k)²/2 + 3·ln f(k) - ln k → +∞ as k → +∞ on the call wing, with a symmetric condition on the put wing as k → -∞ (Theorem 3.1). A finding the authors emphasise is that, unlike the log-normal case, the Normal model needs an extra condition on put option prices to rule out large-strike arbitrage. Third, they show a slice is free of strike arbitrage if and only if it is simultaneously free of butterfly and large-strike arbitrage (Theorem 3.2), constructing the implied risk-neutral distribution from the digital-put price, which serves as a CDF. Finally, at the surface level they prove that the absence of calendar arbitrage is equivalent to the total Normal implied volatility σ(k,T) being non-decreasing in maturity T for every moneyness — a notable contrast with the log-normal world, where it is total variance that must be non-decreasing. An arbitrage-free Normal volatility surface is then defined as one that is free of calendar arbitrage with every slice free of strike arbitrage, giving practitioners the exact conditions needed to build arbitrage-free Bachelier volatility surfaces.

This is a short (7-page) derivatives-pricing theory paper rather than an empirical trading study, so it reports no backtest performance statistics — there is no annualised return, Sharpe ratio, maximum drawdown or win rate. Its results are the four arbitrage theorems above, supported by appendix bounds on Normal call and put prices derived from the Komatsu and Gordon inequalities for the Mills' ratio. There is no accompanying dataset or code release; the work is self-contained and reproducible from the proofs, building on Fukasawa (2012), Lucic (2021, SSRN abstract 3835233) and Choi, Kwak, Tee & Wang (2022) on the Bachelier model.

Mentioned by Parviz Rakhmonov in `this LinkedIn discussion <https://www.linkedin.com/posts/parvizrakhmonov_normalizing-volatility-transform-for-normal-share-7476028780189253632-Nc6s/>`__, where he explains that the paper bridges the gap by introducing the normalizing volatility transform and linking it naturally to the volatility transforms introduced earlier by Masaaki Fukasawa in the log-normal setting, investigating large-strike arbitrage conditions in detail and showing that the Normal case requires an extra condition on put option prices.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6990518>`__

Harvesting the Variance Risk Premium: A Backtest Across Expiry-Day, Stop-Loss and Lot-Scaling Dimensions
-------------------------------------------------------------------------------------------------------

Rohit Trehan investigates whether the variance risk premium — the persistent tendency for option-implied volatility to exceed subsequently realized volatility — can be converted into a tradeable edge by a retail options seller. The study takes the premium's existence as given and backtests a family of short-volatility strategies on one-minute options-chain and index data spanning 1 September 2024 to 14 June 2026, with implied volatilities and Greeks computed under standard assumptions and all results reported net of a deliberately conservative model of transaction costs, taxes, and related charges.

The backtest is organized across three dimensions: expiry-day treatment (all days, excluding expiry days, or expiry days only), stop-loss application, and lot-scaling. The headline result concerns scale rather than signal — at a single lot, most setups that look profitable on gross expectancy turn net-negative once costs are applied, because the fixed per-trade charges swamp the small per-lot edge. Net-positive expectancy emerges only as position size is scaled up and those fixed costs are amortized across a larger notional, which raises the question of whether the per-lot edge can ever clear the per-lot marginal cost for a small trader.

The strategies also respond poorly to stop-losses — tightening them reduced performance on this sample — and the author ranks setups using win rate, expectancy, Sharpe, Calmar, cumulative-PnL linearity (R-squared), skew, and kurtosis, weighting expectancy, win rate, R-squared, and kurtosis most heavily. The conclusion is candid: the edge is real, but so are the barriers to capturing it for a retail participant, and the author frames the work as a first pass, leaving statistical-significance testing and more sophisticated execution and risk-management refinements for future analysis.

By Rohit Trehan.

`Read the blog post <https://rohittrehan.substack.com/p/harvesting-the-variance-risk-premium>`__

Detecting Structural Evolution of Implied Volatility Surface Using Gradient-Based Features
-----------------------------------------------------------------------------------------

This Aalto University master's thesis (subtitle: *A Machine Learning Approach to Market Regime Detection*) develops a model-free methodology for detecting and interpreting structural changes in the implied volatility (IV) surface over time. Rather than fitting a parametric surface model, Shakhin Dzhafarov characterises the surface through local gradients — the partial derivatives of implied volatility with respect to moneyness and maturity — and quantifies how those gradients change from day to day at a grid of points on the surface. The daily gradient-change vectors, together with the concurrent move in the underlying index, become the features fed into an unsupervised clustering algorithm.

The clustering uses HDBSCAN (Hierarchical Density-Based Spatial Clustering of Applications with Noise), chosen because it does not require the number of clusters to be specified in advance and, crucially, explicitly labels points as noise. This matches the economic intuition of the problem: most days the volatility surface merely wiggles, and only occasionally does it undergo a genuine structural transformation. The clusters that survive correspond to recognizable, recurring dynamics — specific changes in volatility skew and in the term structure across different maturity and moneyness levels — giving practitioners a flexible, entire-surface framework for monitoring and interpreting regime shifts in options markets.

The study uses implied volatilities of S&P 500 index options across several moneyness and maturity levels spanning 2007 to 2025. It is an academic thesis, and no accompanying code repository is published.

As a detection and characterisation study rather than a trading backtest, the thesis reports no annualised return, Sharpe ratio, drawdown, or win rate. Its quantitative results are structural: the great majority of daily IV-surface changes are classified as noise, reflecting how infrequently true structural shifts occur, so the identified clusters are small — with sizes of up to 18 daily observations — yet each captures a distinct and interpretable skew or term-structure regime.

Mentioned by Nam Nguyen (Quantitative Strategist and Derivatives Specialist) in `this LinkedIn discussion <https://www.linkedin.com/feed/update/urn:li:activity:7468587901644128256/>`__ — later reposted by Sahand Haji Ali Ahmad — where he summarises the paper as a regime-classification approach built on the entire volatility surface, highlighting that most daily changes are noise while several recurring, meaningfully interpretable patterns can be detected.

`Read the paper <https://aaltodoc.aalto.fi/items/791152a4-a4a7-4c0d-92cd-530272aea533>`__
