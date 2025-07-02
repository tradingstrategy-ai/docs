.. meta::
   :title: AI trading for cryptocurrencies
   :description: How to use machine learning and AI to trade cryptocurrencies

AI and machine learning
~~~~~~~~~~~~~~~~~~~~~~~

This document contains links to resources to learn how to apply machine learning and AI in trading.

See also :doc:`books <./books>` and :doc:`papers <./papers>` sections for more references and information.

Frameworks
==========

Ready made frameworks to apply Python and machine learning for trading data.

FinRL: Financial Reinforcement Learning
---------------------------------------

FinRL provides a framework that supports various markets, SOTA DRL algorithms, benchmarks of many quant finance tasks, live trading, etc.

Reinforcement learning (RL) trains an agent to solve tasks by trial and error, while DRL uses deep neural networks as function approximators. DRL balances exploration (of uncharted territory) and exploitation (of current knowledge), and has been recognized as a competitive edge for automated trading. DRL framework is powerful in solving dynamic decision making problems by learning through interactions with an unknown environment, thus exhibiting two major advantages: portfolio scalability and market model independence. Automated trading is essentially making dynamic decisions, namely to decide where to trade, at what price, and what quantity, over a highly stochastic and complex stock market. Taking many complex financial factors into account, DRL trading agents build a multi-factor model and provide algorithmic trading strategies, which are difficult for human traders.

`Visit Python project page <https://github.com/AI4Finance-Foundation/FinRL>`__.

Universal Portfolios
--------------------

The purpose of this Python package is to put together different Online Portfolio Selection (OLPS) algorithms and provide unified tools for their analysis.

In short, the purpose of OLPS is to choose portfolio weights in every period to maximize its final wealth. Examples of such portfolios could be the Markowitz portfolio or the Universal portfolio. There is currently an active research in the area of online portfolios and even though the results are mostly theoretical, algorithms for practical use start to appear.

Several state-of-the-art algorithms are implemented, based on my understanding of the available literature. Contributions or corrections are more than welcomed.

- Examples contains two Python Notebooks:
    - Online Portfolios : explains the basic use of the library. Script sequence, various options, method arguments, and a strategy template to get you started.
    - Modern Portfolio Theory : goes deeper into the OLPS principle and the tools developped in this library to approach it.
- `universal.algos` hosts the implementations of various OLPS algorithms from the literature
- `universal.result` computes the portfolio wealth from the weights and various metrics on the strategy's performance.

`Visit Python project page <https://github.com/Marigold/universal-portfolios>`__.

Books
=====

Here is a list of books for learning to use AI and machine learning in trading.

Advances in Financial Machine Learning
--------------------------------------

Machine learning (ML) is changing virtually every aspect of our lives. Today, ML algorithms accomplish tasks that – until recently – only expert humans could perform. And finance is ripe for disruptive innovations that will transform how the following generations understand money and invest.

In the book, readers will learn how to:

- Structure big data in a way that is amenable to ML algorithms
- Conduct research with ML algorithms on big data
- Use supercomputing methods and back test their discoveries while avoiding false positives

Advances in Financial Machine Learning addresses real life problems faced by practitioners every day, and explains scientifically sound solutions using math, supported by code and examples. Readers become active users who can test the proposed solutions in their individual setting.

Written by a recognized expert and portfolio manager Marcos López de Prado, this book will equip investment professionals with the groundbreaking tools needed to succeed in modern finance.

`Buy the book <https://www.amazon.com/Advances-Financial-Machine-Learning-Marcos/dp/1119482089>`__.

Machine Learning for Algorithmic Trading: Predictive models to extract signals from market and alternative data for systematic trading strategies with Python
-------------------------------------------------------------------------------------------------------------------------------------------------------------

The definite book for machine learning-based trading.

This book introduces end-to-end machine learning for the trading workflow, from the idea and feature engineering to model optimization, strategy design, and backtesting. It illustrates this by using examples ranging from linear models and tree-based ensembles to deep-learning techniques from cutting edge research.

This edition shows how to work with market, fundamental, and alternative data, such as tick data, minute and daily bars, SEC filings, earnings call transcripts, financial news, or satellite images to generate tradeable signals. It illustrates how to engineer financial features or alpha factors that enable an ML model to predict returns from price data for US and international stocks and ETFs. It also shows how to assess the signal content of new features using Alphalens and SHAP values and includes a new appendix with over one hundred alpha factor examples.

By the end, you will be proficient in translating ML model predictions into a trading strategy that operates at daily or intraday horizons, and in evaluating its performance.
What you will learn

- Leverage market, fundamental, and alternative text and image data
- Research and evaluate alpha factors using statistics, Alphalens, and SHAP values
- Implement machine learning techniques to solve investment and trading problems
- Backtest and evaluate trading strategies based on machine learning using Zipline and Backtrader
- Optimize portfolio risk and performance analysis using pandas, NumPy, and pyfolio
- Create a pairs trading strategy based on cointegration for US equities and ETFs
- Train a gradient boosting model to predict intraday returns using AlgoSee's high-quality trades and quotes data

`View book <https://www.amazon.com/Machine-Learning-Algorithmic-Trading-alternative/dp/1839217715>`__.

ML for Trading
--------------

This book aims to show how ML can add value to algorithmic trading strategies in a practical yet comprehensive way. It covers a broad range of ML techniques from linear regression to deep reinforcement learning and demonstrates how to build, backtest, and evaluate a trading strategy driven by model predictions.

Github repository available.

`View Github page <https://github.com/stefan-jansen/machine-learning-for-trading>`__.

Machine Learning for Algorithmic Trading
----------------------------------------

A book by Stefan Jansen alongside the ZipLine reloaded and community forum.

`Read more <https://ml4trading.io/>`__.

Master AI-Driven Algorithmic Trading
------------------------------------

This is an intense online training program about Python techniques for algorithmic trading. By signing up to this program you get access to 150+ hours of live/recorded instruction, 1,200+ pages PDF as well as 5,000+ lines of Python code and 60+ Jupyter Notebooks (read the 16 week study plan). Master AI-Driven Algorithmic Trading, get started today.

`Read more <https://home.tpq.io/certificates/pyalgo/>`__.

Videos
======

Crypto Trading Using FinRL
--------------------------

Explaining crypto trading using FinRL.

`Watch the video <https://www.youtube.com/watch?v=aJAbgJf6AFM&feature=youtu.be>`__

Stock Trading AI with FinRL in Python
-------------------------------------

- Wrangling
- Trading and fitting
- Backtesting against mean-variance optimised portfolio

`Watch the video <https://www.youtube.com/watch?v=OrqffjqkklM&list=WL&index=1>`__

Papers
======

Algorithmic trading using continuous action space deep reinforcement learning
-----------------------------------------------------------------------------

Finding a more efficient trading strategy has always been one of the main concerns in financial market trading. In order to create trading strategies that lead to higher profits, historical data must be used. Due to a large amount of financial data and various factors affecting them, algorithmic trading and, more recently, artificial intelligence are employed to overcome the decision-making complexity. This paper aims to introduce a new approach using Twin-Delayed DDPG (TD3) and the daily close price to create a trading strategy. As a continuous action space deep reinforcement learning algorithm, in contrast to the discrete ones, the TD3 provides us with both the number of trading shares and the trading positions. In order to evaluate the performance of the proposed algorithm, the comparison results of our approach and other commonly-used algorithms such as technical analysis, reinforcement learning, supervised learning, stochastic strategies, and deterministic strategies are reported. By employing both position and the number of trading shares, we show that the performance of a trading strategy can be improved in terms of Return and Sharpe ratio.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S09574174230>`__

Deep Learning Applying on Stock Trading
---------------------------------------

The project proposes to leverage machine
learning advantage in data mining, forecasting, automatic trading to explore different approaches
to get a profitable portfolio. In our work, to obtain a profitable stock trading portfolio, we design
indirectly trading and directly trading approaches–time series forecasting and reinforcement learning–
with different Deep Learning models’ advantages. Time series forecasting model is used to predict
the market price and apply basic trading strategy based on the result, while reinforcement learning
model directly learns and outputs with trading action to build portfolio.

`Read the paper <http://cs230.stanford.edu/projects_spring_2021/reports/74.pdf>`__

Deep Reinforcement Learning for Financial Portfolio Optimisation
----------------------------------------------------------------

Portfolio Selection (PS) is a perennial financial engineering problem that requires determining a strategy for dynamically allocating wealth among a set of portfolio assets to maximise the long-term return. We investigate state-of-the-art Deep Reinforcement Learning (DRL) algorithms that have proven to be ideal for continuous action spaces, mainly Deep Deterministic Policy Gradient (DDPG) and Twin Delayed Deep Deterministic Policy Gradient (TD3), for the PS problem. Furthermore, we investigate the effect of including stock movement prediction indicators in the state representation and the potential of using an ensemble framework that combines multiple DRL models. We formulate experiments to evaluate our DRL models on real data from the American stock market, against benchmarks including state-of-the-art online portfolio selection (OLPS) approaches, using measures consisting of Average daily yield, Sharpe ratio, Sortino ratio and Maximum drawdown. Our experiments show that TD3-based models generally perform better than DDPG-based ones when used on real stock trading data. Furthermore, the introduction of additional financial indicators in the state representation was found to have a positive effect overall. Lastly, an ensemble model also showed promising results, consistently beating the baselines used, albeit not all other DRL models.

`Read the code and the paper <https://github.com/NigelCusc/DDPG_TD3_PortfolioOptimization_tensorflow-1.15.4?tab=readme-ov-file>`__

From Man vs. Machine to Man Machine: The Art and AI of Stock Analyses
----------------------------------------------------------------------

We train an AI analyst that digests corporate disclosures, industry trends, and macroeconomic
indicators to the extent it beats most analysts. Human wins the “Man vs. Machine”
contest when a firm is complex with intangible assets, and AI wins when information is
transparent but voluminous. Analysts catch up with machines over time, especially after
firms are covered by alternative data and their institutions build AI capabilities. AI power
and human wisdom are complementary in generating accurate forecasts and mitigating extreme
errors, portraying a future of “Man + Machine” (instead of human displacement) in
financial analyses, and likely other high-skill professions.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3840538>`__.

Can Machines Time Markets? The Virtue of Complexity in Return Prediction
------------------------------------------------------------------------

Machine learning techniques can be used to improve market timing strategies by picking up nonlinearities between the predictor variables (i.e., signals) and returns. In order to identify the nonlinearities, complex models – i.e., models where the number of predictor variables is larger than the number of return time series observations – must be estimated. More complex models better identify the true nonlinear relationships and, thus, produce better market timing strategy performance.

This "virtue of complexity" result is validated in three practical market timing applications: timing the stock market, the bond market, and the long/short value factor. The performance improvements are real but modest, consistent with the view that machine learning applied to return prediction leads to evolutionary, not revolutionary, wealth gains.

`Read the paper <https://www.aqr.com/Insights/Research/Alternative-Thinking/Can-Machines-Time-Markets-The-Virtue-of-Complexity-in-Return-Prediction>`__.

XGBoost for Classifying Ethereum Short-term Return Based on Technical Factor
----------------------------------------------------------------------------

The concept of digital cash has the potential to completely change how people think about money. Digital currency has emerged as a possible alternative for exchanging currency and traditional payment systems, in addition to a popular investment option due to its potential for high returns. One of the three main varieties of digital currency is cryptocurrency that is secured by blockchain technology. Bitcoin, Ethereum, and many other cryptocurrencies exist in crypto markets. Investing in cryptocurrencies still carries risks and uncertainties due to the price volatility. It is thus important to approach such investments with caution and thoroughly research the market and its risks before making investment decisions. This paper presents an application of AI technology for learning the price movement of Ethereum (ETH) which is second only to Bitcoin in market capitalization. Based on the Technical factor, the XGBoost model is constructed for classification of return on Ethereum close price. The technical indicators such as moving averages and relative strength index, together with the Bitcoin price trend are chosen to determine influence on Ethereum price further used for computing the short-term return separate into 3 classes: downtrend, sideway, and uptrend. The model performance is measured by multiclass ROC-AUC, achieving the micro-average ROC-AUC of 0.66 saying the model is reasonably good at predicting the overall trend of ETH price.

`Read the paper <https://dl.acm.org/doi/fullHtml/10.1145/3605423.3605462>`__.


Predicting Cryptocurrency Prices with Machine Learning Algorithms: A Comparative Analysis
-----------------------------------------------------------------------------------------

Due to its decentralized nature and opportunity for substantial gains,
cryptocurrency has become a popular investment opportunity. However, the highly
unpredictable and volatile nature of the cryptocurrency market poses a challenge
for investors looking to predict price movements and make profitable investments.
Time series analysis, which recognizes trends and patterns in previous price data to
create forecasts about future price movements, is one of the prominent and effective
techniques for price prediction. Integrating Machine learning (ML) techniques and
technical indicators along with time series analysis, can enhance the prediction ac-
curacy significantly.

Objectives. The objective of this thesis is to identify an effective ML algorithm for
making long-term predictions of Bitcoin prices, by developing prediction models using
the ML algorithms and making predictions using the technical indicators(Relative
Strength Index (RSI), Exponential Moving Average (EMA), Simple Moving Aver-
age (SMA)) as input for these models.

`Read the Bachelor thesis <https://www.diva-portal.org/smash/get/diva2:1778251/FULLTEXT03>`__.

Multivariate cryptocurrency prediction: comparative analysis of three recurrent neural networks approaches
----------------------------------------------------------------------------------------------------------

As a new type of currency introduced in the new millennium, cryptocurrency has
established its ecosystems and attracts many people to use and invest in it. However,
cryptocurrencies are highly dynamic and volatile, making it challenging to predict
their future values. In this research, we use a multivariate prediction approach and
three different recurrent neural networks (RNNs), namely the long short-term memory
(LSTM), the bidirectional LSTM (Bi-LSTM), and the gated recurrent unit (GRU). We also
propose simple three layers deep networks architecture for the regression task in this
study. From the experimental results on five major cryptocurrencies, i.e., Bitcoin (BTC),
Ethereum (ETH), Cardano (ADA), Tether (USDT), and Binance Coin (BNB), we find that
both Bi-LSTM and GRU have similar performance results in terms of accuracy. However,
in terms of the execution time, both LSTM and GRU have similar results, where GRU is
slightly better and has lower variation results on average.

`Read the paper <https://www.academia.edu/82633717/Multivariate_cryptocurrency_prediction_comparative_analysis_of_three_recurrent_neural_networks_approaches?email_work_card=title>`__.

Portfolio Optimization Strategies: New Approaches Based on Machine Learning Forecasting
---------------------------------------------------------------------------------------

This study provides an in-depth discussion and comprehensive review of the latest applications of machine learning techniques in the field of portfolio optimization. The article begins with an overview of traditional portfolio optimization theory and its limitations, and then focuses on how machine learning predictive models, which have flourished in recent years, can provide new perspectives and tools for solving the problems of non-linearity, dynamics and uncertainty in investment decision-making. This paper provides a detailed overview of the application practices of various machine learning algorithms (e.g., deep learning, reinforcement learning, integrated learning, etc.) in the areas of asset return prediction, risk assessment, and optimal weight allocation, and analyses their advantages and challenges compared to traditional methods. The analysis of relevant research cases reveals the significant effect of machine learning predictions in increasing expected portfolio returns, reducing risk exposure, and achieving effective diversification. The study also explores possible future trends and potential research directions for machine learning in portfolio optimization, highlighting the importance of combining domain knowledge with big data-driven intelligent investment decisions. This review aims to provide financial scholars and practitioners with a new way of thinking about portfolio optimization, and to promote the combination of theoretical research and practical operation in the fields of financial engineering and investment management, so as to achieve more accurate and efficient investment decisions.

`Read the paper <https://www.researchgate.net/publication/383710710_Portfolio_Optimization_Strategies_New_Approaches_Based_on_Machine_Learning_Forecasting>`__.

A Deep Learning Based Asset Allocation Methodology For Investment Portfolio Optimization Under Uncertainties
------------------------------------------------------------------------------------------------------------

This paper introduces a novel methodology for determining optimal asset allocation within diversified investment
portfolios by integrating Modern Portfolio Theory with a Deep Learning model. This approach enhances portfolio
diversification by considering both historical asset correlations and forecasts of individual asset volatility.
Distinct from traditional methods that rely solely on historical data, our methodology incorporates current
trading conditions and market dynamics, as reflected in asset prices. The S&P-500 index serves as the benchmark
for this study, with the primary aim of achieving returns comparable to the benchmark while minimizing risk
through a strategic combination of multiple assets.

`Read the paper <https://www.iosrjournals.org/iosr-jef/papers/Vol16-Issue1/Ser-3/H1601035970.pdf>`__.

Machine learning portfolio allocation
-------------------------------------

We find economically and statistically significant gains when using machine learning for portfolio allocation between the market index and risk-free asset. Optimal portfolio rules for time-varying expected returns and volatility are implemented with two Random Forest models. One model is employed in forecasting monthly excess returns with macroeconomic factors including payout yields. The second is used to estimate the prevailing volatility. Reward-risk timing with machine learning provides substantial improvements over the buy-and-hold in utility, risk-adjusted returns, and maximum drawdowns. This paper presents a unifying framework for machine learning applied to both return- and volatility-timing.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S2405918821000155#sec4>`__.

Can machines learn finance?
---------------------------

Machine learning for asset management faces a unique set of challenges that differ markedly from other domains where machine learning has excelled. Understanding these differences is critical for developing impactful approaches and realistic expectations for machine learning in asset management. We discuss a variety of beneficial use cases and potential pitfalls, and emphasize the importance of economic theory and human expertise for achieving success through financial machine learning.

`Read the paper <https://joim.com/can-machines-learn-finance/>`__.

Data Resampling for Cryptocurrency Investment with Ensemble of Machine Learning Algorithms
------------------------------------------------------------------------------------------

This work proposes a system based on machine learning aimed at creating an investment strategy capable of trading on the volatile cryptocurrency exchange markets with the highest returns and lowest risk. With the former goal in mind, several methods are employed for resampling the original financial data into a time series more prone of obtaining higher returns and the final results are compared to the obtained with commonly utilized time sampled series. These methods resample the original financial time series according to price action rather than a fixed time period. Simply put, the original samples are grouped as the closing value surpasses a threshold variation of quote currency. Three experimental thresholds were analysed: percentual value, fixed amount and fixed logarithmic amount.

`Read the paper <https://fenix.tecnico.ulisboa.pt/downloadFile/563345090417208/FinalThesis.pdf>`__.

BITCOIN-USD Trading Using SVM to Detect The Current day’s Trend in The Market
-----------------------------------------------------------------------------

Cryptocurrency trade is now a popular type of investment. Cryptocurrency market has been treated similar to foreign exchange and stock market. The Characteristics of Bitcoin have made Bitcoin keep rising In the last few years. Bitcoin exchange rate to American Dollar (USD) is $3990 USD on November 2018, with daily pice fluctuations could reach 4.55%2. It is important to able to predict value to ensure profitable investment. However, because of its volatility, there’s a need for a prediction tool for investors to help them consider investment decisions for cryptocurrency trade. Nowadays, computing based tools are commonly used in stock and foreign exchange market predictions. There has been much research about SVM prediction on stocks and foreign exchange as case studies but none on cryptocurrency. Therefore, this research studied method to predict the market value of one of the most used cryptocurrency, Bitcoin. The preditct methods will be used on this research is regime prediction to develop model to predict the close value of Bitcoin and use Support vector classifier algorithm to predict the current day’s trend at the opening of the market

`Read the paper <https://www.researchgate.net/publication/331822518_BITCOIN-USD_TRADING_USING_SVM_TO_DETECT_THE_CURRENT_DAY'S_TREND_IN_THE_MARKET>`__.


Intelligent Algorithmic Trading Strategy Using Reinforcement Learning and Directional Change
--------------------------------------------------------------------------------------------

Designing a profitable trading strategy plays a critical role in algorithmic trading, where the algorithm can manage and execute automated trading decisions. Determining a specific trading rule for trading at a particular time is a critical research problem in financial market trading. However, an intelligent, and a dynamic algorithmic trading driven by the current patterns of a given price time-series may help deal with this issue. Thus, Reinforcement Learning (RL) can achieve optimal dynamic algorithmic trading by considering the price time-series as its environment. A comprehensive representation of the environment states is indeed vital for proposing a dynamic algorithmic trading using RL. Therefore, we propose a representation of the environment states using the Directional Change (DC) event approach with a dynamic DC threshold. We refer to the proposed algorithmic trading approach as the DCRL trading strategy.

`Read more <https://www.academia.edu/67660648/Intelligent_Algorithmic_Trading_Strategy_Using_Reinforcement_Learning_and_Directional_Change?email_work_card=view-paper>`__

Deep Reinforcement Trading with Predictable Returns
---------------------------------------------------

Classical portfolio optimization often requires forecasting asset returns and their corresponding variances in spite of the low signal-to-noise ratio provided in the financial markets. Deep reinforcement learning (DRL) offers a framework for optimizing sequential trader decisions through an objective which represents its reward function penalized by risk and transaction costs. We investigate the performance of model-free DRL traders in a market environment with frictions and different meanreverting factors driving the dynamics of the returns. Since this framework admits an exact dynamic programming solution, we can assess limits and capabilities of different value-based algorithms to retrieve meaningful trading signals in a datadriven manner and to reach the benchmark performance.

`Read more <https://arxiv.org/abs/2104.14683>`__

Multi-feature stock price prediction by LSTM networks based on VMD and TMFG
---------------------------------------------------------------------------

The stock market is characterized by its high nonlinearity and complexity, making traditional methods ineffective in capturing its nonlinear features and complex market dynamics. This paper proposes a novel stock price forecasting model—the Variational Mode Decomposition—Triangulated Maximally Filtered Graph—Long Short-Term Memory (VMD–TMFG–LSTM) combined model—aimed at improving prediction accuracy, stability, and computational efficiency. The proposed model first employs Variational Mode Decomposition (VMD) to decompose the stock price time series into multiple smooth intrinsic mode functions (IMFs), reducing data complexity and mitigating noise interference. Subsequently, the TMFG algorithm is utilized for feature selection, simplifying the input data and accelerating the iterative convergence process. Finally, the filtered features are modeled and predicted using a Long Short-Term Memory (LSTM) network. Experimental results demonstrate that the VMD–TMFG–LSTM model significantly outperforms AutoRegressive Integrated Moving Average (ARIMA), Neural Network (NN), Deep Neural Network (DNN), Convolutional Neural Network (CNN), as well as single LSTM, TMFG–LSTM, and VMD–LSTM models in forecasting the closing prices of multiple stocks. Specifically, for Shanghai International Airport Co., Ltd. (sh600009), the VMD–TMFG–LSTM model achieves a 69.76% reduction in Root Mean Squared Error (RMSE), a 71.41% reduction in Mean Absolute Error (MAE), a 46.28% reduction in runtime, and an improvement of 0.2184 in R-squared (R2), indicating significantly higher prediction accuracy. In conclusion, the combined model proposed in this paper enhances the accuracy, efficiency, and stability of stock price prediction, providing a robust and efficient solution for forecasting stock market trends.

`Read the paper <https://journalofbigdata.springeropen.com/articles/10.1186/s40537-025-01127-4>`__.

A CNN-LSTM Stock Prediction Algorithm
-------------------------------------

A deep learning model for predicting the next three closing prices of a stock, index, currency pair, etc. based on the past 10 days of trading history (Open, High, Low, Close, Volume, Day of Week). Neural network architecture based on paper a `CNN-LSTM-Based Model to Forecast Stock Prices <https://onlinelibrary.wiley.com/doi/10.1155/2020/6622927>`__.

`View Github Repository <https://github.com/alexkalinins/cnn-lstm-stock>`__.

Predicting Stock Market time-series data using CNN-LSTM Neural Network model
----------------------------------------------------------------------------

Stock market is often important as it represents
the ownership claims on businesses. Without sufficient stocks,
a company cannot perform well in finance. Predicting a stock
market performance of a company is nearly hard because every
time the prices of a company’s stock keeps changing and not
constant. So, it’s complex to determine the stock data. But
if the previous performance of a company in stock market is
known, then we can track the data and provide predictions to
stockholders in order to wisely take decisions on handling the
stocks to a company. To handle this, many machine learning
models have been invented but they didn’t succeed due to many
reasons like absence of advanced libraries, inaccuracy of model
when made to train with real time data and much more. So, to
track the patterns and the features of data, a CNN-LSTM Neural
Network can be made. Recently, CNN is now used in Natural
Language Processing (NLP) based applications, so by identifying
the features from stock data and converting them into tensors,
we can obtain the features and then send it to LSTM neural
network to find the patterns and thereby predicting the stock
market for given period of time. The accuracy of the CNN-
LSTM NN model is found to be high even when allowed to
train on real-time stock market data. This paper describes about
the features of the custom CNN-LSTM model, experiments we
made with the model (like training with stock market datasets,
performance comparison with other models) and the end product
we obtained at final stage.

`Read the paper <https://arxiv.org/pdf/2305.14378>`__.

Dependency structures in cryptocurrency market from high to low frequency
-------------------------------------------------------------------------

We investigate logarithmic price returns cross-correlations at different time horizons for a set of 25 liquid cryptocurrencies traded on the FTX digital currency exchange. We study how the structure of the Minimum Spanning Tree (MST) and the Triangulated Maximally Filtered Graph (TMFG) evolve from high (15 s) to low (1 day) frequency time resolutions. For each horizon, we test the stability, statistical significance and economic meaningfulness of the networks. Results give a deep insight into the evolutionary process of the time dependent hierarchical organization of the system under analysis. A decrease in correlation between pairs of cryptocurrencies is observed for finer time sampling resolutions. A growing structure emerges for coarser ones, highlighting multiple changes in the hierarchical reference role played by mainstream cryptocurrencies. This effect is studied both in its pairwise realizations and intra-sector ones.

`Read the paper <https://arxiv.org/abs/2206.03386>`__.

Bitcoin price forecasting method based on CNN-LSTM hybrid neural network model
------------------------------------------------------------------------------

In this study, aiming at the problem that the price of Bitcoin varies greatly and is difficult to predict, a hybrid neural network model based on convolutional neural network (CNN) and long short-term memory (LSTM) neural network is proposed. The transaction data of Bitcoin itself, as well as external information, such as macroeconomic variables and investor attention, are taken as input. Firstly, CNN is used for feature extraction. Then the feature vectors are input into LSTM for training and forecasting the short-term price of Bitcoin. The result shows that the CNN-LSTM hybrid neural network can effectively improve the accuracy of value prediction and direction prediction compared with the single structure neural network. The finding has important implications for researchers and investors in the digital currencies market.

`Read the paper <https://digital-library.theiet.org/doi/full/10.1049/joe.2019.1203>`__.

Attention-Based Deep Learning Models for Cryptocurrency Price Prediction: A Comparative Analysis with Technical Indicators
--------------------------------------------------------------------------------------------------------------------------

This study presents a comparative analysis of two advanced attention-based deep learning models—Attention-LSTM and Attention-GRU—for predicting cryptocurrency price movements. The models utilize historical OHLCV data, combined with four technical indicators: SMA, EMA, TEMA, and MACD, to enhance the accuracy of classification into three categories: uptrend, downtrend, and neutral. Both models aim to capture market dynamics through sequential data while incorporating attention mechanisms to focus on relevant time steps. Experimental results demonstrate that the inclusion of technical indicators significantly improves model performance, with MACD yielding the highest accuracy. The Attention-GRU model shows computational advantages, while the Attention-LSTM model excels in capturing long-term dependencies.

`Read the paper <https://www.preprints.org/manuscript/202410.1852/v1>`__.

Application of Deep Q-Network in Portfolio Management
-----------------------------------------------------

Machine Learning algorithms and Neural Networks
are widely applied to many different areas such as stock market
prediction, face recognition and population analysis. This paper
will introduce a strategy based on the classic Deep
Reinforcement Learning algorithm, Deep Q-Network, for
portfolio management in stock market. It is a type of deep
neural network which is optimized by Q Learning. To make the
DQN adapt to financial market, we first discretize the action
space which is defined as the weight of portfolio in different
assets so that portfolio management becomes a problem that
Deep Q-Network can solve. Next, we combine the Convolutional
Neural Network and dueling Q-net to enhance the recognition
ability of the algorithm. Experimentally, we chose five low-
relevant American stocks to test the model. The result
demonstrates that the DQN based strategy outperforms the ten
other traditional strategies. The profit of DQN algorithm is 30%
more than the profit of other strategies. Moreover, the Sharpe
ratio associated with Max Drawdown demonstrates that the risk
of policy made with DQN is the lowest.

`Read the paper <https://arxiv.org/pdf/2003.06365>`__.

A Deep Reinforcement Learning Framework for the Financial Portfolio Management Problem
--------------------------------------------------------------------------------------

Financial portfolio management is the process of constant redistribution of a fund into different financial products. This paper presents a financial-model-free Reinforcement Learning framework to provide a deep machine learning solution to the portfolio management problem. The framework consists of the Ensemble of Identical Independent Evaluators (EIIE) topology, a Portfolio-Vector Memory (PVM), an Online Stochastic Batch Learning (OSBL) scheme, and a fully exploiting and explicit reward function. This framework is realized in three instants in this work with a Convolutional Neural Network (CNN), a basic Recurrent Neural Network (RNN), and a Long Short-Term Memory (LSTM). They are, along with a number of recently reviewed or published portfolio-selection strategies, examined in three back-test experiments with a trading period of 30 minutes in a cryptocurrency market. Cryptocurrencies are electronic and decentralized alternatives to government-issued money, with Bitcoin as the best-known example of a cryptocurrency. All three instances of the framework monopolize the top three positions in all experiments, outdistancing other compared trading algorithms. Although with a high commission rate of 0.25% in the backtests, the framework is able to achieve at least 4-fold returns in 50 days.

`Read the paper <https://arxiv.org/abs/1706.10059>`__.

Reinforcement Learning Approaches to Optimal Market Making
----------------------------------------------------------

Market making is the process whereby a market participant, called a market maker,
simultaneously and repeatedly posts limit orders on both sides of the limit order book of a security
in order to both provide liquidity and generate proﬁt. Optimal market making entails dynamic
adjustment of bid and ask prices in response to the market maker’s current inventory level and
market conditions with the goal of maximizing a risk-adjusted return measure. This problem is
naturally framed as a Markov decision process, a discrete-time stochastic (inventory) control process.
Reinforcement learning, a class of techniques based on learning from observations and used for
solving Markov decision processes, lends itself particularly well to it. Recent years have seen a
very strong uptick in the popularity of such techniques in the ﬁeld, fueled in part by a series of
successes of deep reinforcement learning in other domains. The primary goal of this paper is to
provide a comprehensive and up-to-date overview of the current state-of-the-art applications of
(deep) reinforcement learning focused on optimal market making. The analysis indicated that
reinforcement learning techniques provide superior performance in terms of the risk-adjusted return
over more standard market making strategies, typically derived from analytical models.

`Read the paper <https://www.academia.edu/79674814/Reinforcement_Learning_Approaches_to_Optimal_Market_Making?email_work_card=reading-history>`__.

Deep Learning for High-Frequency Price Prediction in Cryptocurrency Markets
---------------------------------------------------------------------------

The rapid rise of high-frequency trading in cryptocurrency markets has intensified
the need for robust predictive models capable of navigating extreme volatility, frag-
mented liquidity, and the unique microstructure of digital asset exchanges. This
thesis investigates the effectiveness of deep learning architectures, specifically con-
volutional neural networks (CNNs), long short-term memory networks (LSTMs),
and hybrid CNN-LSTM models, in forecasting short-horizon mid-price log-returns
from limit order book data in cryptocurrency markets. Drawing on a large scale,
tick-level dataset from ByBit across three major cryptocurrency pairs, the study
evaluates the performance of these neural networks. Each model is evaluated on its
ability to predict a vector of ten future returns, using both raw book features and
engineered stationary signals. Results indicate that deep learning models consis-
tently outperform linear benchmarks in terms of out-of-sample R2 and directional
accuracy, capturing complex non-linear dependencies present in the data. The anal-
ysis also highlights the impact of input feature transformations on predictive power
and model robustness. These findings provide insights into the adaptability of deep
neural architectures for high-frequency price prediction in continuously evolving,
highly volatile financial environments, and underscore the potential for advanced
machine learning techniques to enhance market understanding in the cryptocur-
rency domain.

`Read the paper <file:///Users/moo/Downloads/DLHFPP-1.pdf>`__.

`Read the code <https://github.com/miohtama/Midprice-Prediction>`__.

From Rules to Rewards: Reinforcement Learning for Interest Rate Adjustment in DeFi Lending
------------------------------------------------------------------------------------------

Decentralized Finance (DeFi) lending enables permissionless borrowing via smart contracts. However, it faces challenges in optimizing interest rates, mitigating bad debt, and improving capital efficiency. Rule-based interest-rate models struggle to adapt to dynamic market conditions, leading to inefficiencies. This work applies Offline Reinforcement Learning (RL) to optimize interest rate adjustments in DeFi lending protocols. Using historical data from Aave protocol, we evaluate three RL approaches: Conservative Q-Learning (CQL), Behavior Cloning (BC), and TD3 with Behavior Cloning (TD3-BC). TD3-BC demonstrates superior performance in balancing utilization, capital stability, and risk, outperforming existing models. It adapts effectively to historical stress events like the May 2021 crash and the March 2023 USDC depeg, showcasing potential for automated, real-time governance.

`Read the paper <https://arxiv.org/abs/2506.00505>`__.