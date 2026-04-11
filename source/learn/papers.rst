.. meta::
   :description: Latest research to algorithmic trading.

Papers about algorithmic trading
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section contains various research papers related to algorithmic trading.

.. note::

    AI-related papers have their own :doc:`AI section <./ai-and-machine-learning>`.

An Investor’s Guide to Crypto
-----------------------------

We provide practical insights for investors seeking exposure to the growing cryptocurrency space. Today, crypto is much more than just bitcoin, which historically dominated the space but accounted for just a 21% share of total crypto trading volume in 2021. We discuss a wide variety of tokens, highlighting both their functionality and their investment properties. We critically compare popular valuation methods. We contrast buy-and-hold investing with more active styles. We only deem return data from 2017 representative, but the use of intraday data boosts statistical power. Underlying crypto performance has been notoriously volatile, but volatility-targeting methods are effective at controlling risk, and trend-following strategies have performed well. Crypto assets display a low correlation with traditional risky assets in normal times, but the correlation also rises in the left tail of these risky assets. Finally, we detail important custody and regulatory considerations for institutional investors.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4124576>`__.

Low-volatility strategies for highly liquid cryptocurrencies
------------------------------------------------------------

Managing extreme price fluctuations in cryptocurrency markets are of central importance for investors in this market segment. Using a sample of highly liquid cryptocurrencies from January 2017 to June 2021, this paper proposes a dynamic investment strategy that selects cryptocurrencies based on their historical volatility and is complemented by a simple stop-loss rule. Our results reveal that investing in highly concentrated low volatility cryptocurrency portfolios with six to twelve months volatility look-back and holding period generate statistically significant excess returns. By including a simple stop-loss rule, the downside risk of cryptocurrency portfolios is reduced markedly, and the Sharpe ratios are improved significantly.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S1544612321004116>`__.

How to avoid overfitting trading strategies
-------------------------------------------

Running a lossy trading strategy would be a very costly mistake, so we spend a lot of effort on assessing the expected performance of our strategies. This task gets harder when we have limited data for this evaluation or when we experiment with the strategy for a longer time and risk manually overfitting the strategy on the same out-of-sample data.

`Read the Quantlane blog post <https://quantlane.com/blog/avoid-overfitting-trading-strategies/>`__.

An Efficient Algorithm for Optimal Routing Through Constant Function Market Makers
----------------------------------------------------------------------------------

Constant function market makers (CFMMs) such as Uniswap have facilitated trillions of dollars of digital asset trades and have billions of dollars of liquidity. One
natural question is how to optimally route trades across a network of CFMMs in order
to ensure the largest possible utility (as specified by a user). We present an efficient algorithm, based on a decomposition method, to solve the problem of optimally executing
an order across a network of decentralized exchanges

`Read the paper <https://angeris.github.io/papers/routing-algorithm.pdf>`__.

Automated Market Making and Arbitrage Profits in the Presence of Fees
---------------------------------------------------------------------

We consider the impact of trading fees on the profits of arbitrageurs trading against an
automated marker marker (AMM) or, equivalently, on the adverse selection incurred by liquidity
providers due to arbitrage. We extend the model of Milionis et al. [2022] for a general class
of two asset AMMs to both introduce fees and discrete Poisson block generation times. In our
setting, we are able to compute the expected instantaneous rate of arbitrage profit in closed
form. When the fees are low, in the fast block asymptotic regime, the impact of fees takes a
particularly simple form: fees simply scale down arbitrage profits by the fraction of time that
an arriving arbitrageur finds a profitable trade.

`Read the paper <https://moallemi.com/ciamac/papers/lvr-fee-model-2023.pdf>`__.


Momentum and trend following trading strategies for currencies and bitcoin
--------------------------------------------------------------------------

Momentum trading strategies are thoroughly described in the academic literature and used in many trading strategies by hedge funds, asset managers, and proprietary traders. Baz et al. (2015) describe a momentum strategy for different asset classes in great detail from a practitioner’s point of view. Using a geometric Brownian Motion for the dynamics of the returns of financial instruments, we extensively explain the motivation and background behind each step of a momentum trading strategy. Constants and parameters that are used for the practical implementation are derived in a theoretical setting and deviations from those used in Baz et al. (2015) are shown. The trading signal is computed as a mixture of exponential moving averages with different time horizons. We give a statistical justification for the optimal selection of time horizons. Furthermore, we test our approach on global currency markets, including G10 currencies, emerging market currencies, and cryptocurrencies. Both a time series portfolio and a cross-sectional portfolio are considered. We find that the strategy works best for traditional fiat currencies when considering a time series based momentum strategy. For cryptocurrencies, a cross-sectional approach is more suitable. The momentum strategy exhibits higher Sharpe ratios for more volatile currencies. Thus, emerging market currencies and cryptocurrencies have better performances than the G10 currencies. This is the first comprehensive study showing both the underlying statistical reasons of how such trading strategies are constructed in the industry as well as empirical results using a large universe of currencies, including cryptocurrencies.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2949379>`__.

Momentum trading in cryptocurrencies: short-term returns and diversification benefits
-------------------------------------------------------------------------------------

We test for the presence of momentum effects in cryptocurrency market and estimate dynamic conditional correlations (DCCs) of returns between momentum portfolios of cryptocurrencies and traditional assets. First, investment portfolios are constructed adherent to the classic J/K momentum strategy, using daily data from twelve cryptocurrencies for over a period of three years. We identify the existence of momentum effect, which is highly significant for short-term portfolios but disappears over the longer term. Second, we show that cross correlations of weekly returns between momentum portfolio of cryptocurrencies and traditional assets are unlike correlations of returns between traditional assets. Third, we find that momentum portfolios of cryptocurrencies not only offer diversification benefits but also can be a hedge and safe haven for traditional assets.


`Read the paper <https://sussex.figshare.com/articles/journal_contribution/Momentum_trading_in_cryptocurrencies_short-term_returns_and_diversification_benefits/23472263>`__.

On technical trading and social media indicators for cryptocurrency price classification through deep learning
--------------------------------------------------------------------------------------------------------------

Predicting the prices of cryptocurrencies is a notoriously challenging task due to high volatility and new mechanisms characterising the crypto markets. In this work, we focus on the two major cryptocurrencies for market capitalisation at the time of the study, Ethereum and Bitcoin, for the period 2017–2020. We present a comprehensive analysis of the predictability of price movements comparing four different deep learning algorithms (Multi Layers Perceptron (MLP), Convolutional Neural Network (CNN), Long Short Term Memory (LSTM) neural network and Attention Long Short Term Memory (ALSTM)). We use three classes of features, considering a combination of technical (e.g. opening and closing prices), trading (e.g. moving averages) and social (e.g. users’ sentiment) indicators as input to our classification algorithm. We compare a restricted model composed of technical indicators only, and an unrestricted model including technical, trading and social media indicators. We found an increase in accuracy for the daily classification task from a range of 51%–55% for the restricted model to 67%–84% for the unrestricted one. This study demonstrates that including both trading and social media indicators yields a significant improvement in the prediction and accuracy consistently across all algorithms.

`Read the paper <https://arxiv.org/pdf/2102.08189.pdf>`__.

Pure Momentum in Cryptocurrency Markets
---------------------------------------

Momentum is one of the most widespread, persistent, and puz- zling phenomenon in asset pricing. The prevailing explanation for momentum is that investors under-react to new information, and thus asset prices tend to drift over time. We use a unique fea- ture of cryptocurrency markets: the fact that they are open 24/7, and report returns over the last 24 hours. Thus, the one-day re- turn is subject to predictable fluctuations based on the removal of lagged information. We show that investors respond positively to changes in reported returns that are unrelated to any new release of information, or change in the asset fundamentals. We call this behavioral anomaly “Pure Momentum”.

`Read the paper <https://assets.ctfassets.net/c5bd0wqjc7v0/4RzmvaUG64ixNPXWuZGXbo/7115cc7bef963d2ff5abbacf879f5b1e/SSRN-id4138685.pdf>`__.

Dissecting Investment Strategies in the Cross Section and Time Series
---------------------------------------------------------------------

Jamil Baz, Nicolas Granger, Campbell R. Harvey, Nicolas Le Roux, and Sandy Rattray compare time-series and cross-sectional implementations of carry, momentum, and value across asset classes. Rather than treating the two portfolio constructions as interchangeable wrappers around the same anomaly, the paper studies when each representation works best and how the underlying market environment changes the relative edge.

Our summary: this is one of the clearest practitioner-academic bridges in the momentum literature. The important contribution is not merely that both time-series and cross-sectional versions can work, but that they load on different economic structures. Time-series approaches are better aligned with persistent directional trends, while cross-sectional portfolios often shine when dispersion across assets is more informative than the market's aggregate direction. For anyone designing trend systems, this paper is a reminder that "signal" and "portfolio construction" are inseparable design choices.

Key metrics: the paper does not reduce the result to a single headline Sharpe ratio because the focus is comparative across carry, momentum, and value in both time-series and cross-sectional form. Its main empirical claim is that market conditions materially affect which implementation dominates, and that the choice is strategy- and regime-dependent rather than universal.

`Read the paper <https://www.cmegroup.com/education/files/dissecting-investment-strategies-in-the-cross-section-and-time-series.pdf>`__.

Can Day Trading Really Be Profitable?
-------------------------------------

The validity of day trading as a long-term consistent and uncorrelated source of income for traders and investors is a matter of debate. In this paper, we investigate the profitability of the well-known Opening Range Breakout (ORB) strategy during the period of 2016 to 2023. This period encompasses two bear markets and a few events with abnormal volatility. Our results suggest that with the proper use of leverage or leveraged products (such as 3x leveraged ETFs), day trading can empirically produce significant returns when compared to a standard buy and hold strategy on benchmark indexes in the US public equity markets (Nasdaq or NYSE). Without any loss of generality, we studied the results of an ORB strategy implemented in QQQ. By comparing the results of the active day trading approach with a passive exposure in QQQ, we prove that it is possible for the ORB portfolio to significantly outperform the passive investment. In fact, the day trading portfolio produced an annualized alpha of 33% (net of commissions). Nevertheless, due to leverage constraints enforced by brokers, an active trader would have capped the full upside potential given by the ORB strategy. To overcome this issue, we introduced the use of TQQQ, a leveraged ETF of QQQ, which allows day traders to fully exploit the benefit of the active strategy while adhering to leverage constraints. The resulting portfolio would have earned an outstanding return of 1,484% during the same period of 2016 to 2023, while an investment in the QQQ ETF would have earned only 169%.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4416622>`__.

Multi-source aggregated classification for stock price movement prediction
--------------------------------------------------------------------------

Predicting stock price movements is a challenging task. Previous studies mostly used numerical features and
news sentiments of target stocks to predict stock price movements. However, their semantics-based sentiment
analysis is sub-optimal to represent real market sentiments. Moreover, only considering the information of
target companies is insufficient because the stock prices of target companies can be affected by their related
companies. Thus, we propose a novel Multi-source Aggregated Classification (MAC) method for stock price
movement prediction. MAC incorporates the numerical features and market-driven news sentiments of target
stocks, as well as the news sentiments of their related stocks. To better represent real market sentiments from
the news, we pre-train an embedding feature generator by fitting the news to real stock price movements.
Embeddings given by the pre-trained sentiment classifier can represent the sentiment information in vector
space. Moreover, MAC introduces a graph convolutional network to capture the news effects of related
companies on the target stock. Finally, MAC can predict stock price movements for the next trading day based
on the aforementioned features. Extensive experiments prove that MAC outperforms state-of-the-art baselines
in stock price movement prediction, Sharpe Ratio, and backtesting trading incomes

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1566253522002019>`__.

Cryptocurrencies: Stylized Facts and Risk Based Momentum Investing
------------------------------------------------------------------

The motivation of this research is in two folds, to understand the distributional characteristics of cryptocurrencies by means of stylized facts, and also to assess the feasibility of risk based and trend following approaches to investing in this asset class. Cryptocurrencies are more of a recent phenomenon, unlike the traditional asset classes. This poses an explicit constraint on the availability of longer history and also reliability of investment performance. Acknowledging such constraint, I focus my analysis based on the few years of data that is available.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4666898>`__.

151 Trading Strategies
----------------------

We provide detailed descriptions, including over 550 mathematical formulas, for over 150 trading strategies across a host of asset classes (and trading styles). This includes stocks, options, fixed income, futures, ETFs, indexes, commodities, foreign exchange, convertibles, structured assets, volatility (as an asset class), real estate, distressed assets, cash, cryptocurrencies, miscellany (such as weather, energy, inflation), global macro, infrastructure, and tax arbitrage. Some strategies are based on machine learning algorithms (such as artificial neural networks, Bayes, k-nearest neighbors). We also give: source code for illustrating out-of-sample backtesting with explanatory notes; around 2,000 bibliographic references; and over 900 glossary, acronym and math definitions. The presentation is intended to be descriptive and pedagogical. This is the complete version of the book.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3247865>`__.

Cryptocurrency trading: A systematic mapping study
--------------------------------------------------

- This systematic mapping examines the current state of cryptocurrency trading research.
- This study observes a recent increase in high-quality research and international collaboration in cryptocurrency trading.
- This study notes a shift towards practical applications in cryptocurrency trading research, particularly in AI-driven prediction and automated trading.
- This study highlights the diverse data types and inputs employed in cryptocurrency trading systems, with emphasis on the prevalent use of neural networks and deep learning algorithms.

`Read the paper <https://research.usq.edu.au/download/08395df9ddb5c5782d17d677bca8793eb08fa40019201ea5337b109d635a76ac/3861227/1-s2.0-S2667096824000296-main.pdf>`__.

Clustering in Cardinality-Constrained Portfolio Optimization
------------------------------------------------------------

In portfolio optimization, efficiently managing large pools of assets while adhering to car-
dinality constraints presents a significant challenge. We propose a novel portfolio optimization
framework that combines cardinality constraints with the classical Markowitz mean-variance
model, using clustering to reduce dimensionality and achieve an optimal balance of risk and
return. We use spectral clustering to group the residual returns of stocks. This method reveals
natural groupings of assets based on their returns and correlations, enhancing our understand-
ing and categorization of assets, which is crucial for efficiently reducing the optimization space
and dimensionality

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4914246>`__.

Regularised jump models for regime identification and feature selection
-----------------------------------------------------------------------

 A regime modelling framework can be employed to address the complexities of financial markets. Under the framework, market periods are grouped into distinct regimes, each distinguished by similar statistical characteristics. Regimes in financial markets are not directly observable but are often manifested in market and macroeconomic variables. The objective of regime modelling is to accurately identify the active regime from these variables at a point in time, a process known as regime identification.

One way to enhance the accuracy of regime identification is to select features that are most responsible for statistical differences between regimes, a process known as feature selection. Feature selection is also capable of both enhancing the interpretability of outputs from regime models, and substantially reducing the computational time required to calibrate regime models.

Models based on the Jump Model framework have recently been developed to address the joint problem of regime identification and feature selection. In the following work, we propose a new set of models called Regularised Jump Models that are founded upon the Jump Model framework.

These models perform feature selection that is more interpretable than that from the Sparse Jump Model, a model proposed in the literature pertaining to the Jump Model framework. Through a simulation experiment, we find evidence that these new models outperform the Standard and Sparse Jump Models, both in terms of regime identification and feature selection.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4950423>`__.

Dynamic Asset Allocation with Asset-Specific Regime Forecasts
-------------------------------------------------------------

This article introduces a novel hybrid regime identification-forecasting framework designed to enhance multi-asset portfolio construction by integrating asset-specific regime forecasts. Unlike traditional approaches that focus on broad economic regimes affecting the entire asset universe, our framework leverages both unsupervised and supervised learning to generate tailored regime forecasts for individual assets. Initially, we use the statistical jump model, a robust unsupervised regime identification model, to derive regime labels for historical periods, classifying them into bullish or bearish states based on features extracted from an asset return series. Following this, a supervised gradient-boosted decision tree classifier is trained to predict these regimes using a combination of asset-specific return features and cross-asset macro-features. We apply this framework individually to each asset in our universe. Subsequently, return and risk forecasts which incorporate these regime predictions are input into Markowitz mean-variance optimization to determine optimal asset allocation weights. We demonstrate the efficacy of our approach through an empirical study on a multi-asset portfolio comprising twelve risky assets, including global equity, bond, real estate, and commodity indexes spanning from 1991 to 2023. The results consistently show outperformance across various portfolio models, including minimum-variance, mean-variance, and naive-diversified portfolios, highlighting the advantages of integrating asset-specific regime forecasts into dynamic asset allocation.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4864358>`__

Optimal Factor Timing in a High-Dimensional Setting
---------------------------------------------------

We develop a framework for equity factor timing in a high-dimensional setting when the number of factors and factor return predictors can be large. To ensure good out-of-sample performance, the approach is disciplined by shrinkage that effectively expresses a degree of skepticism about outsized gains from timing. In our empirical application, the predictors include macroeconomic variables and factor-specific characteristics spreads between the long and short legs of the factors. We find sizable gains from timing equity factors, including for factors constructed only from large-cap stocks.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4864358>`__

Optimal Allocation to Cryptocurrencies in Diversified Portfolios
----------------------------------------------------------------

We apply four quantitative methods for optimal allocation to Bitcoin and Ether cryptocurrencies within alternative and balanced portfolios including metrics for portfolio diversification, expected risk-returns, and skewness of returns distribution. Using roll-forward historical simulations, we show that all four allocation methods produce a persistent positive allocation to Bitcoin and Ether in alternative and balanced portfolios with a median allocation of about 2.7%. We conclude that core cryptocurrencies may provide positive contribution to risk-adjusted performances of broad investment portfolios. We emphasize the diversification benefits of cryptocurrencies as an asset class within broad risk-managed portfolios with systematic re-balancing.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4217841>`__

Catching Crypto Trends; A Tactical Approach for Bitcoin and Altcoins
--------------------------------------------------------------------

In recent years, cryptocurrencies have attracted significant attention from both retail traders and large institutional investors. As their involvement in digital assets grows, so does their interest in active and risk-aware investment frameworks. This paper applies a well-established trend-following methodology, successfully deployed for decades in traditional asset classes, to Bitcoin, and then extends the analysis to a comprehensive, survivorship bias-free dataset covering all cryptocurrencies traded since 2015, to evaluate whether its robustness persists in the emerging digital asset space. We propose an ensemble approach that aggregates multiple Donchian channel-based trend models, each calibrated with different lookback periods, into a single signal, as well as a volatility-based position sizing method. This model, applied to a rotational portfolio of the top 20 most liquid coins, achieved notable net-of-fees returns, with a Sharpe ratio above 1.5 and an annualized alpha of 10.8% versus Bitcoin. While assessing the impact of transaction costs, we propose a straightforward yet effective portfolio technique to mitigate these expenses. Finally, we investigate correlations between crypto-focused trend-following strategies and those applied to traditional asset classes, concluding with a discussion on how investors can execute the proposed strategy through both on-chain and off-chain implementations.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5209907>`__

Does Trend-Following Still Work on Stocks?
------------------------------------------

This paper revisits and extends the results presented in 2005 by Wilcox and Crittenden in a white paper titled Does Trend Following Work on Stocks? Leveraging a survivorship-bias-free dataset of all liquid U.S. stocks from 1950 through November 2024, we examine more than 66,000 simulated long-only trend trades. Our results confirm a highly skewed profit distribution, with less than 7% of trades driving the cumulative profitability. These core statistics hold up out-of-sample (2005–2024), maintaining strong returns despite a modest decline in average trade profitability following the original publication. In the second part of this study, we backtest a long-only trend-following portfolio specifically aimed at capturing outlier returns in individual stocks. While the theoretical portfolio exhibits exceptional gross-of-fees performance from 1991 until 2024 (e.g., a CAGR of 15.19% and an annualized alpha of 6.18%), its extensive daily turnover poses a significant challenge once transaction costs are considered. Examining net-of-fee performance across various asset under management (AUM) levels, we find that the base trend-following approach is not viable for smaller portfolios (AUM less than $1M) due to the dampening effect of trading costs. However, by incorporating a Turnover Control algorithm, we substantially mitigate these transaction cost burdens, rendering the strategy attractive across all tested portfolio sizes even after fees.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5084316>`__


Catching Crypto Trends; A Tactical Approach for Bitcoin and Altcoins
--------------------------------------------------------------------

In recent years, cryptocurrencies have attracted significant attention from both retail traders and large institutional investors. As their involvement in digital assets grows, so does their interest in active and risk-aware investment frameworks. This paper applies a well-established trend-following methodology, successfully deployed for decades in traditional asset classes, to Bitcoin, and then extends the analysis to a comprehensive, survivorship bias-free dataset covering all cryptocurrencies traded since 2015, to evaluate whether its robustness persists in the emerging digital asset space. We propose an ensemble approach that aggregates multiple Donchian channel-based trend models, each calibrated with different lookback periods, into a single signal, as well as a volatility-based position sizing method. This model, applied to a rotational portfolio of the top 20 most liquid coins, achieved notable net-of-fees returns, with a Sharpe ratio above 1.5 and an annualized alpha of 10.8% versus Bitcoin. While assessing the impact of transaction costs, we propose a straightforward yet effective portfolio technique to mitigate these expenses. Finally, we investigate correlations between crypto-focused trend-following strategies and those applied to traditional asset classes, concluding with a discussion on how investors can execute the proposed strategy through both on-chain and off-chain implementations.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5209907>`__

Following a Trend with an Exponential Moving Average: Analytical Results for a Gaussian Model
---------------------------------------------------------------------------------------------

We investigate how price variations of a stock are transformed into profits and losses (P&Ls) of a trend following strategy. In the frame of a Gaussian model, we derive the probability distribution of P&Ls and analyze its moments (mean, variance, skewness and kurtosis) and asymptotic behavior (quantiles). We show that the asymmetry of the distribution (with often small losses and less frequent but significant profits) is reminiscent to trend following strategies and less dependent on peculiarities of price variations. At short times, trend following strategies admit larger losses than one may anticipate from standard Gaussian estimates, while smaller losses are ensured at longer times. Simple explicit formulas characterizing the distribution of P&Ls illustrate the basic mechanisms of momentum trading, while general matrix representations can be applied to arbitrary Gaussian models. We also compute explicitly annualized risk adjusted P&L and strategy turnover to account for transaction costs. We deduce the trend following optimal timescale and its dependence on both auto-correlation level and transaction costs. Theoretical results are illustrated on the Dow Jones index.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5209907>`__

On covariance estimation of non-synchronously observed diffusion processes
--------------------------------------------------------------------------

We consider the problem of estimating the covariance of two diffusion processes when they are
observed only at discrete times in a non-synchronous manner. The modern, popular approach in the
literature, the realized covariance estimator, which is based on (regularly spaced) synchronous data, is
problematic because the choice of regular interval size and data interpolation scheme may lead to
unreliable estimation. We propose a new estimator which is free of any ‘synchronization’ processing
of the original data, hence free of bias or other problems caused by it.

`Read the paper <https://projecteuclid.org/journals/bernoulli/volume-11/issue-2/On-covariance-estimation-of-non-synchronously-observed-diffusion-processes/10.3150/bj/1116340299.pdf>`__

Optimizing the Persistence of Price Momentum: Which Trends Are Your Friends?
----------------------------------------------------------------------------

The traditional wisdom that price momentum which ranks stocks’ raw trailing returns is crash-prone fails to differentiate the various drivers of stocks’ past performances. As such, we compare the persistence of different sources of stocks’ price momentum discerned from applying factor-based performance attribution to their trailing 12-month returns. Our empirical analysis shows that beta- and country-driven price trends were not robust while style and industry momentum persisted both over the intermediate and, more strongly, short-term. Stock-specific momentum persisted over the intermediate term but strongly reverted over the short term; it was subsumed as a stand-alone strategy by both industry and style momentum and should be downweighed when optimizing a momentum signal for persistence. Our results suggest that style momentum is mostly a proxy for static factor tilts while industry and stock-specific momentum appear a separate anomaly that is strongest conditional on low-volatility market regimes. Their premium may reflect investor underreaction to economic shifts to which stocks’ exposures are imperfectly captured by binary industry classifications. Our results corroborate a strand of the extant literature through the novel lens of exactly decomposing the cross-section of stocks’ price momentum; contradicting findings are explained by methodological differences.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5716502>`__

Clustering Market Regimes Using the Wasserstein Distance
--------------------------------------------------------

The problem of rapid and automated detection of distinct market regimes is a topic of great interest to financial mathematicians and practitioners alike. In this paper, we outline an unsupervised learning algorithm for clustering financial time-series into a suitable number of temporal segments (market regimes).
As a special case of the above, we develop a robust algorithm that automates the process of classifying market regimes. The method is robust in the sense that it does not depend on modelling assumptions of the underlying time series as our experiments with real datasets show. This method -- dubbed the Wasserstein $k$-means algorithm -- frames such a problem as one on the space of probability measures with finite $p^\text{th}$ moment, in terms of the $p$-Wasserstein distance between (empirical) distributions. We compare our WK-means approach with a more traditional
clustering algorithms by studying the so-called maximum mean discrepancy scores between, and within clusters. In both cases it is shown that the WK-means algorithm vastly outperforms all considered competitor approaches. We demonstrate the performance of all approaches both in a controlled environment on synthetic data, and on real data.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3947905>`__

Nonlinear Time Series Momentum
------------------------------

We document a persistent nonlinear relationship between price trends and risk-adjusted returns across markets and asset classes that is consistent with asset pricing theory. Nonlinearities in time series momentum are consistent with past returns reflecting information about conditional expected returns, in line with investors using conditioning information to form efficient portfolios. Machine learning techniques are useful in uncovering these relationships and yield economically and statistically significant out-of-sample improvements in time series momentum strategies.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5933974>`__

Building Diversified Portfolios that Outperform Out-of-Sample
--------------------------------------------------------------

This paper introduces the Hierarchical Risk Parity (HRP) approach. HRP portfolios address three major concerns of quadratic optimizers in general and Markowitz’s CLA in particular: Instability, concentration and underperformance.

HRP applies modern mathematics (graph theory and machine learning techniques) to build a diversified portfolio based on the information contained in the covariance matrix. However, unlike quadratic optimizers, HRP does not require the invertibility of the covariance matrix. In fact, HRP can compute a portfolio on an ill-degenerated or even a singular covariance matrix, an impossible feat for quadratic optimizers. Monte Carlo experiments show that HRP delivers lower out-of-sample variance than CLA, even though minimum-variance is CLA’s optimization objective. HRP also produces less risky portfolios out-of-sample compared to traditional risk parity methods.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2708678>`__

The CoinAlg Bind: Profitability-Fairness Tradeoffs in Collective Investment Algorithms
--------------------------------------------------------------------------------------

Collective In vestment Algorithms (CoinAlgs) are increas-
ingly popular systems that deploy shared trading strate-
gies for investor communities. Their goal is to democratize
sophisticated—often AI-based—investing tools.
We identify and demonstrate a fundamental profitability-
fairness tradeoff in CoinAlgs that we call the CoinAlg Bind:
CoinAlgs cannot ensure economic fairness without losing
profit to arbitrage.
We present a formal model of CoinAlgs, with definitions of
privacy (incomplete algorithm disclosure) and economic fair-
ness (value extraction by an adversarial insider). We prove two
complementary results that together demonstrate the CoinAlg
Bind. First, privacy in a CoinAlg is a precondition for insider
attacks on economic fairness. Conversely, in a game-theoretic
model, lack of privacy, i.e., transparency, enables arbitrageurs
to erode the profitability of a CoinAlg.
Using data from Uniswap, a decentralized exchange, we
empirically study both sides of the CoinAlg Bind. We quantify
the impact of arbitrage against transparent CoinAlgs. We show
the risks posed by a private CoinAlg: Even low-bandwidth
covert-channel information leakage enables unfair value ex-
traction.

`Read the paper <https://arxiv.org/pdf/2601.00523>`__

E
-----------------------------------------------------------------

This paper introduces a model-free Reinforcement Learning (RL) framework for portfolio allocation across Foreign Exchange (FX) assets, with a particular focus on carry trade strategies. The study examines whether RL-based approaches can yield distinct outcomes compared to traditional portfolio allocation techniques, such as Mean-Variance Optimization (MVO). The objective is to evaluate the performance of an RL agent in constructing a portfolio driven by FX carry signals and benchmark it against MVO. This work contributes to the literature by demonstrating the adaptability of RL to dynamic FX environments and its potential to outperform static optimization methods under varying market conditions.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6004794>`__

Anomaly Premiums with Dynamic Exits
-----------------------------------

Anomaly premiums are traditionally based on long-short portfolios held passively for a fixed horizon. This paper estimates premiums when exits are instead optimized using machine learning with a computationally light architecture. The authors use randomized kernels to generate high-dimensional representations of time-series inputs. A classifier ingests the inputs and predicts optimal exits. In a conservative universe with only large-cap value-weighted portfolios, dynamic exits generate premiums of about 100 basis points per month for momentum, profitability, and value. These premiums are not replicated with static or random exits, without random re-representations, in non-anomaly portfolios, and are robust to reasonable transaction cost hurdles.

By Nitin Kumar (Nanyang Technological University), Nagpurnanand Prabhala (Johns Hopkins Carey Business School), and Ravi Ranjan (UNC Kenan-Flagler Business School).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2018712332625445079>`__: "Most anomalies don't decay smoothly; they switch off and rotate. Dynamic exits materially improve Sharpe ratios across many classic anomalies, and drawdowns are meaningfully reduced by avoiding low-signal periods. The gains come more from risk control and timing exits than from boosting raw returns."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6076808>`__

Risk Beyond Volatility: A Conditional Framework for Downside Harm and Capital Loss
-----------------------------------------------------------------------------------

Volatility remains the dominant operational proxy for risk in portfolio theory, asset pricing, and performance evaluation. Despite its widespread adoption, volatility treats upside and downside deviations symmetrically and abstracts away from the temporal and path-dependent nature of capital loss. This paper argues that these properties reflect not an economic definition of risk, but a modeling convenience rooted in early mean-variance theory.

The authors propose a conditional framework in which risk is defined as cumulative downside exposure relative to an explicit evaluation horizon and constraint set. This formulation captures both the magnitude and persistence of losses while preserving the asymmetry inherent in capital impairment. The paper shows that volatility-based metrics can misrank risk across strategies and assets exhibiting similar dispersion but substantially different drawdown dynamics.

By Ryan Nelson (The University of Tampa).

Mentioned by Ralph Sueppel in `this discussion <https://x.com/macro_synergy/status/2018955197045694601>`__: "Paper proposes an alternative to volatility where risk is defined as cumulative downside exposure relative to an explicit evaluation horizon... It captures both the magnitude and persistence of losses while preserving the asymmetry inherent in capital impairment."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5954796>`__

Optimizing Liquidity Provision on Uniswap v3: A Comparative Analysis of Adaptive Strategies
--------------------------------------------------------------------------------------------

A comprehensive six-month backtesting study (April-September 2024) comparing multiple liquidity provision strategies on ETH/USDC pools in Uniswap v3. Tested approaches include constant intervals, moving averages, and dual-range allocations. The study examines capital efficiency, range width effects, and market volatility impacts, with parameter optimization across different strategy configurations. Results highlight the challenges of active liquidity management in volatile market conditions. By Zelos Research.

`Read the post <https://medium.com/zelos-research/optimizing-liquidity-provision-on-uniswap-v3-a-comparative-analysis-of-adaptive-strategies-for-c049dc30fb7b>`__

How Demeter Improves the Calculation of Liquidity Fees in Uniswap V3
---------------------------------------------------------------------

This post addresses the problem of fee calculation accuracy when prices cross liquidity position boundaries within a single minute. The enhanced algorithm assumes uniform price movement within one-minute intervals and allocates fees proportionally based on how many ticks the price has passed within the market-making range. This boundary crossing detection and linear price interpolation significantly improves backtesting precision for Uniswap V3 liquidity positions. By Zelos Research.

`Read the post <https://medium.com/zelos-research/how-demeter-improves-the-calculation-of-liquidity-fees-in-uniswap-v3-81272aa1bf35>`__

Pricing Uniswap V3 with Stochastic Process, Part 4
---------------------------------------------------

A technical exposition of mathematical tools needed for pricing Uniswap V3 positions, including optimal stopping theorems, Laplace transforms, and Chapman-Kolmogorov equations. The authors establish foundations for deriving stopping time formulas that determine when liquidity positions reach price boundaries, covering martingale stopping theorem, two-boundary stopping problems, and exponential martingales. By Zelos Research.

`Read the post <https://medium.com/zelos-research/pricing-uniswap-v3-with-stochastic-process-part4-98c8465696b4>`__

Delta Neutral Strategy and Optimization of Uniswap V3
-----------------------------------------------------

Explores hedging strategies for Uniswap V3 liquidity provision using delta neutrality via AAVE borrowing. The approach divides the initial capital into two parts and uses borrowed assets to offset directional exposure while capturing fee income. The study performs backtesting to identify optimal market-making ranges through volatility-linked parameters, covering Greeks analysis, leveraged liquidity, capital allocation formulas, and volatility-adjusted range selection using the Demeter backtesting framework. By Zelos Research.

`Read the post <https://medium.com/zelos-research/delta-neutral-strategy-and-optimization-of-uniswap-v3-a399d07b28d3>`__

Pricing Uniswap V3 with Stochastic Process, Part 5
---------------------------------------------------

Presents pricing models for Uniswap V3 positions using stochastic calculus. The work assumes geometric Brownian motion price dynamics and derives both European-style (exit only at boundaries) and American-style (exit anytime) valuation formulas. Fee collection models transition from boundary-only to continuous collection scenarios, covering optimal stopping strategies and boundary crossing problems. By Zelos Research.

`Read the post <https://medium.com/zelos-research/pricing-uniswap-v3-with-stochastic-process-part5-dda219a45b0f>`__

An LVR Approach Proof of Guillaume Lambert's Uniswap V3 Implied Volatility
---------------------------------------------------------------------------

Demonstrates that LVR-based and Guillaume Lambert's approaches produce identical implied volatility formulas for Uniswap V3 positions. The authors prove mathematical consistency between the two methodologies, showing both rely on similar assumptions about risk-free rates and instantaneous liquidity conditions. The proof covers LVR instantaneous loss calculations, Lambert's IV formula, normalization approaches, and fee acquisition rates. By Zelos Research.

`Read the post <https://medium.com/zelos-research/an-lvr-approach-proof-of-guillaume-lambert-s-uniswap-v3-implied-volatility-6671883e46e2>`__

Implied Volatility from Uniswap V3 Liquidity Positions
-------------------------------------------------------

Presents methodology for calculating implied volatility in Uniswap V3 by deriving volatility perspectives from liquidity provider behaviors. The approach uses bisection methods to align theoretical option pricing with real market conditions, enabling a distribution of volatility views weighted by their liquidity's dollar value. Covers option pricing formulas, position-level IV analysis, time series IV tracking, and weighted averaging methodology. Part 6 in the Uniswap V3 pricing series. By Zelos Research.

`Read the post <https://medium.com/zelos-research/part6-implied-volatility-d8bfee4b7db2>`__

Uniswap v4: Insights on Performance
------------------------------------

A comparative performance analysis of Uniswap v4 versus v3, examining trading execution and liquidity provision metrics. The research shows that v4 trading participation has been gradually increasing and overtaking v3, and for small-to-mid size trades, v4 achieves lower levels of slippage. However, v4 maintains lower overall liquidity than v3, though fee returns are more stable. Covers hook features, trading participation metrics, slippage analysis, and fee generation stability. By Zelos Research.

`Read the post <https://medium.com/zelos-research/uniswap-v4-insights-on-performance-a012671e2020>`__

Stochastic Processes and the Pricing of Uniswap V2
---------------------------------------------------

Analyzes Uniswap V2 liquidity provider positions through stochastic processes, examining impermanent loss (IL) and loss versus rebalancing (LVR). The authors apply martingale stopping methods to derive pricing formulas for V2 positions, treating them as exotic options. Key findings include that the value of the V2 position is independent of volatility in their model, though they acknowledge this oversimplifies by ignoring position reconstruction costs during price swings. Covers geometric Brownian motion modeling, American perpetual option pricing, and Jensen's inequality applications. By Zelos Research.

`Read the post <https://medium.com/zelos-research/stochastic-processes-and-the-pricing-of-uniswap-v2-f8daf81b0f7b>`__

Are Simple Technical Trading Rules Profitable in Bitcoin Markets?
-----------------------------------------------------------------

This paper examines the profitability of simple technical trading rules in bitcoin markets comprehensively, taking into account realistic investor behavior. The study investigates whether classic technical analysis strategies such as moving average rules can generate excess returns in cryptocurrency markets, contributing to the ongoing debate about market efficiency in digital asset markets.

By Michael Frömmel and Niek Deprez, published in the International Review of Economics & Finance (2024).

Mentioned by Jungle Rock in `this discussion <https://x.com/JungleRockRes/status/2019145963844100349>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4401552>`__

Quality Minus Junk
------------------

This paper provides a tractable valuation model that shows how stock prices should increase in their quality characteristics: profitability, growth, and safety. A "quality" security is defined as one that is safe, profitable, growing, and well managed. Empirically, the authors find that high-quality stocks do have higher prices on average but not by a large margin, and high-quality stocks have high risk-adjusted returns. A quality-minus-junk (QMJ) factor that goes long high-quality stocks and shorts low-quality stocks earns significant risk-adjusted returns in the United States and across 24 countries.

By Clifford S. Asness, Andrea Frazzini, and Lasse Heje Pedersen.

Mentioned by Kurtis The Quant in `this discussion <https://x.com/Quant_Kurtis/status/2014420038951088341>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2312432>`__

Episodic Factor Pricing
-----------------------

This paper challenges conventional factor models by showing that factor pricing power is time varying and frequently switches between active and inactive states. The authors propose a real-time method to identify factor pricing states, showing that conditioning on these states materially improves out-of-sample multifactor portfolio performance, even after transaction costs. A conditional stochastic discount factor with state-dependent risk prices provides a better description of the investment opportunity set. Across a broad set of factors, pricing power is concentrated in active states and largely absent otherwise, implying that factor premia and risk prices are inherently episodic rather than persistent.

By Sophia Zhengzi Li, Peixuan Yuan, and Guofu Zhou.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2014362167232040969>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4661444>`__

All Days Are Not Created Equal: Understanding Momentum by Learning to Weight Past Returns
-----------------------------------------------------------------------------------------

By flexibly weighting the information contained in past realized returns, the authors construct a momentum strategy that outperforms and subsumes the performance of traditional stock momentum. The strategy performs well in crises and continues to work in recent decades, circumventing the issue of momentum crashes. The authors show that the way past returns are weighted is consistent with the strategy exploiting an underreaction to information contained in realized returns. Earnings announcements, market-wide jumps, and large individual returns realized during the formation period are found to be most informative about future stock returns.

By Heiner Beckmeyer and Timo Wiedemann, published in the Journal of Banking and Finance (2025).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2009217668566966658>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5702162>`__

Beat the Market: An Effective Intraday Momentum Strategy for S&P500 ETF (SPY)
------------------------------------------------------------------------------

This paper investigates the profitability of a simple yet effective intraday momentum strategy applied to SPY, one of the most liquid ETFs tracking the S&P 500. Unlike academic literature that typically limits trading to the last 30 minutes of the trading session, this model initiates trend-following positions as soon as there is an indication of abnormal demand/supply imbalance in the intraday price action. The strategy introduces dynamic trailing stops to mitigate downside risks while allowing for unlimited upside potential. From 2007 to early 2024, the resulting intraday momentum portfolio achieved a total return of 1,985% (net of costs), an annualized return of 19.6%, and a Sharpe Ratio of 1.33.

By Carlo Zarattini, Andrew Aziz, and Andrea Barbon.

Mentioned by Pasta Capital in `this discussion <https://x.com/Pasta_Capital/status/2008856283387531360>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4824172>`__

A Unified Framework for Anomalies based on Daily Returns
---------------------------------------------------------

Numerous cross-sectional equity anomalies draw on the same underlying information: the sequence of daily returns over the previous month. Using a data-driven approach, the authors estimate the empirical mapping from the distribution of last month's daily returns to future performance without imposing functional forms. The resulting Daily Return Information Factor (DRIF) earns economically large premia, holds across subsamples and research designs, and remains significant after controlling for the modern factor zoo. DRIF subsumes most short-horizon and lottery-style anomalies and emerges as a key factor in asset pricing tests.

By Nusret Cakici, Christian Fieberg, Gabor Neszveda, Robert J. Bianchi, and Adam Zaremba.

Mentioned by Quantitativo in `this discussion <https://substack.com/@quantitativo/note/c-196576483>`__: "The factor zoo isn't crowded. It's redundant. Daily returns already contain the signal — we just kept slicing them the wrong way."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6005614>`__

ASRI: An Aggregated Systemic Risk Index for Cryptocurrency Markets
-------------------------------------------------------------------

This paper introduces the Aggregated Systemic Risk Index (ASRI), a composite measure comprising four weighted sub-indices: Stablecoin Concentration Risk (30%), DeFi Liquidity Risk (25%), Contagion Risk (25%), and Regulatory Opacity Risk (20%).

The framework incorporates data from DeFi Llama, Federal Reserve FRED, and on-chain analytics, and was validated against historical crises including Terra/Luna (May 2022), Celsius/3AC (June 2022), FTX (November 2022), and SVB (March 2023). Event study analysis detected statistically significant signals for all four crises with an average lead time of 18 days. A three-regime Hidden Markov Model identifies distinct Low Risk, Moderate, and Elevated states with regime persistence exceeding 94%, and out-of-sample testing on 2024-2025 data confirmed zero false positives.

The ASRI framework addresses a critical gap in risk monitoring by capturing DeFi-specific vulnerabilities—composability risk, flash loan exposure, and tokenized real-world asset linkages—that traditional systemic risk measures cannot accommodate.

By Murad Farzulla and Andrew Maksakov.

Mentioned by Saeed in `this discussion <https://x.com/saeedamenfx/status/2020120481056067612>`__.

`Read the paper <https://arxiv.org/abs/2602.03874>`__

R&D Alpha: Investment Intensity and Long-Term Stock Returns
-----------------------------------------------------------

This paper tests whether high research and development (R&D) intensity predicts higher subsequent equity returns in a large-cap U.S. universe using methodology designed for portfolio implementability. Each year, S&P 500 stocks are sorted into quintiles by R&D intensity (R&D expense divided by revenue) and subsequent returns are evaluated with timing designed to mitigate look-ahead bias.

The high-minus-low R&D factor averages 3.73% per year, with monthly factor spanning tests confirming a statistically distinct premium (FF5 alpha = 4.37%, p < 0.01). The investable RD20 strategy, a simple long-only portfolio holding the top 20 stocks by R&D intensity equal-weighted, delivers 7.52% annual excess return versus SPY after transaction costs. The paper documents sector tilts, factor exposures, and regime dependence, noting that much of the value comes from sector tilts and regime dependence rather than a clean textbook factor.

By Abhishek Sehgal.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2019799495723085860>`__: "Worth a read for anyone thinking seriously about intangible capital, innovation exposure, and practical factor implementation."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6002295>`__

Magnificent, but Not Extraordinary: Market Concentration in the US and Beyond
------------------------------------------------------------------------------

This paper examines equity market concentration in the US since 1926 and in several developed markets. The authors find that current index weights of the largest firms align with historical and international patterns, and that valuation concentration moves with earnings concentration. A geometric Brownian motion benchmark with firm-specific shocks reproduces observed concentration, with idiosyncratic volatility identified as the key driver.

The central finding is that high concentration alone does not justify deviations from market weights or policy conclusions about firm breakups. The market portfolio remains optimal in the authors' benchmark framework. Their evidence constrains pure multiple-expansion narratives and behavioral channels by linking valuations to fundamentals, pushing back on the popular narrative that the Magnificent 7 represent an unprecedented anomaly.

By Per Bye, Jens Soerlie Kvaerner, and Bas J.M. Werker.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance>`__: "If you believe today's US equity market is uniquely concentrated because of the Magnificent 7, history may disagree."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6080632>`__

Credit Spread News and Financial Market Risk
---------------------------------------------

This paper shows that credit spread news, defined by changes and absolute changes in corporate bond credit spreads, predict a substantial share of future variation in financial market risk. The author first documents a strong and robust predictive relationship between credit spread news and financial market risk, then investigates the economic mechanism underlying this relationship.

Both theoretical and empirical evidence highlight a central role for financial intermediaries' risk expectations in driving the predictive power of credit spread changes. The findings establish credit spread news as statistically significant and economically meaningful predictors of financial market risk, offering a practical signal for macro-oriented systematic traders.

By Fabrizio Ghezzi.

Mentioned by Ralph Sueppel in `this discussion <https://x.com/macro_synergy/status/2020764100608004604>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5994074>`__

Trend Following in Strategic Asset Allocation: A Long-Horizon Analysis and Retail-Oriented Implementation
----------------------------------------------------------------------------------------------------------

Traditional portfolio construction frameworks rely on static asset allocation and cross-asset diversification to manage risk and improve long-term outcomes. This paper investigates the role of trend following as a structural component of strategic asset allocation, rather than as a standalone return-seeking strategy. Using long-horizon historical data from 1979 to 2025, the authors examine whether systematic trend-based exposure management can complement traditional diversification by addressing risk from a different dimension: the temporal evolution of market trends.

The results suggest that incorporating trend following as a structural overlay can provide a complementary form of diversification — one based on time and regime dynamics rather than asset classes alone — potentially improving portfolio efficiency and resilience without relying on return forecasting or discretionary market timing. Simple equity trend filters such as 10-month moving averages or 12-1 momentum signals deliver comparable returns to buy-and-hold while substantially reducing maximum drawdown and improving risk-adjusted performance.

By Gabriele Galletta (Investimento Custodito).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2023797049141964889>`__: "Trend following is not about alpha. It's about risk control."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6177818>`__

A Quantitative Trading Strategy Based on A Position Management Model
---------------------------------------------------------------------

This paper establishes a quantitative trading strategy based on a position management model, applied to gold and bitcoin trading. The approach combines ARIMA time-series forecasting for price prediction with a position management framework that governs trade sizing and entry/exit rules. The authors develop differential autoregressive moving average models calibrated at different cycle times, finding that a 60-day data window produces the smallest prediction error, with the relative error of the average prediction value controlled at 0.003016. The position management model then uses these forecasts to determine optimal trade timing and allocation.

The strategy achieves an annualized rate of return of 25%, with accumulated income reaching $223,640.58 USD by September 10, 2021. Profitability and risk resistance are evaluated using Principal Component Analysis, and model validation via parameter variation confirms the solution is locally optimal and consistent with the initial parameterization. Sensitivity analysis shows that as initial commission increases or principal decreases, both trade count and returns decline gradually, confirming the model behaves as expected under parameter perturbation.

`Read the paper <https://www.researchgate.net/publication/367593705_A_Quantitative_Trading_Strategy_Based_on_A_Position_Management_Model>`__

Efficient Portfolio Estimation in Large Risky Asset Universes
--------------------------------------------------------------

This paper addresses the challenge of constructing efficient portfolios within a large investment universe composed exclusively of risky assets. The authors derive a linearly constrained regression representation of the efficient portfolio, which circumvents the need to estimate the mean vector and covariance matrix. Instead, they apply constrained sparse regression techniques (Linearly Constrained LASSO) to estimate portfolio weights directly.

The key insight is that in many real-world settings — such as institutional equity funds, emerging markets with unstable sovereign debt, or decentralized finance — a risk-free asset is unavailable. Traditional approaches like sample-based plug-in estimators, the 1/N rule, or minimum variance portfolios struggle to achieve mean-variance efficiency in large asset pools. By recasting the efficient portfolio problem as a linearly constrained regression, the authors bypass the notoriously difficult estimation of high-dimensional covariance matrices and mean vectors.

Theoretically, the authors establish asymptotic mean-variance efficiency of the estimated portfolio as both the number of assets and the sample size proportionally approach infinity. In extensive simulations and empirical studies using S&P 500 constituents with out-of-sample returns from 1981 to 2024, the method yields portfolios that satisfy specified risk levels, achieve superior Sharpe ratios, and outperform various benchmarks including equally weighted, minimum variance, and other sparse portfolio methods — both net and gross of transaction costs.

By Leheng Chen, Yingying Li, and Xinghua Zheng (Hong Kong University of Science & Technology).

Mentioned by Piotr Pomorski in `this discussion <https://x.com/PtrPomorski/status/2025269292913361406>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6059635>`__

Value Premium: Where Does It Really Come From?
-----------------------------------------------

This paper investigates the sources of the value premium by distinguishing between newly classified and incumbent value and growth stocks. The authors observe that roughly half of value and growth stocks are newly reclassified each year, and explore whether these "style migrants" — stocks that have recently transitioned into value or growth categories — drive the bulk of the value premium.

The key finding is that recent style migrants disproportionately drive the value premium. Newly promoted growth stocks persistently underperform, suggesting that the fresh rotations into style categories matter most for explaining the value effect. Not all value is created equal — the source of a stock's value or growth classification carries significant information about future returns.

The spread between new value and new growth stocks is 0.33% per month, more than double the 0.15% per month spread between incumbent value and growth stocks. Annualized, the new entrant value-growth spread is approximately 4.0%, compared to roughly 1.8% for incumbents, indicating that recent style migration accounts for the dominant share of the aggregate value premium.

By Chen, Huang & Jiang.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2026337576387289360>`__: "Not all value is created equal. The fresh rotations matter most."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6151286>`__

Multiples for Valuation: Go High, Go Low, Ignore the Middle
------------------------------------------------------------

This paper examines whether valuation multiples such as D/P (dividend-to-price), P/E (price-to-earnings), and CAPE (cyclically adjusted P/E) can forecast stock returns, and under what conditions they are most useful. Using US data spanning 1871–2025, the author finds that multiples are far more useful at predicting forward returns when they are at relatively high or low levels than when they sit in the middle of their historical range.

The key finding is that the predictive power of valuation multiples is concentrated at the extremes. When multiples fall into the top or bottom quartile of their historical distribution, the in-sample correlation with subsequent approximately ten-year returns is substantially higher, with R² reaching up to 0.70. Out-of-sample forecasts generated from extreme multiples also significantly outperform those derived from mid-range multiples. The practical implication is that investors should pay close attention to valuations when they are unusually stretched in either direction, but can largely ignore them when they are near the middle of their historical range.

By Javier Estrada (IESE Business School).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2027063861971415486>`__: "Do multiples predict returns? Valuations Only Matter at Extremes."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6152048>`__

Covariance Implied Risk Factors
-------------------------------

This paper examines the role of heteroskedasticity in extracting latent risk factors from asset returns. Standard principal component analysis (PCA) suffers from distortions when assets exhibit heterogeneous idiosyncratic variances, causing estimated factors to reflect clusters of idiosyncratic risk rather than true systematic risk. The author applies heteroskedastic PCA (heteroPCA) to correct for this bias by iteratively replacing the diagonal of the sample covariance matrix with estimates implied by the off-diagonal structure.

HeteroPCA delivers substantially better out-of-sample cross-sectional pricing performance compared to standard PCA across multiple equity portfolio sorts. The identified factors exhibit clearer economic interpretability, and the implied stochastic discount factor achieves lower Hansen-Jagannathan distances. The method trades off slightly worse time-series fit for much stronger cross-sectional pricing power, a tradeoff the author argues is economically favorable.

Key results: On AP-Tree portfolios, heteroPCA achieves out-of-sample Sharpe ratios of 0.46 (Tree10) and 0.55 (Tree40), compared to 0.18 and 0.26 from standard PCA. Across double-sorted portfolios, heteroPCA consistently outperforms: Size & Book-to-Market Sharpe ratio 0.28 vs 0.15, Size & Accruals 0.21 vs 0.13, Size & Investment 0.32 vs 0.20, and Size & Idiosyncratic Volatility 0.35 vs 0.21. Sharpe ratio gains often exceed 50% relative to standard PCA. RMS pricing errors are also lower, with heteroPCA reducing RMS alpha from 0.85-0.90 to 0.72-0.80 on AP-Tree portfolios.

By Mohammed Mehdi Kaebi (Insper Institute of Education and Research).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2029237686410612736>`__: "Your PCA might be lying to you. Standard PCA distorts latent factors when assets have different idiosyncratic variances. The fix? Heteroskedastic PCA."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6136149>`__

Asset Allocation: From Markowitz to Deep Reinforcement Learning
---------------------------------------------------------------

This paper benchmarks nine asset allocation strategies spanning traditional Modern Portfolio Theory and deep reinforcement learning. The traditional methods include the tangency portfolio, minimum variance, risk parity, and equal weight. The DRL methods include A2C, PPO, DDPG, SAC, and TD3. Each strategy is evaluated across both bullish and bearish market environments using real stock data.

Traditional MPT-based approaches deliver stable, consistent results without requiring a training phase. The tangency portfolio achieves the highest Sharpe and Calmar ratios across scenarios. DRL agents can surpass traditional methods in bull markets at their best (SAC achieved 179% annual return and a 2.58 Sharpe ratio), but exhibit high variance across runs due to stochastic optimization. In their worst runs, DRL agents fail to outperform the simple equal weight baseline. In bear markets the performance gap between traditional and DRL approaches narrows substantially, and DRL results become less reliable. The author suggests that more training data, additional technical indicators, and architectures like transformers could help stabilize DRL performance.

By Ricard Durall (Open University of Catalonia).

Mentioned by Jungle Rock in `this discussion <https://x.com/JungleRockRes/status/2030015840024707096>`__.

`Read the paper <https://arxiv.org/abs/2208.07158>`__

Order Flow and Exchange Rate Dynamics
--------------------------------------

This paper challenges traditional macroeconomic models of exchange rate determination, which typically produce poor forecasting results. Instead, the authors introduce a microstructure-based approach incorporating order flow — the net of buyer-initiated and seller-initiated trades — as a key determinant of exchange rate movements. Their model achieves R² statistics above 50% for daily exchange-rate changes in the DM/$ spot market, vastly outperforming standard macro models and providing superior short-horizon forecasts compared to random walk models.

The central empirical result is that $1 billion of net dollar purchases increases the DM price of a dollar by about 1 pfennig. This finding established order flow as a primary driver of FX price formation and has become a foundational reference for understanding flow-driven dynamics in other asset classes, including cryptocurrencies.

By Martin D.D. Evans and Richard K. Lyons. Published in Journal of Political Economy (2002), vol 110(1), pp 170-180.

`Read the paper <https://www.nber.org/papers/w7317>`__

Trading and Arbitrage in Cryptocurrency Markets
-------------------------------------------------

This paper studies the efficiency and price formation of cryptocurrency markets. The authors document large, recurrent arbitrage opportunities across exchanges, with price deviations much larger across countries than within countries, highlighting the role of capital controls in limiting arbitrage capital flows. The common component of signed volume on each exchange explains approximately 80% of Bitcoin returns, while idiosyncratic components help explain arbitrage spreads between exchanges.

Price deviations across countries co-move and widen during periods of large Bitcoin appreciation, with countries exhibiting higher Bitcoin premia over the US price seeing the largest arbitrage deviations. The paper provides foundational evidence that Bitcoin's price formation is heavily flow-driven, resembling foreign exchange markets more than equities.

By Igor Makarov and Antoinette Schoar. Published in Journal of Financial Economics (2020), vol 135, issue 2, pp 293-319.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3171204>`__

Order Flow and Cryptocurrency Returns
--------------------------------------

This paper investigates the role of order flow in explaining and predicting cryptocurrency returns. The authors construct an aggregate "world" order flow measure from 11 major fiat currencies across multiple exchanges and test its explanatory power on a cross-section of 82 cryptocurrencies using panel regressions with controls for established return predictors.

World order flow explains approximately 11% of daily and 20% of weekly cross-sectional cryptocurrency returns, with strong evidence of permanent price impact — indicating that order flow carries genuine information rather than transient liquidity effects. The paper demonstrates that order flow dominates macroeconomic fundamentals for out-of-sample prediction, especially when using non-linear machine learning models. Long-short portfolios constructed from ML forecasts conditioning on daily order flow achieve an alpha of up to 0.79% per day with an annualized Sharpe ratio of 3.63.

By Alexia Anastasopoulos, Nikola Gradojevic, Jiaao Liu, Alex Maynard, and Christos Tsiakas. Published in Journal of Financial Markets (2026).

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5020002>`__

Risk-adjusted Momentum Strategy Construction and Industry Heterogeneity Analysis Based on STARR Indicator
----------------------------------------------------------------------------------------------------------

This paper proposes a risk-adjusted momentum strategy using the STARR (Stable Tail-adjusted Return Ratio) indicator — a metric that replaces standard deviation in the Sharpe ratio with Conditional Value at Risk (CVaR) to better capture downside tail risk. The study constructs both Sharpe-based and STARR-based momentum factors across industry-level ETFs from the S&P 500 and Nikkei 225, applying mean-variance optimisation to monthly data spanning 2010–2025.

The STARR-based strategy demonstrates superior downside risk control compared to conventional Sharpe-based momentum, particularly during extreme market conditions such as the COVID-19 crisis. Performance varies significantly across sectors and volatility regimes, confirming meaningful industry heterogeneity in momentum returns. The strategy maintains robustness through alternative parameter configurations and cross-market validation between U.S. and Japanese equities, suggesting that incorporating downside-sensitive metrics like CVaR into momentum signal construction can enhance risk-adjusted returns and improve portfolio stability in diverse market environments.

By Xupeng Zhang (McGill University).

`Read the paper <https://www.researchgate.net/publication/394351939_Risk-adjusted_Momentum_Strategy_Construction_and_Industry_Heterogeneity_Analysis_Based_on_STARR_Indicator>`__

Scale Dependent Dynamics in Equity Market Phase Space
-----------------------------------------------------

This paper extends the stochastic damped harmonic oscillator (SDHO) framework to longer timescales and investigates why the transition from mean-reversion to momentum occurs at the 2-3 month horizon where the Jegadeesh-Titman momentum anomaly begins. Using phase-space analysis on 32 years of SPY daily prices, 154 years of Shiller S&P 500 data, and 308 years of Bank of England UK equity data, the authors show that mean-reversion strength decays as a power law with observation horizon, following k(tau) = A * tau^(-alpha).

The paper identifies the Voronoi-Delaunay tessellation as mathematically equivalent to the finite-volume discretization of the Fokker-Planck equation on irregular phase-space data, connecting the empirical dynamics to non-equilibrium statistical mechanics. A 2x2x2 factorial analysis on both SPY daily data and ES futures minute data (5.38 million observations) resolves an apparent R-squared discrepancy between overlapping and non-overlapping sampling, finding that the sampling effect accounts for 92-97% of the apparent improvement across six futures markets spanning five asset classes. A null-model test shows that the power-law decay arises from temporal coarse-graining of stationary SDHO dynamics rather than from scale-dependent coupling constants, though the practical implications for momentum and mean-reversion strategies remain the same.

Key metrics: the mean-reversion coefficient follows k(tau) = 1.61 * tau^(-1.13) with R-squared = 0.99 across 34 measurements spanning 462 combined years of data. Mean-reversion remains strictly positive (k > 0 in 34/34 measurements) but decays to negligible levels at the momentum horizon. All six futures markets tested cluster within a narrow parameter band (R-squared in [0.56, 0.60], omega in [1.11, 1.22]), suggesting a common dynamical equilibrium across liquid markets.

Mentioned by `Symplectic.Research <https://x.com/QuantSymplectic>`__ in `this discussion <https://x.com/QuantSymplectic/status/2033529584986022067>`__.

By Bruce H. Dean (Independent Researcher), March 2026.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6380118>`__

Vault Allocation Strategies
---------------------------

This post examines the quantitative limitations of current crypto vault allocation strategies in DeFi. The author argues that most vault strategies marketed as "yield optimization" are in practice rule-of-thumb routing engines rather than proper quantitative portfolio construction. The analysis identifies five structural weaknesses: absence of formal optimization frameworks (no mean-variance or drawdown minimization, just "higher APY wins"), weak risk modeling relying on caps and allowlists rather than distributions and tail scenarios, ignored correlation across risk factors, static or reactive allocation with little predictive signal, and under-modeled liquidity where withdrawal queues are not priced into allocation decisions.

The post concludes that current vaults are constrained routing engines with basic risk controls sitting on top of structural yield sources (emissions, lending demand, structural carry), not quantitative funds. The author proposes that the next generation of vaults should incorporate proper objective functions, factor-aware allocation, correlation modeling, and liquidity-adjusted returns to move from the "rules-based allocator" phase to a true "quant portfolio" phase.

No quantitative backtest metrics are presented — the post is a qualitative framework analysis rather than an empirical study with performance results.

Mentioned by `Amy O. Khaldoun <https://www.linkedin.com/in/amykhaldoun>`__ (Vess3l, Quant Consultant) in `this LinkedIn post <https://www.linkedin.com/posts/amykhaldoun_vault-allocation-strategies-ugcPost-7439522102115737600-m6ip/>`__.

`Read the post <https://www.linkedin.com/posts/amykhaldoun_vault-allocation-strategies-ugcPost-7439522102115737600-m6ip/>`__

Dynamic Factor Allocation via Momentum-Based Regime Switching
-------------------------------------------------------------

This paper presents a systematic framework for dynamically allocating across five equity factors — Value, Size, Momentum, Quality, and Growth — using a momentum-based regime switching model. The authors use a z-score normalization approach with only two hyperparameters to classify Bull and Bear regimes for each factor through normalized trend signals. Regime identification is statistically significant across all factors, with Size and Growth showing strong significance (p < 0.01). The key insight is asymmetric: Bull regimes exhibit systematic positive forward returns, while Bear regimes show no significant pattern, supporting an approach that overweights factors in Bull regimes and underweights or avoids those in Bear regimes.

The factor timing strategy is validated through ETF-based backtesting over the 1998–2025 period, demonstrating practical implementability with only modest performance degradation from tracking error and expense ratios. The framework uses a Black-Litterman-style integration to combine regime signals with portfolio construction.

Key metrics: the strategy achieves a Sharpe ratio of 0.66 compared to 0.59 for an equal-weighted benchmark, with annualized returns of 13.0% versus 11.3%. The calendar year hit rate is 78.6%, with turnover of approximately 3x annually. Cross-sectional validation confirms Bull regime significance (t = 1.98, p = 0.047).

By Jim Tai, Stephanie Leung, and Justin Jimenez (StashAway), February 2026.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6224058>`__

AlgoXpert Alpha Research Framework: A Rigorous IS WFA OOS Protocol for Mitigating Overfitting in Quantitative Strategies
-------------------------------------------------------------------------------------------------------------------------

Transitioning a strategy from backtest to live trading is a common failure point for quantitative systems due to parameter overfitting, selection bias, and sensitivity to regime changes. This paper presents the AlgoXpert Alpha Research Framework, a standardised three-stage evaluation protocol: In-Sample (IS) analysis that targets stable parameter regions rather than single optima; Walk-Forward Analysis (WFA) with rolling windows and purge gaps to prevent information leakage, governed by majority-pass and catastrophic-veto rules; and Out-of-Sample (OOS) testing under strict parameter lock with no further tuning.

The framework applies a defense-in-depth structure with three layers: structural safeguards (cliff veto), execution controls (spread and leverage guards), and equity protection mechanisms (circuit breakers and a kill switch). A case study on USDJPY M5 intraday data demonstrates how to detect overfitting through performance decay and drawdown behaviour across chronological stages. A post-validation comparison of four alpha variants (v1–v4) reveals rank reversal when the optimisation objective changes from maximising Sharpe ratio to minimising maximum drawdown — illustrating the fundamental trade-off between risk-adjusted performance and tail risk control.

Key metrics: The paper compares four alpha variants in a USDJPY M5 case study. Rank reversal between variants is observed when switching the objective from Sharpe maximisation to max drawdown minimisation. No single aggregate Sharpe/return figure is presented; the framework is methodological rather than a performance report of a specific strategy.

Mentioned by `QFinancePapers <https://x.com/QFinancePapers>`__ in `this discussion <https://x.com/QFinancePapers/status/2031642071665131616>`__.

By The Anh Pham, Bao Chan Nguyen, and Nguyet Nguyen Thi, March 2026.

`Read the paper <https://arxiv.org/abs/2603.09219>`__

Optimizing Portfolio Performance through Clustering and Sharpe Ratio-Based Optimization: A Comparative Backtesting Approach
---------------------------------------------------------------------------------------------------------------------------

This paper introduces a two-stage portfolio construction framework that combines K-Means clustering with Sharpe ratio-based weight optimisation. In the first stage, a universe of financial assets is segmented into clusters based on historical log-returns, grouping together assets with similar return characteristics. In the second stage, each cluster is treated as a sub-portfolio and Sharpe ratio maximisation is applied within each cluster to derive optimal weights — directly incorporating the return/volatility trade-off rather than relying on mean-variance optimisation's sensitivity to expected return estimates.

The framework is evaluated through a backtesting study across multiple asset classes, comparing the cumulative returns of optimised per-cluster portfolios against a traditional equal-weighted benchmark. The approach allows targeted portfolio construction within homogeneous asset groups while maintaining diversification across clusters.

Key metrics: Optimised portfolios outperform the equal-weighted benchmark in cumulative return terms across the backtest period. Specific Sharpe ratio, max drawdown, and annualised return figures are not reported in the abstract; the primary comparison is cumulative return trajectories per cluster versus the equal-weighted baseline.

Mentioned by `QFinancePapers <https://x.com/QFinancePapers>`__ in `this discussion <https://x.com/QFinancePapers/status/1882220409203962241>`__.

By Keon Vin Park, January 2025.

`Read the paper <https://arxiv.org/abs/2501.12074>`__

The Sharpe Stability Ratio: Temporal Consistency of Risk-Adjusted Performance
-----------------------------------------------------------------------------

This paper introduces the Sharpe Stability Ratio (SSR), a performance metric that evaluates the temporal consistency of risk-adjusted returns. While the standard Sharpe ratio summarizes average excess return per unit of risk over a fixed sample, it cannot distinguish persistent skill from episodic outperformance — two strategies may display identical ex-post Sharpe ratios yet differ sharply in their temporal profiles. SSR addresses this gap by treating the rolling Sharpe ratio as a time-series object and defining stability as the ratio of mean rolling performance to its heteroskedasticity-and-autocorrelation-consistent (HAC) standard deviation.

The paper demonstrates four practical applications of SSR. First, it reveals that strategies with similar point-in-time Sharpe ratio and Probabilistic Sharpe Ratio (PSR) can exhibit markedly different stability profiles, providing critical information for due diligence and manager selection. Second, it quantifies the strong serial correlation induced by overlapping rolling windows, showing that naive dispersion measures severely understate uncertainty and that HAC correction is indispensable for valid temporal inference. Third, SSR supports formal hypothesis testing on stability via block bootstrap procedures that preserve the dependence structure of returns. Fourth, it demonstrates that statistically credible aggregate performance (PSR close to one) does not guarantee temporal consistency — high average Sharpe ratios may be generated by concentrated episodic strength rather than sustained skill.

Key metrics: This is a methodological paper introducing a new risk metric rather than a backtested trading strategy. No annualised return, Sharpe ratio, or drawdown figures are reported for a specific strategy. The primary empirical validation uses controlled simulations and hedge fund index data to show that SSR delivers complementary insights relative to SR and PSR, successfully separating genuinely stable performance from volatile profiles that appear credible under static evaluation. The paper is 63 pages and covers formal derivations, Monte Carlo experiments, and empirical applications across hedge fund styles.

By Mario Bajo Traver (Bank of Spain) and Alejandro Rodriguez Dominguez (University of Reading; Miralta Finance Bank S.A.), January 2026.

Mentioned by Piotr Pomorski in `this discussion <https://x.com/PtrPomorski/status/2034695649007214896>`__: "Something on sharpe ratio for temporal stability."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6344658>`__

Cross-Sectional Skewness
------------------------

This paper investigates what distribution best characterizes the time series and cross section of individual stock returns. The authors estimate the degree of cross-sectional return skewness relative to a flexible benchmark that nests many standard models in the literature, including lognormal, stochastic volatility, and jump-diffusion specifications. The central finding is a striking asymmetry across horizons: cross-sectional skewness in monthly returns far exceeds what the benchmark model predicts, while cross-sectional skewness in long-run returns is substantially below what the model predicts.

The resolution lies in fat-tailed idiosyncratic events — rare, firm-specific jumps that generate extreme short-term returns but whose effects attenuate over longer holding periods. The authors show that incorporating power-law-distributed idiosyncratic shocks into the return-generating process is necessary to reconcile both the excess short-horizon skewness and the deficit of long-horizon skewness observed in the data. This has direct implications for asset pricing and portfolio construction: models that ignore fat-tailed idiosyncratic risk will systematically misprice lottery-like payoffs at short horizons and underestimate diversification benefits at longer horizons.

Key metrics: This is a theoretical and empirical asset pricing paper rather than a backtested trading strategy. The primary quantitative results concern the magnitude of cross-sectional skewness relative to model predictions across different return horizons. No annualised return, Sharpe ratio, or drawdown figures are reported. The paper's contribution is to the understanding of return distributions and the role of rare idiosyncratic events in shaping cross-sectional risk.

By Sangmin Oh (Columbia Business School) and Jessica A. Wachter (Wharton / NBER / SEC). Published in Review of Asset Pricing Studies 12(1):155-198, March 2022.

Mentioned by Darren (@ReformedTrader) in `this discussion <https://x.com/ReformedTrader/status/2034719148690087962>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3079715>`__

Beyond delta neutrality: Confidence-scaled hedging with machine learning forecasts
----------------------------------------------------------------------------------

This paper studies whether machine learning forecasts can enhance option portfolio performance by relaxing strict delta neutrality. The authors propose a confidence-scaled hedging framework that dynamically adjusts hedge ratios based on the classification confidence of ML models. Rather than targeting a delta of zero, the framework applies a parameter α as a multiplier to the hedge ratio: when delta is positive and the model anticipates an upward move, the hedge is reduced to retain more directional exposure; when delta is negative and a decline is predicted, the hedge magnitude is similarly reduced. This creates a mechanism for translating model confidence directly into portfolio positioning.

The study uses option and underlying ETF data to evaluate the framework empirically. The key finding is that moderate confidence scaling improves Sharpe ratios relative to a strict delta-neutral benchmark, while aggressive scaling increases volatility and weakens long-term returns. The results demonstrate that ML forecasts can be translated into economically meaningful improvements in risk-adjusted performance, provided the confidence scaling parameter is calibrated carefully.

Key metrics: moderate confidence scaling improves Sharpe ratios versus the delta-neutral benchmark; aggressive scaling increases portfolio volatility and degrades long-term returns. The framework introduces a single tunable parameter α that governs the trade-off between return enhancement and increased risk exposure. No specific numeric Sharpe or return figures are disclosed in the abstract.

Mentioned by `Nam Nguyen, Ph.D. <https://www.linkedin.com/in/namnguyento>`__ (Quantitative Strategist and Derivatives Specialist) in `this LinkedIn discussion <https://www.linkedin.com/posts/namnguyento_options-riskmanagement-volatility-share-7441870249068564481-y4yh>`__.

By Boyan Li and Chongfeng Wu. Published in Finance Research Letters, 2025.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1544612325023475>`__

Advanced Signal Filtering for Mean Reversion Trading
-----------------------------------------------------

This paper develops a regime-aware mean-reversion trading framework in which adaptive neural signal filters determine the latent fair price of an asset. The core idea is that the spot price is driven by high-frequency noise around a smooth "fair value", and the spread between the two creates buy/sell opportunities. The authors introduce a novel optimisation objective — the Local Average Filtering Objective (LAFO) — which interpolates between pointwise fitting and global averaging, yielding a controllable low-pass filter. Penalty terms restore identifiability, encode structural regime assumptions, and stabilise the extracted signal. Modern neural network architectures — including recurrent, convolutional, and state-space models — are shown to approximate solutions within this framework.

On S&P 500 intraday data (2-minute frequency), the neural filters dramatically outperform traditional EMA baselines. The best-performing model, a 2-layer CNN, achieved an annualised Sharpe Ratio of 11.05, a Sortino Ratio of 39.13, a hit rate of 47.9%, and positive excess returns of 10.5% after transaction costs of 3 bps. WaveNet (Sharpe 8.01, Sortino 24.17) and a Deep Kalman Filter (Sharpe 4.92, Sortino 12.89) also produced strong risk-adjusted returns, while standard EMA filters yielded deeply negative Sharpe ratios. The results demonstrate that appropriate signal extraction is central to mean-reversion profitability.

Mentioned by `Piotr Pomorski (@PtrPomorski) <https://x.com/PtrPomorski>`__ in `this discussion <https://x.com/PtrPomorski/status/2038223897640968316>`__.

By Zhichen Xu, Nick Firoozye, Andreas Koukorinis, Philip Treleaven, and Wilbur Zhu. Department of Computer Science, University College London.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6225198>`__

Early Birds Get the Vol: Morning Volatility Uncertainty and Variance Risk Premium
----------------------------------------------------------------------------------

This paper documents that morning volatility-of-volatility (VVIX), measured at 10:00 EST during the U.S.–European market overlap, strongly predicts next-day variance asset returns. The predictive power peaks with t-statistics reaching 5.6 and adjusted R-squared of 2.6%, but diminishes after 11:00 EST. The authors attribute this to limited attention and slow-moving beliefs: elevated morning VVIX signals heightened uncertainty, yet prices do not fully adjust until the following day, making variance assets temporarily "too cheap". Conversely, low morning VVIX makes the usual negative variance risk premium more pronounced. Intraday returns show a flat relationship with morning VVIX on high-uncertainty days, while close-to-close returns exhibit strong predictability — consistent with delayed price adjustment rather than a standard risk premium.

A long-short trading strategy that buys variance assets following high morning VVIX and sells following low morning VVIX achieves annualised Sharpe ratios of 1.51 to 2.87 across SPX straddles, VIX straddles, variance swaps, and VIX futures (using the 75th percentile threshold). VIX futures deliver a Sharpe of 2.09, nearly four times the unconditional benchmark of 0.54. The long-only leg is particularly strong, with Sharpe ratios of 2.52 (SPX straddles), 2.41 (VIX straddles), and 3.24 (VIX futures) at the 75th percentile. The short-only leg generates Sharpes of 1.46 to 2.37. Results remain economically meaningful after transaction costs.

Mentioned by `Piotr Pomorski (@PtrPomorski) <https://x.com/PtrPomorski>`__ in `this discussion <https://x.com/PtrPomorski/status/2037954400719626309>`__: "this one is good".

By Rodrigo Hizmeri and Mattia Bevilacqua.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6212458>`__

Dynamic Black-Litterman
-----------------------

This paper generalises the classical Black-Litterman portfolio allocation model from a single-period to a continuous-time dynamic setting, allowing investors to trade continuously while incorporating expert views whose horizons may differ from the investment horizon. Using Bayesian graphical models, the authors derive the conditional distribution of asset returns under geometric Brownian motion, showing that conditioning on forward-looking views transforms the log-returns process from Brownian motion with drift into a mean-reverting process expressible as a multi-dimensional Brownian bridge. The conditional price process becomes an affine factor model where the conditional log-returns serve as factors, and explicit formulas are provided for the optimal dynamic investment policy via Hamilton-Jacobi-Bellman equations solved in closed form through a system of Riccati ODEs.

In Monte Carlo simulations on five S&P/ASX 50 assets with CAPM-derived expected returns and three forward-looking views over a one-year horizon, the Dynamic Black-Litterman (DBL) investor consistently dominates the Rebalanced Classical Black-Litterman (RCBL) investor across all rebalancing frequencies (continuous, daily, weekly, monthly). The efficient frontier generated by DBL lies strictly above RCBL, with the performance gap widening when expert views are more precise (lower view noise). DBL also achieves substantially lower portfolio turnover across all risk aversion levels, because its hedging demand offsets sensitivity to changes in the views covariate. Crucially, DBL performance is insensitive to rebalancing frequency, while RCBL deteriorates rapidly as the rebalancing interval increases. The paper further shows that anticipating view revisions (quarterly or mid-horizon updates) materially improves certainty equivalent returns.

By Anas Abdelhakmi and Andrew Lim. National University of Singapore.

`Read the paper <https://arxiv.org/abs/2404.18822>`__

The Market Maker's Dilemma: Navigating the Fill Probability vs. Post-Fill Returns Trade-Off
--------------------------------------------------------------------------------------------

This paper presents results from a live trading experiment on the Binance Bitcoin perpetual futures market, the most liquid crypto market globally. The authors submitted 232,897 minimum-sized maker orders over one week in a continuous quoting mode (always maintaining orders at top-of-book on both sides), of which 127,051 filled and 105,846 were cancelled unfilled. The experiment reveals a fundamental negative correlation between an order's fill probability and its post-fill returns: conditions that make fills more likely (such as adverse order book imbalance where the opposite queue is large and the near-side queue is small) are precisely the conditions that predict poor post-fill returns due to price persistence.

The paper demonstrates the consequences with a naive market making strategy that continuously quotes at the touch and rebalances to zero inventory after each fill. This strategy lost nearly 60% in three days, producing an annualised Sharpe ratio of −109 with an average holding time of 11 seconds and an average loss of 0.44 basis points per roundtrip. The authors then model "reversals" — situations where the order book imbalance falsely predicts the next price move — using logistic regression and random forest classifiers on features including queue sizes, recent price moves, and time-of-day effects. A balanced-inventory strategy that only trades when the model predicts a reversal with probability exceeding the 0.24 threshold improves the Sharpe ratio to 11.97 (logistic regression) while maintaining 327 roundtrips per day. The authors caution that these Sharpe ratios apply to minimum-sized orders and would degrade with larger position sizes.

Mentioned by `Alcibiades (@0xAlcibiades) <https://x.com/0xAlcibiades>`__ in `this discussion <https://x.com/0xAlcibiades/status/2039679872000573594>`__: "Fill probability and post-fill returns are negatively correlated. Their naive MM strategy hits a Sharpe of −109 without rebates. The only regime where maker orders are profitable is when order book imbalance falsely predicts the next price move."

By Jakob Albers, Mihai Cucuringu, Sam Howison, and Alexander Y. Shestopaloff.

`Read the paper <https://arxiv.org/abs/2502.18625>`__

Expected Returns with Cash Flow Trends and Cycles
--------------------------------------------------

This paper argues that cash flow growth contains a permanent trend component, rendering the price-dividend ratio a noisy proxy for expected returns. Using an Extended Kalman Filter to jointly estimate trend growth, cash flow cycles, and expected returns, the authors demonstrate that cash flow noise generates severe attenuation bias in standard predictive regressions — making valuation ratios appear far weaker than they truly are.

By decomposing the price-dividend ratio into discount-rate variation (the return-predicting signal) and cash-flow dynamics (the noise), and then purging this noise, return predictability is substantially restored. Discount-rate variation dominates price-dividend movements at short and medium horizons, while trend growth dominates at longer horizons.

The cleaned signal delivers out-of-sample R² of approximately 9% at the one-year horizon and 22% at the five-year horizon, where traditional valuation ratios uniformly fall short at every tested horizon.

Mentioned by `Ivan Blanco <https://www.linkedin.com/in/ivanblancosanchez>`__ in `this LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-valuation-ratios-arent-share-7442576675743256576-pQjJ/>`__: "Valuation ratios aren't weak predictors. They're noisy ones. There's a difference."

By Sebastian Hillenbrand and Odhrain McCarthy.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6332619>`__

Crypto Contagion
----------------

An empirical study of how the relationship between cryptocurrencies and US equity markets underwent a fundamental structural shift following the introduction of crypto ETFs. Using a risk-sharing model of crypto contagion combined with jump diffusion analysis and double machine learning, the authors isolate actual shock transmission between crypto and equity markets — not merely rolling correlations — across the pre- and post-ETF regimes for Bitcoin (BTC-USD) and Ethereum (ETH-USD).

Before ETF launch, the main cryptocurrencies moved in the opposite direction from US market returns: a 1% crypto move corresponded to approximately -0.07% in S&P 500 returns, making crypto a standalone risk factor with genuine portfolio diversification benefits. After ETF introduction, this relationship inverted entirely — cryptocurrencies now move in tandem with equity markets, functioning as high-beta equity exposure. The diversification benefit that previously justified crypto allocations in multi-asset portfolios is largely eliminated. The authors attribute this regime shift to a fundamental change in the investor base and information environment: crypto ETFs aggregate focused information about cryptocurrency innovations within the protections of the US regulatory framework, attracting institutional investors who previously used spot crypto markets for price discovery. The cryptocurrencies themselves are consequently evolving toward entities comparable to ordinary corporations, with ETFs serving as a proxy for investor sentiment about blockchain innovation.

The regime-shift finding has significant implications for systematic portfolio construction: crypto should no longer be modelled as an independent risk factor but as leveraged equity exposure. The pre-ETF negative beta with US equities — the source of the diversification case — has not just weakened but structurally reversed.

Mentioned by `Ivan Blanco <https://www.linkedin.com/in/ivanblancosanchez>`__ in `this LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_crypto-looks-like-high-beta-equity-now-share-7444288683232382976-ZLX6>`__: "For a systematic multi-asset portfolio, the data suggest crypto is no longer a genuine diversifier; it looks like high-beta equity."

By Irene Aldridge and Wenke Du.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5630550>`__

Flow Toxicity and Liquidity in a High Frequency World
-----------------------------------------------------

Order flow is toxic when it adversely selects market makers, who may be unaware they are providing liquidity at a loss. This paper by David Easley, Marcos López de Prado, and Maureen O'Hara introduces the Volume-Synchronized Probability of Informed Trading (VPIN) — a real-time, high-frequency metric for estimating the probability that order flow is driven by informed participants. Unlike the earlier PIN model, which requires maximum-likelihood estimation of unobservable parameters, VPIN operates in volume time rather than clock time and uses a novel Bulk Volume Classification (BVC) procedure to classify trade volume as buy- or sell-initiated without requiring tick-level quote data. The metric is updated continuously as volume buckets fill, making it directly applicable to high-frequency and algorithmic trading environments.

The paper's central empirical contribution is the application of VPIN to the May 6, 2010 Flash Crash. The authors demonstrate that the cumulative distribution function of VPIN (CDF(VPIN)) reached its 0.97 threshold more than one hour before the crash, signalling historically elevated order flow toxicity well before the market collapsed. As informed traders concentrated activity on the sell side, market makers faced severe adverse selection. The resulting withdrawal of liquidity amplified the crash dynamics. Beyond the Flash Crash, the authors show that VPIN serves as a useful short-term indicator of toxicity-induced volatility. Practitioner-calibrated thresholds place sustained readings above 0.85 (90th–95th percentile) as operationally significant for liquidity risk monitoring. Subsequent debate — notably by Andersen and Bondarenko (2014) — has questioned the precise timing and predictive power of VPIN around the Flash Crash, arguing that elevated readings occurred partly after the event and reflect a mechanical relationship with trading intensity. The original authors have responded and refined their analysis, but the controversy underscores the importance of understanding VPIN's assumptions before deploying it in production.

Published in the Review of Financial Studies, Vol. 25, No. 5, pp. 1457–1493, 2012.

Mentioned by `0xAlcibiades <https://x.com/0xAlcibiades>`__ in `this discussion <https://x.com/0xAlcibiades/status/2040056013189943678>`__: "In 2010 Easley, Lopez de Prado, and O'Hara built a way to measure this. VPIN."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1695596>`__

Geopolitical Risk in Currency Markets
--------------------------------------

This paper by Alessandro Melone (Ohio State University) and Andreas Stathopoulos (UNC Chapel Hill) documents that geopolitical risk is a priced factor in the cross-section of currency returns. The authors sort currencies into five portfolios based on the rolling forecast coefficient of their excess returns on Caldara and Iacoviello's (2022) Global Geopolitical Threats (GPT) index. The resulting long-short strategy, GHML (Geopolitical High Minus Low), invests in currencies with high geopolitical exposure and shorts those with low exposure. GHML is nearly orthogonal to standard currency risk factors (DOL and CAR), representing a genuinely new source of systematic variation in FX markets.

The paper further links geopolitical risk factor loadings to international capital flows: countries that attract higher-than-average net capital flows during geopolitical turmoil have currencies that hedge geopolitical risk ("safe havens"), while countries experiencing capital outflows have geopolitically risky currencies ("danger zones"). Safe haven currencies carry a GHML loading 0.32 lower than danger zone currencies. Importantly, geopolitical factor loadings are unrelated to policy uncertainty measures like the Economic Policy Uncertainty (EPU) index or the Trade Policy Uncertainty (TPU) index, establishing geopolitical risk as a distinct phenomenon.

Key metrics: The GHML strategy yields an annualised excess return of 3.28%, with an annualised standard deviation of 8.37% and a Sharpe ratio of 0.39. After controlling for dollar (DOL) and carry (CAR) factors, the annualised alpha is 2.76%, with the regression adjusted R-squared for GHML at just 2% — confirming the factor is essentially unexplained by existing currency risk models. Portfolio GHML loadings increase monotonically from -0.49 (Portfolio 1) to 0.51 (Portfolio 5). The sample covers 41 developed and emerging market currencies from February 1988 to December 2024 (443 monthly observations).

Mentioned by `Ivan Blanco <https://www.linkedin.com/in/ivanblancosanchez>`__ in `this LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-geopolitical-risk-is-a-priced-share-7442578033414410240-Qbes>`__: "New research: geopolitical risk is a priced factor in the cross-section of currency returns."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6438919>`__

Dynamic Mean-Variance Portfolio Allocation under Regime-Switching Jump-Diffusions with Absorbing Barriers and Distribution Matching
---------------------------------------------------------------------------------------------------------------------------------------

This paper by Artur Sepp (LGT Private Banking) studies continuous-time dynamic mean-variance portfolio allocation when the risky asset follows a two-state regime-switching process with exponentially distributed jumps at regime transitions. The value function admits a regime-conditional quadratic form whose coupled nonlinear Riccati ODEs have a unique global solution. The optimal feedback policy retains the Merton-Lipton structure — the regime-dependent effective Merton ratio modulated by a goal-seeking funding ratio — in each regime. An absorbing wealth floor for capital preservation is introduced via a Laplace transform framework employing Arrow-Debreu state prices. The stopped terminal wealth distribution decomposes into three components absent in pure diffusion models: survival paths, a floor atom (diffusion-hitting), and jump-overshoot paths below the floor. The paper also formulates the inverse problem of matching a target terminal wealth distribution using mixtures of stopped strategies across asset classes, showing that the family of achievable distributions is dense in the Wasserstein-1 topology.

The framework is calibrated to a three-asset-class portfolio of bonds, equity, and private equity under capital market assumptions with one crash per decade and mean stress duration of one year. Crash losses are 8% for bonds, 25% for equity, and 30% for private equity. Four mandate profiles are evaluated over a 10-year horizon with a 2-sigma drawdown tolerance. For the balanced mandate (35/43/22 weights), the MV-optimal strategy achieves an implied annualised return of 3.30% with terminal wealth standard deviation of 46.1 and survival probability of 78.7%, compared to a buy-and-hold benchmark return of 4.10% with standard deviation of 74.8 — the floor protection cost is 80 bp per annum. For the growth mandate (0/67/33), implied return is 3.68% versus 5.01% buy-and-hold, with survival at 73.8% and floor protection cost of 117 bp. The MV strategy produces endogenous de-risking glide paths: all mandates start fully invested and de-risk over time, with the growth mandate declining from 100% to 37% risky allocation over 10 years. Conditional on survival, terminal wealth volatility drops sharply (31.5 for growth versus 117.6 under buy-and-hold). All results are computed analytically via Laplace inversion in approximately one second per evaluation. A companion Python package ``GoalBasedAllocation`` is available at https://github.com/ArturSepp/GoalBasedAllocation.

Mentioned by `Artur Sepp <https://x.com/ArturSepp>`__ in `this discussion <https://x.com/ArturSepp/status/2041520208582455581>`__: "A wealth floor is a barrier. A market crash is a jump. Result: analytical terminal wealth densities, floor protection costs & de-risking glide paths — all analytic."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6534579>`__

Optimal Make-Take Fees in a Multi Market Maker Environment
-----------------------------------------------------------

This paper by Bastien Baldacci (Ecole Polytechnique), Dylan Possamai (ETH Zurich), and Mathieu Rosenbaum (Ecole Polytechnique) studies how an exchange should optimally design make-take fee contracts when multiple market makers compete on its platform. Using a principal-agent framework, the exchange (principal) offers fee contracts to N market makers (agents) who then set their bid-ask quotes in a Nash equilibrium. The exchange's revenue depends on the arrival rate of market orders, which is driven by the aggregate liquidity — the weighted sum of all market makers' spreads relative to an efficient price. The problem is solved as a two-step Stackelberg game: first, each market maker computes best-response spread strategies given others' quotes, yielding a Nash equilibrium characterised via a multidimensional system of BSDEs; second, the exchange solves a Hamilton-Jacobi-Bellman equation to find the optimal contract given these equilibrium responses.

The optimal contract is expressed in quasi-explicit form as a sum of stochastic integrals with respect to market order and efficient price processes, making it readily implementable. The contract is indexed only on aggregated order processes and the efficient price — the platform does not need to monitor cross-incentives between individual market makers. Each market maker's compensation consists of: a base payment calibrated to their reservation utility, per-trade rebates for executed orders (the "make" component), a risk-adjustment term for inventory and price exposure, and a deduction for the certain gains the agent would extract from their own optimisation. Crucially, the exchange can discriminate between market makers through the price-risk component based on their individual risk aversion parameters, while keeping the order-flow-based incentives uniform.

A key counterintuitive finding is that increasing the number of market makers does not necessarily improve the exchange's outcome. The function S(N) measuring platform PnL as a function of the number of market makers has a unique global maximum — numerically found at approximately N=3 for the paper's calibration. Beyond this optimum, adding market makers with comparable risk aversion actually decreases order arrival intensity, increases average spreads, and reduces platform profitability, because each maker receives a shrinking share of incentives (described as "a cake whose size increases slower than the number of people who eat it"). However, adding a market maker with higher risk aversion always reduces the average spread, while adding one with lower risk aversion increases the principal's capacity to offer incentives. Decreasing the taker cost increases platform PnL up to a point, while increasing the weight parameter reduces the best bid-ask spread and increases total order flow and PnL. In the limit as N goes to infinity, the optimal spread converges to the no-contract spread form but with a different value function, and the incentive terms vanish.

Mentioned by `Alcibiades <https://x.com/0xAlcibiades>`__ in `this discussion <https://x.com/0xAlcibiades/status/2041597210433880505>`__: Alcibiades frames exchange design as a principal-agent problem where successful venues must balance maker and taker incentives through carefully structured fee mechanisms. He argues that naive rebate rules create synchronised price patterns across makers, latency races concentrate rents among wealthy incumbents, and points programs are unsustainable bribery. The optimal design uses speedbump access to the book, charges takers a fee, pays a portion back to makers as a rebate per dollar of volume, and moves the two in lockstep — so that makers remain viable when their rebate-per-dollar exceeds adverse selection costs, and takers participate when execution costs fall below their alpha or hedging threshold. Hyperliquid (200ms blocks with tiered taker fees) and Lighter (variable latency speedbumps) are cited as real-world examples of this balanced approach.

`Read the paper <https://arxiv.org/abs/1907.11053>`__

A Tale of Two Anomalies: The Implications of Investor Attention for Price and Earnings Momentum
-------------------------------------------------------------------------------------------------

This paper by Kewei Hou (Ohio State University), Roger K. Loh (Nanyang Technological University), Lin Peng (City University of New York), and Wei Xiong (Princeton University and NBER) investigates how investor attention plays opposing roles in two major stock market anomalies: price momentum and earnings momentum. Using a comprehensive set of nine attention proxies — including trading volume (Turnover), Bloomberg terminal readership (Bloomberg AIA), SEC EDGAR downloads, social media activity (StockTwits, Tweets, Social Attention), Google search volume, news article counts, and institutional distraction — the authors construct a Composite Attention measure and test its interaction with momentum strategies using two-way portfolio sorts on CRSP common stocks from January 1967 to December 2022.

The central finding is that attention acts as a double-edged sword: it amplifies overreaction-driven price momentum while dampening underreaction-driven earnings momentum. When investors pay less attention to earnings news, stock prices underreact, generating stronger post-earnings-announcement drift. When attention is high, behavioural biases such as overconfidence and trend extrapolation intensify, fuelling stronger price momentum. The paper also documents important heterogeneity across attention channels: institutional attention (Bloomberg AIA) reduces earnings momentum without amplifying price momentum, consistent with rational information processing, whereas retail-oriented and social media attention strongly amplifies price momentum through behavioural bias channels. Interestingly, social media attention also attenuates earnings momentum, suggesting that even retail participants contribute to price discovery when focusing on fundamental signals. High-attention stocks exhibit stronger long-term price reversals after months 7-8, confirming the overreaction interpretation, while earnings momentum for low-attention stocks shows no reversal over 24 months.

Key metrics from the portfolio analysis: using Composite Attention, high-attention stocks generate price momentum excess returns of 47-74 bps/month more than low-attention stocks across factor models (rising to 64-91 bps/month with orthogonalised measures). Conversely, earnings momentum profits are 99-119 bps/month stronger for low-attention stocks. With Turnover as the attention proxy, the High-Low price momentum spread is 135 bps/month in excess returns and 80-102 bps/month in factor alphas, while earnings momentum spreads are -88 bps excess and -100 to -119 bps in alphas. Social media attention produces the largest differentials: price momentum High-Low spread of 234-308 bps/month, and earnings momentum spreads of 180-265 bps/month in favour of low-attention stocks. Bloomberg AIA yields earnings momentum High-Low differences of 132-159 bps/month. Results are robust to cross-sectional regressions, independent portfolio sorts, size controls, and exclusion of momentum crash months.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5202255>`__

Don't Mix What Should Be Separated: Why Combining Value and Momentum Signals Destroys Alpha
--------------------------------------------------------------------------------------------

This paper addresses a practical but underexplored question in factor investing: how should value and momentum signals be combined within a portfolio? While the negative correlation between value and momentum is well-documented and provides substantial diversification benefits, the existing literature has devoted limited attention to whether these factors should be blended into a single composite ranking or maintained as independent portfolio sleeves. The author conducts a rigorous empirical comparison of two approaches using the Top 1,000 U.S. equities over the period 2000–2026, with long/short dollar-neutral portfolios, monthly rebalancing, and 100 positions per side. The combined ranking method integrates value and momentum signals into a single composite score, while the separate sleeves method maintains independent value and momentum long/short portfolios within a multi-strategy book.

The central finding is that the separate sleeves approach delivers superior risk-adjusted performance despite producing a lower raw return. The key mechanism is that the combined ranking method structurally dilutes the negative correlation between value and momentum return streams, destroying the very diversification benefit that justifies combining these factors in the first place. The separate sleeves framework preserves this negative correlation at −0.349, which functions as an organic diversification mechanism. A volatility-matched comparison confirms the separate sleeves methodology outperforms by 52 basis points annualised when both strategies are equalised at the same risk level.

Key metrics: the combined ranking method produces a higher annualised return of 3.01% versus 2.73% for separate sleeves, but the separate sleeves approach achieves a higher Sharpe ratio (0.168 vs 0.157), substantially lower volatility (5.51% vs 7.71%), and a markedly shallower maximum drawdown (−17.48% vs −26.61%). The paper notes practical trade-offs including increased trading intensity and position count inherent to the separate sleeves method, tail risks associated with shorting momentum losers, and the need for further validation across international markets.

By Carlos Morales (Independent).

Mentioned by Carlos Morales Martínez in `this LinkedIn discussion <https://www.linkedin.com/posts/carlos-morales-martinez_factorinvesting-quantitativefinance-systematicinvesting-share-7447946008820486144-lCg5>`__: "Most quant investors combine value and momentum into one composite ranking. It seems logical: put everything in one model, let the system pick the best stocks. But my research shows the opposite works better."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6255159>`__

The Price Impact of Order Book Events
-------------------------------------

This paper studies the price impact of order book events — limit orders, market orders, and cancellations — using the NYSE TAQ data for 50 U.S. stocks. Rama Cont, Arseniy Kukanov, and Sasha Stoikov show that price changes are mainly driven by the *order flow imbalance* (OFI), defined as the net of buy-side minus sell-side activity at the best bid and ask. They find a linear relation between OFI and contemporaneous price changes, with a slope that varies inversely with market depth. The relationship is stable across stocks, sample periods, and intraday time scales, in contrast to the noisier "square-root" price impact law based on volume alone.

Our summary: rather than modelling price impact as a function of traded volume, the authors argue that the relevant state variable for high-frequency price dynamics is the imbalance in the *full* event stream at the top of book. Cancellations and limit-order arrivals carry as much information as executions, and aggregating them into a signed flow gives a compact, linear predictor of mid-price moves. This reframes microstructure prediction around a directly observable ladder quantity that can be computed from raw Level-1/Level-2 feeds, and provides a theoretical bridge explaining why the classical volume-based square-root law appears at coarser horizons.

Key metrics: using 50 NYSE stocks over April–June 2008, the authors report a linear regression of 10-second mid-price changes on OFI with R² values typically in the 50–70% range across stocks, far exceeding the explanatory power of trade volume alone. The OFI price-impact coefficient is inversely proportional to average market depth, with the relationship holding across time-of-day buckets and different aggregation intervals from seconds to minutes.

`Read the paper <https://arxiv.org/abs/1011.6402>`__

Queue Imbalance as a One-Tick-Ahead Price Predictor in a Limit Order Book
-------------------------------------------------------------------------

Martin D. Gould and Julius Bonart investigate whether bid/ask queue imbalance at the top of a limit order book can predict the direction of the next mid-price move. Using LOBSTER data for 10 liquid Nasdaq stocks, they build both a binary classifier for the sign of the next mid-price change and a probabilistic classifier estimating the probability of an upward move, fitted via logistic regression on the queue imbalance ratio. They document a strongly statistically significant relationship between imbalance and subsequent price direction, especially for large-tick stocks where the queue state dominates short-horizon dynamics.

Our summary: the authors formalise the common HFT intuition that "the thin side gets picked off first" as a rigorous, testable one-tick-ahead predictor. Rather than using raw queue *sizes*, they show the correct state variable is the normalised *ratio* I = Qᵇ / (Qᵇ + Qᵃ), and that a simple logistic regression on this single scalar already captures much of the predictable short-term structure. They also test a semi-parametric local logistic regression variant that fits the relationship non-parametrically, which yields modest improvements at the cost of more computation. The result is a minimal, transparent baseline that any microstructure model should beat before adding complexity.

Key metrics: for large-tick stocks, the logistic queue-imbalance classifier outperforms the null baseline substantially, achieving strong McFadden pseudo-R² values and classification accuracies well above 50% on the next mid-price move. For small-tick stocks, the improvement is more modest, reflecting the diminished role of top-of-book state when price levels are finely spaced. Local logistic regression adds a small but statistically meaningful boost over standard logistic regression across the universe.

`Read the paper <https://arxiv.org/abs/1512.03492>`__

The Micro-Price: A High-Frequency Estimator of Future Prices
------------------------------------------------------------

Sasha Stoikov defines the *micro-price* as the limit of a sequence of martingale mid-price estimates conditioned on the order book state. Formally, Pᵗᵐⁱᶜʳᵒ = lim Pᵗⁱ, where Pᵗⁱ = E[M_{τᵢ} | ℱₜ] and τ₁, …, τₙ are the (random) times at which the mid-price next changes. The order book state is summarised by the triple (Mₜ, Iₜ, Sₜ) — mid-price, imbalance Iₜ = Qᵇ/(Qᵇ+Qᵃ), and bid-ask spread Sₜ — and assumed to form a Markov process whose dynamics are independent of the price level. Under these assumptions, the micro-price is a Markovian, martingale, and computationally tractable adjustment to the mid-price.

Our summary: the paper provides a principled answer to the question "what is the fair value of an asset given its order book?" The mid-price is not a martingale because of the bid-ask bounce, and the volume-weighted mid-price *Mʷ = I·Pᵃ + (1−I)·Pᵇ* produces counter-intuitive behaviour (e.g., the "fair" price can move *down* after a cancellation on the ask side). Stoikov's micro-price fixes both issues by iterating the conditional expectation until convergence, yielding a fair value that lives between the bid and ask and reacts smoothly to changes in imbalance and spread. The resulting estimator can be pre-computed as a table indexed by (I, S) and used as a continuous predictive signal rather than a discrete trading trigger. Empirically, it is a better short-term predictor than either the mid-price or the weighted mid-price and serves as a standard building block for high-frequency market making and execution models.

Key metrics: Stoikov reports empirical results on Nasdaq data for liquid stocks showing that the micro-price dominates both the mid-price and the weighted mid-price as a predictor of future mid-price realisations at horizons of a few ticks. The micro-price adjustment can be material — a significant fraction of the spread for imbalanced books — and is reported as a smooth, bounded function of imbalance that vanishes at the extremes.

`Read the paper <https://www.tandfonline.com/doi/full/10.1080/14697688.2018.1489139>`__

Deep Order Flow Imbalance: Extracting Alpha at Multiple Horizons from the Limit Order Book
------------------------------------------------------------------------------------------

Petter N. Kolm, Jeremy Turiel, and Nicholas Westray apply deep learning to high-frequency return prediction for 115 Nasdaq-listed stocks using the full depth of the limit order book. Their central finding is that models trained on *order flow* features (stationary increments at each level of the book) significantly outperform models trained on raw order book *states* (volumes at each level). They show that simple LSTM and feed-forward neural network architectures trained on multi-level order-flow imbalance features deliver superior predictive performance to more elaborate architectures fed raw state, and the predictions remain useful across multiple forecasting horizons.

Our summary: the paper generalises the Cont–Kukanov–Stoikov OFI idea by (a) extending order flow imbalance beyond the top of book to all quoted levels, (b) making the features properly stationary so that neural networks can learn from them without collapsing, and (c) comparing forecasting performance across horizons rather than at a single fixed lag. The result is a practical recipe for feature engineering in deep microstructure models: instead of feeding raw book snapshots into a network and hoping it learns the right invariance, construct multi-level OFI features first and let the network focus on the nonlinear dynamics. The authors also document cross-sectional heterogeneity — some stocks are "information-rich" with higher predictability, and useful stock-specific forecasts extend to roughly two average price changes.

Key metrics: across 115 Nasdaq stocks, deep OFI models achieve materially higher out-of-sample R² than models trained on raw book states at short horizons (seconds to tens of seconds). Forecasting performance degrades gracefully with horizon but remains significant out to approximately two average mid-price moves per stock. LSTM variants give a modest lift over feed-forward networks once the input is already stationary OFI, suggesting most of the predictable signal lives in the feature construction rather than the architecture.

`Read the paper <https://ideas.repec.org/a/bla/mathfi/v33y2023i4p1044-1081.html>`__

Crypto Carry
------------

Maik Schmeling, Andreas Schrimpf, and Karamfil Todorov (BIS Working Paper 1087) analyse the dynamics of the carry — the difference between futures and spot prices — in bitcoin and ether derivatives. They document that crypto carry can exceed 40% per annum with substantial time variation and trace this to two forces: demand from smaller trend-chasing investors seeking leveraged long exposure, and limited arbitrage capital due to regulatory, funding, and margin frictions on the short side.

Our summary: this is the most rigorous academic treatment of the crypto cash-and-carry basis and its predictive content. Interest-rate differentials explain almost none of the variation in crypto carry; the dominant driver is a time-varying convenience yield linked to speculative demand for long leverage. Crucially, high carry is not a free lunch — it acts as a crash-risk premium. The paper explicitly shows that a 10% rise in standardised carry predicts roughly a 22% increase in short-futures liquidations as a fraction of total open interest over the following month, and is associated with richer option-implied crash-risk insurance. This reframes the perp-spot basis not just as an arbitrage target but as a state variable for tail risk.

Key metrics: the authors report crypto carry reaching peaks above 40% annualised across bitcoin and ether futures venues (CME and crypto-native exchanges). Predictive regressions of one-month-ahead short-side liquidations (scaled by open interest) on standardised carry produce statistically significant positive coefficients, implying ~2.2% liquidation response per 1% carry standardisation. Similar predictive content shows up in option skew changes. The carry premium is orders of magnitude larger than in traditional FX carry trades, and the drivers are structurally different.

`Read the paper <https://www.bis.org/publ/work1087.pdf>`__

Fundamentals of Perpetual Futures
---------------------------------

Songrun He, Asaf Manela, Omri Ross, and Victor von Wachter derive no-arbitrage prices for perpetual futures contracts in both frictionless and cost-adjusted markets. Unlike fixed-maturity futures, perpetual futures have no expiry date, so the usual convergence argument that pins the price to spot at maturity does not apply. Instead, alignment with spot is enforced only by the periodic funding mechanism. The paper derives explicit bounds on the perp-spot deviation in the presence of trading costs and funding frictions, and empirically characterises those deviations across major crypto venues.

Our summary: this paper provides the theoretical backbone for treating the perp-spot basis and funding rate as joint predictive signals. The key result is that perpetual futures are not guaranteed to track spot, so any persistent basis deviation is informative. Deviations are larger in crypto than in traditional FX perpetual analogues, comove strongly across coins (suggesting a common market-wide factor), and decline over time as markets mature — both of which are testable predictions for any trading model that uses basis features. The authors further show that the size of the current deviation is itself a predictor of the next funding payment, which ties the two signals together in a theoretically grounded way.

Key metrics: the authors construct an explicit arbitrage strategy — going long (or short) spot and taking the opposite side in the perpetual — that captures funding payments on BitMEX, Binance, FTX, and OKX. The reported Sharpe ratios of the arbitrage portfolio are high across all exchanges, with the cross-venue strategy delivering materially better risk-adjusted returns than any single-venue implementation. Measured deviations of perp prices from their no-arbitrage values are an order of magnitude larger in crypto than in perpetual-style FX contracts.

`Read the paper <https://arxiv.org/abs/2212.06888>`__

Perpetual Futures Pricing
-------------------------

Damien Ackerer, Julien Hugonnier, and Urban Jermann derive closed-form no-arbitrage prices for linear, inverse, and quanto perpetual futures contracts in both discrete and continuous time. The paper provides the first fully tractable pricing framework that accounts for the random-maturity nature of perpetuals (the funding mechanism can be viewed as a stream of infinitesimal settlements) and for the distinct payoff geometries of the three main contract types used in crypto derivatives markets.

Our summary: this is the canonical theoretical reference for anyone modelling perpetuals. The authors show that under standard diffusion assumptions, the perpetual-spot basis and the funding rate together encode information about expected spot returns and convenience yields, formalising the intuition behind all the empirical basis/funding predictability papers. Their framework allows a clean decomposition of observed basis into a "fair" component implied by the funding mechanism and a deviation term that can be interpreted as either an arbitrage opportunity or a risk premium. The paper is calibrated to bitcoin perpetual data and provides an explicit benchmark against which to measure empirical dislocations.

Key metrics: under the authors' calibration to BTC perpetuals, observed funding rates and basis deviations line up well with the model's predictions in normal market conditions but diverge in stress episodes. The divergence itself carries information content, consistent with the crash-prediction findings of Schmeling et al. and Gornall et al.

`Read the paper <https://finance.wharton.upenn.edu/~jermann/AHJ-main-10.pdf>`__

Anatomy of Cryptocurrency Perpetual Futures Returns
----------------------------------------------------

Yi Cao, Pengfei Luo, Yuhan Cheng, and Yizhe Dong (University of Edinburgh) develop a cost-of-carry model tailored specifically to perpetual contracts and use it to decompose perpetual futures returns into a spot premium, a log basis, and an expected funding spread. They then run the most comprehensive horse race to date of candidate return predictors in the cross-section of crypto perpetuals, testing 134 signals drawn from the basis, momentum, volume, size, and volatility literatures.

Our summary: this is the paper to cite when arguing that basis is the dominant cross-sectional predictor in crypto perpetual futures. Of the 134 candidates tested, 48 deliver statistically significant cross-sectional spreads at the 5% level, and every single one of them is spanned by a two-factor model built from a basis factor and a price–volume factor. In other words, after controlling for basis and price–volume, no other signal in their universe carries incremental predictive power. This is a strong empirical argument for placing the perp-spot basis at the centre of any cross-sectional crypto strategy and treating other signals as secondary.

Key metrics: cross-sectional sorts on basis deliver statistically significant long-short spreads in perpetual futures returns, and the basis factor is the single strongest predictor among the 134 candidates tested. The two-factor (basis + price–volume) model prices all 48 significant anomalies with zero significant alphas. The paper does not report a single headline Sharpe but documents the basis factor as economically and statistically dominant.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6365329>`__

An Empirical Investigation on Risk Factors in Cryptocurrency Futures
--------------------------------------------------------------------

Yeguang Chi, Wenyan Hao, Jiangdong Hu, and Zhenkai Ran (Journal of Futures Markets 2023) test basis, momentum, and basis-momentum factors — borrowed from the commodity futures literature — in the cross-section of cryptocurrency futures from 2017 to 2021. They construct long-short factor portfolios sorted on each signal and measure their premia at daily, weekly, and monthly frequencies.

Our summary: the paper confirms that basis is the strongest single predictor of cross-sectional crypto futures returns, echoing Cao et al. A novel finding is that the basis-momentum factor — a robust premium in commodities — has a statistically significant raw return in crypto but is entirely subsumed by the basis factor once you control for it. Most importantly for implementation, the predictive content of basis is high-frequency: daily factor returns are strongest, weekly returns are weaker, and monthly returns are insignificant. This matters a lot for anyone building a basis-factor strategy — the alpha lives at daily or faster horizons.

Key metrics: daily long-short portfolios sorted on basis deliver statistically significant excess returns and Sharpe ratios that exceed momentum and basis-momentum factors in the same universe. The basis premium shrinks monotonically as the rebalancing frequency drops from daily to weekly to monthly, with the monthly premium indistinguishable from zero. Commodity-style basis-momentum has zero incremental alpha after controlling for basis.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4657014>`__

The Risk and Return of Cryptocurrency Carry Trade
--------------------------------------------------

Zhenzhen Fan, Feng Jiao, Lei Lu, and Xin Tong build a cryptocurrency carry trade analogous to the classical FX carry trade, going long high-funding-rate coins and shorting low-funding-rate coins on perpetual futures markets. They run the strategy across a broad universe of perpetual contracts and decompose the returns to understand which leg is doing the work and how well the returns are explained by standard crypto risk factors.

Our summary: this is the cleanest cross-sectional implementation of "funding rate as a predictive signal" in the literature. The carry trade works, but the returns are heavily concentrated on the short leg — i.e., the money comes from *receiving* funding on contracts where funding is extreme, not from the long side. The returns are not spanned by standard crypto factors (BTC, size, momentum, volatility), so funding is capturing a genuinely distinct premium. The paper also highlights important differences from FX carry: crypto carry is more volatile, more prone to crashes, and structurally dependent on exchange-specific funding caps.

Key metrics: the cross-sectional funding-rate carry strategy delivers roughly 43.4% annualised return with a Sharpe ratio of about 0.74, with the short leg contributing the majority of both the return and the alpha. The strategy loads significantly on a crypto illiquidity factor and retains positive alpha against a five-factor model built from standard crypto risk factors.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4666425>`__

The Crypto Carry Trade
----------------------

Nicolas Christin, Bryan Routledge, Kyle Soska, and Ariel Zetlin-Jones (Carnegie Mellon) study the long-spot, short-perpetual cash-and-carry trade in bitcoin. They document very large in-sample Sharpe ratios for the strategy and attribute the profits to differences of opinion between leveraged long speculators and capital-constrained arbitrageurs, amplified by exchange funding caps.

Our summary: this is the paper that first quantified just how large the cash-and-carry carry can be in crypto, and it is the reference point for anyone who claims that "funding rate = free money". The authors carefully separate USDT-settled perps (where carry is richest) from coin-settled perps (where the premium is smaller but still very large) and show that the USDT/coin gap maps directly onto differences in collateral constraints and funding caps. They also decompose carry into a mark-price premium plus an interest component, which lines up with the Ackerer–Hugonnier–Jermann pricing framework. The reported Sharpes are in-sample and benefit from not fully accounting for liquidation risk and exchange risk — but even after generous haircuts, the strategy is extraordinarily profitable relative to traditional carry trades.

Key metrics: in-sample annualised Sharpe ratios of approximately 12.8 for USDT-settled bitcoin perpetuals and 7.0 for coin-settled bitcoin perpetuals. Returns are tightly linked to the level and stickiness of the funding rate and are constrained by exchange-imposed funding caps. Tick-level data from Binance and BitMEX.

`Read the paper <https://www.andrew.cmu.edu/user/azj/files/CarryTrade.v1.0.pdf>`__

Perpetual Futures and Basis Risk: Evidence from Cryptocurrency
--------------------------------------------------------------

Will Gornall, Martin Rinaldi, and Yizhou Xiao compare perpetual versus quarterly bitcoin futures contracts and argue that the small, frequent funding payments embedded in perpetuals materially reduce basis risk during market crises. They develop a tractable model of capital-constrained arbitrage and test its predictions on BitMEX, Binance, and CME futures around large spot moves.

Our summary: this paper is the best explanation of *why* perpetuals dominate crypto derivatives volume. Dated futures are structurally fragile in crises because the basis is sensitive to the remaining time to expiry and to collateral availability, so during stress episodes the quarterly basis can blow out by 8–10%, eating through all of the expected carry in a single day. Perpetuals, by contrast, settle PnL continuously via funding payments, which damps the basis dislocation to around 3% in the same stress episodes. The practical implication for basis-trading strategies is that perpetuals are a far better instrument than quarterlies for cash-and-carry during volatile regimes, and funding-rate-based entry rules inherit this crisis-resilient property.

Key metrics: during large spot moves, quarterly bitcoin futures dislocate from spot by 8–10%, while perpetuals dislocate by only ~3%. Drawdowns of common cash-and-carry arbitrage strategies are cut by more than half when implemented on perpetuals instead of quarterlies. The comparison holds across BitMEX, Binance, and CME.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5036933>`__

Predictability of Funding Rates
-------------------------------

Emre Inan runs an out-of-sample forecasting study of perpetual futures funding rates on bitcoin contracts traded on Binance and Bybit. Using double-autoregressive (DAR) models, the paper evaluates forecast quality against a no-change benchmark across multiple horizons and tests for regime-dependence of predictability.

Our summary: most of the crypto basis literature treats the funding rate as a contemporaneous signal (carry, cross-section). This paper instead asks the simpler but important question: can you predict the *next* funding rate from its own history? The answer is yes — DAR models outperform the random-walk benchmark in both forecast error and directional accuracy across Binance and Bybit BTC perpetual contracts. The predictability is time-varying, suggesting regime dependence, which matches the stylised fact that funding rates mean-revert slowly in range-bound regimes and jump sharply around trend reversals. This is a useful building block for any strategy that needs a forward estimate of funding.

Key metrics: DAR-based forecasts beat the no-change benchmark in RMSE, MAE, and directional accuracy across multiple horizons on both Binance and Bybit. Predictability varies through the sample — stronger in stable regimes, weaker during stress — consistent with regime-dependent funding-rate dynamics.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5576424>`__

Arbitrage Opportunities and Efficiency Tests in Crypto Derivatives
------------------------------------------------------------------

Carol Alexander, Xi Chen, Jun Deng, and Tianyi Wang test joint efficiency of bitcoin and ether options and perpetual futures markets using a fiat-currency-free put–call parity relation. They identify the determinants and time-variation of cross-market arbitrage profits and quantify how arbitrage profitability has evolved as crypto derivatives markets have matured.

Our summary: the paper extends the basis/funding predictability toolkit to include options. Their put–call parity relation ties together spot, perpetual futures, and options on a single instrument and provides a unified framework for detecting mispricings across all three markets. The arbitrage strategies that exploit these mispricings remain profitable after slippage, especially during high-volume and congestion regimes, although the opportunities are shrinking over time as liquidity improves. BTC markets are measurably more efficient than ETH markets. For a basis-trading model, this paper provides a rigorous benchmark against which to measure whether observed deviations represent tradable alpha or just execution friction.

Key metrics: arbitrage strategies linking perpetuals and options remain profitable even after slippage, especially in high-volume and congestion regimes. BTC derivatives markets are more efficient than ETH, and efficiency is improving over time, particularly for options with maturity ≥ 15 days. Deribit-sourced option data combined with perp data from major venues.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4495548>`__

The Relationship Between Arbitrage in Futures and Spot Markets and Bitcoin Price Movements
------------------------------------------------------------------------------------------

Takahiro Hattori and Ryo Ishida use intraday CBOE bitcoin futures and Gemini spot data to reconstruct the actual cash-and-carry condition faced by arbitrageurs in real time. They test how arbitrage profit opportunities vary across calm and crash regimes and relate the dislocation to capital constraints on the short side.

Our summary: this paper documents the uncomfortable truth about basis-based trading in crypto: the basis becomes most attractive exactly when you are least able to trade it. In normal markets, cash-and-carry opportunities are rare and small. During bitcoin crashes, the basis blows out dramatically — but exactly those episodes are when arbitrage capital is constrained, margin requirements jump, and liquidation risk is highest. This is a textbook limits-to-arbitrage story applied to crypto, and it mirrors Gornall et al.'s finding that quarterlies dislocate much more than perpetuals during crises. For anyone building a basis-trading strategy, the practical lesson is to size for the tails, not the averages.

Key metrics: the paper documents statistically significant widening of cash-and-carry arbitrage spreads during bitcoin crash episodes, with the basis reaching levels many standard deviations above normal-regime values. Arbitrage is typically unavailable outside these stress regimes. High-frequency CBOE-Gemini matched-pair data.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3209625>`__

The Two-Tiered Structure of Cryptocurrency Funding Rate Markets
---------------------------------------------------------------

This study builds a high-frequency panel of perpetual funding rates spanning 26 exchanges (11 centralised, 15 decentralised) covering 749 symbols and roughly 35.7 million 1-minute observations over 8 days. It studies price discovery and arbitrage between CEX and DEX funding markets using Hasbrouck-style information share decompositions and transaction-cost-adjusted arbitrage backtests.

Our summary: this is the first paper to rigorously quantify the directional information flow between CEX and DEX funding rates. CEX funding leads DEX funding with no detectable reverse causality — about a 61% higher integration on the CEX side — meaning any cross-venue basis signal should be interpreted as CEX setting the mark and DEX adjusting to it. The paper also documents that roughly 17% of observations exhibit ≥20 basis point arbitrage spreads between venues, but only about 40% of the largest opportunities yield positive PnL after transaction costs. For anyone building a multi-venue funding-rate strategy, this provides both a benchmark (how much alpha is theoretically available) and a sobering check (how much survives execution).

Key metrics: CEX funding markets lead DEX markets with ~61% higher price discovery integration; ~17% of 1-minute observations show ≥20bp cross-venue arbitrage spreads; only ~40% of the top opportunities yield positive transaction-cost-adjusted PnL. High-frequency panel of 26 exchanges and 749 symbols.

`Read the paper <https://www.mdpi.com/2227-7390/14/2/346>`__

Exploring Risk and Return Profiles of Funding Rate Arbitrage on CEX and DEX
---------------------------------------------------------------------------

This paper reports an empirical study of delta-neutral funding-rate arbitrage strategies implemented on both centralised (Binance, BitMEX) and decentralised (Drift, ApolloX) perpetual venues across BTC, ETH, XRP, BNB, and SOL. The strategies long spot and short perpetuals (or vice versa) to harvest funding payments while eliminating directional price risk.

Our summary: this paper documents some of the highest in-sample Sharpe ratios ever reported for a crypto trading strategy, driven by the very wide funding spreads available on DEX venues that have lower competition and thinner arbitrage capital. It's a useful reference point for the upper bound of what funding-rate harvesting can deliver under favourable conditions — but the reported numbers should be read with care, because the sample period is short, the DEX venues are niche, and the strategy's capacity is limited by each venue's liquidity. That said, the paper makes the useful point that the CEX/DEX funding-rate gap is a structural feature driven by market maturity rather than a transient inefficiency.

Key metrics: reported Sharpe ratios of approximately 23.55 on Drift and 6.50 on ApolloX for funding-rate arbitrage strategies, versus ~2.89 for a HODL benchmark. Up to 115.9% return over six months with maximum drawdown around 1.92%. Backtests cover BTC, ETH, XRP, BNB, and SOL perpetual contracts.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S2096720925000818>`__

Multi-Level Order-Flow Imbalance in a Limit Order Book
------------------------------------------------------

Ke Xu, Martin D. Gould, and Sam D. Howison (University of Oxford) define *multi-level order-flow imbalance* (MLOFI) as a vector quantity that tracks the net buy-sell flow at each quoted price level of a limit order book, not just the best bid and ask. Using high-resolution Nasdaq data for 6 liquid stocks, they fit a simple linear regression of the contemporaneous mid-price change onto the stacked MLOFI vector and measure how out-of-sample goodness-of-fit changes as deeper book levels are added.

Our summary: this is the canonical extension of Cont–Kukanov–Stoikov's top-of-book OFI to the full book depth. The methodology is deliberately simple — a linear model, no deep learning — and the point is to isolate the marginal information content of each additional price level. The authors find monotonic R² improvements for every one of the 6 stocks tested as levels are added, which is strong evidence that resting liquidity deeper in the book carries real information about the short-term price-formation process and is not just noise. For any microstructure model, the practical takeaway is to feature-engineer MLOFI across all levels rather than truncating at the top of book.

Key metrics: out-of-sample R² monotonically improves with each additional price level for all 6 Nasdaq stocks tested, with the marginal contribution diminishing but remaining positive well beyond the top of book. The linear MLOFI model is shown to meaningfully outperform best-level OFI.

`Read the paper <https://arxiv.org/abs/1907.06230>`__

Deep Limit Order Book Forecasting
---------------------------------

Antonio Briola, Silvia Bartolucci, and Tomaso Aste (University College London) use state-of-the-art deep learning models to forecast short-horizon mid-price moves from limit order book data for a heterogeneous set of Nasdaq stocks. They release ``LOBFrame``, an open-source codebase for large-scale LOB processing and deep model benchmarking, and they introduce a novel operational evaluation metric based on the probability of accurately forecasting *complete transactions* rather than mid-price moves.

Our summary: this is the paper to cite whenever someone claims a high-accuracy deep LOB model. The authors show that (a) standard classification metrics (F1, accuracy) on mid-price direction systematically *overstate* the economic usefulness of a forecaster, and (b) the same architecture performs very differently across stocks with different microstructural regimes, so one-size-fits-all benchmarking is misleading. Their proposed operational metric asks "given the forecast, what is the probability of capturing a complete round-trip transaction at a reasonable spread?" — a framing that aligns the model with actual trading P&L rather than label guessing. The stark headline from the paper is that "high forecasting power does not necessarily correspond to actionable trading signals", which should be the warning label on every deep LOB result.

Key metrics: the paper reports that forecasting performance varies strongly with stock-level microstructural regime and that standard classification metrics routinely overstate actionability. The operational transaction-forecasting metric is substantially harder to beat and brings deep model performance closer to economic reality.

`Read the paper <https://arxiv.org/abs/2403.09267>`__

Cross-Impact of Order Flow Imbalance in Equity Markets
------------------------------------------------------

Rama Cont, Mihai Cucuringu, and Chao Zhang (Oxford) investigate cross-asset order-flow-imbalance effects in a multi-asset equity setting. They propose a systematic way to combine OFIs at the top levels of the limit order book into an *integrated OFI* variable and test whether lagged cross-asset OFIs add predictive power for future returns beyond the contemporaneous impact of own-asset OFI.

Our summary: this paper answers an important but previously neglected question — is the OFI of stock A useful for predicting the return of stock B? The authors show first that integrating OFI across multiple LOB levels (following the MLOFI line of work) dominates a best-level-only construction, and second that once you have properly integrated multi-level own-OFI, cross-asset *contemporaneous* cross-impact vanishes — sparse single-asset models explain as much as dense cross-impact models. However, *lagged* cross-asset OFI does improve short-horizon return forecasting, and that lead-lag information decays rapidly. Practical takeaway: for contemporaneous price-impact modelling, focus on own-asset multi-level OFI; for short-horizon return prediction, a small amount of lagged cross-sectional OFI adds value.

Key metrics: integrated multi-level OFI materially outperforms best-level OFI for contemporaneous impact; lagged cross-asset OFIs add meaningful forecasting power over short horizons with rapid decay. Published in Quantitative Finance Vol 23 Issue 10 (2023), pp 1373–1393.

`Read the paper <https://arxiv.org/abs/2112.13213>`__

Bitcoin Wild Moves: Evidence from Order Flow Toxicity and Price Jumps
---------------------------------------------------------------------

Atiwat Kitvanitphasu, Khine Kyaw, Tanakorn Likitapiwat, and Sirimon Treepongkaruna study the dynamic relationship between order-flow toxicity (measured via VPIN) and Bitcoin price jumps using high-frequency data in a vector autoregression framework. Published in Research in International Business and Finance (2026), the paper integrates behavioural finance with market microstructure to understand how informed trading drives jumps and how traders respond.

Our summary: this is the single most directly relevant paper for "can microstructure features predict future large crypto moves?" Unlike the bulk of the OFI/LOB literature, which is pinned to horizons of seconds to a few price changes, this paper explicitly shows that VPIN *predicts* future Bitcoin price jumps in a VAR framework — not just contemporaneously. It also documents positive serial correlation in both VPIN and jump size (so both toxicity and jumps cluster), time-of-day and day-of-week patterns, and weak reverse feedback from jumps into VPIN. The jump detection is robust to the Jiang–Oomen test that explicitly accounts for microstructure noise. For a strategy trying to nowcast or short-horizon-forecast BTC crashes or breakouts, this is the primary academic anchor.

Key metrics: VPIN Granger-causes Bitcoin jump occurrence and size in a bipolar VAR; positive autocorrelation in VPIN and in jump magnitudes; significant time-of-day / day-of-week seasonality in VPIN levels; results are robust across Lee–Mykland and Jiang–Oomen jump detection tests.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0275531925004192>`__

High-Frequency Jump Analysis of the Bitcoin Market
---------------------------------------------------

Olivier Scaillet, Adrien Treccani, and Christopher Trevisan use the leaked Mt. Gox database — covering June 2011 through November 2013 with trader identifiers at a tick-transaction level — to study the jump dynamics of Bitcoin. The data provides a rare opportunity to observe an emerging retail-focused, highly speculative and unregulated market at the individual-trader level.

Our summary: this is the foundational jump-clustering paper for Bitcoin and a primary reference for anyone modelling crypto microstructure tail events. The authors document that jumps are frequent and temporally clustered, and they identify specific microstructure precursors — elevated order-flow imbalance, an increased share of aggressive (liquidity-taking) traders, and a widening bid-ask spread — that predict jump arrivals. Jumps cause short-term spikes in activity and illiquidity and, importantly, are associated with persistent changes in the price level, so the price does not mean-revert through them. The finding that OFI and aggressive-trader share predict jumps provides early academic support for the intuition that current feature-engineering projects try to operationalise.

Key metrics: jumps are frequent and cluster in time; OFI, aggressive-trader share, and widening bid-ask spread all predict jump arrivals with statistically significant coefficients; jumps correspond to short-term illiquidity spikes and persistent (non-reverting) price moves.

`Read the paper <https://arxiv.org/abs/1704.08175>`__

Good and Bad Self-Excitation in Bitcoin: Asymmetric Self-Exciting Jumps
-----------------------------------------------------------------------

Chuanhai Zhang, Zhengjun Zhang, Mengyu Xu, and Zhe Peng (Economic Modelling, 2023) model asymmetric self-exciting jump clustering in Bitcoin returns using a bivariate Hawkes-type jump process that separates positive ("good") and negative ("bad") jumps. The paper studies how each jump type contributes to subsequent jump intensity.

Our summary: this paper formalises the intuition that Bitcoin's tail risk is skewed — bad news begets more bad news faster than good news begets more good news. The bivariate Hawkes setup allows separate branching ratios for good and bad jumps and tests whether they are different. The empirical answer is clear: negative self-excitation is strictly stronger than positive self-excitation, with longer persistence. The asymmetry is much more pronounced in bear regimes than in bull regimes. For any strategy that wants to exploit jump clustering, this paper is the reference for why a single symmetric Hawkes process misses structurally important behaviour, and why the downside jump channel deserves its own modelling.

Key metrics: negative jumps trigger substantially more subsequent volatility than positive jumps; the asymmetry holds in bear markets and is muted in bull markets; aftershocks of bad self-excitation persist longer than those of good self-excitation.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0264999322003613>`__

Nowcasting Bitcoin's Crash Risk with Order Imbalance
-----------------------------------------------------

Dimitrios Koutmos (Texas A&M – Corpus Christi) and Wang Chun Wei (Realindex Investments) build an early-warning system for Bitcoin price crashes using generalized extreme value (GEV) and logistic regression models. Their feature set integrates order-flow imbalance with blockchain-activity and network-value controls, on daily Bitcoin data from 1 April 2013 to 15 January 2023 (3,577 days).

Our summary: this is the clearest-cut empirical study of order imbalance as a *crash predictor* on Bitcoin at the daily horizon. The authors define a crash as a daily return at least one standard deviation below the mean (~−3.57%), giving 318 crash days or 8.89% of the sample. They show that adding OFI to a crash-nowcasting model dramatically improves explanatory power over models that use only blockchain / network fundamentals. The best logistic specification (model 3.5) reaches a McFadden pseudo-R² of 30.74%, with the GEV variant at 29.95% — both extremely high for a binary daily crash model. This is strong empirical backing for the idea that daily-aggregated order imbalance is an input to a BTC tail-risk timing model, even if it is not a timing signal for normal market moves.

Key metrics: McFadden pseudo-R² of 30.74% (logistic) and 29.95% (GEV) on the best specification; 318 crash days out of 3,577 (8.89% base rate); OFI materially improves crash nowcasting versus on-chain and network-value controls alone. Published in Review of Quantitative Finance and Accounting (2023).

`Read the paper <https://pmc.ncbi.nlm.nih.gov/articles/PMC10040314/>`__

Where Is the Price of Bitcoin Determined? Price Discovery in a Fragmented Market
--------------------------------------------------------------------------------

Riccardo Cosenza and Simon Stalder investigate price discovery for Bitcoin across regulated and unregulated spot and perpetual-futures venues using high-frequency data in both fiat and stablecoin markets. They apply Hasbrouck information shares, Gonzalo–Granger component shares, and Putniņš information-leadership shares in a trivariate VECM with FX, as well as bivariate VECMs with prices converted to a common currency.

Our summary: this is the reference paper for the question "which venue sets the Bitcoin price?" The answer is blunt: unregulated crypto-native venues (primarily Binance spot and perpetual futures) dominate price discovery during the vast majority of trading hours. Regulated venues like Coinbase gain relative importance around specific fixing windows, notably the NY 4pm fixing used as an ETF NAV reference, but outside those windows they follow. Lower transaction costs, higher volume, and higher volatility all enhance a venue's price-discovery share. For any cross-venue aggregation strategy, this paper tells you where to look (Binance) and which intervals may exhibit different dynamics (NY afternoon). It also raises real regulatory concerns about the reference price for Bitcoin ETFs.

Key metrics: Binance's information share dominates across most hours of the trading day; Coinbase's share rises around the NY 4pm fixing; information-leadership shares align with the intuition that lower-cost, higher-volume, higher-volatility venues lead price formation.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4983566>`__

Pricing Efficiency and Arbitrage in the Bitcoin Spot and Futures Markets
------------------------------------------------------------------------

Seungho Lee, Nabil El Meslmani, and Lorne N. Switzer (Concordia University) study Bitcoin pricing efficiency using spot prices alongside all CBOE and CME futures contracts traded from January 2018 to March 2019. They test cost-of-carry and no-arbitrage conditions and the predictive content of the futures basis for subsequent spot moves.

Our summary: this is the empirical complement to He–Manela–Ross–von Wachter's theoretical perpetuals-pricing work, focused on the dated futures era (CBOE XBT, CME BTC). The authors find that the futures basis has some predictive power for future spot-price changes and for the risk premium but is a *biased* predictor, so it cannot be used as a clean standalone signal. Cointegration tests confirm that futures prices are biased predictors of spot. Arbitrage deviations are persistent and, crucially, *widen substantially* around Bitcoin-specific events — security incidents (hacks) and alt-coin launches — which is the same limits-to-arbitrage pattern documented by Hattori–Ishida. Published in Research in International Business and Finance Vol 53 (2020).

Key metrics: basis has predictive power for future spot moves but is a biased predictor; cointegration/VECM tests confirm the bias; no-arbitrage deviations widen around hacks and alt-coin launches, matching the capital-constraints-in-crises pattern seen in other basis-crypto studies.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0275531919309808>`__

The 10 Reasons Most Machine Learning Funds Fail
-----------------------------------------------

Marcos López de Prado (Journal of Portfolio Management 2018) distils the ten most common methodological mistakes that cause quantitative ML funds to fail in practice. The paper is the canonical practitioner reference for the methodology family that follows: information-driven bars, triple-barrier labelling, meta-labelling, sample uniqueness, purged K-fold cross-validation, combinatorial purged CV, deflated Sharpe ratio, and probability of backtest overfitting.

Our summary: this is the single most important methodological paper for anyone doing serious machine-learning research on financial time series. It is prescriptive rather than empirical — the value is in the enumeration of pitfalls and the recipes to fix them. The ten pitfalls and their proposed remedies are: (1) the "Sisyphus" lone-PM research model → an assembly-line meta-strategy paradigm; (2) research-through-backtesting → feature-importance-driven research; (3) fixed chronological time bars → volume / dollar / information-driven bars; (4) integer differentiation → fractional differentiation; (5) fixed-time-horizon labelling → triple-barrier labelling; (6) learning direction and size jointly → meta-labelling; (7) ignoring the non-IID structure of financial data → uniqueness-weighted sample and sequential bootstrap; (8) leaky cross-validation → purging and embargoing; (9) walk-forward backtesting → Combinatorial Purged Cross-Validation (CPCV); (10) in-sample-maximised backtests → Deflated Sharpe Ratio. Every item on this list corresponds to a quantifiable source of bias or overfitting, and every one has a concrete fix. If a research project does not systematically address at least the last five items, its reported Sharpe is almost certainly inflated.

Key metrics: this is a methodological paper with no single headline number. The operational claim is that the vast majority of quantitative ML strategies fail out-of-sample because of one or more of the ten pitfalls, and that the listed corrections (CPCV, DSR, PBO, triple-barrier, meta-labelling, sample uniqueness) are individually necessary.

`Read the paper <https://www.garp.org/hubfs/Whitepapers/a1Z1W0000054x6lUAA.pdf>`__

The Deflated Sharpe Ratio: Correcting for Selection Bias, Backtest Overfitting and Non-Normality
------------------------------------------------------------------------------------------------

David H. Bailey (Lawrence Berkeley National Lab / UC Davis) and Marcos López de Prado (Cornell) introduce the Deflated Sharpe Ratio (DSR) — a closed-form correction to the standard Sharpe ratio that accounts for (i) selection bias under multiple testing when many trial strategies are evaluated, and (ii) non-normal return distributions via higher-moment terms (skewness and kurtosis). Published in The Journal of Portfolio Management (2014).

Our summary: the Sharpe ratio is a very unreliable performance metric in any research pipeline that tests more than a handful of candidate strategies. DSR addresses the root problem by computing the probability that the observed Sharpe of the *selected* strategy exceeds a given benchmark Sharpe, conditional on the number of trials, the cross-sectional variance of trial Sharpes, and the skewness and kurtosis of the selected strategy's returns. The result is a single probability that can be thresholded and compared across projects with very different research budgets. In practice, DSR is the mandatory deflator for any parameter-sweep or grid-search backtest; without it, reported Sharpes are systematically optimistic. DSR is one of the ten fixes enumerated in "10 Reasons Most Machine Learning Funds Fail" and is a direct prerequisite for publishable quantitative research.

Key metrics: methodological paper; provides the closed-form DSR formula and worked examples. The operational benefit is a probability-valued confidence statement about the true Sharpe, calibrated to the search budget used to find the strategy.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2460551>`__

The Probability of Backtest Overfitting
---------------------------------------

David H. Bailey, Jonathan M. Borwein, Marcos López de Prado, and Qiji Jim Zhu propose a general framework — Probability of Backtest Overfitting (PBO) — to assess the likelihood that a strategy selected as best in-sample will underperform the median strategy out-of-sample. They introduce Combinatorially Symmetric Cross-Validation (CSCV) as a model-free, non-parametric estimator of PBO. Published in the Journal of Computational Finance (2017).

Our summary: this is the companion paper to the Deflated Sharpe Ratio and the practical workhorse behind any honest evaluation of a multi-trial backtest. The authors demonstrate that standard hold-out and walk-forward evaluations are structurally unreliable for strategy selection — they consistently underestimate the true risk that the selected strategy is a lucky survivor of multiple testing. CSCV fixes this by partitioning the time series into S equally-sized blocks and exhaustively evaluating every combinatorially-symmetric assignment of blocks into in-sample and out-of-sample halves. For each configuration, it measures whether the IS winner underperforms the OOS median; the fraction of configurations in which this happens is the PBO estimate. The approach is model-free (no assumption about return distributions), non-parametric, and reasonably compute-efficient, and it directly quantifies overfitting risk as a single probability.

Key metrics: PBO is defined as the probability that the IS-best strategy underperforms the OOS-median strategy; CSCV gives reasonable empirical PBO estimates across examples in the paper; naive hold-out is shown to be systematically unreliable for strategy selection.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2326253>`__

Clustered Feature Importance
-----------------------------

Marcos López de Prado introduces Clustered Feature Importance (CFI) to address a major failure mode of standard Mean-Decrease-Impurity (MDI) and Mean-Decrease-Accuracy (MDA) feature-importance measures: the "substitution effect" that distorts importances when two or more features share predictive power. The methodology groups correlated / redundant features into clusters using the Optimal Number of Clusters (ONC) algorithm and then computes importance at the cluster level. Subsequently incorporated into *Machine Learning for Asset Managers* (Cambridge, 2020).

Our summary: any research pipeline that selects features by MDI or MDA is vulnerable to collinear-feature substitution — two correlated features will split the true importance between them, causing both to appear weakly important and potentially getting dropped. CFI is the right fix: cluster correlated features first, then compute importance on the clusters, either by shuffling all members of a cluster jointly (clustered MDA) or by aggregating impurity decreases across cluster members (clustered MDI). The cluster count is data-driven via ONC, which uses a silhouette-t-statistic elbow over candidate k values. The result is a feature-importance ranking that correctly identifies the importance of *groups* of substitutable features instead of being diluted by their collinearity. For microstructure feature libraries where OFI, book imbalance, and CVD are heavily correlated, CFI is essentially mandatory.

Key metrics: methodological paper; CFI is demonstrated to be robust to both linear and non-linear substitution effects and to recover the correct ranking of relevant feature groups in simulations where standard MDI/MDA fail.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3517595>`__

Does Meta-Labeling Add to Signal Efficacy?
------------------------------------------

Ashutosh Singh and Jacques Francois Joubert (Hudson & Thames, 2022) empirically evaluate whether meta-labelling — a secondary machine-learning classifier layered on top of a primary trading signal to predict whether to *act* on that signal — improves signal efficacy. They combine event-based sampling (CUSUM) with triple-barrier labels and test on S&P 500 E-mini futures tick data from July 2011 to February 2019.

Our summary: meta-labelling is one of the ten fixes in López de Prado's "10 Reasons" paper, and this whitepaper is the best compact empirical demonstration that the fix actually works. Two primary strategies are tested; for both, adding a meta-label classifier improves classification precision and accuracy substantially, and the improvements carry over (albeit more modestly) to the held-out test set. The intuition is that the primary signal decides the *side* of the trade, while the meta-label classifier decides the *size* — specifically whether to take the trade at all or skip it. Skipping low-confidence primary signals filters out a large share of false positives and dramatically reduces the noise in the P&L stream without requiring any change to the primary strategy itself.

Key metrics: Strategy 1 validation set — accuracy improves 20% → 77%, precision 0.21 → 0.39; Strategy 1 test (OOS) — accuracy 17% → 63%, precision 0.17 → 0.20. Strategy 2 validation — accuracy 37% → 56%, precision 0.37 → 0.42. Portfolio-level Sharpe and drawdown metrics also improve out-of-sample.

`Read the paper <https://hudsonthames.org/wp-content/uploads/2022/04/Does-Meta-Labeling-Add-to-Signal-Efficacy.pdf>`__

Algorithmic Crypto Trading Using Information-Driven Bars, Triple-Barrier Labeling and Deep Learning
---------------------------------------------------------------------------------------------------

Przemysław Grądzki, Piotr Wójcik (University of Warsaw), and Stefan Lessmann (Humboldt-Universität zu Berlin) apply the full López de Prado methodological pipeline — information-driven sampling, triple-barrier labels, meta-labelling — to Bitcoin and Ethereum trading, combined with a deep learning classifier. Published in Financial Innovation (2025).

Our summary: this is the clearest end-to-end empirical application of the AFML pipeline to crypto. The authors benchmark fixed-time bars against CUSUM filters, range bars, volume bars and dollar bars, and replace next-bar return prediction with triple-barrier labelling that uses volatility-scaled up/down barriers and a time-out. The result is that information-driven sampling meaningfully outperforms time bars on both classification and trading metrics for BTC and ETH, and that the triple-barrier labels produce targets better aligned with realised trading outcomes than standard next-bar classification. For a crypto strategy that wants a credible methodological anchor, this paper is the empirical reference point: it shows that every piece of the AFML pipeline adds economic value when applied correctly to the right data.

Key metrics: information-driven bars (CUSUM, dollar, volume) improve both classification metrics and backtest-level trading metrics relative to time bars on BTC and ETH; end-to-end pipeline produces positive net-of-cost results. Specific numerical Sharpe / F1 values are in the paper tables.

`Read the paper <https://link.springer.com/article/10.1186/s40854-025-00866-w>`__

Stock Price Prediction Using Triple-Barrier Labeling and Raw OHLCV Data: Evidence from Korean Markets
-----------------------------------------------------------------------------------------------------

Sungwoo Kang shows that simple deep learning models trained on raw OHLCV data can match more elaborate models — including XGBoost with engineered technical features — when the prediction target is created using an optimised triple-barrier labelling scheme. Evaluated on the Korean equity universe 2006–2024.

Our summary: this paper is a useful data point for two questions. First, it confirms that triple-barrier labelling extends beyond the high-frequency microstructure domain where it is usually demonstrated — it works at multi-day horizons on daily equity data. Second, it shows that feature engineering and labelling choices often matter more than model complexity: an LSTM fed only raw OHLCV matches a heavily-engineered XGBoost baseline once the label is defined sensibly. The authors identify the optimal triple-barrier configuration as a 29-day holding-period window with 9% barrier width, which they select to balance the label distribution. The best LSTM configuration is small (hidden size 8, window size 100), which is a useful reminder that model depth is rarely the bottleneck on financial time series.

Key metrics: optimal triple-barrier configuration of 29-day window with 9% barriers; best LSTM configuration has window size 100 and hidden size 8; LSTM on raw OHLCV matches XGBoost with technical indicators; full OHLCV input outperforms close-only or close+volume variants.

`Read the paper <https://arxiv.org/abs/2504.02249>`__

Time Series Momentum
--------------------

Tobias J. Moskowitz, Yao Hua Ooi, and Lasse Heje Pedersen (Journal of Financial Economics, 2012) document a remarkably broad time-series momentum effect across 58 liquid futures and forward contracts spanning equity indices, sovereign bonds, currencies, and commodities. Using a security's own past return rather than its return relative to peers, they show that return persistence is strong from one to twelve months and then partially reverses at longer horizons.

Our summary: this is the canonical modern TSMOM paper. It matters because it separates "trend following" from the usual cross-sectional winner-minus-loser construction and shows that a security's own lagged return has predictive power across very different asset classes. The paper also argues that most of the effect comes from positive auto-covariance rather than lead-lag structure across assets, and it links the profits to speculators effectively riding the trend while hedgers absorb the other side. If you need one foundational citation for multi-asset trend following, this is it.

Key metrics: the paper reports positive 12-month time-series momentum profits for all 58 contracts in the sample. A diversified TSMOM portfolio earns a Sharpe ratio greater than 1 on an annual basis, roughly 2.5x the Sharpe ratio of the equity market, with little correlation to passive asset-class benchmarks or standard pricing factors.

`Read the paper <https://pages.stern.nyu.edu/~lpederse/papers/TimeSeriesMomentum.pdf>`__

A Century of Evidence on Trend-Following Investing
--------------------------------------------------

Brian K. Hurst, Yao Hua Ooi, and Lasse H. Pedersen (Journal of Portfolio Management, 2017) extend the trend-following evidence far beyond the modern futures era by constructing a time-series momentum strategy back to 1880. The paper asks whether the strong post-1985 performance of managed futures and trend-following strategies is just a recent lucky sample or a deeper empirical regularity that survives very different macro regimes.

Our summary: this is the long-horizon historical companion to Moskowitz, Ooi, and Pedersen. Its main value is not a novel signal, but historical durability. By stitching together much older data sources, it shows that trend following survives wars, inflation shocks, monetary regime changes, and long stretches where traditional assets behave very differently from the late-20th-century sample. That makes it one of the most important papers for anyone trying to argue that trend is a structural phenomenon rather than a short backtest artifact.

Key metrics: the authors construct a trend-following strategy back to 1880 and report that it remains consistently profitable over the next 110 years. The paper explicitly confirms that the post-1985 results from the modern multi-asset futures sample are not an isolated fluke.

`Read the paper <https://www.aqr.com/Insights/Research/Journal-Article/A-Century-of-Evidence-on-Trend-Following-Investing>`__

Two Centuries of Trend Following
--------------------------------

Y. Lempériere, C. Deremble, P. Seager, M. Potters, and J.-P. Bouchaud push the historical evidence even further by studying trend-following strategies across commodities, currencies, stock indices, and bonds using both futures data since 1960 and spot series that go back to 1800 for some assets. The paper's framing is explicitly anomaly-focused: are long-horizon trend returns statistically strong enough to count as one of the major persistent irregularities in financial markets?

Our summary: this paper is the strongest statistical durability argument in the trend-following literature. The long sample lets the authors separate two issues that often get conflated: whether trends exist at all, and whether modern trend strategies have decayed. Their answer is nuanced: long trends remain statistically robust, but shorter trends have weakened in the recent era. The paper also documents signal saturation for very strong trends, consistent with the idea that fundamental traders only start leaning against price moves once the trend becomes extreme.

Key metrics: the paper reports an overall t-statistic of about 5 for excess returns since 1960 and about 10 since 1800, after accounting for the upward drift of markets. The authors describe the effect as stable across both time and asset classes.

`Read the paper <https://arxiv.org/abs/1404.3274>`__

Time Series Momentum and Volatility Scaling
-------------------------------------------

Abby Y. Kim, Yiuman Tse, and John K. Wald (Journal of Financial Markets, 2016) revisit the Moskowitz-Ooi-Pedersen result and ask how much of the observed alpha is really driven by the momentum signal itself versus the volatility-scaling overlay that accompanies the strategy. They compare volatility-scaled and unscaled versions of TSMOM and buy-and-hold portfolios at the contract, sector, and aggregate portfolio levels.

Our summary: this is the paper that forced the TSMOM literature to treat signal and position sizing as separate objects. The central result is uncomfortable but important: much of what looks like "momentum alpha" in managed futures-style backtests is actually the effect of volatility targeting or risk parity-style scaling. That does not make TSMOM useless, but it does mean any honest evaluation has to attribute performance carefully rather than crediting the sign signal for the whole package.

Key metrics: the paper finds that large TSMOM alphas are largely driven by volatility scaling. Unscaled TSMOM alphas look similar to unscaled buy-and-hold alphas, and scaled TSMOM alphas look similar to scaled buy-and-hold alphas, with the pattern holding at the individual-contract, sector, and portfolio levels.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S1386418116301379>`__

Is Momentum Really Momentum?
----------------------------

Robert Novy-Marx (Journal of Financial Economics, 2012) argues that the classic momentum effect is driven much more by intermediate-horizon returns than by very recent continuation. In his formulation, what investors usually call "momentum" often looks more like an echo from returns earned roughly 12 to 7 months before portfolio formation than a clean near-term persistence effect.

Our summary: this paper matters because it reframes momentum from a single monolithic anomaly into a term-structure question. If intermediate-horizon returns do the heavy lifting while the most recent month is polluted by reversal, then naive short-lookback momentum rules are badly specified from the start. That is exactly why this paper remains important background for anyone experimenting with very short-horizon trend signals: it explains why some "momentum" setups fail even when the broader anomaly is real.

Key metrics: Novy-Marx finds that strategies based on firms' performance 12 to 7 months before formation are more profitable than strategies based on the recent 6 to 2 months, especially among the largest and most liquid stocks. He also shows that similar intermediate-horizon patterns appear in international equity indices, commodities, and currencies.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0304405X11001152>`__

Time Series Momentum: Is It There?
----------------------------------

Dashan Huang, Jiangyuan Li, Liyao Wang, and Guofu Zhou (Journal of Financial Economics, 2020) reexamine the Moskowitz-Ooi-Pedersen evidence using the same broad futures data set but a more skeptical statistical lens. They argue that pooled regressions overstate the strength of TSMOM because of fixed-effect issues, persistent predictors, and the interaction between volatility scaling and heterogeneous asset means.

Our summary: this is the main empirical challenge paper in the TSMOM debate. The authors' point is not that trend-following strategies cannot make money, but that the specific claim of statistically reliable return predictability from past 12-month returns is much weaker than it first appears once you examine assets individually and use bootstrap-adjusted inference. Even if one ultimately disagrees with the conclusion, this paper is essential because it raises the methodological bar for what counts as convincing TSMOM evidence.

Key metrics: in asset-by-asset regressions, 47 of 55 assets have t-statistics below 1.65 and only 3 assets deliver significant out-of-sample R^2 at the 10% level. In pooled regressions the headline t-statistic is 4.34, but the paper reports bootstrap critical values of 12.53 and 4.83, implying the pooled result is not statistically significant under their more conservative tests.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0304405X19301953>`__

Risks and Returns of Cryptocurrency
-----------------------------------

Yukun Liu and Aleh Tsyvinski (Review of Financial Studies, 2021) provide one of the foundational asset-pricing treatments of major cryptocurrencies. Studying Bitcoin, Ripple, and Ethereum, they show that crypto returns are largely distinct from stocks, currencies, and precious metals, and are better explained by crypto-native drivers such as user adoption, network activity, investor attention, and trend effects.

Our summary: this paper is the bridge between "crypto as a weird asset" and "crypto as an asset class that deserves its own factor language." The most important takeaway is not merely that crypto is different, but that the relevant predictors are different in a systematic way. That makes this paper foundational for any crypto momentum or factor research stack: it says you should not expect stock-market factors to do most of the explanatory work.

Key metrics: the paper reports a strong time-series momentum effect in major cryptocurrencies and finds that investor-attention proxies significantly forecast future returns, while exposures to most common stock, currency, commodity, and macro factors are weak or absent.

`Read the paper <https://academic.oup.com/rfs/article/34/6/2689/5912024>`__

Common Risk Factors in Cryptocurrency
-------------------------------------

Yukun Liu, Aleh Tsyvinski, and Xi Wu develop a cryptocurrency factor model for the cross-section of crypto returns. Starting from a large universe of coins from 2014 to 2018, they construct crypto analogues of stock-market price and market-based factors and test whether a small number of them can explain the cross-section of expected returns.

Our summary: this is the canonical crypto factor-model paper. The headline result is that a three-factor model built from cryptocurrency market, size, and momentum factors explains most of the successful zero-investment strategies in the sample. For research design, the important lesson is that crypto needs its own factor architecture: stock-market factor models do not price these returns well, but crypto-native market, size, and momentum factors go much further.

Key metrics: 9 of 25 candidate crypto factors generate statistically significant long-short excess returns. The paper reports weekly excess returns of about 2.7%, 3.3%, 4.1%, and 2.5% for one-, two-, three-, and four-week momentum strategies, and shows that a crypto market-size-momentum three-factor model explains the excess returns of all nine successful strategies. Momentum among above-median-size coins reaches 4.2% weekly versus 0.6% for below-median-size coins.

`Read the paper <https://www.nber.org/papers/w25882>`__

Bitcoin Intraday Time-Series Momentum
-------------------------------------

Dehua Shen, Andrew Urquhart, and Pengfei Wang study whether Bitcoin exhibits an intraday time-series momentum effect despite trading continuously around the clock. Because Bitcoin has no natural exchange open and close like equities, the paper defines effective trading sessions using volume spikes and then tests whether returns early in the trading day predict returns later in the same day.

Our summary: this is the closest academic match for sub-daily BTC trend-following questions. The paper shows that intraday momentum in Bitcoin is not just a stylized-fact curiosity; it has practical trading content and seems strongest when market activity is elevated. Equally important, the authors test competing mechanisms and conclude the effect is more consistent with liquidity provision, disposition effects, and aversion to overnight risk than with a simple late-information story.

Key metrics: the first half-hour of Bitcoin trading significantly predicts the last half-hour in both in-sample and out-of-sample tests. The effect is strongest during sessions with the highest trading volume or volatility, and the authors report substantial economic gains from intraday momentum-based trading, especially during Bitcoin downturns.

`Read the paper <https://centaur.reading.ac.uk/100181/3/21Sep2021Bitcoin%20Intraday%20Time-Series%20Momentum.R2.pdf>`__

Value and Momentum Everywhere
-----------------------------

Clifford S. Asness, Tobias J. Moskowitz, and Lasse H. Pedersen (Journal of Finance, 2013) study value and momentum jointly across eight diverse markets and asset classes. Instead of treating value and momentum as stock-specific anomalies, they show that both premia appear broadly across global equities, equity index futures, government bonds, currencies, and commodities, and that their returns exhibit a strong common cross-asset factor structure.

Our summary: this is the canonical paper for understanding momentum as a global style rather than a niche equity effect. The most important finding is the correlation structure: value strategies are positively related to one another across markets, momentum strategies are also positively related across markets, and value and momentum are negatively related to each other both within and across asset classes. That makes the paper foundational for multi-style portfolio construction, because it explains why combining value and momentum is so powerful and why studying them jointly reveals global risks that disappear when each is examined in isolation.

Key metrics: the paper reports consistent value and momentum premia across all eight markets and asset classes studied and documents a diversified global value-plus-momentum portfolio with a high Sharpe ratio. It also shows that value and momentum returns correlate more strongly across asset classes than passive market exposures themselves, supporting the case for common global style factors.

`Read the paper <https://www.aqr.com/insights/research/journal-article/value-and-momentum-everywhere>`__

Cryptocurrencies and Momentum
-----------------------------

Klaus Grobys and Niranjan Sapkota (Economics Letters, 2019) test whether the classic momentum anomaly survives in a broad cryptocurrency universe. Using monthly data on 143 cryptocurrencies from 2014 to 2018, they examine both cross-sectional and time-series-style momentum specifications motivated by the traditional asset-pricing literature.

Our summary: this is one of the clean negative-result papers in the crypto momentum literature, which is exactly why it is useful. Earlier crypto studies often worked with small samples, short windows, or the largest coins only, making it easy to overstate the anomaly. Grobys and Sapkota show that once the universe broadens, the classic momentum signal becomes much less convincing and in some specifications even turns negative. That makes this paper an important counterweight to the more bullish crypto-momentum evidence and a useful reminder that sample design matters enormously in digital assets.

Key metrics: across the 2014-2018 sample, the authors report no statistically significant evidence of profitable traditional momentum payoffs. For the broad 143-coin universe, winner-minus-loser returns are close to zero and generally insignificant; some trimmed-sample specifications are negative rather than positive.

`Read the paper <https://osuva.uwasa.fi/bitstream/handle/10024/10391/Osuva_Grobys_Sapkota_2019.pdf>`__

A Factor Model for Cryptocurrency Returns
-----------------------------------------

Daniele Bianchi and Mykola Babiak develop a latent-factor model for cryptocurrency returns using Instrumented Principal Component Analysis (IPCA). Rather than relying only on a small set of hand-crafted observable factors, the model extracts latent risk drivers from a large cross-section of cryptocurrency pairs while allowing factor loadings to vary with observable characteristics such as liquidity, size, reversal, and downside risk.

Our summary: this paper is the natural next step after the early crypto factor literature. Whereas Liu-Tsyvinski-Wu establish that crypto has its own factor structure, Bianchi and Babiak ask whether a more flexible latent-factor model can describe that structure better than fixed observable factors. The answer is yes: crypto returns appear to have a richer, time-varying risk architecture than simple bottom-up factor portfolios can capture. For practitioners, the paper is especially interesting because it frames crypto risk premia as a dynamic latent-state problem rather than a static factor-zoo exercise.

Key metrics: the paper reports total and predictive R^2 of 17.2% and 2.9% for individual daily returns under the IPCA model, versus 9.6% and -0.02% for a benchmark six-factor observable model. The main drivers of expected returns are liquidity, size, reversal, and both market and downside risks. The results remain robust across individual assets, characteristic-sorted portfolios, pre- and post-COVID subsamples, and weekly data.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3935934>`__
