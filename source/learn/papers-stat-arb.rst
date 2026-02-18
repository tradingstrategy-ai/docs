.. meta::
   :description: Curated collection of statistical arbitrage research papers.

Statistical Arbitrage Papers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A curated collection of statistical arbitrage papers found across arXiv, SSRN, Twitter/X, trading forums, and LinkedIn.

.. note::

    Sources searched: arXiv, SSRN, Twitter/X (Ivan Blanco, Ralph Sueppel, pedma, QuantSeeker, Quant Insider), Quant StackExchange, LinkedIn.


Seminal / Classic
=================

Pairs Trading: Performance of a Relative-Value Arbitrage Rule
-------------------------------------------------------------

The paper that established the distance method for pairs trading on U.S. equities. Using data from 1962 to 2002, the authors show that pairs selected by minimum distance between normalized price series deliver approximately 11% annualized excess returns with a Sharpe ratio around 1.5 and near-zero market beta. This is the most-cited empirical foundation for statistical arbitrage and remains a standard benchmark for all subsequent methods.

By Evan Gatev, William N. Goetzmann, and K. Geert Rouwenhorst.

The methodology operates in two stages: a 12-month formation period matching all liquid stocks by minimizing the sum of squared deviations between normalized cumulative total return indices, followed by a 6-month trading period where positions open when prices diverge by more than two historical standard deviations and close upon convergence. The top 5 pairs portfolio earns an average 6-month excess return of 5.98% on committed capital. Pairs portfolio returns have low volatility (4-6% annualized), are uncorrelated with the S&P 500, and exhibit high Sharpe ratios. Fama-French three-factor regressions show intercepts remain significantly positive, indicating returns are not explained by standard risk factors. Bootstrap tests confirm profits are not due to previously documented short-term mean reversion.

Profitability spans all four broad industry sectors, though Utilities dominate the top pairs, and a declining profitability trend is consistent with increased competition from quantitative traders. After conservative transaction cost estimates of approximately 200 basis points per six-month period, the strategy retains economically and statistically significant net profits of 88-168 basis points.

`Read the paper <https://doi.org/10.1093/rfs/hhj020>`__

Statistical Arbitrage in the U.S. Equities Market
--------------------------------------------------

The foundational paper on modern PCA-based statistical arbitrage. The authors study model-driven statistical arbitrage strategies in U.S. equities, generating trading signals using Principal Component Analysis and sector ETFs. Residual (idiosyncratic) stock returns are modeled as a mean-reverting process, leading naturally to contrarian trading signals. Back-testing over 1997-2007 shows PCA-based strategies generally outperform ETF-based strategies, yielding Sharpe ratios of 1.1-1.5 after transaction costs. This paper established the framework that most subsequent stat arb research builds upon.

By Marco Avellaneda and Jeong-Hyun Lee (NYU).

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1153505>`__

Review of Statistical Arbitrage, Cointegration, and Multivariate Ornstein-Uhlenbeck
------------------------------------------------------------------------------------

A classic tutorial introducing the multivariate Ornstein-Uhlenbeck process and its relationship to cointegration and statistical arbitrage. The paper provides a geometrical interpretation of the dynamics, illustrates applications to swap contract strategies, and includes fully documented MATLAB code. An essential reference for understanding the mathematical foundations of cointegration-based stat arb.

By Attilio Meucci (ARPM).

The paper derives the closed-form solution of the multivariate OU process as a VAR(1) with conditional normal distribution, showing it generalizes a broad class of continuous-time and discrete-time processes including VAR(n), unit root, random walk, cointegrated, and stationary processes. The key geometric insight comes from eigenvalue decomposition of the transition matrix: real eigenvalues with positive real parts produce exponential mean-reversion with half-life ln(2)/lambda, while complex conjugate pairs generate spiral trajectories. The cointegrated subspace corresponds to eigenvalues with positive real parts where variance stabilizes.

A model-independent approach detects cointegration via PCA of the sample covariance matrix at long horizons: the eigenvector corresponding to the smallest eigenvalue minimizes conditional variance and is the best candidate for a stationary linear combination. For each candidate series, a univariate AR(1) extracts the mean-reversion parameter theta, expected long-term gain, z-score signal, and half-life. The methodology is illustrated on swap contract strategies using 1y-30y par swap rates, where higher-order PCA eigendirections exhibit stronger mean-reversion (theta up to 27.03) and represent more attractive stat arb candidates.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1404905>`__


Surveys
=======

Statistical Arbitrage Pairs Trading Strategies: Review and Outlook
------------------------------------------------------------------

A comprehensive survey covering more than 90 papers across five categories: distance, cointegration, time-series, stochastic control, and other approaches. The review concludes that cointegration and stochastic control methods often excel in out-of-sample tests. An essential starting point for anyone entering the field, providing a structured map of the entire statistical arbitrage literature up to 2017.

By Christopher Krauss.

The distance approach yields approximately 11% annualized returns on U.S. CRSP data (1962-2002), though Do and Faff (2010, 2012) show declining profitability on extended samples. Krauss provides an original analytical critique showing the SSD metric is suboptimal because minimizing SSD simultaneously minimizes both spread variance and squared spread mean drift, conflicting with a trader's objective. The cointegration approach uses Engle-Granger or Johansen tests, with Caldeira and Moura (2013) reporting 16% on Brazilian stocks (2005-2010). The stochastic control approach uses optimal control theory, with Jurek and Yang (2007) reporting 28-43% on selected stocks (1962-2004). Key cross-cutting findings include: profitability is linked to delayed information diffusion, uninformed demand shocks, and limits to arbitrage; quasi-multivariate strategies outperform univariate pairs; and profitability has generally declined over time.

`Read the paper <https://www.econstor.eu/bitstream/10419/116783/1/833997289.pdf>`__

A Survey of Statistical Arbitrage Pairs Trading: Non-ML Methods, 2016-2023
---------------------------------------------------------------------------

An updated survey reviewing over 100 non-ML statistical arbitrage papers published between 2016 and 2023, categorizing them into distance, cointegration, stochastic control, and other approaches. The review highlights strengths like simplicity (distance methods) versus adaptability (stochastic control), while noting weaknesses such as spurious pairs or parameter sensitivity. A valuable complement to the Krauss (2017) survey, covering the most recent classical methods.

By Sun (University of Warsaw Working Paper 2025-19).

The survey covers applications across a broad set of global indices (S&P 500, FTSE 100, CSI 300, Nikkei 225, KOSPI 100, and others). Cointegration methods dominate with 43 studies, followed by stochastic control (40 studies), distance methods (21), time series methods (20), and alternatives including copula, Hurst exponent, and entropic approaches (20). For distance methods, key advances include Diao et al. (2020)'s bi-objective optimization for pair selection in Chinese A-shares and Miao and Laws (2016)'s confirmation of profitability across 12 international markets. For stochastic control, Endres and Stubinger (2019) propose a Levy-driven OU process with dynamic entry/exit thresholds, while Das et al. (2023) incorporate regime-switching mean-reversion structures.

`Read the paper <https://ideas.repec.org/p/war/wpaper/2025-19.html>`__


Deep Learning / ML Approaches
=============================

Deep Learning Statistical Arbitrage
------------------------------------

A comprehensive framework for statistical arbitrage using deep learning. The authors construct arbitrage portfolios of similar assets as residual portfolios from conditional latent asset pricing factors, extract time series signals with a CNN+Transformer architecture, and form an optimal trading policy that maximizes risk-adjusted returns under constraints. On top-500 U.S. stocks over 19 years, the method achieves approximately 20% annualized returns with volatility below 6%, Sharpe ratios up to 4 (gross), and near-zero Fama-French exposure, robust to transaction costs. Published in Management Science (2025).

By Jorge Guijarro-Ordonez (BlackRock), Markus Pelger, and Greg Zanotti (Stanford).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/1789324804325482946>`__.

The three-step pipeline first constructs arbitrage portfolios as residual portfolios from conditional latent asset pricing factor models (Fama-French, PCA, IPCA), where residuals represent deviations from factor-implied fair prices. A CNN serves as a local filter to detect patterns like trends and reversals, while the transformer's attention mechanism captures global temporal dependencies such as mean-reversion behavior. A feedforward neural network then maps extracted signals to portfolio weights that maximize the out-of-sample Sharpe ratio subject to leverage, turnover, and short-selling constraints. Appropriate residuals -- close to uncorrelated and locally cross-sectionally stationary -- are critical for enabling effective time-series pattern extraction, and a trading objective rather than a prediction objective yields superior investment performance.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3862004>`__

Attention Factors for Statistical Arbitrage
-------------------------------------------

A framework that jointly identifies similar assets through factors, identifies mispricing, and forms a trading policy maximizing risk-adjusted performance after trading costs. The Attention Factors are conditional latent factors learned from firm characteristic embeddings that allow for complex interactions. Time-series signals are extracted from residual portfolios using a general sequence model. On top-500 U.S. stocks (1998-2021), the model achieves gross Sharpe 3.97-4+, net Sharpe 2.28-2.3 after 5bp costs, annualized returns of 9.5-16%, and low beta, significantly beating PCA benchmarks.

By Elliot L. Epstein, Rose Wang, Jaewon Choi, and Markus Pelger. Also published in ICAIF 2025 proceedings.

The attention mechanism embeds 39 firm characteristics (past returns, value, trading frictions, profitability, investment, intangibles) through a key matrix, computing factor portfolio weights via scaled dot-product attention between learned query vectors and embedded characteristics. Factors whose loadings are interpretable and closely related to industry sectors emerge naturally. A LongConv sequence model with 32 convolutions extracts time-series signals from residuals, and the system is trained to maximize net Sharpe ratio incorporating 5 bps transaction costs and 1 bp shorting costs plus an explained variance regularization term. A notable finding is that "weak factors" explaining less cross-sectional variation are important for identifying temporal mispricing, and jointly optimizing factor construction with the trading objective is crucial for reducing turnover and short positions.

`Read the paper <https://arxiv.org/abs/2510.11616>`__

A Deep Learning Approach for Trading Factor Residuals
-----------------------------------------------------

A replication and extension of the Deep Learning Statistical Arbitrage (DLSA) methodology of Guijarro-Ordonez et al. (2019), applied to a more recent out-of-sample period from 2016 to 2024. The authors adhere strictly to point-in-time principles and ensure no information leakage, following the same data pre-processing, factor modeling, and deep learning architectures (CNN, LSTM, Transformer). The study examines whether the DLSA framework's strong historical performance persists in more recent market conditions.

By Wo Long and Victor Xiao.

The replication follows the original three-step pipeline on S&P 500 equities with CRSP and Compustat data, using rolling 1,000-day historical windows and 125-day out-of-sample testing windows. Results yield out-of-sample Sharpe ratios occasionally exceeding 10, substantially higher than the original study's approximately 3.5-4, though the authors exercise caution noting potential model overfitting, unusual market regimes (post-crisis monetary policy, COVID-19), and the absence of realistic transaction costs and market impact in their preliminary analysis. The study calls for further robustness checks before drawing conclusions about the method's performance in recent markets.

`Read the paper <https://arxiv.org/abs/2412.11432>`__

End-to-End Policy Learning of a Statistical Arbitrage Autoencoder Architecture
------------------------------------------------------------------------------

In classical StatArb, mean reversion trading strategies rely on asset-pricing or PCA-based models to identify the mean of a synthetic asset, followed by a separate mean reversion strategy to generate trading signals. This paper studies Autoencoder architectures as a generalization, first using a standard Autoencoder trained on U.S. stock returns to derive strategies based on the Ornstein-Uhlenbeck process, then introducing a novel end-to-end architecture that jointly learns the latent factor structure and the trading policy. On CRSP daily U.S. equities (2000-2022), the end-to-end AE Policy achieves a best Sharpe ratio of 1.81 with 6.24% mean return and 3.46% volatility (pre-cost).

By Fabian Krause and Jan-Peter Calliess.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/1789324804325482946>`__.

The architecture consists of an encoder (ReLU activation) learning latent factors from standardized stock returns, a decoder (tanh activation) reconstructing returns analogous to PCA, a residual layer computing the difference, and a portfolio weight layer mapping residuals to trading positions. The loss function balances MSE reconstruction loss with a Sharpe ratio trading policy. Using CRSP daily U.S. equity data from 2000 to 2022 (filtering for stocks above $5 price, $1B market cap, $1M daily volume), standalone autoencoder models with OU signal extraction achieve Sharpe ratios comparable to PCA benchmarks (PCA 8 factors: SR 0.96; best autoencoder: approximately 0.42). The end-to-end AE Policy achieves a best Sharpe ratio of 1.81 (15 latent dimensions, 6.24% mean return, 3.46% volatility), substantially outperforming all benchmarks. However, these are pre-cost results, as the end-to-end model exhibits high turnover that would significantly erode after-cost performance.

`Read the paper <https://arxiv.org/abs/2402.08233>`__


Reinforcement Learning
=======================

Advanced Statistical Arbitrage with Reinforcement Learning
----------------------------------------------------------

An innovative model-free reinforcement learning framework for statistical arbitrage. For spread construction, the authors establish an empirical reversion time metric and optimize asset coefficients by minimizing this mean reversion time. In the trading phase, a reinforcement learning framework identifies optimal mean reversion trading strategies. The approach requires no model assumptions about spread dynamics, making it more flexible than traditional parametric methods. On 10 S&P 500 pairs (2022-2023), the RL method achieves cumulative P&L of 37.76% on MSFT-GOOGL and 48.82% on OXY-XOM, substantially outperforming the Distance Method and classical OU benchmarks.

By Boming Ning and Kiseop Lee.

The paper proposes two innovations replacing traditional model-dependent approaches. For spread construction, an "empirical mean reversion time" (EMRT) metric measures how quickly a time series reverts to its mean by identifying local extremes and mean-crossing times; asset coefficients are optimized via grid search to minimize EMRT with no distributional assumptions. Simulations on OU processes confirm EMRT decreases monotonically as mean-reversion speed increases (from 98.79 at mu=2 to 31.15 at mu=20). For the trading phase, a Q-learning agent's state space encodes recent price movement directions and magnitudes (discretized into four levels over a lookback window, yielding 256 states), with a reward function incorporating transaction costs.

Tested on 10 representative S&P 500 pairs (e.g., MSFT-GOOGL, V-MA, OXY-XOM) using 2022 as formation and 2023 as trading period, the RL strategy substantially outperforms Distance Method and classical OU benchmarks. For MSFT-GOOGL, the RL method achieved cumulative P&L of 37.76% with daily Sharpe 0.125 versus 11.44% (Sharpe 0.096) for the Distance Method; on OXY-XOM, it returned 48.82% versus the Distance Method's -36.18% loss.

`Read the paper <https://arxiv.org/abs/2403.12180>`__


Optimization / Mathematical
============================

Finding Moving-Band Statistical Arbitrages via Convex-Concave Optimization
--------------------------------------------------------------------------

A new method for finding statistical arbitrages that can contain more assets than just the traditional pair. The problem is formulated as seeking a portfolio with the highest volatility, subject to its price remaining in a band and a leverage limit. This non-convex optimization problem is approximately solved using the convex-concave procedure (a sequential convex programming method). The method generalizes to finding moving-band statistical arbitrages where the price band midpoint varies over time. On CRSP US stocks (2010-2023), moving-band stat-arbs yield 70% profitable portfolios with average annualized return 15% and Sharpe 0.84.

By Kasper Johansson, Thomas Schmelzer, and Stephen Boyd (Stanford).

The optimization problem maximizes portfolio price volatility (sum of squared daily price changes) subject to the price staying within a fixed band, plus a leverage constraint promoting sparsity. The nonconvex problem is solved via the convex-concave procedure (CCP), which linearizes the objective at each iteration. The key conceptual contribution is "moving-band" stat-arbs where the midpoint is a trailing M-period moving average rather than a fixed constant, analogous to Bollinger bands on multi-asset portfolios.

Using CRSP daily data on 15,405 US stocks (2010-2023), searching every 21 trading days with 10 random initializations: fixed-band stat-arbs yielded 545 unique portfolios (3-9 assets each, median 6) with 63% profitable, average annualized return 10%, average Sharpe 0.79. Moving-band stat-arbs yielded 712 portfolios with 70% profitable, average annualized return 15%, average risk 20%, and average Sharpe 0.84, with far fewer early terminations (0.4% vs. 5%).

`Read the paper <https://arxiv.org/abs/2402.08108>`__

A Markowitz Approach to Managing a Dynamic Basket of Moving-Band Statistical Arbitrages
---------------------------------------------------------------------------------------

Building on the moving-band statistical arbitrage framework, this paper considers the problem of managing a portfolio of MBSAs using Markowitz-inspired optimization. The authors show how to manage a dynamic basket of MBSAs and illustrate the method on recent historical data, demonstrating performance that is essentially uncorrelated with the market while achieving strong risk-adjusted returns. On CRSP US stocks (2010-2023) with realistic costs, the portfolio achieves 19% annualized return, 12% volatility, Sharpe ratio 1.61, maximum drawdown 15%, and very low S&P 500 correlation (15%).

By Kasper Johansson, Thomas Schmelzer, and Stephen Boyd (Stanford).

Given a set of active MBSAs discovered via the CCP method, each with a moving-band alpha signal (alpha_t = mu_t - p_t), the method solves a daily second-order cone program to optimize allocations across MBSAs. The objective maximizes alpha exposure minus transaction and shorting costs, subject to cash-neutrality, collateral requirements, per-MBSA position limits (linearly ramped down to decommission aging MBSAs), and a risk limit using an IEWMA-estimated covariance matrix. MBSAs are searched monthly and kept active for 500 trading days.

Tested on CRSP daily data for 15,405 US stocks (2010-2023) with realistic bid-ask spread costs and 0.5% annual shorting costs, the portfolio achieves 19% annualized return at 12% volatility, Sharpe ratio 1.61, maximum drawdown 15%, with positive returns in all 11 calendar years and very low S&P 500 correlation (15%). The residual alpha is 18% with market beta of only 11%.

`Read the paper <https://arxiv.org/abs/2412.02660>`__

Optimal Entry and Exit with Signature in Statistical Arbitrage
--------------------------------------------------------------

This paper explores optimal timing strategies for trading price spreads exhibiting mean-reverting characteristics. A sequential optimal stopping framework analyzes optimal entry and exit timings while considering transaction costs. A refined signature optimal stopping method resolves this problem without predefined assumptions about spread dynamics. On simulated OU paths and real U.S. pairs (e.g., UAL-DAL 2022), it achieves higher cumulative returns (e.g., 42% vs. 9.6% baseline) and better Sharpe ratios with fewer but higher-quality trades.

By Boming Ning, Prakash Chakraborty, and Kiseop Lee.

The core methodology formulates a sequential optimal stopping problem solved via the signature optimal stopping method, which approximates stopping times using linear functionals of the truncated augmented path signature. The authors introduce a non-randomized variant with a deterministic threshold and sigmoid approximation for gradient-based optimization. Training samples are generated by fitting OU processes to observed spreads, though the method itself makes no assumptions about underlying dynamics.

Tested on four co-integrated US stock pairs (WM-RSG, UAL-DAL, V-MA, GS-MS) using 2021 as formation and 2022 for trading, the signature optimal trading (SOT) method consistently outperforms a moving-average baseline: for UAL-DAL, cumulative P&L of 42.46% vs. 9.64% (daily Sharpe 0.178 vs. 0.049); for GS-MS, 15.85% vs. 2.88%; for WM-RSG, 10.03% vs. 2.64%. The method consistently enters near local minima and exits near local maxima of the spread.

`Read the paper <https://arxiv.org/abs/2309.16008>`__


Factor / Residual Models
=========================

On Statistical Arbitrage Under a Conditional Factor Model of Equity Returns
---------------------------------------------------------------------------

A conditional factor model for a multivariate portfolio of U.S. equities in the context of statistical arbitrage trading. A state space framework underlies the factor model whereby asset returns are assumed to be a noisy observation of a linear combination of factor values and latent factor risk premia. Filter and state prediction estimates are retrieved online, and large deviations between filtered returns and observations represent candidate mean reversion trades.

By Trent Spears, Stefan Zohren, and Stephen Roberts (Oxford).

The key innovation is modeling latent factor risk premia as time-varying quantities estimated online via filtering -- using both the Kalman Filter (KF) for a linear state evolution model and the Unscented Kalman Filter (UKF) for a non-linear model where factor dynamics are learned by a multi-layer perceptron. Asset returns are modeled as noisy observations of a linear combination of 5 risk factors (market beta, size, volatility, momentum, value) and their latent premia. Trading signals arise from large deviations between observed and filter-estimated returns, treated as mean-reversion candidates, with trade entry governed by Z-score thresholds on cumulative spread deviations.

Tested on 29 years of US equity data (1992-2021) from CRSP/IBES on the top 2,000 stocks by market capitalization, with 5 bps per leg transaction costs. During the earlier calibration period (1993-2007), the state space models dominate benchmarks across Sharpe ratio and maximum drawdown, with KF tending toward higher Sharpe ratios and UKF toward better drawdown control. The authors acknowledge performance degradation in more recent years, attributing it to increased market efficiency and competition.

`Read the paper <https://arxiv.org/abs/2309.02205>`__

Statistical Arbitrage in Rank Space
------------------------------------

Equity market dynamics are conventionally investigated in name space where stocks are indexed by company names. By instead indexing stocks based on their ranks in capitalization, the authors gain a different perspective of market dynamics in rank space. Using PCA residuals and either OU parametric or CNN-Transformer neural networks, rank-space neural networks produced 206% gross annualized returns and Sharpe 9.04 (2007-2022); net of 2bp costs and intraday rebalancing, this fell to 35.68% returns and Sharpe 3.28, vastly outperforming name-space equivalents. Enhanced mean-reversion (half-life approximately 2.5 days vs. 6 days in name space) and a single dominant factor drive the edge.

By Y.-F. Li and G. Papanicolaou (Stanford).

Mentioned by Vivek V Rao in `this discussion <https://x.com/VivekVRao1/status/1881003820203360384>`__.

The methodology performs PCA-based factor decomposition on rank returns -- where rank k's return reflects whichever company occupies that capitalization rank -- to extract residual returns, then generates trading signals using either a parametric OU model (Avellaneda-Lee) or a CNN+transformer architecture. The CNN extracts local patterns from cumulative residual trajectories while the transformer captures long-range dependencies, with portfolio weights optimized via a mean-variance objective. A critical practical contribution is an intraday rebalancing mechanism that converts rank-space weights into tradable stock positions by responding to rank-switching events.

On US equity data from 2007-2022 with 2 bps transaction cost, rank-space neural network portfolios achieve average annual returns of 35.68% and Sharpe ratio 3.28, dramatically outperforming name-space equivalents which yield negligible returns. The rank space exhibits a more robust single-factor market structure and enhanced mean-reversion (half-life approximately 2.5 days vs. 6 days in name space), which are the key drivers of the performance advantage.

`Read the paper <https://arxiv.org/abs/2410.06568>`__


Clustering-Based Approaches
============================

Correlation Matrix Clustering for Statistical Arbitrage Portfolios
------------------------------------------------------------------

A framework to construct statistical arbitrage portfolios with graph clustering algorithms. Various clustering methods partition the correlation matrix of market residual returns into clusters, then mean-reverting stat arb portfolios are constructed and evaluated within each cluster. Five clustering algorithms are explored, generating profitable trading strategies with over 10% annualized returns and statistically significant Sharpe ratios above one.

By Alvaro Cartea, Mihai Cucuringu, and Qi Jin (Oxford).

Mentioned by Ralph Sueppel in `this discussion <https://x.com/macro_synergy>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4560455>`__

Statistical Arbitrage in Multi-Pair Trading Strategy Based on Graph Clustering Algorithms in US Equities Market
---------------------------------------------------------------------------------------------------------------

A framework combining graph clustering (SPONGE on residuals) with quantitative and machine learning methods, including the Kelly criterion and an ensemble of ML classifiers. On S&P 500 constituents (2000-2022), the approach delivers 49% annualized returns and information ratio 1.30 out-of-sample after 5bp costs. The study introduces innovative ways of optimizing take profit and stop loss functions for daily frequency trading of pairs in the U.S. equities market.

By Adam Korniejczuk and Robert Slepaczuk.

The framework builds on Cartea et al. (2023) by constructing an undirected, signed, weighted graph from S&P 500 residual return correlations, then applying SPONGEsym clustering. The authors first replicate Cartea et al.'s results (Sharpe ~1.17 without costs) but reveal severe degradation with 0.05% transaction costs (Sharpe dropping to 0.28, with total costs four times larger than net profits). They address this by extending rebalancing from 3 to 10 days, then training an ensemble of ML classifiers to filter signals by predicted profitability, and applying the Kelly criterion for position sizing with optimized stop-loss/take-profit functions.

Using S&P 500 daily data (2000-2022) from Yahoo Finance, with the first 1,500 trading days for training and the remainder for out-of-sample testing, features include both graph-based measures (vertex degree, graph density, cluster size) and conventional price-based features. All tested strategy variants outperform benchmarks, with the best combinations of classifier ensembles, Kelly-based allocation, and optimized risk management delivering 49% annualized returns and information ratio 1.30 out-of-sample after 5bp costs.

`Read the paper <https://arxiv.org/abs/2406.10695>`__


Regime-Switching / HMM
=======================

A Hidden Markov Model for Statistical Arbitrage in International Crude Oil Futures Markets
------------------------------------------------------------------------------------------

Statistical arbitrage strategies applied to international crude oil futures markets, extending classical pairs trading to three cointegrated futures (Brent, WTI, and Shanghai). The cointegration spread is modeled as a mean-reverting regime-switching process modulated by a hidden Markov chain. Online filter-based parameter estimators are used to implement trading strategies that adapt to changing market regimes.

By Viviana Fanelli, Claudio Fontana, and Francesco Rotondi.

Mentioned by Quant Insider in `this discussion <https://x.com/QuantINsider_IQ/status/1838490759277806041>`__.

The authors establish cointegration among all three futures prices jointly -- a first in the literature -- and model the resulting cointegration spread using a mean-reverting autoregressive process with regime switching governed by a hidden Markov chain (AR-HMM). Parameters are estimated dynamically via a filter-based Expectation Maximization algorithm, enabling online updating as new data arrives.

The empirical analysis tests five strategies (plain vanilla, probability interval, prediction interval, realized increment, and predicted increment) on these three contracts. Key findings: strategies involving the Shanghai futures are profitable even under conservative transaction cost assumptions; model-based strategies exploiting HMM-filtered predictions significantly outperform simpler strategies; and the triplet cointegration approach enables arbitrage even when pairwise cointegration is not detected. Higher profitability of Shanghai-inclusive strategies is attributed to the Shanghai futures' higher speed of adjustment, consistent with newer markets offering richer arbitrage opportunities.

`Read the paper <https://arxiv.org/abs/2309.00875>`__


Mean Reversion + Momentum
==========================

Diversified Statistical Arbitrage: Dynamically Combining Mean Reversion and Momentum Strategies
------------------------------------------------------------------------------------------------

A quantitative investment strategy combining mean reversion and momentum strategies to construct a diversified statistical arbitrage approach. The mean reversion strategy decomposes stock returns into market and idiosyncratic components using PCA. The momentum strategy uses technical trading rules to trade at the industry sector level. Dynamic portfolio optimization rebalances exposures as the market environment changes, producing strong risk-adjusted returns in both up and down markets.

By James Velissaris.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1666799>`__


Options and Alternative Assets
===============================

Statistical Arbitrage in Options Markets by Graph Learning and Synthetic Long Positions
---------------------------------------------------------------------------------------

This paper targets options markets using graph learning (RNConv architecture incorporating tree structures on tabular features) and synthetic long-short arbitrage (SLSA) positions neutral to Black-Scholes risks. On KOSPI 200 index options, RNConv outperforms GCN/SAGE/GAT baselines; SLSA delivers consistent positive P&L with average information ratio 0.1627 (up to 0.2351 for deeper out-of-the-money sets), hit rates above 57%, and upward-sloping cumulative P&L curves. Demonstrates stat arb viability beyond equities.

By Hong and Klabjan.

The two-stage approach first defines a novel prediction target based on pure arbitrage opportunities from deviations in synthetic zero-coupon bond prices constructed via put-call parity. RNConv (Revised Neural oblivious decision ensemble graph Convolution) incorporates differentiable decision trees (NODE) to handle tabular node features effectively. In the second stage, SLSA (Synthetic-Long-Short-Arbitrage) positions are proven to contain only arbitrage opportunities, exhibiting zero variance and neutrality to all Black-Scholes risk factors under the arbitrage-free assumption, with an SLSA projection method converting predictions into executable positions.

Experiments on KOSPI 200 index options show RNConv statistically significantly outperforms GCN, SAGE, GAT, and GPS benchmarks. The SLSA strategy consistently yields positive returns with an average information ratio of 0.1627 (up to 0.2351 for deeper out-of-the-money sets), hit rates above 57%, and upward-sloping cumulative P&L curves.

`Read the paper <https://arxiv.org/abs/2508.14762>`__

Graph Learning for Foreign Exchange Rate Prediction and Statistical Arbitrage
-----------------------------------------------------------------------------

Applies graph learning methods to foreign exchange rate prediction in the context of statistical arbitrage. The graph structure captures dependencies between currency pairs, enabling identification of mispricing opportunities in FX markets.

The method formulates FX rate prediction as an edge-level regression on a discrete-time spatiotemporal graph where currencies are nodes (with interest rates as features) and exchange rates are edges. For FX statistical arbitrage, the authors formulate a stochastic optimization problem that explicitly accounts for observation-execution time lags, with a graph learning method generating trading quantities through flow constraints and ReLU projection while maximizing risk-adjusted returns.

Evaluated on ten of the most traded currencies, the FXSA method achieves a 61.89% higher information ratio and 45.51% higher Sortino ratio compared to benchmark, with steadily increasing cumulative profits and reduced risk. The authors prove their method satisfies empirical arbitrage constraints. This is the first work to formulate FX statistical arbitrage as a stochastic optimization problem with a provably constraint-satisfying graph learning solution.

`Read the paper <https://arxiv.org/abs/2508.14784>`__


LLM / Foundation Model Approaches
==================================

LLMs for Time Series: an Application for Single Stocks and Statistical Arbitrage
---------------------------------------------------------------------------------

Tests the Chronos LLM (pretrained on non-financial data, then fine-tuned) for single-stock and long/short stat-arb portfolios on large U.S. equities (2002-2016, data from Guijarro-Ordonez et al.). Pretrained and fine-tuned versions generate gross Sharpe ratios up to 3.97 on PCA residuals, outperforming autoARIMA but trailing specialized CNN-Transformer/STR benchmarks. Alpha is strongest pre-2008, highlighting market-efficiency evolution, yet confirms LLMs can extract signals from near-random time series.

By Valeyre and Aboura.

The authors apply the Chronos model (an 11-million parameter T5-based architecture, pretrained on 14 non-financial time series datasets) in a zero-shot setting to predict next-day residual returns of approximately 550 of the largest US stocks (2001-2016), using three residual return datasets (IPCA, PCA, Fama-French) from Guijarro-Ordonnez et al. A long/short portfolio goes long stocks with positive predicted residuals and short those with negative predictions, weighted by ranking distance from the median.

Despite never being trained on financial data, Chronos generates statistically significant forecasts with gross Sharpe ratios of 3.21 (Fama-French), 3.36 (PCA), and 4.16 (IPCA), though net Sharpe ratios are significant only before 2006. Alpha is strongest pre-2008, highlighting market-efficiency evolution, yet confirms LLMs can extract signals from near-random time series. Fine-tuned versions are also tested, outperforming autoARIMA but trailing specialized CNN-Transformer benchmarks.

`Read the paper <https://arxiv.org/abs/2412.09394>`__


Emerging Markets / Regional
=============================

Statistical Arbitrage in Polish Equities Market Using Deep Learning Techniques
------------------------------------------------------------------------------

Adapts the Avellaneda-Lee framework to Polish equities (WIG20/mWIG40, 2017-2020) using PCA eigenportfolios, sector ETFs, or stacked LSTMs for replication. PCA delivers approximately 20% cumulative returns and annualized Sharpe up to 2.63 (2017-2019); ETFs alone remain profitable (approximately 5% annual) during the 2020 COVID recession while PCA/LSTM incur losses, illustrating regime-dependent robustness and the importance of method selection across market conditions.

By Adamczyk and Dabrowski.

The paper adapts the Avellaneda-Lee framework to the Warsaw Stock Exchange (WIG20 and mWIG40 constituents with Polish sector indices), comparing three replication methods: PCA, Exchange Traded Funds (both real and artificially constructed), and LSTM neural networks. Residuals are modeled as OU mean-reverting processes with transaction costs and Polish risk-free rate calibrated to local conditions.

Backtesting over 2017-2019 (normal conditions) shows all three strategies profitable, with PCA achieving approximately 20% cumulative returns and annualized Sharpe up to 2.63 (2017). During the 2020 COVID recession, only the ETF-based technique remains profitable at approximately 5% annual return, while PCA and LSTM methods incur losses -- illustrating regime-dependent robustness and the importance of method selection across market conditions.

`Read the paper <https://arxiv.org/abs/2512.02037>`__


Risk Premium and ML
====================

Statistical Arbitrage Risk Premium by Machine Learning
------------------------------------------------------

Investigates whether machine learning methods can identify a statistical arbitrage risk premium in financial markets. The study applies ML techniques to extract positive premia from cross-sectional equity data, contributing to the understanding of how data-driven approaches can uncover systematic mispricings that traditional linear models may miss. On CRSP US equities (1976-2020), the high-SAR minus low-SAR spread earns 1.101% per month, robust to Fama-French factor controls.

By Leung and Tam.

The authors introduce Statistical Arbitrage Risk Premium (SARP): a long position in a stock and a short position in its machine-learning-constructed replicate (built via elastic-net regression projecting each stock's past 12 months of daily returns onto all other stocks) isolates factor residual risk. The regression R-squared is identified as Statistical Arbitrage Risk (SAR), where low R-squared indicates a "unique" stock and high R-squared indicates an "ubiquitous" stock.

Using CRSP data (1976-2020) on US common equities, SARP increases monotonically with SAR: high-SAR stocks earn monthly SARP of 1.368% versus 0.267% for low-SAR stocks, a highly significant spread of 1.101%. Even in raw excess returns, high-SAR stocks outperform low-SAR by 0.710% per month. Average SAR is countercyclical, and results are robust to Fama-French factor controls. This contributes a novel asset pricing anomaly driven entirely by data-driven peer identification rather than pre-specified factor models.

`Read the paper <https://arxiv.org/abs/2103.09987>`__

Harnessing Deep Q-Learning for Enhanced Statistical Arbitrage in High-Frequency Trading
---------------------------------------------------------------------------------------

Applies Deep Q-Learning to statistical arbitrage in high-frequency trading settings. The reinforcement learning agent learns to exploit short-lived mean-reversion opportunities at high frequency, adapting its trading policy dynamically to changing market microstructure conditions.

The paper details how traditional Q-Learning is extended with deep neural networks to handle the vast, continuous state spaces of HFT. The state representation includes recent price movements, technical indicators (moving averages, Bollinger Bands, RSI), and market microstructure variables (volume, bid-ask spread). Actions are discrete (buy, hold, sell) with risk-adjusted return as the reward. Key components include neural network Q-value approximation, a target network for stability, and experience replay with random mini-batch sampling.

This is primarily a methodological exposition rather than an empirical study -- it lays out the theoretical integration of Deep Q-Learning with HFT statistical arbitrage but does not report specific backtest performance metrics or comparative results against benchmarks. The paper positions reinforcement learning as a promising direction for adaptive, real-time statistical arbitrage in HFT, leaving empirical validation for future work.

`Read the paper <https://arxiv.org/abs/2311.10718>`__


Cryptocurrency / Digital Assets
================================

Statistical Arbitrage in Cryptocurrency Markets
------------------------------------------------

A landmark high-frequency study applying random forest classifiers to minute-binned cryptocurrency data. Using 40 liquid coins (Jan-Sep 2018), the authors train on lagged multi-period returns to predict whether a coin outperforms the cross-sectional median over the next 120 minutes. The long-short portfolio (top-3 long, bottom-3 short) is rebalanced every minute with a one-minute execution delay to mitigate bid-ask bounce. Over the out-of-sample period (Jun-Sep 2018, >100,000 trades), the strategy delivers 7.1 basis points per day net of 15 bps round-trip costs -- annualizing to approximately 29% with Sharpe 2.55 and MDD -2.4%. Past 60-minute returns emerge as the strongest predictors.

By Nick Fischer, Christopher Krauss, and Alexander Deinert.

The random forest classifier is trained on lagged multi-period returns spanning the past 24 hours at varying granularities to predict whether each coin outperforms the cross-sectional median over the next 120 minutes. Using 120 overlapping parallel portfolios to eliminate starting-point bias, a one-minute execution gap, volume constraints, and transaction costs of 15 bps per half-turn, the RF achieves a mean return of 3.8 bps per round-trip trade (7.1 bps daily) after costs. Feature importance reveals both models exploit short-term mean reversion, with past 20-60 minute returns most predictive.

The logistic regression baseline is weaker but still positive (annualized Sharpe 1.42, 18.8% return). Both models substantially outperform buy-and-hold Bitcoin (-18.8% annualized) and the equally-weighted market portfolio (-71.6%). The alpha decays rapidly with execution delay (vanishing by minute t+5), and strategy capacity is severely limited -- estimated at only around $2,100 per minute given low average trading volumes.

`Read the paper <https://www.mdpi.com/1911-8074/12/1/31>`__

Constructing Cointegrated Cryptocurrency Portfolios for Statistical Arbitrage
-----------------------------------------------------------------------------

Foundational work applying cointegration to cryptocurrency markets. The authors use Engle-Granger two-step and Johansen tests to form multi-coin portfolios, demonstrating statistically significant arbitrage opportunities across major cryptocurrencies. On daily Coinbase prices (Dec 2017-Jun 2018) for BTC, ETH, LTC, and BCH, the basic strategy at 1.5-sigma threshold produces an annualized Sharpe of 109, MDD of only $1,536, and a 100% win rate (though with zero transaction cost assumption and a short backtest window).

By Tim Leung and Hung Nguyen.

Using daily Coinbase prices (Dec 2017-Jun 2018) for BTC, ETH, LTC, and BCH, both Johansen and Engle-Granger tests confirm rank-1 cointegration. The Engle-Granger spread (adjusted R-squared 94.9%) is preferred for trading due to faster mean-reversion and more frequent threshold crossings. The basic strategy at 1.5-sigma threshold produces an annualized Sharpe of 109, net P&L of $8,422.57, and maximum drawdown of only $1,536 with a 100% win rate. Adding stop-loss reduces drawdowns but also lowers profitability (Sharpe drops to 3-5).

Key caveats include the short six-month backtesting window, the assumption of zero transaction costs, restriction to one unit of spread at a time (limiting scalability), and in-sample cointegration estimation on the same dataset used for trading signals.

`Read the paper <https://www.emerald.com/insight/content/doi/10.1108/SEF-08-2018-0264/full/html>`__

Evaluation of Dynamic Cointegration-Based Pairs Trading Strategy in the Cryptocurrency Market
---------------------------------------------------------------------------------------------

Advances high-frequency crypto pairs trading with minute-binned BitMEX data (Sep 2018-Oct 2019). The authors calibrate Ornstein-Uhlenbeck half-lives for optimal look-back windows and test three scenarios: single pairs (Engle-Granger/KSS), multi-coin baskets (Johansen), and all-pairs. Realistic backtesting uses best bid/ask quotes with execution only when volume allows. Basket trading yields the strongest results: total P&L 1.44 XBT, Sharpe 7.94, low MDD, and clear outperformance of buy-and-hold. Certain coins (TRX, ADA, XRP) exhibit superior edges; commissions contribute up to 35% of profits.

By Jan Tadi and Igor Kortchemski.

The methodology uses a rolling three-month formation window updated weekly, applying both ADF and KSS nonlinear unit-root tests. The spread's half-life is calibrated via the OU process to determine the look-back window for Z-score normalization, with entry at 2-sigma and exit at 1-sigma. In Scenario 1 (single optimal pair per week), average monthly returns reach 17.3% (ADF) and 13.9% (KSS) with Sharpe ratios of 6.96 and 6.57. In Scenario 2 (Johansen basket), total P&L is 1.44 XBT with Sharpe 7.94. In Scenario 3 (all individual pairs), Sharpe ranges from 0.29 to 20.38, with TRX-ADA the strongest.

The paper stands out for realistic backtesting: best bid/ask quotes, BitMEX's asymmetric maker/taker fees (-0.025%/0.075%), volume availability checks before execution, and multi-period execution gaps. All pairs outperform the buy-and-hold benchmark (negative returns of -30% to -65% for all coins).

`Read the paper <https://arxiv.org/abs/2109.10662>`__

Copula-Based Trading of Cointegrated Cryptocurrency Pairs
---------------------------------------------------------

Introduces non-parametric dependence modeling to crypto stat arb using hourly Binance USDT-margined futures (2021-2023, 20 pairs, 104 monthly cycles). After Engle-Granger/KSS cointegration screening and copula fitting (Gaussian, Student-t, Archimedean, extreme-value families via IFM), mispricing indices trigger trades at conditional-probability thresholds. At optimal thresholds, annualized returns reach 35-37% with Sharpe approximately 0.95, MDD -35%, and RoMaD >2 -- vastly superior to Bitcoin buy-and-hold. Extreme-value and select Archimedean copulas perform best; transaction costs consume approximately 12% of gross P&L.

By Jan Tadi and Jiri Witzany.

The key innovation replaces log-returns with stationary spread processes for copula modeling, addressing the problem that cumulative mispricing indices based on returns may not exhibit mean-reverting behavior. A broad set of copula families (elliptical, Archimedean, extreme-value) are fitted with AIC-based selection. Trading signals are generated from conditional probabilities deviating beyond threshold alpha1 from 0.5. Tawn type 1, Tawn type 2, and BB7 copulas are most frequently selected, highlighting the importance of asymmetric and heavy-tailed dependence structures.

At optimal alpha1=0.10, the EG-based strategy achieves total return 76.2% (annualized 37.1%), Sharpe 0.97, and MDD -35.6% with 176 transactions; KSS is slightly weaker at 72.3% total (annualized 35.3%), Sharpe 0.93. Both significantly outperform Bitcoin buy-and-hold (-33.9% total, Sharpe -0.23, drawdown -77.1%). Transaction costs (taker fees 0.04%) consume 11.7% of gross P&L.

`Read the paper <https://arxiv.org/abs/2305.06961>`__

High-Frequency Trading of Cryptocurrencies Through Short-Term Cointegration Pairs-Trading Strategies
-----------------------------------------------------------------------------------------------------

A dedicated high-frequency study on 1-minute Binance data resampled to 60-second intervals (May-Sep 2018, 17 USDT pairs). Engle-Granger identifies pairs, validated by Johansen VECM rank tests incorporating short-term trends. A trading bot opens/closes on residual thresholds (percentile-based, adjusted for costs/skew), with stop-loss on non-stationarity. The Johansen-assisted version averages 6.81% weekly returns versus 5.97% for pure Engle-Granger, with fewer but higher-quality trades and lower variance. Granger-causality pre-screening favoring lagging coins reduces computation for live HFT.

By Lennart de Bruijn (Erasmus University, in collaboration with Blocktraders HFT firm).

The methodology uses EG2SLS for pair selection across all 17 USDT pairs, with an optional Johansen VECM rank test as an additional filter incorporating short-term trend dynamics. A 15-day training period is used for grid-search parameter optimization, and 92-day out-of-sample testing (Jun-Sep 2018) runs at 60-second intervals. The Johansen-assisted method achieves this with roughly half the trades (77 vs. 152 per week), yielding 0.20% return per position compared to 0.14% for pure EG2SLS, with tighter confidence intervals on weekly returns.

Granger causality pre-screening finds that larger-cap coins (BTC, ETH, BCH, ETC) tend to Granger-cause smaller coins, and the most-traded pairs in the algorithm correspond to lagging exchange rates. Key caveats include the 16-week sample during a crypto bear market, 60-second rather than true HFT-level data due to computational constraints, and potential survivorship bias.

`Read the paper <https://thesis.eur.nl/pub/47732/Bruijn-de.pdf>`__

Reinforcement Learning Pair Trading: A Dynamic Scaling Approach
---------------------------------------------------------------

Applies actor-critic reinforcement learning agents (A2C, PPO, SAC, DQN) to 1-minute Binance BTC-GBP/EUR pairs (Oct-Dec 2023), learning timing, direction, and position sizing. The RL2 variant dynamically scales positions from -1 to +1. States include z-score spreads and zone indicators; rewards penalize costs while rewarding P&L. Traditional Gatev-style pairs trading yields 8.33% annualized; RL variants reach 9.94-31.53%, demonstrating superior exploitation of volatile crypto spreads via learned policies.

By Harry Yang and Akhtar Malik.

The RL1 configuration decides only trade timing (discrete: long leg, short leg, close), while RL2 decides both timing and investment quantity via continuous action space in [-1, 1] enabling dynamic position scaling. Pair formation uses Pearson correlation and Engle-Granger tests over a moving window; the spread is z-score normalized with grid-searched parameters (open threshold 1.8, close threshold 0.4, window 900 intervals). The RL reward combines P&L, zone-appropriate behavior rewards, and transaction cost penalties. Four algorithms are tested: PPO, DQN, A2C, and SAC.

A2C consistently outperforms other RL methods. RL2's outperformance stems from fewer but larger winning trades (average win $90.94 vs. $14.50 for Gatev), with 2.42 win/loss ratio. The Kim and Kim (2019) RL threshold-adaptive method failed entirely in this crypto context (-35% to -88%). Results hold across transaction cost tiers (0% to 0.05%), though the extremely high returns are based on only one month of data on a single pair.

`Read the paper <https://arxiv.org/abs/2407.16103>`__

Altcoin-Bitcoin Arbitrage
--------------------------

Focuses on cross-sectional mean-reversion driven by prior-day momentum using daily open-to-close returns. Long low-momentum altcoins versus short Bitcoin produces Sharpe ratios up to 14.65 in illiquid tiers, though capacity is constrained by market impact. Illustrates a "low-liquidity premium" edge that complements higher-frequency approaches.

By Zura Kakushadze and Willie Yu.

The alpha signal exploits the finding that the leading factor in daily close-to-close crypto returns is prior-day momentum, and subsequent open-to-close returns are negatively correlated with it. The trading rule maintains a constant short Bitcoin position (via futures) while going long altcoins with negative prior-day momentum, equal dollar weights, rebalanced daily. Using data from CoinMarketCap for 2,115 cryptoassets (Jan 2019), altcoins are segmented into six market-cap tiers to examine liquidity effects.

The alpha is fundamentally a low-liquidity effect: high-cap altcoins (tiers 1A-1B, ranks 2-60) produce significantly negative returns (Sharpe -1.81 to -1.99). Performance improves monotonically as market cap decreases: tier 1E (ranks 201-300) yields Sharpe 4.93, and tier 1F (ranks 301-417) yields Sharpe 14.65 with 459% ROC. The critical caveat is that these returns are largely untradeable -- market impact for low-liquidity altcoins would quickly become prohibitive, meaning the alpha exists precisely because it cannot be efficiently arbitraged away.

`Read the paper <https://arxiv.org/abs/1903.06033>`__
