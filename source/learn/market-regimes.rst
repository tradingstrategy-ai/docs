.. meta::
   :description: Research papers and posts on market regime detection, Markov switching models, HMM, and regime-adaptive trading systems.

Market Regimes
~~~~~~~~~~~~~~

Financial markets do not behave uniformly across time. They cycle through distinct regimes — bull and bear markets, high and low volatility periods, trending and mean-reverting environments, expansion and contraction phases — with each regime exhibiting different return distributions, correlations, and factor sensitivities. Regime detection aims to identify the current market state in real time, enabling adaptive trading systems that adjust strategy parameters, position sizes, or asset allocation based on the inferred regime.

The research here covers the foundational Markov regime-switching framework introduced by Hamilton (1989), regime-switching ARCH/GARCH models for volatility, modern machine learning approaches to regime identification (Wasserstein clustering, jump models, HMM), and practical applications to Bitcoin, VIX term structures, and multi-asset portfolios. A recurring theme is the challenge of real-time regime detection — the tension between using only past data (filtered probabilities) and the inevitable lag in regime identification that limits practical utility.

Related topics include :doc:`Trend Following <./trend-following>` for regime-conditional trend strategies, :doc:`Momentum <./momentum>` for momentum timing with regime filters, and :doc:`Volatility Modeling <./volatility>` for volatility-based regime characterization.

A New Approach to the Economic Analysis of Nonstationary Time Series and the Business Cycle
---------------------------------------------------------------------------------------------

James D. Hamilton introduces the Markov-switching autoregressive model, where the parameters of an autoregression are governed by a discrete-state Markov process whose realizations are not directly observed. The framework allows the mean growth rate of a nonstationary series to shift between states, with the timing and duration of regimes inferred from the data via maximum likelihood. The paper applies the model to postwar U.S. real GNP growth, identifying distinct expansion and contraction regimes that align closely with NBER business cycle dates. Published in Econometrica, Vol. 57, No. 2, March 1989.

Our summary: this is the foundational paper for all regime-switching time-series models in economics and finance. Every subsequent application of Markov-switching to volatility, asset returns, or macro variables traces back to this framework. The key insight for quantitative finance is that a single linear model often masks fundamentally different dynamics across market states, and the Hamilton filter provides a principled, real-time way to estimate which regime the market is in at each point.

`Read the paper <https://www.econometricsociety.org/publications/econometrica/1989/03/01/new-approach-economic-analysis-nonstationary-time-series-and>`__

Autoregressive Conditional Heteroskedasticity and Changes in Regime
--------------------------------------------------------------------

James D. Hamilton and Raul Susmel extend the Markov regime-switching framework to ARCH volatility models, allowing the parameters governing conditional heteroskedasticity to shift between discrete states. The paper models weekly returns on U.S. stock indices, permitting the ARCH intercept and persistence parameters to change with an unobserved Markov state. Published in the Journal of Econometrics, Vol. 64, 1994.

Our summary: this paper is the direct bridge between Hamilton's 1989 regime-switching framework and modern volatility modeling. By allowing ARCH parameters to switch between states, it formalizes the intuition that volatility clustering is not uniform over time but instead governed by latent market regimes. For realized-volatility forecasting and crypto volatility work, the Hamilton-Susmel model is the ancestor of all Markov-switching GARCH variants.

`Read the paper <https://econpapers.repec.org/article/eeeeconom/v_3a64_3ay_3a1994_3ai_3a1-2_3ap_3a307-333.htm>`__

Clustering Market Regimes Using the Wasserstein Distance
---------------------------------------------------------

This paper introduces Wasserstein k-means clustering for identifying market regimes from return distributions. Unlike standard clustering that uses Euclidean distance on summary statistics, the Wasserstein approach operates directly on distributional properties, capturing the full shape of the return distribution in each period and identifying regime changes that conventional methods miss.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3830626>`__

Rethinking Trend Following: Optimal Regime-Dependent Allocation
----------------------------------------------------------------

This paper develops a framework for regime-dependent time-series momentum allocation, showing that the optimal trend signal depends on the current market regime. The authors demonstrate that adapting trend parameters and allocations to the identified regime generates superior risk-adjusted performance compared to static trend following implementations.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3411948>`__

Dynamic Mean-Variance Portfolio Allocation under Regime-Switching Jump-Diffusions with Absorbing Barriers
----------------------------------------------------------------------------------------------------------

This paper solves the dynamic mean-variance portfolio allocation problem under a regime-switching jump-diffusion model with absorbing barriers representing ruin. The optimal allocation policy depends on the current regime and adapts to regime transitions, providing a rigorous framework for regime-aware portfolio construction under realistic market dynamics.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3827694>`__

Regularised jump models for regime identification and feature selection
-----------------------------------------------------------------------

A regime modelling framework that jointly performs regime identification and feature selection using regularised jump models. The framework identifies the active regime from market and macroeconomic variables while simultaneously selecting features that best distinguish between regimes, improving both interpretability and regime identification accuracy compared to standard jump models.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4950423>`__.

Dynamic Asset Allocation with Asset-Specific Regime Forecasts
--------------------------------------------------------------

This article introduces a novel hybrid regime identification-forecasting framework that leverages both unsupervised and supervised learning to generate tailored regime forecasts for individual assets. The statistical jump model derives regime labels, and a gradient-boosted decision tree classifier predicts future regimes using return features and cross-asset macro-features. The framework is applied to a multi-asset portfolio comprising twelve risky assets from 1991 to 2023.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4864358>`__

Forecasting Market Regimes with the sUSDe Term Structure
---------------------------------------------------------

An exploration of how the sUSDe term structure on Pendle can serve as a forward-looking signal for crypto market sentiment and regime forecasting. The article explains how crypto prices are heavily influenced by leveraged trading in perpetual futures, and how Ethena's sUSDe effectively captures the basis from funding rates through delta-neutral strategies.

The article demonstrates that the term spread—the difference between back month and front month implied yields—is highly correlated with underlying yield regimes and produces a stronger signal for returns than the underlying yield alone. Historical analysis supports using this term structure as a leading indicator for changes in cost of carry and BTC price levels.

By Luke Leasure.

`Read the article <https://x.com/0xMether/article/2016201886395990198>`__

Testing the January Barometer as a Regime Filter for Crypto Trend Models
------------------------------------------------------------------------

Research Article #46 from Trading Research Hub. Tests the January Barometer effect in cryptocurrency markets. Originally introduced by Yale Hirsch in 1972 for equities, the January Barometer suggests that January's market performance predicts the trend for the rest of the year.

The article applies this calendar anomaly to crypto, testing whether January's performance in Bitcoin and other cryptocurrencies has predictive power for the remaining eleven months. It also examines whether the effect can be incorporated as a regime filter into a systematic trend-following model.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-46-is-the-january>`__.

Adjusting Bitcoin Strategy Exposure Based on Volatility Regimes
----------------------------------------------------------------

Research Article #26 from Trading Research Hub. Studies how volatility regimes affect trading strategy performance in Bitcoin. The study examines how adjusting portfolio exposure based on the current volatility environment can improve risk-adjusted returns.

The article tests systematic approaches to identifying and responding to different volatility regimes, from calm to highly volatile periods. By targeting specific volatility conditions or adjusting position sizes based on the prevailing regime, the strategy aims to reduce drawdowns during turbulent periods while maintaining exposure during favorable conditions.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-26-bitcoin-volatility>`__.

Systematic Regime Detection for Momentum Strategy Timing
---------------------------------------------------------

An article on the systematic approach to regime targeting for momentum trading strategies. The article argues that trading against the general market direction is one of the most common causes of losses, and presents a framework for identifying favorable market regimes.

The article covers how to define and detect market regimes, how to adjust strategy exposure based on the current regime, and how to avoid trading during unfavorable conditions. The practical framework helps momentum traders align their positions with the broader market trend while knowing when to reduce exposure.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/optimizing-trading-strategies-mastering>`__.

Detecting VIX Term Structure Regimes
-------------------------------------

A practical guide to analyzing the VIX term structure using Principal Component Analysis (PCA) and Hidden Markov Models (HMM) in Python. The article argues that a single VIX number tells you almost nothing about where risk sits in the market, but the term structure reveals whether the crowd expects a crisis next week or three months from now.

The methodology uses PCA to reduce the dimensionality of the VIX term structure into interpretable components (level, slope, curvature), then applies a Gaussian Hidden Markov Model to classify the slope series into distinct regimes including contango, backwardation, and transition states. A complete Python notebook is provided for reproducing the analysis.

By Cristian Velasquez.

Mentioned by QuantSeeker in `this discussion <https://x.com/quantseeker>`__.

`Read the article <https://medium.com/@crisvelasquez/detecting-vix-term-structure-regimes-8f3b1a4ddf15>`__.

Regime Detection with HMM: Critical Analysis
---------------------------------------------

A critical examination of hidden Markov model-based regime detection for systematic trading, covering both the theoretical appeal and practical limitations of HMM approaches. The post discusses the strengths of the method — including its principled probabilistic framework for latent state estimation — and several critical concerns including state number sensitivity, real-time detection lag, and the challenge of distinguishing regime detection from regime prediction.

Several aspects warrant scrutiny: HMMs require the number of hidden states to be specified a priori; real-time regime detection lags regime transitions substantially; the 70% probability threshold for reducing leverage is presented without justification; and transaction costs from regime-switching strategies can erode returns significantly if regime changes are detected frequently or noisily.

By Bongani Mayaba.

`Read the post <https://www.linkedin.com/posts/bongani-mayaba-b359b7107_regimedetection-hiddenmarkovmodels-quantfinance-share-7452618889789628416-7snd/>`__.

Building Regime-Robust Trading Systems Through Market Cycle Analysis
--------------------------------------------------------------------

An article on building robust long-term trading systems, explaining the market dynamics of inventory accumulation and distribution. The article describes how a trading system with a reliable signal acts like a lighthouse, attracting market participants and creating the conditions for profitable trading through systematic inventory management.

The article emphasizes the importance of distinguishing between systems that work in specific market conditions (like 2020's bull market) versus those that are genuinely robust across different regimes.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-market-seas-the-art-and>`__.

Architecting Market Regime Clusters for Adaptive Portfolio Construction
-----------------------------------------------------------------------

A practical guide to implementing market regime clustering as infrastructure for adaptive portfolio construction. The article argues that classical quantitative models fail because they assume stationary markets, and proposes unsupervised learning approaches to partition financial time series into distinct states with unique risk-return distributions. The recommended feature stack goes well beyond raw returns — rolling skewness and kurtosis, volatility cones, cross-asset dynamics (CDX vs VIX), and microstructure signatures (mid-price autocorrelation, bid-ask imbalance) — with manifold learning (t-SNE or autoencoders) for dimensionality reduction before clustering.

Three algorithmic approaches are compared: Gaussian Mixture Models for soft clustering that reflects gradual transitions, HDBSCAN for non-parametric density-based detection with transition states classified as noise, and Jump-Diffusion Hidden Markov Models for capturing instantaneous regime shifts. The article identifies three canonical regimes — Low-Vol Growth (suited for leveraged risk-parity), High-Vol Inflation (requiring minimum-variance pivots), and Tail Crash (triggering convexity overlays). A particularly sharp observation is that widely adopted "Risk-Off" signals can become self-fulfilling prophecies, ceasing to be leading indicators and instead becoming coordinating mechanisms for liquidation. The validation framework uses BIC optimisation, Viterbi path analysis, MST comparisons, and a "Regime Coherence Test" on realised volatility.

By Systan.

`Read the article <https://systan.dev/article/architecting-market-regime-clusters-for-adaptive-portfolio-construction>`__.

A hidden Markov model to detect regime changes in cryptoasset markets
---------------------------------------------------------------------

This paper by Paolo Giudici and Iman Abu-Hashish (Quality and Reliability Engineering International, 2020, vol. 36(6), pp. 2057-2065) proposes a Gaussian hidden Markov model to describe the dynamics of Bitcoin prices as transitions between unobserved latent regimes, labelled "bull," "stable," and "bear." The model is fit to Bitcoin price series observed simultaneously across several exchange markets, treating the multivariate cross-exchange returns as the emission process. A central methodological contribution is the use of a likelihood ratio test to compare models with different numbers of latent states and different covariance structures (diagonal versus full covariance matrices).

Our summary: the authors find that Bitcoin price movements across exchanges are well described by a low-dimensional regime-switching model, and that a parsimonious specification with a diagonal covariance matrix yields better predictive performance than a richer model with a full covariance matrix. The work is an early, clean application of HMMs to crypto regime identification, with the novelty being the joint modelling across multiple exchanges and the formal model-comparison machinery rather than ad hoc state selection.

Key metrics: the model uses a small number of latent states (a three-regime bull/stable/bear interpretation). Model selection is driven by likelihood ratio tests across state counts and covariance structures, with the diagonal-covariance model preferred on predictive grounds. The paper does not report trading/financial performance metrics such as Sharpe ratios, hit rates, or VaR/ES backtests; its evaluation is statistical (likelihood-based fit and comparative prediction) rather than economic. No public data or code release is mentioned.

Critical view: this is a methodologically careful but descriptive paper. Its strength is the disciplined use of likelihood ratio tests to choose state count and covariance structure rather than overfitting an arbitrary number of regimes, and the diagonal-covariance preference is a sensible parsimony result. The weaknesses are typical of early crypto HMM work: the evaluation is largely in-sample fit and one-step prediction without a true out-of-sample trading or risk backtest, the regime labels are assigned post hoc, and inference relies on smoothed/filtered state probabilities that suffer detection lag in real time. Because there is no transaction-cost-aware strategy and no economic performance measure, the paper supports the claim that Bitcoin exhibits regime structure but does not demonstrate that the regimes are tradable or that the model adds value out-of-sample. Treated as a regime-identification study rather than an alpha claim, the results look credible.

`Read the paper <https://onlinelibrary.wiley.com/doi/abs/10.1002/qre.2673>`__

Exploring the Predictability of Cryptocurrencies via Bayesian Hidden Markov Models
----------------------------------------------------------------------------------

This paper by Constandina Koki, Stefanos Leonardos, and Georgios Piliouras (arXiv 2011.03741; published in Research in International Business and Finance) studies whether the returns of major cryptocurrencies can be forecast using Bayesian hidden Markov models. The authors compare a range of multi-state HMM specifications, including homogeneous HMMs and Non-Homogeneous Hidden Markov Models (NHHMMs) in which transition probabilities depend on covariates, estimated within a Bayesian framework. The models are applied to daily returns of Bitcoin, Ether, and Ripple, with a set of predictors entering the state-dependent return distributions and transition dynamics.

Our summary: the key finding is that a four-state NHHMM delivers the best one-step-ahead forecasting performance across all three cryptocurrencies, dominating single-regime random-walk benchmarks in predictive density. The recovered states map onto interpretable bull, bear, and calm regimes for Bitcoin and onto regimes with distinct profit/risk profiles for Ether and Ripple. The novelty lies in combining a Bayesian treatment (which propagates parameter uncertainty into the predictive density) with non-homogeneous, covariate-driven transitions, and in showing that state-dependent predictor relationships matter.

Key metrics: the optimal model has four latent states across three cryptocurrencies (Bitcoin, Ether, Ripple). Model comparison is based on one-step-ahead predictive likelihood/density, where the four-state NHHMM beats competing HMM configurations and a random-walk baseline. The paper emphasizes predictive-density dominance rather than directional accuracy, Sharpe ratios, or VaR/ES backtests; no trading P&L or transaction-cost-adjusted performance is reported.

Critical view: this is a relatively rigorous study by the standards of the crypto-HMM literature: the Bayesian framing produces genuine out-of-sample predictive densities and incorporates parameter uncertainty, which is more honest than plug-in point-forecast comparisons. The main caveats are that "best forecasting performance" is established on statistical predictive likelihood, not on an economically meaningful, cost-aware trading strategy, so the practical exploitability of the predictability is not demonstrated. Choosing four states risks some overfitting given the short, highly non-stationary crypto sample, and the NHHMM's covariate-driven transitions add researcher degrees of freedom (which predictors, which lags) that invite model-selection bias. Predictability claims for daily crypto returns are notoriously fragile to sample period, so the result would be stronger with a strictly walk-forward evaluation and a turnover/transaction-cost analysis. Still, the Bayesian out-of-sample density comparison makes this more credible than most peers.

`Read the paper <https://arxiv.org/abs/2011.03741>`__

Market Regime Detection in Bitcoin Time Series Using K-Means Clustering and Hidden Markov Models
------------------------------------------------------------------------------------------------

This paper (Journal of Digital Market and Digital Currency, 2026) proposes a hybrid framework that first uses K-Means clustering to segment Bitcoin market data into discrete regimes and then fits a Hidden Markov Model to estimate the probabilistic transitions between those states. The motivation is that Bitcoin exhibits extreme volatility and nonlinear dynamics that single-method approaches handle poorly. The data are minute-level Bitcoin price records, preprocessed into features including logarithmic returns and rolling volatility, and the clustering identifies three regimes interpreted as bullish, bearish, and sideways.

Our summary: the authors report that the hybrid K-Means-plus-HMM framework outperforms standalone models, with the combined approach showing higher log-likelihood and lower BIC. Substantively, they find that bullish and bearish regimes are highly persistent while the sideways regime acts as a transitional buffer between them. The novelty is the two-stage pipeline in which clustering supplies an informed initialization/labeling for the HMM rather than relying on the HMM alone.

Key metrics: three regimes are identified (bullish, bearish, sideways). Data are minute-level Bitcoin prices with engineered features (log returns, rolling volatility). Model quality is reported via higher log-likelihood and lower Bayesian Information Criterion (BIC) relative to standalone baselines, and via the persistence/transition structure of the estimated transition matrix. No trading performance metrics (Sharpe, hit rate, returns) and no VaR/ES backtests are reported; the evaluation is statistical fit plus regime-persistence description. No clear public data or code release is noted.

Critical view: the paper is a descriptive regime-identification exercise, and several methodological concerns temper its claims. Using K-Means to pre-label states and then fitting an HMM creates a circularity: the BIC/log-likelihood comparison favoring the hybrid is partly a consequence of feeding the HMM cluster-derived structure, so the "outperformance" is not a clean out-of-sample test and may reflect in-sample fit. K-Means on log-return/volatility features imposes spherical, equal-variance clusters that sit awkwardly with fat-tailed crypto returns. There is no out-of-sample forecasting, no economic backtest, and no transaction-cost analysis, so persistence findings (bull/bear sticky, sideways transitional) are essentially an in-sample characterization rather than a predictive or tradable result. The single-asset (Bitcoin), single-sample design and absence of robustness checks across periods further limit generalizability. Reasonable as an exploratory pipeline, but the performance claims are weakly supported.

`Read the paper <https://jdmdc.com/index.php/JDMDC/article/view/57>`__

Applications of Hidden Markov Models in Detecting Regime Changes in Bitcoin Markets
-----------------------------------------------------------------------------------

This paper by Elijah Wanjala Machimbo, Wycliffe Cheruiyot, George M. Mocheche, and Joy Mutegi (Asian Journal of Probability and Statistics, 2025, vol. 27(7), pp. 127-138) compares several statistical regime-detection models on Bitcoin markets: Hidden Markov Models (HMMs), Markov-Switching Models (MSMs), and Threshold Models. The analysis uses Bitcoin price history together with financial indicators including market capitalization, volatility, and trading volume, summarized with descriptive statistics. The authors define three market regimes operationally: bullish (sustained price increases exceeding 20%), bearish (sustained declines exceeding 20%), and neutral (low volatility, sideways movement).

Our summary: the headline finding is that HMMs outperform MSMs and Threshold Models at forecasting regime shifts, particularly in detecting transitions among bullish, bearish, and neutral states. The contribution is a side-by-side comparison of three competing regime-detection methodologies on a common Bitcoin dataset, positioning HMMs as the preferred tool for capturing latent market-state transitions.

Key metrics: three regimes are used (bullish, bearish, neutral), with bull/bear defined by a 20% sustained move threshold. Inputs include market capitalization, volatility, trading volume, and price. The paper reports comparative model performance favoring HMMs for regime-shift forecasting but provides limited concrete quantitative scoring (no clearly reported Sharpe, hit rate, AIC/BIC, log-likelihood values, or VaR/ES backtests). No trading P&L or transaction-cost analysis is mentioned, and no data/code availability is noted.

Critical view: this reads as a comparative review with thin quantitative reporting, which makes the "HMMs outperform" conclusion hard to verify. The regime definitions are based on a fixed 20% threshold applied with hindsight, which embeds look-ahead bias into the very labels being predicted, and the comparison appears to be largely in-sample with no described walk-forward or out-of-sample protocol. Without explicit accuracy, likelihood, or backtest numbers, the claimed superiority of HMMs cannot be assessed and may reflect qualitative judgment rather than a controlled benchmark. As with most single-asset Bitcoin studies, there is no transaction-cost-aware evaluation and limited robustness analysis. The paper is useful as an orientation to the menu of regime-detection methods but its empirical claims are weakly substantiated.

`Read the paper <https://journalajpas.com/index.php/AJPAS/article/view/781>`__

Markov and Hidden Markov Models for Regime Detection in Cryptocurrency Markets: Evidence from Bitcoin (2024–2026)
-----------------------------------------------------------------------------------------------------------------

This preprint (Preprints.org, manuscript 202603.0831, 2026) develops a regime-switching framework to classify Bitcoin market conditions into latent states distinguished by different statistical properties of returns and volatility. It argues that crypto markets' high volatility, structural breaks, and non-stationarity limit linear time-series models, and that HMMs offer a probabilistic way to recover unobservable states generating observed price dynamics. The methodology extends standard homogeneous HMMs by incorporating non-homogeneous (time-varying) transition probabilities and Bayesian estimation, and explores relaxing the geometric sojourn-time assumption of standard HMMs. The empirical analysis uses Bitcoin price data sampled at a 4-hour candle frequency over January 2024 to January 2026.

Our summary: the paper frames Bitcoin regime detection as a comparison/extension of homogeneous Markov and HMM approaches, adding non-homogeneous transitions, Bayesian estimation, and a relaxation of the geometric sojourn-density assumption to better capture how long the market dwells in each regime. The intended novelty is methodological: improving regime-duration modelling and transition dynamics over vanilla HMMs on recent, higher-frequency Bitcoin data.

Key metrics: the dataset is Bitcoin 4-hour candles spanning January 2024 to January 2026 (a roughly two-year window). The framework distinguishes latent return/volatility states with non-homogeneous transition probabilities and Bayesian estimation. The manuscript does not surface concrete trading or risk performance numbers (no reported Sharpe, hit rate, VaR/ES backtest, or specific log-likelihood/AIC/BIC values), nor a stated number of fitted states; its emphasis is the modelling framework rather than quantified forecasting accuracy. No data or code availability is indicated.

Critical view: as a non-peer-reviewed preprint, the claims should be treated cautiously until backed by reported diagnostics. The sample is short (about two years) and single-asset (Bitcoin), covering an idiosyncratic 2024-2026 period (post-2024 halving, ETF-driven flows), which raises serious concerns about regime-count overfitting and out-of-sample generalizability. Relaxing the geometric sojourn assumption (toward a hidden semi-Markov style duration model) and adding non-homogeneous Bayesian transitions increases flexibility but also adds many researcher degrees of freedom, so without a strict walk-forward evaluation and explicit fit/forecast metrics it is impossible to tell whether the added complexity buys real predictive power or just in-sample fit. The absence of transaction-cost-aware backtesting and the reliance on filtered/smoothed probabilities (real-time detection lag) further limit any tradability claim. Promising methodology on paper, but unverifiable and likely overfit-prone as presented.

`Read the paper <https://www.preprints.org/manuscript/202603.0831>`__

Bitcoin Price Regime Shifts: A Bayesian MCMC and Hidden Markov Model Analysis of Macroeconomic Influence
--------------------------------------------------------------------------------------------------------

This paper by Vaiva Pakstaite, Ernestas Filatovas, Mindaugas Juodis, and Remigijus Paulavicius (Mathematics, MDPI, 2025, vol. 13(10), article 1577) integrates a Bayesian Markov Chain Monte Carlo (MCMC) covariate-selection procedure into homogeneous and non-homogeneous Hidden Markov Models to study how Bitcoin price regimes relate to macroeconomic conditions. The model jointly estimates latent regimes and selects from 16 macroeconomic and Bitcoin-specific factors (including halving cycles, trading volume, exchange rates, and major stock indices), using likelihood penalties to refine variable selection. The analysis covers 2016 to 2024 and employs a rolling-window bootstrap procedure to generate 1-, 5-, and 30-step-ahead forecasts.

Our summary: the central finding is a structural shift in Bitcoin's pricing drivers: early in the sample, prices were primarily driven by technical and supply-side factors such as halving cycles and trading volume, whereas later periods show stronger ties to macroeconomic indicators such as exchange rates and major equity indices. Heightened-volatility regimes align with significant events including regulatory changes and institutional announcements. The methodological novelty is embedding Bayesian MCMC covariate selection (with penalization) directly inside the HMM, and pairing it with non-homogeneous transitions and rolling-window bootstrap multi-horizon forecasting.

Key metrics: the study spans 2016-2024 and screens 16 macroeconomic and Bitcoin-specific covariates. Forecasts are produced at 1-, 5-, and 30-step-ahead horizons via rolling-window bootstrap. The paper emphasizes regime characterization and evolving covariate importance rather than reporting headline trading metrics; it does not surface specific Sharpe ratios, hit rates, or VaR/ES backtest pass rates, and the explicit number of latent states is not stated. Variable selection is governed by likelihood penalties within the Bayesian MCMC scheme.

Critical view: this is among the more sophisticated entries in the crypto-HMM literature: integrating penalized Bayesian covariate selection inside the HMM addresses the data-snooping problem head-on (rather than hand-picking predictors), the non-homogeneous transitions are well motivated, and the rolling-window bootstrap with multiple horizons reflects an out-of-sample mindset. The substantive claim of a regime-dependent migration from supply-side to macro drivers is plausible and economically interpretable. Remaining caveats: the headline results are about explanatory/covariate-importance structure rather than a demonstrated tradable forecasting edge, and without reported directional accuracy, economic backtests, or transaction-cost analysis the practical value of the multi-horizon forecasts is unquantified. The single-asset focus, the discretionary alignment of volatility regimes with named events (a partly post hoc narrative), and reliance on filtered-state inference (real-time lag) are the usual limitations. Overall a genuinely careful study whose macro-driver conclusions are credible, but whose forecasting usefulness still needs an economic, cost-aware out-of-sample evaluation to confirm.

`Read the paper <https://www.mdpi.com/2227-7390/13/10/1577>`__

Expectile hidden Markov regression models for analyzing cryptocurrency returns
------------------------------------------------------------------------------

This paper (Foroni, Merlo & Petrella, Statistics and Computing, 2023) develops a linear expectile hidden Markov regression model for cryptocurrency time series within a risk-management framework. Rather than modelling the conditional mean, the approach targets expectiles, an asymmetric least-squares analogue of quantiles, so that attention is focused on the tails and extreme movements of returns. The regression coefficients are allowed to vary over time according to a latent discrete, homogeneous Markov chain, so that the relationship between the response and the covariates switches across hidden regimes. Estimation is carried out by maximum likelihood through an Expectation-Maximization (EM) algorithm built on the asymmetric normal distribution, with closed-form M-step update formulas. The method is validated on simulated data and then applied to real data linking daily Bitcoin returns to major world stock-market indices.

Our summary: the novelty is the marriage of expectile regression (a coherent, tail-focused alternative to quantile/expected-shortfall estimation) with a hidden Markov regime-switching structure and a tractable EM estimator. This lets the model capture both the regime-dependent co-movement of Bitcoin with global equity indices and the asymmetric tail behaviour of crypto returns in a single framework, which is useful for VaR/ES-style risk applications.

Key metrics: the paper is primarily methodological/statistical rather than a trading study, and it reports no Sharpe ratios, hit rates, or backtested P&L. Performance is assessed via simulation (parameter-recovery accuracy across settings) and via in-sample model fit on the Bitcoin-indices application, with the number of hidden states selected by information criteria. Concrete trading/financial performance metrics are not provided. No explicit code repository is highlighted, though the EM update formulas are given in full to support reimplementation.

Critical view: this is a solid, carefully derived statistical contribution, and expectiles are a defensible (elicitable, coherent) risk target. The main caveats are that the empirical evaluation is essentially descriptive and in-sample: the model is fit to the full Bitcoin sample and interpreted, rather than being used to produce genuinely out-of-sample, regime-conditional VaR/ES forecasts that are backtested against realized exceptions. Regime assignment relies on smoothed probabilities (full-sample information), so the apparent clarity of the regimes would lag in a real-time filtered setting. There is also the usual hidden-Markov risk of overfitting the number of states, and crypto's short, single-asset history (Bitcoin) limits how strongly the regime structure can be claimed to generalize. As a modelling paper it is convincing; as evidence of usable predictive risk performance it is suggestive rather than demonstrated.

`Read the paper <https://link.springer.com/article/10.1007/s11222-023-10377-2>`__

Regime-Switching Factor Investing with Hidden Markov Models
-----------------------------------------------------------

This study (Wang, Lin & Mikhelson, Journal of Risk and Financial Management, 2020) uses a hidden Markov model (HMM) to identify latent market regimes in the US stock market and proposes a strategy that switches among factor-investing models depending on the regime currently detected. The authors first backtest an array of individual factor models over a roughly 10.5-year period from January 2007 to September 2017, then train a Gaussian HMM on S&P 500 ETF (SPY) historical return data to label the market into discrete regimes. The investment rule selects, in each regime, the factor model that historically performed best under that regime, producing a dynamic regime-conditional factor allocation.

Our summary: the contribution is a simple, intuitive bridge between unsupervised regime detection and factor rotation, showing that conditioning factor exposure on an HMM-inferred state can beat any single static factor strategy. The headline result is that the regime-switching combination delivered higher absolute returns and better traditional portfolio metrics than each constituent factor model when evaluated out-of-sample.

Key metrics: regimes are detected with a Gaussian HMM trained on SPY; the in-sample factor backtest spans Jan 2007-Sep 2017 and the out-of-sample test spans Sep 2017-Apr 2020 (a window that notably includes the COVID-19 crash). The paper reports that the switching strategy achieves higher absolute returns and superior risk-adjusted metrics than the individual factor models, but it does not present a rigorous standardized table of Sharpe ratios, drawdowns, turnover, or transaction-cost-adjusted returns. No formal VaR/ES backtest or HMM AIC/BIC model-selection results are emphasized.

Critical view: the idea is sound and the out-of-sample window is genuinely held out, which is a point in its favour. However, the evidence is thin and prone to overstatement. The out-of-sample period is short (about 2.5 years) and dominated by a few large events, so a small number of well-timed regime calls can drive most of the outperformance. The "best factor per regime" mapping is learned in-sample, creating a clear data-snooping/selection channel; the number of HMM states and the factor menu are degrees of freedom that can be tuned to flatter results. Crucially, regime labels from an HMM are typically smoothed and the paper does not clearly establish that switching used only real-time filtered probabilities, so look-ahead and regime-detection lag are real concerns. Transaction costs and turnover from switching factor sleeves are not seriously accounted for. Overall: a plausible, well-motivated proof of concept, but the performance claims should be treated as illustrative rather than robustly established.

`Read the paper <https://www.mdpi.com/1911-8074/13/12/311>`__

Identifying Risk Regimes in a Sectoral Stock Index Through a Multivariate Hidden Markov Framework
-------------------------------------------------------------------------------------------------

This paper (Risks, MDPI, 2025) investigates hidden market regimes in a sector-specific stock index within the Thai equity market, motivated by the observation that sectoral indices often deviate from broad macroeconomic trends and so are hard for conventional models to characterize. The author fits a multivariate Gaussian mixture hidden Markov model that infers unobservable states from a set of daily and intraday return features, specifically open-to-close, open-to-high, and low-to-open returns, rather than from close-to-close returns alone. This richer feature set is intended to capture intraday directionality and range, improving separation of the latent states.

Our summary: the model identifies three statistically distinct regimes corresponding to bullish, sideways, and bearish conditions, and the novelty lies in using multivariate intraday return geometry (not just daily close returns) to detect regimes in a narrow sectoral index. The author then validates that the regimes are economically meaningful by showing that return distributions and related market variables differ significantly across the inferred states.

Key metrics: the final specification selects three regimes (bullish, sideways, bearish). Kruskal-Wallis tests confirm that return distributions, trading volume, and open interest differ significantly across regimes, providing non-parametric statistical support for regime distinctiveness. The paper is descriptive/diagnostic and reports no trading performance metrics, no Sharpe ratios, and no VaR/ES backtests; the reported evidence is statistical (regime-conditional distributional differences and significance tests) rather than predictive P&L. Data are from a Thai sectoral index; no code repository is highlighted.

Critical view: the multivariate intraday-feature idea is reasonable and the use of Kruskal-Wallis tests to confirm cross-regime differences is more rigorous than the usual eyeball-the-states approach. The central weakness is that the entire exercise is descriptive and in-sample: the regimes are fit and characterized on the full history, and differences across states are almost tautological once an HMM has partitioned the data by volatility/return level, so significant Kruskal-Wallis results do not demonstrate predictive value. Choosing three states is a modelling decision vulnerable to overfitting, and regime labels are smoothed (full-sample), so they would lag under real-time filtering. Generalizability is limited by the single sectoral index in one emerging market. This is a competent regime-identification study, but it makes no out-of-sample or trading claims, and none of its results should be read as evidence that the regimes are tradable.

`Read the paper <https://www.mdpi.com/2227-9091/13/7/135>`__

Machine Learning-Driven Market Regime Analysis in Equity Markets: A Gaussian Hidden Markov Model Approach
---------------------------------------------------------------------------------------------------------

This 2025 working paper applies a multivariate Gaussian hidden Markov model to US equity-market data spanning 2010 to 2025 in order to uncover concealed market regimes with distinct return, volatility, and risk profiles. The pipeline emphasizes data preprocessing and dimensionality reduction: principal component analysis (PCA) is used to compress a set of market features before the HMM infers the latent states. The stated goal is a data-driven system for regime detection that maps statistical states onto recognizable economic and financial-market conditions, to support risk management and investment decisions.

Our summary: the distinctive choice here is a high-cardinality regime structure: the model is reported to detect nine separate market states aligned with real economic conditions, combined with PCA-based feature engineering. The author argues that the states display strong persistence (transitions are slow), reflecting that market conditions tend to remain stable rather than flip abruptly, and uses the most recent state assignment as a near-real-time market diagnostic.

Key metrics: the model identifies nine regimes over a 2010-2025 sample. Expansionary regimes are characterized by roughly 20-30% annualized returns at about 12% volatility, while contractionary regimes show elevated risk and negative returns. As of November 2025 the model reportedly assigns a 100% probability to a stable-return state with a ~1.6 Sharpe ratio and low volatility. These figures are regime-conditional descriptive statistics, not the output of an out-of-sample backtested trading strategy; no VaR/ES backtest, hit rate, or transaction-cost-adjusted performance is reported, and the Sharpe figure is a within-regime characterization rather than a strategy result. The paper is hosted on ResearchGate; no peer-reviewed venue or code repository is confirmed.

Critical view: this is the weakest of the group on methodological rigor. Nine HMM states over a single 15-year equity sample is a strong sign of over-parameterization: with that many states fit in-sample, regimes can be carved arbitrarily finely, and the "100% probability of the current regime" claim reflects smoothed/in-sample certainty, not a tested real-time signal. The eye-catching numbers (20-30% returns in expansions, ~1.6 Sharpe in the current state) are conditional descriptive statistics computed after the fact on the same data used to define the regimes, so they involve circular reasoning and look-ahead by construction; they say nothing about whether the regimes could be exploited prospectively. PCA preprocessing adds further researcher degrees of freedom. There is no out-of-sample evaluation, no cost accounting, and (as an unrefereed posting) limited external vetting. Treat the regime narrative as illustrative and the headline performance numbers as essentially non-predictive.

`Read the paper <https://www.researchgate.net/publication/398722347_Machine_Learning-Driven_Market_Regime_Analysis_in_Equity_Markets_A_Gaussian_Hidden_Markov_Model_Approach>`__

Regime changes in Bitcoin GARCH volatility dynamics
---------------------------------------------------

This paper (Ardia, Bluteau & Ruede, Finance Research Letters, 2019) tests for the presence of regime changes in the GARCH volatility dynamics of Bitcoin log-returns using Markov-switching GARCH (MSGARCH) models, and compares them against traditional single-regime GARCH specifications for predicting one-day-ahead Value-at-Risk (VaR). Estimation is Bayesian, with the posterior used both to fit the models and to generate the VaR forecasts. The authors consider symmetric and asymmetric conditional-variance dynamics and Normal versus Student-t innovations across one- and two-state specifications, allowing volatility persistence and leverage effects to differ by regime.

Our summary: the paper provides clean statistical evidence that Bitcoin volatility is governed by distinct regimes rather than a single GARCH process. The best in-sample fit is a two-state model with asymmetric dynamics and Student-t innovations, and the analysis surfaces an inverted leverage effect (positive shocks raising volatility more than negative ones) present in both regimes. Most importantly for practitioners, MSGARCH models clearly outperform single-regime GARCH when forecasting VaR.

Key metrics: the central empirical claims are (i) strong evidence of regime changes in the GARCH process, (ii) a two-state asymmetric Student-t specification as the best in-sample model, (iii) an inverted leverage effect in both regimes, and (iv) MSGARCH dominating single-regime GARCH in out-of-sample one-day-ahead VaR forecasting, assessed by VaR backtesting. The study is on a single asset (Bitcoin) with daily data through the late-2010s. It reports volatility/VaR statistical performance rather than trading metrics (no Sharpe, no P&L); the authors' MSGARCH framework is available through the R package MSGARCH, supporting reproduction.

Critical view: this is a credible, well-scoped paper from authors who maintain the relevant estimation software, and the headline result, regime-switching improving VaR forecasts, is evaluated genuinely out-of-sample via VaR backtesting, which is the right test. The main limitations are inherent to the setting: a single, short, highly volatile crypto series limits generalization, and the "best model" is chosen after comparing several GARCH variants, so some model-selection/data-snooping risk attaches to the specific winning specification (mitigated, but not eliminated, by the out-of-sample VaR focus). The inverted leverage effect is an interesting but sample-specific finding. There is no trading-strategy claim and no transaction-cost analysis, which is appropriate since the paper is about risk measurement, not returns. Overall this is one of the more methodologically sound entries: modest in its claims and validated where it matters.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S1544612318303970>`__

Modelling the volatility of cryptocurrencies using Markov-Switching GARCH models
--------------------------------------------------------------------------------

This paper (Caporale & Zekokh, Research in International Business and Finance, 2019) conducts a large-scale model comparison to find the best specification(s) for the volatility of four major cryptocurrencies: Bitcoin, Ethereum, Ripple, and Litecoin. The authors fit more than 1,000 GARCH-type models, spanning single-regime and Markov-switching (regime-dependent) variants with different conditional-variance dynamics and innovation distributions, and generate one-step-ahead forecasts of Value-at-Risk (VaR) and Expected Shortfall (ES) for each. Model adequacy is assessed via VaR and ES backtesting together with the Model Confidence Set (MCS) procedure, which formally selects the statistically superior subset of models while controlling for multiple comparisons.

Our summary: the key message is that standard single-regime GARCH models are inadequate for crypto risk, and that allowing for regime switching materially improves tail-risk forecasts. Across all four cryptocurrencies, two-regime models produce better VaR and ES predictions than single-regime models. The use of the MCS procedure across 1,000+ models is the methodological strength, since it guards against picking a single lucky specification.

Key metrics: more than 1,000 GARCH models are estimated across four cryptocurrencies (BTC, ETH, XRP, LTC); evaluation is via one-step-ahead VaR and ES backtesting plus the Model Confidence Set. The headline finding is that two-regime (Markov-switching) GARCH specifications dominate single-regime ones in VaR/ES accuracy for all four assets. The paper reports risk-forecasting/statistical performance (VaR/ES backtests, MCS membership) rather than trading metrics; no Sharpe ratios or strategy P&L are given. The estimation leans on the MSGARCH R package, aiding reproducibility.

Critical view: this is a rigorous and appropriately cautious study. The combination of out-of-sample VaR/ES backtesting with the Model Confidence Set directly addresses the main pitfall of fitting hundreds of GARCH variants, namely data snooping and model-selection bias, because MCS is explicitly designed to control for searching over many models. Testing four cryptocurrencies rather than Bitcoin alone strengthens external validity relative to single-asset studies. Remaining caveats are modest: the crypto samples are short and highly non-stationary, so even out-of-sample windows cover an unusual, bubble-prone period; ES backtesting is statistically harder than VaR and those conclusions rest on relatively few tail observations; and the analysis is about risk measurement, so it makes no claim about tradability and ignores transaction costs (reasonably so). On balance, the regime-switching-improves-tail-risk conclusion is well supported and among the more reliable results in this set.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S027553191830669X>`__

Modelling and Predicting the Conditional Variance of Bitcoin Daily Returns: Comparison of Markov Switching GARCH and SV Models
------------------------------------------------------------------------------------------------------------------------------

This paper by Dennis Koch, Vahidin Jeleskovic and Zahid I. Younas compares two families of volatility models for Bitcoin daily log returns: Markov-Switching GARCH (MS-GARCH) models and stochastic volatility models, specifically the Stochastic Autoregressive Volatility (SARV) family. The authors adopt a two-stage estimation approach that separates the estimation of the mean-equation coefficients from those of the variance equation, and they evaluate the competing specifications through out-of-sample forecasting of Bitcoin's conditional variance rather than relying solely on in-sample fit.

Our summary: the central finding is that stochastic volatility models, particularly SARV specifications, outperform MS-GARCH models in forecasting Bitcoin price volatility. A notable and somewhat deflationary result is that even simple single-regime GARCH models can outperform the more elaborate Markov-Switching GARCH variants for predicting the variance of Bitcoin log returns. The contribution is therefore more cautionary than triumphant: added regime-switching machinery does not automatically buy better volatility forecasts for crypto.

Key metrics: the paper compares MS-GARCH against SARV/SV using out-of-sample forecast loss criteria, but specific log-likelihood, AIC/BIC, MSE/QLIKE loss values, the exact sample period, and the number of regimes are not recoverable from the public abstract. The paper is a 2024 arXiv preprint; no trading or financial performance metrics (Sharpe, hit rate, VaR/ES backtests) are reported, as the study is purely about variance forecasting accuracy. No explicit data or code repository is mentioned.

Critical view: the headline conclusion that simple GARCH and SARV beat MS-GARCH is credible and aligns with a recurring finding in the crypto-volatility literature that regime-switching GARCH often overfits in-sample and degrades out-of-sample. Because the authors emphasize out-of-sample evaluation, the comparison is less prone to the in-sample overfitting that flatters regime models, which is a genuine strength. The main caveats are familiar to this genre: a single asset (Bitcoin) and likely a single contiguous daily sample limit external validity; the two-stage estimation may discard efficiency relative to joint estimation and can bias variance-equation inference if the mean is misspecified; and conclusions about model ranking can be sensitive to the chosen loss function (MSE versus QLIKE) and to whether a formal Model Confidence Set test is applied. Without the published metrics it is hard to judge whether the SARV advantage is statistically significant or merely a point-estimate ordering. As a directional result it looks real; as a precise quantitative claim it is under-documented in the accessible material.

`Read the paper <https://arxiv.org/abs/2401.03393>`__

Regime-Switching in Bitcoin Volatility Under Global Uncertainty: Markov-Switching GARCH and Hidden Markov Copula Approaches
---------------------------------------------------------------------------------------------------------------------------

This paper by Amin Shakourloo and Asil Azimli (SSRN, 2025; forthcoming in Research in International Business and Finance) studies Bitcoin volatility dynamics under global uncertainty using two complementary tools. First, a Markov-Switching GARCH (MS-GARCH) model captures regime-dependent conditional volatility, replacing static structural-break assumptions with endogenous, stochastic regime transitions and augmenting the volatility process with macroeconomic uncertainty triggers. Second, a Hidden Markov Copula framework models the nonlinear, tail-dependent co-movement between Bitcoin volatility regimes and a set of foreign-exchange pairs, allowing the dependence structure itself to switch across hidden states.

Our summary: the key finding is that Bitcoin behaves very differently from a safe-haven asset during crisis periods, with its volatility and its dependence on FX markets shifting regime under elevated global uncertainty. The novelty lies in combining regime-switching volatility with a hidden-Markov copula that lets tail dependence be state-dependent, and in framing macro uncertainty as an endogenous driver of regime transitions rather than treating breaks as exogenous and fixed. The authors draw practical implications for regime-sensitive risk models and early-warning systems.

Key metrics: as the SSRN abstract is the primary accessible source, concrete numbers are limited. The study reports no explicit trading performance metrics (Sharpe, hit rate). It centers on regime characterization and copula tail-dependence estimates across Bitcoin and FX pairs under global-uncertainty regimes; specific figures for number of regimes, sample period, log-likelihood/AIC/BIC, copula parameters, or VaR/ES backtests are not available from the abstract. Data appear to be standard daily Bitcoin and FX series plus a global uncertainty proxy; no code availability is mentioned.

Critical view: conceptually this is a richer setup than a plain MS-GARCH study, and the safe-haven-failure conclusion is consistent with broader post-2020 evidence that Bitcoin co-moves with risk assets in stress. However, the design invites several concerns that cannot be dismissed from the abstract alone. Hidden-Markov copula models add many parameters and are prone to overfitting and to label/state identification problems, so the estimated regimes may be fragile to specification and start values. The number of states is a researcher choice that is easy to inflate, and "regime-aware" claims often rest on smoothed (full-sample) probabilities, which are not usable in real time and can overstate how cleanly regimes are detectable ex ante. Whether the macro-uncertainty triggers genuinely predict transitions, versus merely correlating contemporaneously, is the crucial predictive-versus-descriptive distinction and is not demonstrable from the abstract. Without out-of-sample VaR/ES backtests or a formal forecast comparison, the practical risk-management value is asserted rather than proven. The contribution looks methodologically serious but the empirical claims should be treated as plausible and untested until the full paper's numbers and robustness checks are examined.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5347272>`__

A Quantile Spillover-Driven Markov Switching Model for Volatility Forecasting: Evidence from the Cryptocurrency Market
----------------------------------------------------------------------------------------------------------------------

This paper by Fangfang Zhu, Sicheng Fu and Xiangdong Liu (Mathematics, MDPI, 2025) proposes a regime-switching realized-volatility model that incorporates time-varying, quantile-based spillover effects. The authors first build a dynamic spillover factor by identifying, across different quantile levels, the most influential contributors to Bitcoin's realized volatility, distilling a complex and time-varying network structure into a single economically interpretable endogenous driver. This quantile-layered spillover factor is then embedded into a HAR (Heterogeneous Autoregressive) realized-volatility model with a time-varying transition probability (TVTP) Markov-switching mechanism, yielding a TVTP-MS-HAR model in which spillovers both explain regime transitions and sharpen regime identification.

Our summary: the contribution is the quantile-driven spillover factor: instead of feeding a high-dimensional spillover network directly into the model, the authors compress it into a single interpretable, endogenous regime driver that captures heterogeneous spillover paths under different market conditions. Empirically the proposed TVTP-MS-HAR model is reported to deliver superior out-of-sample volatility forecasts relative to standard HAR-type benchmarks, while better identifying state-dependent spillovers and nonlinear dynamics in the cryptocurrency market.

Key metrics: the paper reports forecast-comparison results against standard HAR/MS-HAR benchmarks, but the publicly accessible abstract does not expose the concrete loss values; specific MSE/QLIKE/MAE numbers, Model Confidence Set outcomes, out-of-sample R-squared, the exact sample period, and the full cross-section of cryptocurrencies are not recoverable from the abstract alone. No trading/financial performance metrics (Sharpe, VaR/ES backtests, hit rate) are described; the evaluation is statistical forecast accuracy on realized volatility. Data are realized-volatility series centered on Bitcoin; code availability is not indicated.

Critical view: the framework is intellectually appealing and the TVTP mechanism is a principled way to make transition probabilities respond to an observable driver, which is more defensible than constant-probability MS models. The quantile-spillover compression also addresses a real problem (dimensionality of network inputs). That said, this design has many degrees of freedom: the choice of quantile levels, how the "most influential" contributors are selected, the HAR lag structure, and the TVTP link function all create scope for data-snooping and in-sample tuning, so a clean, pre-specified out-of-sample protocol and an MCS-style test across many models are essential to trust the "superior forecasting" claim. Constructing the spillover factor using quantile information risks look-ahead bias if any full-sample quantile estimation leaks into the forecasting window. Realized-volatility forecasting also rewards complexity in-sample, and HAR benchmarks are easy to beat marginally; whether the gains survive transaction-cost-aware use or out-of-sample across multiple coins and sub-periods is not answerable from the abstract. The idea is solid and publishable; the magnitude and robustness of the forecasting edge need the full results tables to verify.

`Read the paper <https://www.mdpi.com/2227-7390/13/15/2382>`__

Regime-Switching Behaviour in US Equity Indices: Two State Model With Kalman Filter Tracking and Finite State Machine Trading System
------------------------------------------------------------------------------------------------------------------------------------

This Master of Applied Science thesis by Timothy Little (Ryerson University, now Toronto Metropolitan University, 2012, Electrical and Computer Engineering) develops a time-varying two-state regime-switching model for US equity index daily returns. Rather than estimating fixed regime parameters, the model's parameters are tracked recursively over time using a Kalman filter, treating the latent regime dynamics as a state-space signal-processing problem. The author reports that this recursive, time-varying formulation improves model fit relative to static approaches. The information extracted from the fitted model is then used to construct a Finite State Machine (FSM) trading system that switches between long/defensive states according to the inferred regime.

Our summary: the work bridges signal processing and quantitative finance by casting equity regime detection as Kalman-filter state tracking and turning the regime signal into a deterministic Finite State Machine trading rule. The headline backtest claim is dramatic: the FSM trading system is reported to outperform buy-and-hold by more than 15,000% on the Dow Jones Industrial Average over 1928-2012, with similar outperformance on the S&P 500 and NASDAQ Composite.

Key metrics: indices are the DJIA, S&P 500, and NASDAQ Composite; the sample is daily returns spanning 1928-2012 for the DJIA (shorter for the others). The model is a two-state regime-switching model with Kalman-filter parameter tracking. Reported performance is a cumulative backtested return exceeding 15,000% above buy-and-hold for the DJIA; the thesis emphasizes improved model fit but does not give Sharpe ratios, drawdowns, turnover, hit rate, or transaction-cost figures. DOI 10.32920/ryerson.14651955.v1.

Critical view: the 15,000%-over-buy-and-hold figure should be read with strong skepticism. Cumulative-return multiples over an 84-year window are extremely sensitive to compounding and to a handful of well-timed exits around the 1929, 1987, 2000 and 2008 crashes, so a single regime signal that sidesteps a few crashes can mechanically produce enormous headline outperformance without implying a robust, repeatable edge. The most serious concern is in-sample versus out-of-sample evaluation: if the regime model and FSM thresholds were fitted on the same 1928-2012 history they are backtested on, the result is curve-fit and look-ahead biased. A Kalman filter run as a smoother (using future data) versus a true real-time filter is the crucial distinction; only causal, filtered-probability signals are tradeable, and theses of this vintage frequently blur the line. The reported numbers also appear to ignore transaction costs, slippage, financing, dividends, and the practical impossibility of trading index levels directly, all of which erode multi-decade switching strategies substantially. Finally, three highly correlated US indices over overlapping periods is effectively one experiment, not three independent confirmations. The Kalman-filter regime-tracking idea is legitimate and the improved model fit may be real, but the trading-performance claim is almost certainly overstated and not credible as a forward-looking expectation without out-of-sample validation and cost-aware accounting.

`Read the paper <https://rshare.library.torontomu.ca/articles/thesis/Regime-Switching_Behaviour_In_US_Equity_Indices_Two_State_Model_With_Kalman_Filter_Tracking_And_Finite_State_Machine_Trading_System/14651955>`__

Kalman Filter Demystified: from intuition to probabilistic graphical model to applications in finance
-----------------------------------------------------------------------------------------------------

This expository and methodological paper by Eric Benhamou (arXiv, 2018; 44 pages) revisits Kalman filter theory and rebuilds it from financial intuition up through a probabilistic graphical-model formulation, connecting the Kalman filter to Hidden Markov Models within a unified graphical framework. Beyond exposition, the paper makes methodological contributions: new inference algorithms for extended Kalman filters and the use of CMA-ES (Covariance Matrix Adaptation Evolution Strategy) optimization for parameter estimation in place of the traditional Expectation-Maximization (EM) approach. It then tests various dynamics assumptions for applying Kalman filters to market data.

Our summary: the paper's value is twofold. As pedagogy, it offers an unusually careful path from intuition to graphical-model formalism, making explicit the Kalman-filter/HMM correspondence. As method, it proposes CMA-ES-based parameter estimation for (extended) Kalman filters, arguing this avoids some limitations of EM, and applies the resulting filter to build a trend-following technical-analysis system, reporting superior performance for trend-following detection versus conventional approaches.

Key metrics: this is primarily a tutorial/methodological paper, and it reports no rigorous quantitative trading metrics (no Sharpe ratio, hit rate, drawdown, or out-of-sample backtest statistics). The financial application is illustrated qualitatively as improved trend-following detection rather than through a formal performance table. No standardized error metrics (log-likelihood/AIC/BIC, RMSE), specific market/sample period, or code repository are stated in the accessible abstract. The concrete deliverables are the graphical-model exposition, the extended-Kalman inference algorithms, and the CMA-ES estimation procedure.

Critical view: as a reference and teaching document the paper is genuinely useful and the Kalman-filter/HMM/graphical-model unification is sound, well-trodden theory presented clearly. The methodological claim, that CMA-ES improves estimation over EM, is plausible (CMA-ES can escape local optima that trap EM) but the paper does not appear to back it with a controlled, statistically tested benchmark across many series. The "superior performance for trend-following" claim is the weakest part from an evaluation standpoint: trend-following backtests are notoriously easy to flatter through parameter choice, period selection, and ignored transaction costs, and without an out-of-sample protocol, multiple-asset validation, and cost accounting such a claim is descriptive rather than demonstrated. Readers should treat the trading result as an illustrative proof-of-concept, not as evidence of a deployable edge, while valuing the paper mainly for its clear derivations and the practical CMA-ES estimation recipe.

`Read the paper <https://arxiv.org/abs/1811.11618>`__

Advance Detection of Bull and Bear Phases in Cryptocurrency Markets
-------------------------------------------------------------------

This paper by Rahul Arulkumaran, Suyash Kumar, Shikha Tomar, Manideep Gongalla and Harshitha (arXiv, 2024) attempts to anticipate bull and bear phases in the cryptocurrency market by forecasting Bitcoin's price path and then deriving regime labels from moving-average crossovers. Bull and bear phases are defined by the relationship between Bitcoin's 50-day and 200-day moving averages (the classic golden-cross / death-cross convention). The authors forecast future Bitcoin prices with predictive algorithms and then compute the predicted 50-day and 200-day moving averages to flag upcoming phase transitions in advance. They build and compare two models: a Multiple Linear Regression (MLR) system and an LSTM neural network.

Our summary: the core idea is to detect regime changes early by predicting the moving averages that define them, rather than waiting for the crossover to occur. Bitcoin is used as the sole proxy for the whole market because of its roughly 50% dominance. Two architectures are compared: an MLR setup using 22 separate models to predict closing prices across a 21-day horizon, and an LSTM with 100 input neurons, hidden layers of 15 and 31 neurons, and 22 output neurons. The authors deliberately judge accuracy by visually comparing predicted versus actual SMA curves instead of using R-squared.

Key metrics: data are daily Bitcoin OHLCV series from an open API starting 1 January 2012; train/test split is 75/25 for both MLR and LSTM. The LSTM predicts 22 outputs over a 21-day horizon. Critically, the paper reports no conventional quantitative performance metrics: the authors explicitly decline to use R-squared (arguing the technical indicators are highly correlated) and report no RMSE, MAE, classification accuracy, precision/recall/F1, detection lead time, Sharpe ratio, or trading returns. Model quality is assessed qualitatively by overlaying predicted and actual SMA curves; they note the LSTM was less accurate at 1000 epochs than at 2000 epochs. No code repository is mentioned.

Critical view: this is a weak empirical paper by quantitative standards and its claims are essentially undemonstrated. Refusing to report any numerical accuracy metric, and substituting eyeball comparison of moving-average curves, makes the results impossible to verify or compare and is a major red flag. Predicting the 50-day and 200-day SMAs is also a deceptively easy task: these are heavily smoothed, highly autocorrelated quantities, so a model can appear to track them closely while carrying essentially no information about the underlying daily returns that actually matter for a crossover's timing. Because the moving averages embed up to 200 days of past prices, "advance detection" risks being trivial near-persistence rather than genuine forecasting, and the paper provides no out-of-sample lead-time measurement, no comparison against a naive persistence baseline, and no trading backtest with transaction costs to show economic value. Using only Bitcoin and a single contiguous sample further limits generality. The conceptual framing (predict the indicators that define the regime) is reasonable, but as executed the work is descriptive and unvalidated, and its conclusions should be treated as suggestive at best.

`Read the paper <https://arxiv.org/abs/2411.13586>`__

Bayesian change point analysis of Bitcoin returns
-------------------------------------------------

This Finance Research Letters paper by Sven Thies and Peter Molnar (2018) studies whether the average return and volatility of Bitcoin are stable over time. The authors apply a Bayesian change point (BCP) model to the daily Bitcoin return series to detect structural breaks and partition the time series into homogeneous segments. The BCP framework allows an unrestricted number of independent change points rather than imposing a prespecified count, so the data themselves dictate how many breaks occur in the first and second moments of the return distribution.

Our summary: the study finds that structural breaks in both the mean and volatility of Bitcoin returns are very frequent. Roughly forty-eight change points in the average return are detected, and segments with similar statistical properties are merged into about seven volatility regimes. Most regimes show positive average returns; one regime shows negative average returns. The novel takeaway is that, across regimes, higher volatility tends to accompany higher average return, with the notable exception of the most volatile regime, which is the only one delivering negative average returns, challenging a simple risk-return interpretation for Bitcoin.

Key metrics: approximately 48 change points in average return, merged into roughly 7 volatility regimes. The paper reports no trading or financial performance metrics (no Sharpe, strategy returns, drawdown, or hit rate); its outputs are purely descriptive distributional statistics (mean and volatility per regime). The analysis is on daily Bitcoin returns (Finance Research Letters vol. 27, pp. 223-227). No code or data availability is mentioned.

Critical view: this is an honest, modest descriptive study and does not overclaim. The BCP method is a reasonable, well-established Bayesian tool, and the finding of frequent breaks is plausible for an immature, highly volatile asset. The key caveat is that the entire analysis is in-sample and purely descriptive: change points are identified retrospectively over the full sample, so there is inherent look-ahead and no out-of-sample or real-time detection-lag assessment. The regimes therefore cannot be used directly for trading without a forward-looking detection scheme, and the paper makes no predictive or profitability claims, which is appropriate but limits practical applicability. The single-asset (Bitcoin-only) scope and short early-era sample also limit generality, and reproducibility is hampered by the absence of shared code. As descriptive evidence of non-stationarity it is solid; as a basis for strategy it is only suggestive.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1544612318300710>`__

Tensor time series change-point detection in cryptocurrency network data
------------------------------------------------------------------------

This 2025 arXiv preprint by Andreas Anastasiou and Ivor Cribben proposes TenSeg, a method for detecting multiple change points in tensor-valued (multi-network) time series, motivated by cryptocurrency fraud and market-manipulation detection across multiple trading platforms. Because manipulators increasingly operate across several interconnected venues simultaneously, the authors argue for analyzing a stack of trading networks jointly rather than each network in isolation. TenSeg works in two stages: first a tensor decomposition of the data, then detection of multiple change points in the cross-covariance structure of the decomposed components. The procedure is designed to handle frequent changes of possibly small magnitude and to be computationally fast.

Our summary: the contribution is methodological, extending change-point detection from vector/matrix time series to tensor time series by combining tensor decomposition with cross-covariance segmentation. The method is validated on simulated data and applied to real Ethereum blockchain tensor-variate trading network data. The authors report that TenSeg substantially outperforms existing state-of-the-art change-point techniques, and they release code on GitHub.

Key metrics: the abstract reports no concrete numerical performance figures (no detection accuracy, false-positive/false-negative rates, F1, or runtime numbers), and no trading or financial performance metrics (returns, Sharpe, drawdown); this is a statistical change-point methods paper, not a trading study. Evaluation is via simulation studies plus an Ethereum network application. Code is stated to be available on GitHub, aiding reproducibility; the specific sample period and number of networks/assets are not given in the available abstract.

Critical view: as a methods contribution this looks credible: tensor change-point detection is a genuine and underdeveloped problem, the two-stage decompose-then-detect design is principled, and simulation benchmarking against competing methods plus released code are good signs for reproducibility. The main caveats are that the "substantially outperforms" claim cannot be assessed without the actual numbers and the choice of competitor baselines, and simulation-based superiority can be sensitive to the data-generating process chosen. The applied claim, that detected change points correspond to manipulation or fraud, is largely descriptive/illustrative: detecting a structural break in a blockchain network is not the same as validating it against ground-truth fraud labels, which the abstract does not mention. There are no out-of-sample predictive or economic-value claims, so the practical value for trading or surveillance remains unproven. Overall a plausible methods paper whose real-data validation appears qualitative rather than label-validated.

`Read the paper <https://arxiv.org/abs/2510.06211>`__

Herding behavior in exploring the predictability of price clustering in cryptocurrency market
---------------------------------------------------------------------------------------------

This Finance Research Letters (2023, vol. 57) paper by Hachicha, Masmoudi, Abid and Obeid investigates price clustering, the tendency of traded prices to concentrate at particular digits, in the cryptocurrency market and links it to herding behavior. The authors focus on AI and big-data token markets. They use the Chang et al. (2000) cross-sectional absolute deviation (CSAD) model to test for static and time-varying herding, and they propose using K-means clustering together with a Hidden Markov Model (HMM) to characterize and predict the price-clustering phenomenon.

Our summary: the paper combines a classical behavioral-finance herding test (CSAD) with machine-learning/state-space tools (K-means and HMM) to study whether price clustering in crypto markets is predictable and whether it co-moves with herding. The novelty is the methodological pairing, applying clustering and HMM regime modeling to the price-clustering question in the relatively niche AI/big-data token segment, and the linkage of clustering patterns to herding dynamics that vary over time.

Key metrics: the paper reports its CSAD herding estimates and uses K-means and HMM, but specific numbers (number of HMM states/clusters, sample period, number of tokens, predictive accuracy, AIC/BIC) are not surfaced in the accessible summary. No trading or financial performance metrics (returns, Sharpe, drawdown) are reported; the contribution is statistical/behavioral rather than a trading strategy. No data or code availability is mentioned.

Critical view: the topic is legitimate and the CSAD herding methodology is standard, but several concerns temper the results. Price clustering and herding studies are largely descriptive and prone to data-snooping when many digit-clustering definitions and token subsamples are tried; the choice of the narrow "AI and big-data token" universe raises sample-selection and survivorship concerns and limits generality to the broader crypto market. HMM/K-means "predictability" claims are easy to overstate because regime labels are often fit in-sample and may suffer detection lag and look-ahead bias if the full sample is used for both clustering and evaluation, and the abstract does not indicate genuine out-of-sample testing. Without reported predictive accuracy numbers, transaction-cost-aware backtests, or any economic-value assessment, the "predictability" finding should be read as in-sample association rather than demonstrated forecastability. Reproducibility is weak given no stated data window or code.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1544612323005500>`__

Cluster analysis on the structure of the cryptocurrency market via Bitcoin-Ethereum filtering
---------------------------------------------------------------------------------------------

This Physica A (2019, vol. 527, art. 121339) paper by Jung Yoon Song, Woojin Chang and Jae Wook Song analyzes the correlation structure of the cryptocurrency market using correlation-based agglomerative hierarchical clustering and minimum spanning trees (MST). The methodological novelty is a "Bitcoin-Ethereum filtering" step that removes the linear influence of Bitcoin and Ethereum on the other cryptocurrencies before clustering, isolating residual co-movement structure that is otherwise masked by the two dominant coins. The authors examine market structure across three windows (Total, Pre-regulation, and Post-regulation) to see how regulatory announcements from various countries reshaped the network.

Our summary: after filtering out Bitcoin and Ethereum, the analysis confirms the leadership/centrality of Bitcoin and Ethereum in the raw market and uncovers six homogeneous clusters among the relatively less-traded cryptocurrencies. The key finding is that the market's structure transforms after regulatory announcements, with the cluster/MST topology changing between the pre- and post-regulation periods. The filtering approach is the main contribution, offering a cleaner view of secondary co-movement structure.

Key metrics: six homogeneous clusters are identified among less-traded cryptocurrencies; the analysis is split into Total, Pre-, and Post-regulation periods. The paper reports no trading or financial performance metrics (no returns, Sharpe, drawdown, or hit rate); outputs are network/structural statistics (correlation-based hierarchical clustering and MST topology). Exact number of cryptocurrencies and precise sample dates are not surfaced in the accessible abstract (DOI: 10.1016/j.physa.2019.121339). No code availability is mentioned.

Critical view: this is a sound, descriptive econophysics study and does not overclaim predictive power. Correlation-based MST and hierarchical clustering are well-established tools, and the Bitcoin-Ethereum linear-filtering idea is a sensible, interpretable refinement. The principal caveats are inherent to the genre: results are entirely in-sample and structural, with no out-of-sample or predictive validation, so the regulatory "transformation" is an association, not a causal or forecastable effect; the pre/post split is researcher-chosen and vulnerable to confounding with broader market moves (e.g., the 2017-2018 boom-bust) rather than regulation per se. Correlation networks are also sensitive to estimation window, the linear-filter assumption ignores nonlinear dependence, and the number of clusters can depend on linkage/threshold choices. No economic-value claims, transaction costs, or trading evaluation are present, and reproducibility is limited by the absence of a stated coin list and shared code. As a structural snapshot it is credible; as actionable insight it is only suggestive.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0378437119304893>`__

A Deep Learning Framework for Predicting Digital Asset Price Movement from Trade-by-trade Data
----------------------------------------------------------------------------------------------

This 2020 arXiv preprint by Qi Zhao presents an LSTM-based deep learning framework for forecasting short-term cryptocurrency price movements directly from granular trade-by-trade (tick-level) data rather than aggregated OHLCV bars. The approach emphasizes feature engineering over high-frequency market-microstructure information and extensive hyperparameter optimization, training LSTM networks to predict the direction of price moves within defined short time windows. The dataset spans roughly one year of trade-by-trade cryptocurrency data.

Our summary: the framework reports over 60% out-of-sample directional accuracy on unseen trading periods and, notably, claims transferability, that a model trained on some cryptocurrencies generalizes to other coins not in the training set, suggesting the LSTM captures somewhat universal microstructure patterns. The author further claims profitability in a "realistic trading simulation" setting. The novelty is the use of raw trade-by-trade data plus the cross-asset transfer result.

Key metrics: out-of-sample directional accuracy is reported as "over 60%"; the dataset is ~1 year of trade-by-trade data; the paper claims profitability in a trading simulation and cross-cryptocurrency transfer. No specific Sharpe ratio, net returns, drawdown, turnover, or transaction-cost figures are given, and the exact accuracy, number of assets, and sample dates are not precisely stated. No data or code availability is mentioned.

Critical view: the headline numbers warrant skepticism. A "60%+ directional accuracy" on high-frequency crypto data is impressive on its face but is highly sensitive to label construction (very short horizons have strong autocorrelation and can be near-trivially predictable in-sample), class imbalance, and whether the baseline is properly chosen, accuracy alone is a weak metric without a no-skill benchmark. The crucial omission is transaction costs and the bid-ask spread: at tick frequency, spreads and fees typically erase directional edges far smaller than the implied signal, so the "realistic trading simulation" profitability claim cannot be assessed without explicit cost assumptions, slippage, and execution modeling, none of which are documented. Single-author preprint status (not peer-reviewed), unspecified sample/asset details, and no released code make reproducibility and data-snooping/overfitting hard to rule out, extensive hyperparameter search on one year of one market is a classic overfitting risk. The cross-asset transfer result is the most interesting and least cost-dependent claim, but it too needs out-of-sample, out-of-period verification. Treat the results as preliminary and likely optimistic until independently reproduced with costs.

`Read the paper <https://arxiv.org/abs/2010.07404>`__

Designing a cryptocurrency trading system with deep reinforcement learning utilizing LSTM neural networks and XGBoost feature selection
---------------------------------------------------------------------------------------------------------------------------------------

This Applied Soft Computing (2025, vol. 175, art. 113029) paper by H. Ghadiri and E. Hajizadeh designs a two-stage cryptocurrency trading system. First, XGBoost is used for feature selection, ranking the most relevant inputs from a large pool spanning market variables, technical indicators, macroeconomic factors, and blockchain-specific (on-chain) data, separately for each cryptocurrency. Second, the selected features are fed into a Double Deep Q-Network (DDQN) reinforcement-learning agent whose function approximator incorporates LSTM, BiLSTM, and GRU recurrent layers to emit discrete trading signals (buy, hold, sell). The system is evaluated on Bitcoin and Ethereum.

Our summary: the central claims are that (i) blockchain/on-chain variables carry crucial information for trading decisions and survive feature selection, and (ii) coupling XGBoost feature selection with the recurrent DDQN agent improves all key trading performance metrics relative to using the DDQN alone. The novelty is the explicit XGBoost-driven feature-selection front end combined with a recurrent (LSTM/BiLSTM/GRU) deep-RL agent and the inclusion of on-chain data as inputs.

Key metrics: tested on Bitcoin and Ethereum over July 2021 to March 2023. The paper reports that XGBoost feature selection improves "all key trading performance metrics" of the DDQN agent, but specific numerical values (cumulative/annualized return, Sharpe ratio, maximum drawdown, win rate, transaction costs) are not surfaced in the accessible abstract. No explicit statement on data or code availability appears in the abstract.

Critical view: several red flags common to deep-RL trading papers apply. The evaluation window (July 2021-March 2023) is short (under two years) and covers a specific, largely bearish/sideways crypto regime, so reported performance may not generalize; with only two assets the effective out-of-sample breadth is very small and overfitting/data-snooping risk is high, especially given a large initial feature pool fed through XGBoost selection (selection itself can leak look-ahead information if performed on the full sample rather than walk-forward). Deep-RL agents are notoriously sensitive to seed, hyperparameters, and reward shaping, and "improves all key metrics" is a relative claim against the authors' own baseline rather than against a buy-and-hold or simple momentum benchmark, which is the more honest comparison. Whether transaction costs, slippage, and realistic execution are included is critical for any discrete buy/hold/sell agent and is not confirmed in the abstract. Without reported absolute Sharpe/drawdown numbers, a proper walk-forward protocol, multiple-asset breadth, and released code, the results should be considered promising but unverified and at meaningful risk of being overstated.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1568494625003400>`__
