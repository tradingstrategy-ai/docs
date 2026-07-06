.. meta::
   :description: Research papers and posts on statistical arbitrage, pairs trading, cointegration, and relative-value strategies.

Statistical Arbitrage
~~~~~~~~~~~~~~~~~~~~~~

Statistical arbitrage encompasses a broad family of market-neutral strategies that exploit temporary mispricings between related assets. The classic implementation is pairs trading, where two historically correlated assets are traded when their price spread diverges beyond a statistical threshold, with the expectation of mean reversion. More advanced implementations extend this to baskets of assets, factor residuals, and machine learning-driven signal extraction. Statistical arbitrage differs from simple mean reversion in that it explicitly exploits cross-asset relationships and aims for market neutrality.

This collection covers the full spectrum of statistical arbitrage research: the seminal distance-method papers that established the field, cointegration-based approaches using Engle-Granger and Johansen tests, deep learning frameworks that extract arbitrage signals from factor residuals, reinforcement learning for optimal execution timing, clustering methods for portfolio construction, and applications to cryptocurrency and international markets. The coverage spans from theoretical foundations to practical implementation details including transaction cost modeling and execution mechanics.

Related topics include :doc:`Mean Reversion <./mean-reversion>` for single-asset reversion strategies, :doc:`Order Flow <./order-flow>` for microstructure-driven signals used alongside stat arb, and :doc:`Cryptocurrency <./cryptocurrency>` for digital asset applications.

Pairs Trading: Performance of a Relative-Value Arbitrage Rule
-------------------------------------------------------------

The paper that established the distance method for pairs trading on U.S. equities. Using data from 1962 to 2002, the authors show that pairs selected by minimum distance between normalized price series deliver approximately 11% annualized excess returns with a Sharpe ratio around 1.5 and near-zero market beta. This is the most-cited empirical foundation for statistical arbitrage and remains a standard benchmark for all subsequent methods.

By Evan Gatev, William N. Goetzmann, and K. Geert Rouwenhorst.

The methodology operates in two stages: a 12-month formation period matching all liquid stocks by minimizing the sum of squared deviations between normalized cumulative total return indices, followed by a 6-month trading period where positions open when prices diverge by more than two historical standard deviations and close upon convergence. The top 5 pairs portfolio earns an average 6-month excess return of 5.98% on committed capital. Pairs portfolio returns have low volatility (4-6% annualized), are uncorrelated with the S&P 500, and exhibit high Sharpe ratios. Fama-French three-factor regressions show intercepts remain significantly positive, indicating returns are not explained by standard risk factors.

`Read the paper <https://doi.org/10.1093/rfs/hhj020>`__

Statistical Arbitrage in the U.S. Equities Market
--------------------------------------------------

The foundational paper on modern PCA-based statistical arbitrage. The authors study model-driven statistical arbitrage strategies in U.S. equities, generating trading signals using Principal Component Analysis and sector ETFs. Residual (idiosyncratic) stock returns are modeled as a mean-reverting process, leading naturally to contrarian trading signals. Back-testing over 1997-2007 shows PCA-based strategies generally outperform ETF-based strategies, yielding Sharpe ratios of 1.1-1.5 after transaction costs. This paper established the framework that most subsequent stat arb research builds upon.

By Marco Avellaneda and Jeong-Hyun Lee (NYU Courant, 2008).

Our summary: stock returns are decomposed into systematic and idiosyncratic components, with risk factors taken either from PCA eigenportfolios of the return correlation matrix or from 15 sector ETFs. The residual is fitted as an Ornstein-Uhlenbeck process on a fixed 60-day window (roughly one earnings cycle) and converted into a dimensionless s-score; trades open when the residual deviates 1.25 standard deviations from equilibrium and close at 0.5, uniformly across all stocks with market capitalisation above USD 1 billion at the trade date (avoiding survivorship bias). The paper finds the number of PCA factors needed to explain about 50% of return variance drifts between 10 and 30 and varies inversely with the VIX, and that mean-reversion strategies work best when relatively few factors suffice. A dedicated section reproduces the Khandani-Lo analysis of the August 2007 quant meltdown: sector-level P&L shows Technology and Consumer Discretionary were hit harder than Financials and Real Estate, lending support to the portfolio "unwinding" theory, and at comparable 2+2 leverage the PCA book drew down about 5% versus 10% for the ETF book.

Data: daily end-of-day U.S. equity prices 1996-2007 (some variants start in 2002), universe of stocks above USD 1 billion market capitalisation, with a flat 5 bps per-trade (10 bps round-trip) transaction cost assumption. No code is provided, but the appendix documents the Ornstein-Uhlenbeck estimation and s-score formulas in enough detail for reproduction.

Key metrics: PCA-based strategies average an annual Sharpe ratio of 1.44 net of costs over 1997-2007 but only 0.9 during 2003-2007; sector-ETF strategies reach Sharpe 1.1 over 1997-2007 with a similar post-2002 decay. Weighting signals in "trading time" (inversely proportional to daily volume) lifts the ETF strategy to Sharpe 1.51 over 2003-2007. During the August 2007 liquidity crisis the strategies at 2+2 leverage suffered roughly 5-10% drawdowns within days before recovering.

Mentioned by Matias Scalbi in `this discussion <https://x.com/MatiasScalbi/status/2065214621531902254>`__, and this is what people say about it: the paper "brought serious math to mean reversion" and formalised the strategy behind countless trading bots. The thread highlights the honest reporting — the Sharpe decay from 1.44 to 0.9 after 2003 as the trade got crowded — and the August 2007 chapter as the most valuable parts, concluding that the real risk is not in the formula but in how many people hold the same position when everyone runs for the exit.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1153505>`__

Review of Statistical Arbitrage, Cointegration, and Multivariate Ornstein-Uhlenbeck
-------------------------------------------------------------------------------------

A classic tutorial introducing the multivariate Ornstein-Uhlenbeck process and its relationship to cointegration and statistical arbitrage. The paper provides a geometrical interpretation of the dynamics, illustrates applications to swap contract strategies, and includes fully documented MATLAB code. An essential reference for understanding the mathematical foundations of cointegration-based stat arb.

By Attilio Meucci (ARPM).

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1404905>`__

Statistical Arbitrage Pairs Trading Strategies: Review and Outlook
------------------------------------------------------------------

A comprehensive survey covering more than 90 papers across five categories: distance, cointegration, time-series, stochastic control, and other approaches. The review concludes that cointegration and stochastic control methods often excel in out-of-sample tests. An essential starting point for anyone entering the field, providing a structured map of the entire statistical arbitrage literature up to 2017.

By Christopher Krauss.

`Read the paper <https://www.econstor.eu/bitstream/10419/116783/1/833997289.pdf>`__

A Survey of Statistical Arbitrage Pairs Trading: Non-ML Methods, 2016-2023
---------------------------------------------------------------------------

An updated survey reviewing over 100 non-ML statistical arbitrage papers published between 2016 and 2023, categorizing them into distance, cointegration, stochastic control, and other approaches. The review highlights strengths like simplicity (distance methods) versus adaptability (stochastic control), while noting weaknesses such as spurious pairs or parameter sensitivity.

By Sun (University of Warsaw Working Paper 2025-19).

`Read the paper <https://ideas.repec.org/p/war/wpaper/2025-19.html>`__

Deep Learning Statistical Arbitrage
------------------------------------

A comprehensive framework for statistical arbitrage using deep learning. The authors construct arbitrage portfolios of similar assets as residual portfolios from conditional latent asset pricing factors, extract time series signals with a CNN+Transformer architecture, and form an optimal trading policy that maximizes risk-adjusted returns under constraints. On top-500 U.S. stocks over 19 years, the method achieves approximately 20% annualized returns with volatility below 6%, Sharpe ratios up to 4 (gross), and near-zero Fama-French exposure, robust to transaction costs. Published in Management Science (2025).

By Jorge Guijarro-Ordonez (BlackRock), Markus Pelger, and Greg Zanotti (Stanford).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/1789324804325482946>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3862004>`__

Attention Factors for Statistical Arbitrage
--------------------------------------------

A framework that jointly identifies similar assets through factors, identifies mispricing, and forms a trading policy maximizing risk-adjusted performance after trading costs. The Attention Factors are conditional latent factors learned from firm characteristic embeddings that allow for complex interactions. Time-series signals are extracted from residual portfolios using a general sequence model. On top-500 U.S. stocks (1998-2021), the model achieves gross Sharpe 3.97-4+, net Sharpe 2.28-2.3 after 5bp costs, annualized returns of 9.5-16%, and low beta.

By Elliot L. Epstein, Rose Wang, Jaewon Choi, and Markus Pelger.

Mentioned by `@quantbeckman in this discussion <https://x.com/quantbeckman/status/2032724928307331339>`__.

`Read the paper <https://arxiv.org/abs/2510.11616>`__

A Deep Learning Approach for Trading Factor Residuals
------------------------------------------------------

A replication and extension of the Deep Learning Statistical Arbitrage methodology, applied to a more recent out-of-sample period from 2016 to 2024. The authors adhere strictly to point-in-time principles and ensure no information leakage, following the same data pre-processing, factor modeling, and deep learning architectures (CNN, LSTM, Transformer). The study examines whether the DLSA framework's strong historical performance persists in more recent market conditions.

By Wo Long and Victor Xiao.

`Read the paper <https://arxiv.org/abs/2412.11432>`__

End-to-End Policy Learning of a Statistical Arbitrage Autoencoder Architecture
-------------------------------------------------------------------------------

This paper studies Autoencoder architectures as a generalization of classical StatArb, first using a standard Autoencoder trained on U.S. stock returns to derive strategies based on the Ornstein-Uhlenbeck process, then introducing a novel end-to-end architecture that jointly learns the latent factor structure and the trading policy. On CRSP daily U.S. equities (2000-2022), the end-to-end AE Policy achieves a best Sharpe ratio of 1.81 with 6.24% mean return and 3.46% volatility (pre-cost).

By Fabian Krause and Jan-Peter Calliess.

`Read the paper <https://arxiv.org/abs/2402.08233>`__

Advanced Statistical Arbitrage with Reinforcement Learning
----------------------------------------------------------

An innovative model-free reinforcement learning framework for statistical arbitrage. For spread construction, the authors establish an empirical reversion time metric and optimize asset coefficients by minimizing mean reversion time. In the trading phase, a reinforcement learning framework identifies optimal mean reversion trading strategies. On 10 S&P 500 pairs (2022-2023), the RL method achieves cumulative P&L of 37.76% on MSFT-GOOGL and 48.82% on OXY-XOM.

By Boming Ning and Kiseop Lee.

`Read the paper <https://arxiv.org/abs/2403.12180>`__

Finding Moving-Band Statistical Arbitrages via Convex-Concave Optimization
--------------------------------------------------------------------------

A new method for finding statistical arbitrages that can contain more assets than just the traditional pair. The problem is formulated as seeking a portfolio with the highest volatility, subject to its price remaining in a band and a leverage limit. On CRSP US stocks (2010-2023), moving-band stat-arbs yield 70% profitable portfolios with average annualized return 15% and Sharpe 0.84.

By Kasper Johansson, Thomas Schmelzer, and Stephen Boyd (Stanford).

`Read the paper <https://arxiv.org/abs/2402.08108>`__

A Markowitz Approach to Managing a Dynamic Basket of Moving-Band Statistical Arbitrages
----------------------------------------------------------------------------------------

Building on the moving-band statistical arbitrage framework, this paper considers the problem of managing a portfolio of MBSAs using Markowitz-inspired optimization. On CRSP US stocks (2010-2023) with realistic costs, the portfolio achieves 19% annualized return, 12% volatility, Sharpe ratio 1.61, maximum drawdown 15%, and very low S&P 500 correlation (15%).

By Kasper Johansson, Thomas Schmelzer, and Stephen Boyd (Stanford).

`Read the paper <https://arxiv.org/abs/2412.02660>`__

Optimal Entry and Exit with Signature in Statistical Arbitrage
--------------------------------------------------------------

This paper explores optimal timing strategies for trading price spreads exhibiting mean-reverting characteristics using a sequential optimal stopping framework and a refined signature optimal stopping method. On simulated OU paths and real U.S. pairs (e.g., UAL-DAL 2022), it achieves higher cumulative returns (e.g., 42% vs. 9.6% baseline) and better Sharpe ratios with fewer but higher-quality trades.

By Boming Ning, Prakash Chakraborty, and Kiseop Lee.

`Read the paper <https://arxiv.org/abs/2309.16008>`__

On Statistical Arbitrage Under a Conditional Factor Model of Equity Returns
---------------------------------------------------------------------------

A conditional factor model for a multivariate portfolio of U.S. equities in the context of statistical arbitrage trading. A state space framework underlies the factor model whereby asset returns are assumed to be a noisy observation of a linear combination of factor values and latent factor risk premia. Filter and state prediction estimates are retrieved online, and large deviations represent candidate mean reversion trades.

By Trent Spears, Stefan Zohren, and Stephen Roberts (Oxford).

`Read the paper <https://arxiv.org/abs/2309.02205>`__

Statistical Arbitrage in Rank Space
------------------------------------

Equity market dynamics are investigated in rank space where stocks are indexed by their capitalization ranks rather than company names. Using PCA residuals and either OU parametric or CNN-Transformer neural networks, rank-space neural networks produced 206% gross annualized returns and Sharpe 9.04 (2007-2022); net of 2bp costs, this fell to 35.68% returns and Sharpe 3.28, vastly outperforming name-space equivalents.

By Y.-F. Li and G. Papanicolaou (Stanford).

Mentioned by Vivek V Rao in `this discussion <https://x.com/VivekVRao1/status/1881003820203360384>`__.

`Read the paper <https://arxiv.org/abs/2410.06568>`__

Correlation Matrix Clustering for Statistical Arbitrage Portfolios
------------------------------------------------------------------

A framework to construct statistical arbitrage portfolios with graph clustering algorithms. Various clustering methods partition the correlation matrix of market residual returns into clusters, then mean-reverting stat arb portfolios are constructed and evaluated within each cluster. Five clustering algorithms are explored, generating profitable trading strategies with over 10% annualized returns and statistically significant Sharpe ratios above one.

By Alvaro Cartea, Mihai Cucuringu, and Qi Jin (Oxford).

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4560455>`__

Statistical Arbitrage in Multi-Pair Trading Strategy Based on Graph Clustering Algorithms in US Equities Market
----------------------------------------------------------------------------------------------------------------

A framework combining graph clustering (SPONGE on residuals) with quantitative and machine learning methods, including the Kelly criterion and an ensemble of ML classifiers. On S&P 500 constituents (2000-2022), the approach delivers 49% annualized returns and information ratio 1.30 out-of-sample after 5bp costs.

By Adam Korniejczuk and Robert Slepaczuk.

`Read the paper <https://arxiv.org/abs/2406.10695>`__

A Hidden Markov Model for Statistical Arbitrage in International Crude Oil Futures Markets
------------------------------------------------------------------------------------------

Statistical arbitrage strategies applied to international crude oil futures markets, extending classical pairs trading to three cointegrated futures (Brent, WTI, and Shanghai). The cointegration spread is modeled as a mean-reverting regime-switching process modulated by a hidden Markov chain, with online filter-based parameter estimators enabling adaptive trading strategies.

By Viviana Fanelli, Claudio Fontana, and Francesco Rotondi.

`Read the paper <https://arxiv.org/abs/2309.00875>`__

Diversified Statistical Arbitrage: Dynamically Combining Mean Reversion and Momentum Strategies
-------------------------------------------------------------------------------------------------

A quantitative investment strategy combining mean reversion and momentum strategies to construct a diversified statistical arbitrage approach. The mean reversion strategy decomposes stock returns into market and idiosyncratic components using PCA. The momentum strategy uses technical trading rules to trade at the industry sector level. Dynamic portfolio optimization rebalances exposures as the market environment changes.

By James Velissaris.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1666799>`__

Statistical Arbitrage in Options Markets by Graph Learning and Synthetic Long Positions
----------------------------------------------------------------------------------------

This paper targets options markets using graph learning (RNConv architecture incorporating tree structures on tabular features) and synthetic long-short arbitrage (SLSA) positions neutral to Black-Scholes risks. On KOSPI 200 index options, RNConv outperforms GCN/SAGE/GAT baselines; SLSA delivers consistent positive P&L with average information ratio 0.1627 and hit rates above 57%.

By Hong and Klabjan.

`Read the paper <https://arxiv.org/abs/2508.14762>`__

Graph Learning for Foreign Exchange Rate Prediction and Statistical Arbitrage
-----------------------------------------------------------------------------

Applies graph learning methods to foreign exchange rate prediction in the context of statistical arbitrage. The graph structure captures dependencies between currency pairs, enabling identification of mispricing opportunities in FX markets. On ten of the most traded currencies, the FXSA method achieves a 61.89% higher information ratio and 45.51% higher Sortino ratio compared to benchmark.

`Read the paper <https://arxiv.org/abs/2508.14784>`__

LLMs for Time Series: an Application for Single Stocks and Statistical Arbitrage
----------------------------------------------------------------------------------

Tests the Chronos LLM for single-stock and long/short stat-arb portfolios on large U.S. equities (2002-2016). Pretrained and fine-tuned versions generate gross Sharpe ratios up to 3.97 on PCA residuals, outperforming autoARIMA but trailing specialized CNN-Transformer benchmarks. Alpha is strongest pre-2008, highlighting market-efficiency evolution, yet confirms LLMs can extract signals from near-random time series.

By Valeyre and Aboura.

`Read the paper <https://arxiv.org/abs/2412.09394>`__

Statistical Arbitrage in Polish Equities Market Using Deep Learning Techniques
-------------------------------------------------------------------------------

Adapts the Avellaneda-Lee framework to Polish equities (WIG20/mWIG40, 2017-2020) using PCA eigenportfolios, sector ETFs, or stacked LSTMs for replication. PCA delivers approximately 20% cumulative returns and annualized Sharpe up to 2.63 (2017-2019); ETFs alone remain profitable (approximately 5% annual) during the 2020 COVID recession while PCA/LSTM incur losses.

By Adamczyk and Dabrowski.

`Read the paper <https://arxiv.org/abs/2512.02037>`__

Statistical Arbitrage Risk Premium by Machine Learning
------------------------------------------------------

Investigates whether machine learning methods can identify a statistical arbitrage risk premium in financial markets. On CRSP US equities (1976-2020), the high-SAR minus low-SAR spread earns 1.101% per month, robust to Fama-French factor controls.

By Leung and Tam.

`Read the paper <https://arxiv.org/abs/2103.09987>`__

Harnessing Deep Q-Learning for Enhanced Statistical Arbitrage in High-Frequency Trading
----------------------------------------------------------------------------------------

Applies Deep Q-Learning to statistical arbitrage in high-frequency trading settings. The reinforcement learning agent learns to exploit short-lived mean-reversion opportunities at high frequency, adapting its trading policy dynamically to changing market microstructure conditions.

`Read the paper <https://arxiv.org/abs/2311.10718>`__

Statistical Arbitrage in Cryptocurrency Markets
------------------------------------------------

A landmark high-frequency study applying random forest classifiers to minute-binned cryptocurrency data. Using 40 liquid coins (Jan-Sep 2018), the strategy delivers 7.1 basis points per day net of 15 bps round-trip costs — annualizing to approximately 29% with Sharpe 2.55 and MDD -2.4%. Past 60-minute returns emerge as the strongest predictors.

By Nick Fischer, Christopher Krauss, and Alexander Deinert.

`Read the paper <https://www.mdpi.com/1911-8074/12/1/31>`__

Constructing Cointegrated Cryptocurrency Portfolios for Statistical Arbitrage
------------------------------------------------------------------------------

Foundational work applying cointegration to cryptocurrency markets using Engle-Granger and Johansen tests to form multi-coin portfolios. On daily Coinbase prices (Dec 2017-Jun 2018) for BTC, ETH, LTC, and BCH, the basic strategy at 1.5-sigma threshold produces an annualized Sharpe of 109 (with zero transaction cost assumption).

By Tim Leung and Hung Nguyen.

`Read the paper <https://www.emerald.com/insight/content/doi/10.1108/SEF-08-2018-0264/full/html>`__

Evaluation of Dynamic Cointegration-Based Pairs Trading Strategy in the Cryptocurrency Market
----------------------------------------------------------------------------------------------

Advances high-frequency crypto pairs trading with minute-binned BitMEX data (Sep 2018-Oct 2019). The authors calibrate Ornstein-Uhlenbeck half-lives for optimal look-back windows and test three scenarios: single pairs (Engle-Granger/KSS), multi-coin baskets (Johansen), and all-pairs. Basket trading yields the strongest results: total P&L 1.44 XBT, Sharpe 7.94.

By Jan Tadi and Igor Kortchemski.

`Read the paper <https://arxiv.org/abs/2109.10662>`__

Copula-Based Trading of Cointegrated Cryptocurrency Pairs
---------------------------------------------------------

Introduces non-parametric dependence modeling to crypto stat arb using hourly Binance USDT-margined futures (2021-2023, 20 pairs, 104 monthly cycles). After Engle-Granger/KSS cointegration screening and copula fitting, annualized returns reach 35-37% with Sharpe approximately 0.95.

By Jan Tadi and Jiri Witzany.

`Read the paper <https://arxiv.org/abs/2305.06961>`__

High-Frequency Trading of Cryptocurrencies Through Short-Term Cointegration Pairs-Trading Strategies
------------------------------------------------------------------------------------------------------

A dedicated high-frequency study on 1-minute Binance data resampled to 60-second intervals (May-Sep 2018, 17 USDT pairs). The Johansen-assisted version averages 6.81% weekly returns versus 5.97% for pure Engle-Granger.

By Lennart de Bruijn (Erasmus University, in collaboration with Blocktraders HFT firm).

`Read the paper <https://thesis.eur.nl/pub/47732/Bruijn-de.pdf>`__

Reinforcement Learning Pair Trading: A Dynamic Scaling Approach
---------------------------------------------------------------

Applies actor-critic reinforcement learning agents (A2C, PPO, SAC, DQN) to 1-minute Binance BTC-GBP/EUR pairs, learning timing, direction, and position sizing. Traditional Gatev-style pairs trading yields 8.33% annualized; RL variants reach 9.94-31.53%.

By Harry Yang and Akhtar Malik.

`Read the paper <https://arxiv.org/abs/2407.16103>`__

Altcoin-Bitcoin Arbitrage
--------------------------

Focuses on cross-sectional mean-reversion driven by prior-day momentum using daily open-to-close returns. Long low-momentum altcoins versus short Bitcoin produces Sharpe ratios up to 14.65 in illiquid tiers, though capacity is constrained by market impact.

By Zura Kakushadze and Willie Yu.

`Read the paper <https://arxiv.org/abs/1903.06033>`__

Trading and Arbitrage in Cryptocurrency Markets
------------------------------------------------

This paper studies cross-exchange arbitrage opportunities in cryptocurrency markets, documenting persistent pricing discrepancies between exchanges and quantifying the returns available from exploiting them. The authors analyze the structural reasons for arbitrage persistence including capital transfer frictions, withdrawal limits, and timing risks.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3171150>`__

Pairs Trading - Selection via Scoring Systems
---------------------------------------------

Lukas Reichmann develops a cointegration-based pairs trading selection framework that replaces the usual single-factor squared-sum-of-distances ranking with an aggregated score built from statistically significant panel-regression coefficients. The paper estimates which inter-pair characteristics predict future mean-reversion activity, then uses those coefficients to rank candidate stock pairs. Published in Finance Research Letters, Vol. 93, March 2026.

Our summary: the paper is useful because it treats pair selection as a forecasting problem rather than a purely descriptive closeness screen. The score combines training-period mean reversion, squared spread distance, spread volatility, shared industry classification, momentum-rank distance, and volume correlation. The regression score improves returns and risk-adjusted performance versus the SSD benchmark.

Data and code: the study uses Refinitiv Eikon stock-level data for all firms that were S&P 500 constituents at any point between 2010 and 2023.

Key metrics: the best-reported configuration uses lambda = 2 with six-month training and six-month trading periods. Including the COVID period, the updated 20-pair scoring strategy earns a 20.59% cumulative gross return and 11.33% net return after transaction costs, versus 4.06% gross and -5.49% net for the SSD 20-pair benchmark.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S154461232600173X>`__

Short Scamtrash / Long Distinguished Crypto
-------------------------------------------

A practical investigation into the "quality factor" for cryptocurrency perpetuals trading. The core strategy is simple: short scammy, low-quality crypto perps while going long large-cap crypto against it. This works better in crypto than traditional equities because markets are less efficient and there are abundant opportunities to identify low-quality assets.

The post demonstrates how to build a simple "trashmetric" derived from trading volume to sort perpetuals into buckets by quality. Backtests show that trashier assets have worse average returns while more distinguished assets perform better. The strategy trades once a week, going long the least trashy third of the universe and short the most trashy third, with volatility-targeted position sizing.

By Robot James.

`Read the post <https://robotjames.substack.com/p/short-scamtrash-long-distinguished>`__

Pairs Trading and Statistical Arbitrage Across Top Cryptocurrencies
--------------------------------------------------------------------

A comprehensive article on implementing pairs trading and statistical arbitrage strategies across the top 23 cryptocurrencies by market capitalization. The article covers the full implementation including data normalization, the Sum of Squared Differences (SSD) metric for measuring price divergence, and the formation and trading period methodology.

The article addresses practical challenges including the computational complexity of 253 possible pair combinations, the importance of proper price normalization for fair comparison, and the trade-off between data granularity and trading costs.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/strategy-16-cryptocurrency-pairs>`__.

BTC-ETH Pairs Trading: Correlation Analysis and Statistical Arbitrage
----------------------------------------------------------------------

An article exploring statistical arbitrage opportunities between Bitcoin and Ethereum through correlation analysis and linear regression. The study uses Pearson correlation coefficients on 4-hour interval data to understand the dynamic relationship between the two largest cryptocurrencies.

The article demonstrates how the BTC-ETH correlation fluctuates with market conditions, creating trading opportunities when the pair deviates from its historical relationship.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-the-waves-of-correlation>`__.

Pairs Trading with VectorBT® PRO
----------------------------------

A comprehensive tutorial on designing and developing a pairs trading strategy using VectorBT® PRO, covering four distinct implementation approaches each suited to a specific purpose. Topics include spread construction, signal generation, parameterization, chunking, and infinite parameter search. The tutorial integrates Optuna for strategy optimization and fine-tuning, and includes allocation analysis demonstrating how different parameter configurations affect portfolio outcomes.

By Oleg Polakow (VectorBT® PRO).

`Read the tutorial <https://vectorbt.pro/tutorials/pairs-trading/>`__.

Quickly Make a Pairs Trading Strategy with 500 Stocks
------------------------------------------------------

A practical guide to building a market-neutral pairs trading strategy using VectorBT Pro and the full S&P 500 universe. The article walks through collecting historical price data via VectorBT's YFData, computing cointegration p-values across all pair combinations, selecting the most statistically significant pairs, and running OLS regression to generate z-score-based entry and exit signals. The backtest uses VectorBT Pro's cash sharing and position sizing features.

By PyQuant News.

`Read the article <https://www.pyquantnews.com/the-pyquant-newsletter/quickly-make-pairs-trading-strategy-500-stocks>`__.

Optimal Market-Neutral Multivariate Pair Trading on the Cryptocurrency Platform
---------------------------------------------------------------------------------

This paper by Hongshen Yang and Avinash Malik introduces the Optimal Trading Technique (OTT), a novel arbitrage methodology for multivariate pair trading in cryptocurrency markets. The method creates a bucket of fiat currencies (USD, CAD, GBP, EUR) quoted against ETH on the Kraken exchange to exploit pricing anomalies arising from independent fiat-crypto trades. A bi-objective convex optimization model balances profitability against risk using a tunable volatility penalty parameter (lambda), while maintaining market neutrality by requiring equal ETH quantities bought and sold.

Our summary: the paper demonstrates that cross-currency arbitrage on a single crypto exchange can generate consistent profits without requiring external shorting or margin. The strategy operates within the initial principal, trading the price differences between ETH quoted in different fiat currencies. The 5-minute interval with moderate risk aversion (lambda=1) provides the best risk-adjusted performance, and the strategy remains profitable even during the 2022 bear market when ETH declined 61.84%. The high trading frequency (12,166 trades over the test period) with 54.4% win rate and average 5-hour holding period characterizes it as a high-frequency stat-arb approach.

Data: ETH prices in USD/CAD/GBP/EUR from Kraken, training January 2018 to January 2020, testing January 2021 to October 2022. Published in International Journal of Financial Studies. No code provided.

Key metrics: 15.49% annualized return at lambda=1 (5-min interval), Sharpe ratio 0.68 full-cycle, 2.66 in bull market, 0.16 in bear market. At lambda=0.5: 37.74% annualized return, Sharpe 1.11. Win rate 54.4%, win/loss ratio 1.19, average holding period 5.09 hours. Bear market return +4.99% versus buy-and-hold -61.84%. Portfolio volatility reduced from 0.961 (buy-and-hold) to 0.104 (OTT lambda=2).

`Read the paper <https://arxiv.org/abs/2405.15461>`__

Statistical Arbitrage within Crypto Markets using PCA
------------------------------------------------------

This paper by Jay Jung (2025) explores the application of Principal Component Analysis to statistical arbitrage trading in cryptocurrency markets. The methodology follows the classical Avellaneda-Lee framework: constructing eigenportfolios from PCA on crypto returns, estimating the Ornstein-Uhlenbeck process for residual mean reversion, and implementing a walk-forward validation framework. The study tests whether the well-documented PCA-based stat-arb approach that works in equities can transfer to the crypto domain.

Our summary: the paper's main finding is negative — the PCA-based eigenportfolio approach may not be robust in the cryptocurrency market. This is a practically important result because it suggests that crypto's factor structure, driven by a dominant market factor (BTC) with rapidly shifting altcoin correlations, does not produce stable mean-reverting residuals the way equity PCA residuals do. The author notes room for improvement, potentially through adaptive PCA windows or alternative factor extraction methods. The result aligns with the broader observation that equity stat-arb frameworks require significant modification for crypto markets.

Data: cryptocurrency market data. Published on SSRN (March 2025). No code availability noted.

Key metrics: the paper reports that performance metrics indicate the approach is not robust in crypto markets. Specific Sharpe ratios and returns are not highlighted as the results are largely negative.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5263475>`__

Deep Reinforcement Learning Applied to Statistical Arbitrage Investment Strategy on Cryptomarket
-------------------------------------------------------------------------------------------------

This paper by Vergara and Kristjanpoller integrates cointegration tests with Deep Reinforcement Learning into a statistical arbitrage framework for cryptocurrency markets. The approach constructs cointegrated long-short portfolios from crypto pairs and trains DRL agents (including Deep Q-Network, PPO, and A2C variants) to detect and act on temporary price divergences. The framework is evaluated on 30-minute interval data and benchmarked against classical cointegration-based and SVM baselines.

Our summary: the paper demonstrates that DRL agents, particularly the Deep Q-Network variant, consistently outperform classical cointegration-based and SVM-based stat-arb baselines in crypto markets, even after incorporating transaction costs. The framework addresses the extreme volatility challenge in crypto by learning adaptive trading policies rather than relying on fixed threshold rules. The positive out-of-sample results across multiple DRL algorithms suggest that the approach captures nonlinear spread dynamics that parametric models miss.

Data: cryptocurrency data at 30-minute intervals. Published in Applied Soft Computing, Vol. 153: 111255 (March 2024). No code availability noted.

Key metrics: DRL agents generate out-of-sample returns ranging from 79.52% to 112.82% without transaction costs, outperforming the Bitcoin benchmark return of 32.51%. Strategies maintain positive returns after transaction costs, with the DRL agent outperforming the standard arbitrage strategy.

`Read the paper <https://doi.org/10.1016/j.asoc.2024.111255>`__

Cluster-Based Pairs Trading: Combining Unsupervised Learning with Cointegration Filtering
------------------------------------------------------------------------------------------

This paper by Fuwen Gan and Ramy Mizrachi develops a market-neutral pairs trading strategy on a universe of 304 highly liquid ETFs, testing whether statistically robust performance can be achieved under realistic constraints on data availability and computation. Returns are standardized cross-sectionally and decomposed via PCA; the authors compare specifications that keep versus remove the first principal component (market mode). Density-based clustering (HDBSCAN and OPTICS) forms ETF neighborhoods, and within each cluster, candidate spreads are selected via Engle-Granger cointegration together with Hurst exponent filtering, Ornstein-Uhlenbeck half-life bounds, and excursion requirements. A rolling backtest with 12-month formation and 6-month trading windows trades all surviving spreads in an equally weighted, dollar-neutral portfolio using simple z-score entry/exit rules.

Our summary: the paper's central contribution is a fully reproducible, end-to-end empirical pipeline intentionally constrained to free daily ETF data and a single machine — asking how far a careful practitioner can go toward recovering the statistical arbitrage returns documented in the literature. The multi-stage filtering pipeline (ADF cointegration at 5%, Hurst exponent between 0.20-0.48, OU half-life between 3-25 trading days, plus excursion requirements) is particularly well-documented and provides a reusable template for pair selection. All four clustering specifications substantially outperform the S&P 500, Dow Jones, and Nasdaq benchmarks on both cumulative return and Sharpe ratio, with OPTICS on PC1-removed returns delivering the best risk-adjusted performance.

Data: daily adjusted prices from Yahoo Finance for 304 ETFs with common history from November 6, 2013 to November 10, 2025. Trading period: December 16, 2014 to November 24, 2025. Implemented with open-source Python libraries. Mentored at Rice University Department of Statistics by Dr. Michael Jackson, Dr. Elizabeth McGuffey, and Zechariah Zhu.

Key metrics (best specification — OPTICS with PC1 removed): 963.78% cumulative return, annualized Sharpe ratio 2.4935, maximum drawdown -8.74%, win rate 44.21%. HDBSCAN with PC1 removed achieved the highest cumulative return at 1020.34% with Sharpe 2.0755 but deeper drawdown of -28.39%. All specifications beat S&P 500 (302.03% cumulative, Sharpe 0.80), Dow Jones (170.93%, Sharpe 0.61), and Nasdaq (542.53%, Sharpe 0.88) over the same period.

`Read the paper <https://repository.rice.edu/server/api/core/bitstreams/e947dc21-5ed8-4be3-ab2d-40eb833770f1/content>`__

Pairs Trading
-------------

This paper by Robert J. Elliott, John van der Hoek and William P. Malcolm (2005, *Quantitative Finance* 5(3):271-276) is the seminal state-space formulation of pairs trading and the analytical foundation for every Kalman-filter pairs strategy that followed. The authors model the spread between two cointegrated assets as a mean-reverting Gaussian Markov chain — a discrete-time Ornstein-Uhlenbeck process — observed in Gaussian noise. The hidden mean-reverting state is estimated recursively with the Kalman filter, and the model parameters are calibrated by the EM algorithm. The trading rule is Bayesian-predictive: compare the observed spread against the filter's one-step-ahead forecast and trade the divergence (go long the spread when the observation falls below prediction, short when above), optionally beyond a threshold.

Our summary: this is the paper that recast pairs trading from an ad-hoc distance/z-score heuristic into a principled latent-state estimation problem. The contribution is conceptual and methodological rather than empirical — there is no large backtest — but it is short, rigorous and directly implementable, and it gives you the exact recursions (predict/update plus EM) underpinning the dynamic hedge-ratio and spread-filtering machinery that practitioners now treat as standard. For a systematic trader this is essential background reading: every later refinement (probability-triggered signals, nonlinear/non-Gaussian filtering, neural KalmanNet hybrids) is positioned explicitly against this model. It sits in the Bayesian-updating lineage alongside de Moura et al. (2016), Zhang (2020) and Milstein et al. (2024) below.

Data and code: an illustrative empirical example only; no public code. The mathematics (Sections 2-3) is the deliverable.

Key metrics: the paper does not report Sharpe/return/drawdown statistics — it establishes the model and estimation procedure rather than a performance study. Its value is the framework, not a track record.

`Read the paper <https://www.tandfonline.com/doi/abs/10.1080/14697680500149370>`__

A Pairs Trading Strategy Based on Linear State Space Models and the Kalman Filter
---------------------------------------------------------------------------------

This paper by Bernardo de Moura Pizzinga, Adrian Pizzinga and Jorge P. Zubelli (2016, *Quantitative Finance* 16(10):1559-1573) builds a pairs trading strategy entirely on linear state-space models of the spread, with a distinctive Bayesian signal mechanism. Instead of trading a z-score threshold or a time-varying hedge ratio, the Kalman filter is used to compute the *conditional probability* that the spread will revert to its long-term mean, and a position is opened only when that probability is large. The hedge ratio itself is a static cointegration coefficient; the filter models the spread dynamics.

Our summary: this is the most direct practitioner expression of "trade on the posterior, not the point estimate." Turning the entry signal into an explicit reversion probability is attractive because it gives a natural, interpretable knob for selectivity — you only act when the model is confident — and it composes cleanly with position sizing. The authors are commendably honest that the empirical evidence is limited (a small number of spreads), so treat the backtest as illustration rather than proof. Worth reading in full for the probability-triggered design, which transfers well to crypto pairs where false reversions are costly.

Data and code: backtests on U.S. (XOM-LUV) and Brazilian (VALE5-BRAP4) equity pairs; no public code. The authors caveat the evidence as limited.

Key metrics: even a single-spread portfolio is reported to outperform major equity benchmarks over the test windows; the paper emphasises the probability-based signal mechanism over a comprehensive performance study, and headline Sharpe/drawdown figures are not the focus.

`Read the paper <https://www.tandfonline.com/doi/abs/10.1080/14697688.2016.1164886>`__

A Kalman Filter Approach to Pairs Trading with Non-Gaussian Heteroskedastic and Nonlinear Mean-Reverting Spread
---------------------------------------------------------------------------------------------------------------

This paper by Yaoge Zhang (2020, arXiv:2005.09794) extends Kalman-filter pairs trading beyond the linear-Gaussian world that Elliott et al. (2005) and de Moura et al. (2016) assume. The latent mean-reverting spread is given two realistic features that break exact Kalman filtering: (1) non-Gaussian, heteroskedastic innovations (Student-t / GED shocks with ARCH/APARCH state-dependent volatility), and (2) nonlinear mean reversion (an Aït-Sahalia-type nonlinear drift). Because exact filtering is no longer available, the author develops a Quasi Monte Carlo Kalman filter that approximates the filtering distribution with a Gaussian mixture, then uses the filtered spread as the live trading indicator and a Monte Carlo procedure to select the optimal trading rule.

Our summary: this is the most directly relevant Kalman variant for crypto, where spreads are fat-tailed, volatility-clustered, and reverting at a state-dependent rate — exactly the conditions that violate the textbook linear-Gaussian assumptions. The QMC-Kalman approximation is the practical contribution: it keeps the recursive-filtering workflow while accommodating the heavy tails and nonlinearity. Caveat: this is an unrefereed preprint, so validate the implementation carefully before trusting it with capital.

Data and code: methodological study with simulated and equity-spread illustrations; no public code released.

Key metrics: the paper centres on the filtering methodology and trading-rule selection rather than a headline Sharpe/return table; its value is the non-Gaussian/nonlinear filter design relevant to high-volatility markets.

`Read the paper <https://arxiv.org/abs/2005.09794>`__

Neural Augmented Kalman Filtering with Bollinger Bands for Pairs Trading (KBPT)
-------------------------------------------------------------------------------

This paper by Amit Milstein, Haoran Deng, Guy Revach, Hai Morgenstern and Nir Shlezinger (arXiv:2210.15448; *IEEE Transactions on Signal Processing*, 2024) is the strongest recent hybrid of Bayesian filtering and deep learning for trading, and a clean illustration of the "model-based deep learning" school applied to stat-arb. It first frames the standard approach — a linear state-space model of the pair processed by a Kalman filter and traded with Bollinger Bands (KF-BB) — as the model-based baseline policy. It then proposes KBPT, which formulates an extended state-space model that assumes only *partial* cointegration and augments the Kalman filter with a KalmanNet neural network (two of the authors are the original KalmanNet inventors), learning the parts of the dynamics that are hard to specify while keeping the interpretable filtering/trading structure.

Our summary: this is the paper to read on how to graft a neural network onto a Kalman filter without throwing away the state-space interpretability that makes pairs trading tractable. The partial-cointegration extended model is the conceptual advance — real pairs drift apart in ways pure cointegration misses — and KalmanNet learns that residual structure from data. It beats both the classic model-based KF-BB policy and a purely data-driven deep-RL (DDQN) benchmark. The main limitation is evaluation scope: only three unique pairs (CHF-EUR, AUD-ZAR, EWC-EWA), so the superiority claim, while consistent, rests on a narrow test bed.

Data and code: evaluated on FX and ETF pairs (CHF-EUR, AUD-ZAR, EWC-EWA); KalmanNet architecture from the authors' prior open-source work.

Key metrics: KBPT is reported to systematically yield higher cumulative revenue than both the model-based KF-BB policy and the data-driven DDQN deep-RL benchmark across the tested pairs; the paper reports relative revenue improvements rather than annualised Sharpe/drawdown tables.

`Read the paper <https://arxiv.org/abs/2210.15448>`__

Crypto Pair Trading, Relative Value, and Basket Short Legs
-----------------------------------------------------------

Flip (@trevor_flipper) discusses the practical risk management of crypto pair trading and relative-value baskets, using HYPE/SOL and LIT/ETH as examples. The post argues that when the short leg is already in a major downtrend, a trader does not necessarily need to close the spread just because it has moved favorably; instead, Flip describes rebalancing when the position drifts two to three standard deviations from entry while keeping the trade on if the relative thesis has not materially changed.

The main implementation advice is to avoid using a single altcoin as the isolated short leg of a pair or basket trade. Because individual altcoins can experience abrupt idiosyncratic moves, the post recommends using a diversified basket of roughly 20 short legs when shorting alts, and points to Pear Protocol and Lighter's atomic orders as tools for putting on these trades. The broader thesis is that as crypto assets with durable revenues continue to compound, relative-value trading should become increasingly useful.

Mentioned by Flip in `this X discussion <https://x.com/trevor_flipper/status/2073754934210695484>`__. The post quotes KoolKrypto, who warns that pairing or shorting HYPE/LIT can be dangerous because single announcements can move either asset sharply, and argues that tokenholder-revenue leaders still represent a small share of total crypto market capitalization.

By Flip (@trevor_flipper).

`Read the post <https://x.com/trevor_flipper/status/2073754934210695484>`__
