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


AI-based Trading Strategies: Comparing Deep Learning Architectures
------------------------------------------------------------------

his project deploys a systematic, AI-driven framework to develop and evaluate quantitative trading strategies. Our modular pipeline integrates robust API-based data acquisition with advanced feature engineering—including regime detection via Hidden Markov Models—to produce high-quality inputs for our models. We implement a suite of deep learning architectures, including a GRU, a standalone LSTM model, and an LSTM-CNN hybrid, all validated through rolling cross-validation and realistic backtesting that incorporates transaction cost adjustments. Performance is benchmarked against a buy-and-hold baseline, and the framework supports rapid experimentation with alternative architectures such as LSTM with attention mechanisms and transformers.

By Jose Francisco Salazar Guillen, St Edward's University and other collaborators.

`Visit Github repository <https://github.com/FranQuant/AI-based-Trading-Strategies/tree/308151561093960aed7c721a7370d5f8fa15fbd5>`__

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

`Read the paper <https://github.com/miohtama/Midprice-Prediction/blob/main/DLHFPP.pdf>`__.

`Read the code <https://github.com/miohtama/Midprice-Prediction>`__.

From Rules to Rewards: Reinforcement Learning for Interest Rate Adjustment in DeFi Lending
------------------------------------------------------------------------------------------

Decentralized Finance (DeFi) lending enables permissionless borrowing via smart contracts. However, it faces challenges in optimizing interest rates, mitigating bad debt, and improving capital efficiency. Rule-based interest-rate models struggle to adapt to dynamic market conditions, leading to inefficiencies. This work applies Offline Reinforcement Learning (RL) to optimize interest rate adjustments in DeFi lending protocols. Using historical data from Aave protocol, we evaluate three RL approaches: Conservative Q-Learning (CQL), Behavior Cloning (BC), and TD3 with Behavior Cloning (TD3-BC). TD3-BC demonstrates superior performance in balancing utilization, capital stability, and risk, outperforming existing models. It adapts effectively to historical stress events like the May 2021 crash and the March 2023 USDC depeg, showcasing potential for automated, real-time governance.

`Read the paper <https://arxiv.org/abs/2506.00505>`__.

Bitcoin volatility forecasting: a comparative analysis of conventional econometric models with deep learning models
-------------------------------------------------------------------------------------------------------------------

The behavior of the Bitcoin market is dynamic and erratic, impacted by a range of elements including news developments and investor mood. One well-known aspect of bitcoin is its extreme volatility. This study uses both conventional econometric techniques and deep learning algorithms to anticipate the volatility of Bitcoin returns. The research is based on historical Bitcoin price data spanning October 2014 to February 2022, which was obtained using the Yahoo Finance API. In this work, we contrast the efficacy of generalized autoregressive conditional heteroskedasticity (GARCH) and threshold ARCH (TARCH) models with long short-term memory (LSTM), bidirectional LSTM (Bi-LSTM), and multivariate Bi-LSTM models. Model effectiveness is evaluated by means of root mean squared error (RMSE) and root mean squared percentage error (RMSPE) scores. The multivariate Bi-LSTM model emerges as mostly effective, achieving an RMSE score of 0.0425 and an RMSPE score of 0.1106. This comparative scrutiny contributes to understanding the dynamics of Bitcoin volatility prediction, offering insights that can inform investment strategies and risk management practices in this quickly changing environment of finance.

`Read the paper <https://www.academia.edu/126426432/Bitcoin_volatility_forecasting_a_comparative_analysis_of_conventional_econometric_models_with_deep_learning_models?email_work_card=title>`__.

Cryptocurrency Price Prediction Using Frequency Decomposition and Deep Learning
-------------------------------------------------------------------------------

A good paper on variational mode decomposition (VMD).

Given the substantial volatility and non-stationarity of cryptocurrency prices, forecasting them has become a complex task within the realm of financial time series analysis. This study introduces an innovative hybrid prediction model, VMD-AGRU-RESVMD-LSTM, which amalgamates the disintegration–integration framework with deep learning techniques for accurate cryptocurrency price prediction. The process begins by decomposing the cryptocurrency price series into a finite number of subseries, each characterized by relatively simple volatility patterns, using the variational mode decomposition (VMD) method. Next, the gated recurrent unit (GRU) neural network, in combination with an attention mechanism, predicts each modal component’s sequence separately. Additionally, the residual sequence, obtained after decomposition, undergoes further decomposition. The resultant residual sequence components serve as input to an attentive GRU (AGRU) network, which predicts the residual sequence’s future values. Ultimately, the long short-term memory (LSTM) neural network integrates the predictions of modal components and residuals to yield the final forecasted price. Empirical results obtained for daily Bitcoin and Ethereum data exhibit promising performance metrics. The root mean square error (RMSE) is reported as 50.651 and 2.873, the mean absolute error (MAE) stands at 42.298 and 2.410, and the mean absolute percentage error (MAPE) is recorded at 0.394% and 0.757%, respectively. Notably, the predictive outcomes of the VMD-AGRU-RESVMD-LSTM model surpass those of standalone LSTM and GRU models, as well as other hybrid models, confirming its superior performance in cryptocurrency price forecasting.

`Read the paper <https://www.mdpi.com/2504-3110/7/10/708>`__.

Benchmarking Cryptocurrency Forecasting Models in the Context of Data Properties and Market Factors
---------------------------------------------------------------------------------------------------

Cryptocurrency price prediction presents a significant challenge due to the inherent nonlinearity of the market. In this thesis, we assess the performance of thirteen time series forecasting models in predicting the prices of twenty-one different cryptocurrencies across four specific time frames. Our analysis centers on how data characteristics and market conditions affect the precision of these models and explores the implications of both broadening the scope of training data and extending the forecast periods. Our findings indicate that TBATS, LightGBM, XGBoost, and ARIMA consistently deliver the most accurate results. We identify key factors influencing prediction accuracy, including market trends, heteroskedasticity, volatility, and market capitalization. Additionally, the choice of time frame markedly affects all models’ predictive accuracy. Contrary to expectations, we observe that increasing the volume of training data does not necessarily enhance the performance of deep-learning and RNN-based models. Our thesis offers a comprehensive benchmark of forecasting models within the cryptocurrency context, underscoring the conditions crucial for improving prediction accuracy.

By Stephan Akkerman from Utrecht University, Netherlands.

`Read the paper <https://studenttheses.uu.nl/handle/20.500.12932/45623>`__.

Volatility dynamics of cryptocurrencies: a comparative analysis using GARCH-family models
-----------------------------------------------------------------------------------------

Cryptocurrency markets have evolved into a vital segment of the global financial ecosystem, drawing considerable interest from both investors and regulatory bodies. Yet, their extreme price instability demands innovative strategies for risk mitigation and investment that diverge from conventional financial practices. This research focuses on analyzing the volatility patterns of leading cryptocurrencies—Bitcoin (BTC), Ethereum (ETH), and Binance Coin (BNB)—by employing GARCH-family models such as GARCH, EGARCH, TGARCH, and CGARCH. Through a comparative evaluation of these models, the study identifies the optimal framework for characterizing cryptocurrency market volatility. Utilizing daily closing prices from Yahoo Finance (January 1, 2019, to January 8, 2025), the analysis reveals that TGARCH outperforms others for BTC, EGARCH for ETH, and CGARCH for BNB, underscoring the critical role of asymmetric volatility in these markets. This work advances existing research by offering a detailed comparison of GARCH-based approaches and practical insights for risk evaluation and portfolio optimization.

`Read the paper <https://fbj.springeropen.com/articles/10.1186/s43093-025-00568-w#>`__.

Stochastic Volatility Modelling with LSTM Networks: A Hybrid Approach for S&P 500 Index Volatility Forecasting
--------------------------------------------------------------------------------------------------------------

Accurate volatility forecasting is essential in various domains, including banking, investment, and risk management, as expectations about future market movements directly influence current decision-making. This study proposes a hybrid modeling framework that integrates a Stochastic Volatility model with a Long Short-Term Memory neural network. The SV model contributes statistical precision and the ability to capture latent volatility dynamics, particularly in response to unforeseen events, while the LSTM network enhances the model's ability to detect complex, nonlinear patterns in financial time series. The forecasting is conducted using daily data from the S&P 500 index, covering the period from January 1, 1998, to December 31, 2024. A rolling window approach is employed to train the model and generate one-step-ahead volatility forecasts. The performance of the hybrid SV-LSTM model is evaluated through both statistical testing and investment simulations. Results show that the hybrid approach outperforms both the standalone SV and LSTM models. These findings contribute to the ongoing development of volatility modeling techniques and provide a robust foundation for enhancing risk assessment and strategic investment planning in the context of the S&P 500.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5910742>`__.

KASPER: Kolmogorov Arnold Networks for Stock Prediction and Explainable Regimes
--------------------------------------------------------------------------------

This paper introduces the KASPER framework, which combines regime detection, sparse spline-based function modeling, and symbolic rule extraction for financial forecasting. The approach uses Kolmogorov-Arnold Network (KAN) layers with specialized activation functions and extracts human-readable rules for interpretability. When tested on real market data, the model demonstrated strong performance with an R² score of 0.89, a Sharpe Ratio of 12.02, and mean squared error of 0.0001, outperforming existing methods in regime-aware financial forecasting.

By Vidhi Oad, Param Pathak, Nouhaila Innan, Shalini D, and Muhammad Shafique.

Mentioned by Piotr Pomorski in `this discussion <https://x.com/PtrPomorski/status/2017303718182404487>`__.

`Read the paper <https://arxiv.org/abs/2507.18983>`__

TradingAgents: Multi-Agents LLM Financial Trading Framework
------------------------------------------------------------

This paper introduces a collaborative trading framework powered by large language models. It features specialized AI agents in roles like fundamental analysts, sentiment analysts, and technical analysts, along with researchers assessing market conditions and a risk management team. The system aims to replicate how real trading firms operate by having agents debate insights and synthesize data to inform trading decisions. The framework demonstrates improvements in cumulative returns, Sharpe ratio, and maximum drawdown compared to baseline approaches.

By Yijia Xiao, Edward Sun, Di Luo, and Wei Wang.

Mentioned by Quant Science in `this discussion <https://x.com/quantscience_/status/2016920152739131471>`__.

`Read the paper <https://arxiv.org/abs/2412.20138>`__

Deep Learning Statistical Arbitrage
------------------------------------

Statistical arbitrage exploits temporal price differences between similar assets. This paper develops a unifying conceptual framework for statistical arbitrage and a novel data-driven solution. The approach constructs arbitrage portfolios of similar assets as residual portfolios from conditional latent asset pricing factors, extracts time series signals using a convolutional transformer, and uses these signals to form an optimal trading policy that maximizes risk-adjusted returns under constraints. The comprehensive empirical study on daily US equities shows high compensation for arbitrageurs to enforce the law of one price, with consistently high out-of-sample mean returns and Sharpe ratios that substantially outperform benchmark approaches.

By Jorge Guijarro-Ordonez, Markus Pelger, and Greg Zanotti.

`Read the paper <https://arxiv.org/abs/2106.04028>`__

Enhancing Time Series Momentum Strategies Using Deep Neural Networks
---------------------------------------------------------------------

This paper introduces Deep Momentum Networks, a hybrid approach that injects deep learning-based trading rules into the volatility scaling framework of time series momentum. Unlike traditional momentum strategies that require manually specifying both a trend estimator and a position sizing rule, the model simultaneously learns both components in a data-driven manner. The networks are directly trained by optimising the Sharpe ratio of the signal, using architectures including linear models, MLPs, LSTMs, and WaveNets. The authors also propose a turnover regularisation term that trains the network to factor in transaction costs at run-time, addressing a key practical concern for more illiquid assets.

Backtesting on a portfolio of 88 continuous futures contracts from 1995 to 2015, the Sharpe-optimised LSTM achieves a Sharpe ratio of 2.91, a Sortino ratio of 4.29, and a Calmar ratio of 2.16 when rescaled to a 15% volatility target, with annualised returns of 45.1% and a maximum drawdown of 20.9%. This represents a more than 2x improvement over the best traditional benchmark (Sgn(Returns), Sharpe 1.39). The win rate reaches 59.6%. However, the high turnover of the raw LSTM signal makes it sensitive to transaction costs — at 10bps costs the unregularised LSTM Sharpe collapses to -5.31. With the proposed turnover regularisation, the LSTM recovers to a Sharpe of 0.91 at 10bps costs, remaining competitive with traditional benchmarks.

Datasets: the exact paper backtest uses 88 ratio-adjusted continuous futures from the commercial `Pinnacle Data CLC Database <https://pinnacledata2.com/clc.html>`__. The exact paper dataset is not publicly released. If you want a close scriptable substitute from the same Oxford research line, the later official repo for the Momentum Transformer downloads the `Nasdaq Data Link CHRIS continuous futures dataset <https://data.nasdaq.com/data/CHRIS-wiki-continuous-futures/documentation>`__.

By Bryan Lim, Stefan Zohren, and Stephen Roberts (University of Oxford, Oxford-Man Institute of Quantitative Finance).

Mentioned by Quant Beckman in `this discussion <https://x.com/quantbeckman/status/2025129088302621068>`__.

`Read the paper <https://arxiv.org/abs/1904.04912>`__

Rethinking the ML Pipeline: Why "Train Wide, Filter Smart" is a Game-Changer for AI Factor Models
---------------------------------------------------------------------------------------------------

This post challenges the conventional quantitative investing approach of pre-filtering a stock universe before training machine learning models. Instead, it advocates a "Train Wide, Filter Smart" paradigm: let nonlinear models like LightGBM or ExtraTrees learn from the full, noisy market universe, then apply simple quality filters only at the portfolio construction stage. The argument is that models trained on a broad universe develop deeper market intelligence about regime changes, factor interactions, and market dynamics that are invisible in a pre-filtered dataset.

The post provides detailed technical insights on how buy filter design interacts with feature normalization. For Z-Score normalized models, simple absolute quality filters like positive EPS are dramatically superior to complex percentile-based filters, because Z-Score normalization amplifies distribution tails. The author also explains why AI factor models built as ensembles of decision trees (e.g., 500 trees with depth 5 yielding over 25,000 decision paths) remain robust even with strict buy rules — the quality filter focuses the model's application without deleting its pre-trained knowledge. The post addresses the "Junk Factor" problem, where ML models naturally load up on speculative stocks because they optimize for prediction rather than risk, and shows how the Train Wide, Filter Smart approach can tame this while preserving alpha.

By Andreas Himmelreich (Systematic AI Investing Portfolios).

Mentioned by Andreas Himmelreich in `this discussion <https://x.com/GfI_Himmelreich/status/2025219523985481896>`__: "Train on a broad universe, then filter. This approach works exceptionally well with AI factor models, but avoid it with traditional ranking systems."

`Read the blog post <https://systematicportfolios.substack.com/p/rethinking-the-ml-pipeline-why-train>`__

Deep Reinforcement Learning for Optimal Portfolio Allocation: A Comparative Study with Mean-Variance Optimization
-------------------------------------------------------------------------------------------------------------------

This paper from J.P. Morgan AI Research presents a thorough comparison between model-free Deep Reinforcement Learning (DRL) and Mean-Variance Optimization (MVO) for portfolio allocation. The authors design a simple market replay environment that slides over historical data, training a DRL agent using Proximal Policy Optimization (PPO) on S&P 500 sector indices from 2006 to 2021. The study uses daily adjusted close price data for 11 S&P 500 sector indices along with VIX and S&P 500 index data as features, incorporating volatility regime indicators derived from rolling window standard deviations. Unlike many DRL studies that benchmark only against naive baselines or other DRL agents, this work provides a practical head-to-head comparison with MVO, the method most commonly used by financial professionals.

The DRL agent outperforms MVO across virtually all key metrics averaged over ten backtesting periods (2012-2021). The DRL agent achieves an annualised return of 12.11% versus 6.53% for MVO, a Sharpe ratio of 1.17 compared to 0.68, and a Sortino ratio of 1.72 versus 1.01. Maximum drawdown is comparable at -32.96% (DRL) versus -33.03% (MVO). The Calmar ratio stands at 2.31 for DRL versus 1.16 for MVO. The DRL strategy also leads to more stable portfolios with decreased turnover, which has practical implications for live deployment where transaction costs and slippage erode returns.

By Srijan Sood, Kassiani Papasotiriou, Marius Vaiciulis, and Tucker Balch (J.P. Morgan AI Research).

Mentioned by Ralph Sueppel in `this discussion <https://x.com/macro_synergy/status/2025841104478687644>`__.

`Read the paper <https://arxiv.org/abs/2602.17098>`__

Janus-Q: End-to-End Event-Driven Trading via Hierarchical-Gated Reward Modeling
---------------------------------------------------------------------------------

This paper proposes Janus-Q, an end-to-end event-driven trading framework that treats financial news events as primary decision units rather than auxiliary signals. The system operates in two stages: first, constructing a large-scale dataset of 62,400 Chinese equity news articles annotated with 10 fine-grained event types, sentiment labels, associated stocks, and event-driven Cumulative Abnormal Returns (CAR); second, performing decision-oriented fine-tuning that combines supervised learning (SFT with LoRA) with reinforcement learning (Group Relative Policy Optimization) guided by a Hierarchical Gated Reward Model (HGRM). The HGRM decomposes trading rewards into interpretable components — a hard gate that blocks all downstream rewards when direction prediction is wrong, a soft gate for event type consistency, and additional terms for trading PnL, magnitude accuracy, and reasoning quality.

Janus-Q achieves a Sharpe ratio of 1.31 on the Chinese A-share test period (November 2024 to January 2025), improving the Sharpe ratio by up to 102.0% over the strongest competing LLM baseline (QwQ-32B at 0.65) while increasing direction accuracy by over 17.5% (58.7% vs 50.0% for the best baseline). Event type classification accuracy reaches 80.1%. Ablation studies show that removing SFT is the most damaging change (Sharpe collapses to -5.28), while GRPO contributes a consistent 13% Sharpe improvement. All market index benchmarks (CSI 300/500/1000) produced negative Sharpe ratios during the test period, and all time-series and financial-domain LLM baselines also underperformed significantly. The model uses a two-day holding period with event-type-weighted position allocation.

By Xiang Li, Zikai Wei, Yiyan Qi, Wanyun Zhou, Xiang Liu, Penglei Sun, Yongqi Zhang, and Xiaowen Chu (The Hong Kong University of Science and Technology (Guangzhou), International Digital Economy Academy).

Mentioned by Quant Beckman in `this discussion <https://x.com/quantbeckman/status/2026208445213385144>`__.

`Read the paper <https://arxiv.org/abs/2602.19919>`__

Deep Learning for Financial Time Series: A Large-Scale Benchmark of Risk-Adjusted Performance
----------------------------------------------------------------------------------------------

This paper presents a comprehensive benchmark of modern deep learning architectures for financial time-series prediction and position sizing, with a primary focus on Sharpe ratio optimization. The study evaluates linear models, recurrent networks, transformer-based architectures, state-space models, and recent sequence-representation approaches on a daily futures dataset spanning commodities, equity indices, bonds, and FX from 2010 to 2025. The evaluation goes beyond average returns to include statistical significance, downside and tail risk measures, breakeven transaction cost analysis, robustness to random seed selection, and computational efficiency.

The key finding is that architectures maintaining explicit recurrent state representations consistently outperform purely attention-based models across most performance dimensions, including downside protection and tail behavior. Variable Selection Networks (VSN) combined with gating mechanisms provide a second critical inductive bias by allowing models to dynamically attend to relevant input features, mitigating noise in low signal-to-noise financial data. Among the models tested, VLSTM (VSN+LSTM) achieves the highest overall Sharpe ratio of 2.39 with a 26.3% CAGR, a HAC t-statistic of 8.81, and a hit rate of 58.8%. VxLSTM (VSN+xLSTM) exhibits the lowest maximum drawdown at -11.8% with the best Calmar ratio of 1.64. LPatchTST (LSTM+PatchTST) delivers a Sharpe of 2.32 with a -17.4% max drawdown and a Calmar of 1.47. xLSTM demonstrates the largest breakeven transaction cost buffer across assets, indicating the greatest robustness to trading frictions. State-space models (Mamba2) and pure attention models (iTransformer) rank near the bottom, while a passive long-only benchmark achieves only a 0.48 Sharpe with -30.8% max drawdown over the same period.

By Adir Saly-Kaufmann, Kieran Wood, Jan Peter-Calliess, and Stefan Zohren (Machine Learning Research Group, University of Oxford; Oxford-Man Institute of Quantitative Finance).

Mentioned by Sepp Hochreiter in `this discussion <https://x.com/HochreiterSepp/status/2028721510232277255>`__: "xLSTM excels in Finance as TiRex does."

Mentioned by Quant Beckman in `this discussion <https://x.com/quantbeckman/status/2033451586446405946>`__: "There is a research-budget effect. The headline results come from averaging the top 10 seeds from 50 runs, selected by validation loss, and they also use top-seed ensembling to reduce turnover."

`Read the paper <https://arxiv.org/abs/2603.01820>`__

Same Error, Different Function: The Optimizer as an Implicit Prior in Financial Time Series
--------------------------------------------------------------------------------------------

This paper demonstrates that neural networks applied to financial time series operate in a regime of underspecification, where models with identical out-of-sample error learn qualitatively different functions. Using large-scale volatility forecasting for S&P 500 stocks, the authors show that different model-training-pipeline pairs achieving the same test loss produce divergent non-linear response profiles and temporal dependencies depending on optimizer choice. These differences have material portfolio consequences: volatility-ranked portfolios constructed from models with equivalent predictive accuracy trace a near-vertical Sharpe-turnover frontier, exhibiting nearly 3x turnover dispersion at comparable Sharpe ratios. The paper concludes that in underspecified settings, the optimizer acts as a consequential source of inductive bias, and model evaluation should extend beyond scalar loss to encompass functional and decision-level implications.

By Federico Vittorio Cortesi, Giuseppe Iannone, Giulia Crippa, Tomaso Poggio, and Pierfrancesco Beneventano.

Mentioned by Pierfrancesco Beneventano in `this discussion <https://x.com/PierBeneventano/status/2029973886687740316>`__: "Your optimizer is your trading strategy!"

`Read the paper <https://arxiv.org/abs/2603.02620>`__

Interpretable ML for High-Frequency Execution
-----------------------------------------------

This paper addresses the problem of optimal order placement in high-frequency trading: whether to post a passive limit order or cross the spread with a market order. Using high-quality tick data from both digital asset centralized exchanges (BTC-USD) and Euronext equities, the authors train a neural network to infer the fill probability function for limit orders at a fixed horizon, employing a weighted loss function to handle censored data from orders that are cancelled before being filled.

SHAP analysis reveals that signed order flow and signed traded volume (net aggressive volume over recent events) are among the most important features for predicting fill probability in BTC-USD, with crypto pairs showing more dynamic flow sensitivity than equities due to small-tick order books. The practical framework estimates cleanup costs through market feature functions and avoids hypothetical order insertion in backtests, instead testing with orders that realistically impact price formation. This directly informs execution strategies: the model helps decide between market and limit orders based on flow-implied fill probability and adverse-move risk.

By Timothée Fabre and Vincent Ragel.

`Read the paper <https://arxiv.org/abs/2307.04863>`__

Explainable Patterns in Cryptocurrency Microstructure
------------------------------------------------------

This paper documents stable cross-asset patterns in cryptocurrency limit-order-book microstructure using data from Binance Futures perpetual contracts (BTC, LTC, ETC, ENJ, ROSE) at 1-second frequency from January 2022 through October 2025. Using a unified CatBoost modeling pipeline with a direction-aware GMADL objective and time-series cross-validation, the authors show that feature rankings and partial effects are remarkably stable across assets spanning an order of magnitude in market capitalization, despite heterogeneous liquidity and volatility.

Order-flow imbalance emerges as one of the most stable, high-SHAP-importance features for predicting 3-second mid-price returns, exhibiting a monotone (with concavity) effect on returns consistent across all assets studied. The paper connects these SHAP structures to classic microstructure theory — adverse selection, Kyle-type price impact, and spread dynamics. Analysis of a major flash crash reveals divergent taker and maker strategy performance that empirically validates adverse selection theory. The results suggest a portable microstructure representation useful for developing universal feature libraries across cryptocurrency markets.

By Bartosz Bieganowski and Robert Ślepaczuk (University of Warsaw).

`Read the paper <https://arxiv.org/abs/2602.00776>`__

E-TRENDS: Enhanced LSTM Trend Forecasting for Equities
------------------------------------------------------

This paper proposes an LSTM-based framework for forecasting next-day trend differences for the top 30 S&P 500 equities, validated across market cycles from 2005 to 2025. The authors provide a formal proof that differencing reduces estimator variance without inflating bias beyond the local slope of the trend, grounding the approach in bias-variance theory. The model uses rolling means, volatilities, t-statistic trend signals, RSI, and MACD as features, and compares two loss functions: standard MSE and a direct Sharpe-ratio loss that optimizes economic performance.

The LSTM is benchmarked against OLS, Ridge, Lasso, and LightGBM regressors. Across the 30-stock universe, the LSTM is the only model that achieves a positive total PnL gain over baseline (+0.28), while OLS (-7.52), Ridge (-3.22), Lasso (-2.14), and LightGBM (-2.19) all underperform. The LSTM outperforms the baseline in 21 out of 30 tickers (70%). Subperiod analysis shows the largest Sharpe gain (+0.45) during the COVID crisis, demonstrating regime adaptability. The paper includes a reproducible Google Colab notebook.

Key metrics (NVDA case study): out-of-sample Sharpe ratio of 1.10 versus 0.85 for the baseline trend-following strategy, 15% RMSE reduction, 62% directional accuracy (up from 56%), and cumulative returns of 150% versus 100% over the out-of-sample period. Across the full universe, total portfolio P&L moves from -2.15 to +0.28 of initial capital. Transaction costs are modelled at 2 bps round-trip.

Mentioned by `Piotr Pomorski <https://x.com/PtrPomorski>`__ in `this discussion <https://x.com/PtrPomorski/status/2033831393977934205>`__: "If moving average cross is not a benchmark then something's off."

By Harris Buchanan (Saint Andrew University) and Eric Benhamou (AI for Alpha, Paris Dauphine University).

`Read the paper <https://arxiv.org/abs/2603.14453>`__

A Controlled Comparison of Deep Learning Architectures for Multi-Horizon Financial Forecasting: Evidence from 918 Experiments
-----------------------------------------------------------------------------------------------------------------------------

This paper provides a large-scale, controlled evaluation of nine deep learning architectures for multi-horizon price forecasting across cryptocurrency, forex, and equity index markets. The architectures benchmarked span four major families — Transformers (Autoformer, iTransformer, PatchTST, TimesNet, TimeXer), MLP (DLinear, N-HiTS), CNN (ModernTCN), and RNN (LSTM) — evaluated at 4-hour and 24-hour forecast horizons. The study's central methodological contribution is a five-stage reproducibility protocol: fixed-seed Bayesian hyperparameter optimisation, configuration freezing per asset class, multi-seed retraining, uncertainty aggregation, and statistical validation, yielding 918 controlled experiments.

The results reveal a clear three-tier ranking structure. ModernTCN, a modern CNN variant, dominates across asset classes, followed by PatchTST. Architecture choice explains nearly all performance variance, while seed randomness is negligible. Rankings remain stable across forecast horizons despite 2–2.5× error amplification from 4-hour to 24-hour predictions. A key finding is that directional accuracy remains near 50% across all configurations, indicating that MSE-trained models lack directional forecasting skill at hourly resolution — a significant limitation for trading signal generation.

Key metrics: ModernTCN achieves a mean rank of 1.333 with a 75% first-place rate across all 918 experiments, followed by PatchTST at mean rank 2.000. Directional accuracy is consistently ~50% across all models and asset classes. No Sharpe ratio or PnL metrics are reported; evaluation is based on MSE/MAE forecasting error only.

Mentioned by `QFinancePapers <https://x.com/QFinancePapers>`__ in `this discussion <https://x.com/QFinancePapers/status/2034560815097950478>`__.

By Nabeel Ahmad Saidd, March 2026.

`Read the paper <https://arxiv.org/abs/2603.16886>`__

Developing Cryptocurrency Trading Strategy Based on Autoencoder-CNN-GANs Algorithms
-------------------------------------------------------------------------------------

This paper proposes a deep learning pipeline for cryptocurrency trading that chains three architectures: a denoising autoencoder filters random noise from raw contract price data, a 1D convolutional layer reduces dimensionality and extracts key features, and a Generative Adversarial Network (GAN) processes the cleaned representation before passing it to a fully connected classification head. The model is trained via cross-validation to identify feature patterns that precede large price moves, then deployed in real-time to place trades only at moments of high prediction confidence in both the direction and magnitude of the anticipated move.

The framework targets large price fluctuation events rather than continuous forecasting, treating the problem as a directional classification task. By separating the noise-removal (autoencoder + CNN) and pattern-generation (GAN) stages, the authors argue that each component focuses on a distinct sub-problem: signal cleaning versus distributional feature synthesis. Empirical results confirm that this pipeline achieves meaningful predictive performance on cryptocurrency data, validating the use of generative models for uncovering latent structure in financial time series.

Key metrics: The abstract reports "a certain level of predictive performance" without providing specific Sharpe ratio, return, or accuracy figures. Evaluation is primarily qualitative confirmation that the combined architecture outperforms simpler baselines on cryptocurrency price prediction.

Mentioned by `QFinancePapers <https://x.com/QFinancePapers>`__ in `this discussion <https://x.com/QFinancePapers/status/1928508914947022870>`__.

By Zhuohuan Hu, Richard Yu, Zizhou Zhang, Haoran Zheng, Qianying Liu, and Yining Zhou, December 2024.

`Read the paper <https://arxiv.org/abs/2412.18202>`__

An Advanced Ensemble Deep Learning Framework for Stock Price Prediction Using VAE, Transformer, and LSTM Model
--------------------------------------------------------------------------------------------------------------

This paper proposes an ensemble framework for stock price prediction that combines three complementary neural architectures: a Variational Autoencoder (VAE) for learning compressed linear representations of high-dimensional data, a Transformer for capturing long-range dependencies and non-linear patterns in price sequences, and an LSTM for modelling short-term temporal dynamics and local fluctuations. The framework uses a rich set of technical indicators as inputs and scales predictors dynamically based on current market conditions. The design philosophy is to exploit the structural strengths of each component — VAE handles dimensionality and noise, Transformer handles long-term context, LSTM handles sequential recency — and combine them into a single prediction signal.

The ensemble is benchmarked against individual model baselines (standalone VAE, Transformer, and LSTM) as well as classical forecasting methods across multiple stock datasets. The combined framework consistently outperforms all single-model comparisons, demonstrating both higher accuracy and greater reliability. The authors position it as applicable to algorithmic trading, risk analysis, and financial decision-making.

Key metrics: The framework demonstrates "consistently high accuracy and reliability" and "exceptional directional performance" versus individual models and classical forecasting, but no specific Sharpe, return, RMSE, or directional accuracy numbers are reported in the abstract. The primary evidence is cross-dataset benchmarking showing ensemble superiority over component models.

Mentioned by `QFinancePapers <https://x.com/QFinancePapers>`__ in `this discussion <https://x.com/QFinancePapers/status/1906641283126378733>`__.

By Anindya Sarkar and G. Vadivu, March 2025.

`Read the paper <https://arxiv.org/abs/2503.22192>`__

Algorithms for Asset Allocators: Review
----------------------------------------

This paper presents a taxonomy and review of machine learning areas relevant to the Asset Allocator domain — endowment funds, pension funds, and sovereign wealth funds — which typically operate on longer time horizons than other investor types and often serve socially important purposes. Despite managing large quantities of assets globally, allocators have historically fallen under the radar in the financial data science literature due to limited datasets, long feedback loops, and a complex variety of underlying investment characteristics.

The review maps out applications of machine learning and computational statistics algorithms across three use cases: investment analysis, portfolio management, and workflow productivity enhancement. The authors argue that the data challenge faced by allocators is one of the most complex problems within asset management, but that the recent period has seen growing interest in applying data science methods across the entire industry, including this domain. The paper further examines private equity investing as a case study, drawing transferable learnings for the broader allocator space.

Key metrics: This is a review and taxonomy paper rather than an empirical study, so no specific performance metrics (Sharpe ratio, returns, drawdown) are reported. The contribution is a structured mapping of ML techniques to allocator-specific challenges and use cases.

Mentioned by `PtrPomorski <https://x.com/PtrPomorski>`__ in `this discussion <https://x.com/PtrPomorski/status/2034966181745238308>`__.

By Chloe Taysom, Nick Firoozye, and Philip Treleaven, February 2026.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6245160>`__

Empirical Asset Pricing via Learning-to-Rank
---------------------------------------------

This paper applies learning-to-rank (L2R) methods from information retrieval to the cross-section of stock returns. Unlike traditional return forecast or probability forecast models that rank stocks based on absolute predicted values, L2R models directly optimise relative rankings among stocks. The authors compare three approaches — return forecasting, probability forecasting, and listwise learning-to-rank — using both gradient-boosted decision trees (GBDT) and three-layer neural networks (NN3) on U.S. equities from 1994 to 2024. They also apply the ranking philosophy to simpler models such as ordered logit, which perform comparably to the most sophisticated ML return and probability forecast models.

The GBDT-based listwise L2R models deliver the strongest results: long-short portfolios achieve average monthly excess returns of 1.88%, 1.55%, and 2.35% with annualised Sharpe ratios of 0.71, 0.63, and 1.18 across the three L2R variants, compared to 0.35–0.53 Sharpe for standard GBDT return and probability forecast models. L2R models also exhibit materially lower maximum drawdowns — the NN3-based listwise model has a maximum drawdown of 41% versus 54% for the return forecast model and 63% for the probability forecast model. The outperformance stems from better identification of top and bottom decile stocks and improved hedging, rather than superior return point estimates. Combining forecasts with L2R does not consistently improve on L2R alone.

Mentioned by `Ivan Blanco <https://www.linkedin.com/in/ivanblancosanchez>`__ in `this LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-learning-to-rank-vs-predicting-share-7442569151061250048-oqt4>`__. In `a follow-up discussion <https://www.linkedin.com/feed/update/urn:li:activity:7444390524037382144/>`__, He Shuhan offered a critical counterpoint: the L2R advantage stems from poorly-specified return models rather than ranking's inherent superiority, characterising it as a robust fallback for noisy signals rather than a universal improvement. See also the related post on `Learning to Rank for Long-Short Equity Portfolio Construction <https://www.linkedin.com/feed/update/urn:li:activity:7084892137594499072/>`__ which covers the ListFold approach to L2R in Chinese equities.

By Yan Lin, Yihong Su, and Zhaobo Zhu.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6348379>`__

Learning to Rank for Long-Short Equity Portfolio Construction
--------------------------------------------------------------

An overview of Learning-to-Rank (L2R) methods applied to quantitative equity portfolio construction. The post explains the three main L2R approaches — pointwise (scoring individual items), pairwise (comparing item pairs), and listwise (optimising entire ranked lists) — and highlights their emerging use in finance, where the goal is to predict ranked stock lists rather than individual stock returns directly.

The post references the ListFold paper by Chen, Li, and Qiao, which introduces a listwise L2R loss function specifically designed for long-short strategies by emphasising both top and bottom rankings. Applied to 68 factors on China's A-share market (2006–2019), ListFold achieved approximately 38% annual return with a Sharpe ratio of 2.0. The implementation is `open-sourced on GitHub <https://github.com/TCtobychen/ListFold>`__. See also the related paper `Empirical Asset Pricing via Learning-to-Rank <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6348379>`__ (Lin, Su, Zhu) which compares L2R to return and probability forecast models on U.S. equities and finds similar L2R advantages.

By `Sione Palu <https://www.linkedin.com/in/sione-palu-62912a85/>`__.

Few-Shot Learning Patterns in Financial Time-Series for Trend-Following Strategies
-----------------------------------------------------------------------------------

Forecasting models for systematic trading strategies do not adapt quickly when financial market conditions rapidly change, as was seen in the advent of the COVID-19 pandemic in 2020, causing many forecasting models to take loss-making positions. To deal with such situations, the authors propose a novel time-series trend-following forecaster that can quickly adapt to new market conditions, referred to as regimes. They leverage recent developments from the deep learning community and use few-shot learning.

The paper introduces the Cross Attentive Time-Series Trend Network — X-Trend — which takes positions by attending over a context set of historical financial time-series regimes. Instead of relying solely on a single fitted model, X-Trend transfers trends from similar patterns in the context set to make forecasts and then takes positions for a new, distinct target regime. The context set is built from change-point-detection segmented sequences, and a cross-attention mechanism matches the current target window against historical regimes, allowing interpretable inspection of which past patterns are driving any given forecast. The architecture is trained directly on Sharpe-ratio loss and supports both few-shot adaptation (rapidly adjusting to new regimes on known assets) and zero-shot transfer (taking positions on previously unseen assets).

By quickly adapting to new financial regimes, X-Trend increases Sharpe ratio by 18.9% over a neural forecaster and 10-fold over a conventional Time-Series Momentum (TSMOM) strategy during the turbulent 2018–2023 period. The strategy recovers from the COVID-19 drawdown roughly twice as quickly as the neural-forecaster baseline. In the zero-shot setting, applied to novel unseen financial assets, X-Trend achieves a 5-fold Sharpe ratio increase versus a neural time-series trend forecaster over the same period. Across 2018–2023 the reference TSMOM and MACD baselines post Sharpe ratios of 0.23 and 0.27 respectively, while the Sharpe-optimised neural baseline reaches 2.27 and the best X-Trend variants reach 2.38–2.43. The cross-attention mechanism additionally allows interpretation of the relationship between forecasts and matched patterns in the context set.

Datasets: the paper backtests on 50 liquid backwards-ratio-adjusted continuous futures from the commercial `Pinnacle Data CLC Database <https://pinnacledata2.com/clc.html>`__. The exact paper dataset is not publicly released, and the current `x-trend` repository is still a placeholder that does not yet ship data loaders. It explicitly builds on the earlier Momentum Transformer codebase, whose README shows how to fetch a similar futures panel from the `Nasdaq Data Link CHRIS continuous futures dataset <https://data.nasdaq.com/data/CHRIS-wiki-continuous-futures/documentation>`__.

By Kieran Wood, Samuel Kessler, Stephen J. Roberts, and Stefan Zohren (Oxford-Man Institute, University of Oxford).

`Read the paper <https://arxiv.org/abs/2310.10500>`__

`Source code on GitHub (placeholder repository) <https://github.com/kieranjwood/x-trend>`__

Trading with the Momentum Transformer: An Intelligent and Interpretable Architecture
-------------------------------------------------------------------------------------

The authors introduce the Momentum Transformer, an attention-based deep-learning architecture, which outperforms benchmark time-series momentum and mean-reversion trading strategies. Unlike state-of-the-art Long Short-Term Memory (LSTM) architectures, which are sequential in nature and tailored to local processing, an attention mechanism provides the architecture with a direct connection to all previous time-steps. The architecture, an attention-LSTM hybrid, enables learning of longer-term dependencies, improves performance when considering returns net of transaction costs and naturally adapts to new market regimes, such as during the SARS-CoV-2 crisis. Via the introduction of multiple attention heads, the model captures concurrent regimes, or temporal dynamics, occurring at different timescales. The Momentum Transformer is inherently interpretable, providing insights into the deep-learning momentum trading strategy, including the importance of different factors over time and the past time-steps that are of the greatest significance to the model.

The model combines an LSTM encoder for local temporal features with a multi-head self-attention block that attends over the full history of an asset's returns and volatility-scaled features. This hybrid design addresses two weaknesses of pure LSTM-based deep momentum networks: limited long-range context and slow adaptation to regime shifts. The paper also introduces a Change Point Detection (CPD) module that flags regime transitions, and shows the Momentum Transformer adapts to the 2020 COVID shock materially faster than LSTM baselines while keeping turnover — and therefore transaction costs — lower.

Backtested on a portfolio of 50 of the most liquid continuous futures contracts from 1990–2020, the Momentum Transformer delivers a Sharpe ratio of roughly 2.33 after rescaling to 15% volatility, outperforming classical TSMOM and MACD benchmarks (Sharpe ~0.4–1.0) as well as the LSTM-based Deep Momentum Network baseline (Sharpe ~1.7–2.0). The advantage widens once transaction costs are included: at 3bps costs the Momentum Transformer retains a Sharpe of ~1.9 versus ~1.2 for the LSTM baseline, driven by lower turnover. During the 2020 COVID regime change, the Momentum Transformer recovers substantially faster than the LSTM-based forecaster.

Datasets: the paper results are reported on 50 liquid continuous futures extracted from the commercial `Pinnacle Data CLC Database <https://pinnacledata2.com/clc.html>`__. The exact paper dataset is not publicly released. The official repo uses the free `Nasdaq Data Link CHRIS continuous futures dataset <https://data.nasdaq.com/data/CHRIS-wiki-continuous-futures/documentation>`__ instead and includes scripts to download the data and build features.

By Kieran Wood, Sven Giegerich, Stephen Roberts, and Stefan Zohren (Oxford-Man Institute, University of Oxford).

`Read the paper <https://arxiv.org/abs/2112.08534>`__

`Source code on GitHub <https://github.com/kieranjwood/trading-momentum-transformer>`__

DeepLOB: Deep Convolutional Neural Networks for Limit Order Books
-----------------------------------------------------------------

Zihao Zhang, Stefan Zohren, and Stephen Roberts (Oxford-Man Institute) develop a large-scale deep learning model to predict price movements directly from raw limit order book (LOB) data. The architecture uses Inception-like convolutional filters to capture the spatial structure of the order book (bid/ask × levels × price/quantity) followed by an LSTM layer to capture longer-term temporal dependencies. Published in IEEE Transactions on Signal Processing (2019).

Our summary: DeepLOB is the reference deep model for LOB price-direction classification. The convolutional front-end is specifically designed around the structured ``(levels × bid/ask × price/quantity)`` tensor that LOB snapshots naturally form, so the model can exploit spatial invariances that a plain MLP would miss. The LSTM back-end then aggregates over the time axis. The most important and underappreciated finding is that the model generalises across instruments: features learned on one set of stocks transfer, with minimal degradation, to completely unseen stocks, indicating that the network has learned genuinely *universal* microstructural features rather than instrument-specific quirks. The authors also perform a sensitivity analysis that highlights which LOB levels drive the predictions, partially de-black-boxing the architecture.

Key metrics: DeepLOB achieves state-of-the-art results on the FI-2010 benchmark dataset with significant F1 gains over prior CNN and LSTM baselines. On a year of London Stock Exchange quotes for a variety of instruments, it delivers a remarkably stable out-of-sample prediction accuracy and transfers successfully to instruments not seen during training — evidence of universal feature extraction.

`Read the paper <https://arxiv.org/abs/1808.03668>`__

Multi-Horizon Forecasting for Limit Order Books
------------------------------------------------

Zihao Zhang and Stefan Zohren (Oxford-Man Institute) design multi-horizon forecasting models for LOB data using encoder-decoder architectures with sequence-to-sequence and attention mechanisms. Unlike single-output classifiers, their models generate a *forecasting path* — predicted mid-price moves at multiple future horizons jointly. The paper also experiments with training on Graphcore Intelligent Processing Units (IPUs) for hardware acceleration.

Our summary: this paper addresses a key weakness of classification-style LOB forecasters like DeepLOB and TransLOB — they only predict at a single fixed horizon, which is a strong constraint on how the model can be used in production. By switching to an encoder-decoder with attention, the authors generate a full sequence of future predictions in one pass, and they show this matches single-horizon SOTA at short horizons while outperforming it at longer horizons where iterative single-step prediction would compound errors. The IPU vs GPU hardware comparison is a useful practical note: training recurrent encoder-decoder models on IPUs delivers significant speedups over GPUs for this specific workload, which is relevant if you want to scale the model across many instruments.

Key metrics: matches SOTA at short horizons and outperforms them at longer horizons by avoiding iterative single-step compounding; significant training-time speedups reported on Graphcore IPUs versus GPUs for the encoder-decoder workload.

`Read the paper <https://arxiv.org/abs/2105.10430>`__

Transformers for Limit Order Books (TransLOB)
-----------------------------------------------

James Wallbridge introduces a deep learning architecture combining a causal dilated convolutional feature extractor with a masked self-attention (transformer) back-end for limit order book price-movement classification. TransLOB is widely cited as the first clean transformer-family architecture for the LOB forecasting task.

Our summary: TransLOB is the point where transformer attention enters the LOB literature. The causal dilated convolution front-end gives the model a large receptive field over recent LOB history cheaply, and the masked self-attention layer then allows flexible temporal aggregation without the vanishing-gradient problems of pure LSTM architectures. The paper shows that on the standard FI-2010 benchmark, this combination outperforms the prior CNN+LSTM family (including DeepLOB). TransLOB set a new SOTA for its era and is the model against which later LOB transformer variants (TLOB, LiT) are benchmarked.

Key metrics: reported to significantly outperform prior CNN and LSTM baselines — including DeepLOB — and to set a new state-of-the-art on the FI-2010 benchmark dataset. Architecture: causal dilated convolutional feature extractor → masked self-attention encoder → classification head.

`Read the paper <https://arxiv.org/abs/2003.00130>`__

TLOB: A Novel Transformer Model with Dual Attention for LOB Price Trend Prediction
----------------------------------------------------------------------------------

Leonardo Berti and Gjergji Kasneci (Technical University of Munich) propose TLOB, a transformer architecture that applies two separate self-attention mechanisms to LOB data — one across price *levels* (spatial) and one across time (temporal). The model is evaluated on FI-2010, Nasdaq equity LOB data, and Bitcoin LOB data across multiple prediction horizons, and also used to measure how stock-price predictability has evolved over time.

Our summary: TLOB is the state-of-the-art LOB transformer at the time of writing (2025) and one of the few deep LOB papers to explicitly include cryptocurrency data. Its dual-attention design recognises that the two axes of an LOB tensor — levels and time — carry very different structure and benefit from separate attention mechanisms rather than being flattened into a single sequence. Beyond the raw SOTA claim, the paper contributes two important practical findings. First, the authors measure a −6.68 F1-score decline in stock LOB predictability over the historical window studied, quantitative evidence that the low-hanging fruit of the deep LOB literature is genuinely diminishing over time. Second — and this is the warning label — when the label definition is made economically realistic by requiring the predicted mid-price move to exceed the bid-ask spread, *classification performance deteriorates significantly* across all models tested. This aligns with the Briola-Bartolucci-Aste observation that high classification F1 does not translate directly into profitable signals.

Key metrics: TLOB outperforms SOTA baselines (including DeepLOB and TransLOB) on every dataset and horizon tested — FI-2010, Nasdaq equities, and Bitcoin LOB data. F1 scores on stock LOB prediction decline by approximately 6.68 points over time. Performance deteriorates significantly when the mid-price trend label requires the move to exceed the average spread.

`Read the paper <https://arxiv.org/abs/2502.15757>`__

LiT: Limit Order Book Transformer
---------------------------------

Yue Xiao, Carmine Ventre, and Haochen Li (King's College London) with collaborators from Birkbeck, UCL, and SOAS introduce LiT, a transformer architecture for LOB forecasting that dispenses with the convolutional front-end entirely and instead uses structured patch-based tokenisation plus pure self-attention to capture spatial and temporal features. Published in Frontiers in Artificial Intelligence (2025).

Our summary: LiT is the "transformer only" LOB model — no convolutions, no recurrence, just self-attention over patches of the LOB tensor. This is the LOB analogue of Vision Transformers (ViT) for images. The authors show that LiT consistently beats traditional ML baselines (XGBoost, logistic regression) as well as SOTA deep baselines (DeepLOB, TransLOB, TLOB) on multiple LOB datasets and forecasting horizons. A practically useful contribution is the distribution-shift evaluation: LiT retains robust performance when lightly fine-tuned on new data, which matters for production deployment where market microstructure evolves. Ablations show that narrower temporal windows with deeper spatial coverage give the best forecasts, which is a useful prior for anyone tuning a similar architecture.

Key metrics: LiT consistently outperforms traditional ML and SOTA deep learning baselines across multiple LOB datasets and prediction horizons; remains robust under distributional shift after lightweight fine-tuning; ablation favours narrower temporal windows with deeper spatial coverage.

`Read the paper <https://www.frontiersin.org/journals/artificial-intelligence/articles/10.3389/frai.2025.1616485/full>`__

Exploring Microstructural Dynamics in Cryptocurrency Limit Order Books: Better Inputs Matter More Than Stacking Another Hidden Layer
-------------------------------------------------------------------------------------------------------------------------------------

Haochuan Wang investigates whether the gains claimed by complex deep learning models on crypto LOB forecasting actually come from architectural depth or from data pre-processing. The paper compares logistic regression, XGBoost, and deep models (DeepLOB, Conv1D+LSTM) on BTC/USDT LOB data using two filtering pipelines (Kalman and Savitzky-Golay) and both binary and ternary price-movement targets across multiple sampling intervals.

Our summary: this paper is a strong piece of negative evidence against the "just stack more layers" school of LOB modelling. The author shows that with careful data pre-processing (Kalman or Savitzky-Golay smoothing), proper denoising, and good hyperparameter tuning, *simpler* models — logistic regression and XGBoost — match or exceed DeepLOB and Conv1D+LSTM on BTC/USDT LOB out-of-sample accuracy while being orders of magnitude faster at inference and much more interpretable. The headline message is "better inputs matter more than stacking another hidden layer", which is particularly important in the crypto setting where data is noisier and latency is at a premium. For anyone starting a new LOB research project, this paper is the argument for beginning with a well-engineered linear/GBT baseline before moving to deep models.

Key metrics: with proper preprocessing and hyperparameter tuning, logistic regression and XGBoost match or exceed DeepLOB and Conv1D+LSTM on BTC/USDT LOB classification, at a fraction of the inference cost and with full interpretability. Tested with both Kalman and Savitzky-Golay filters, binary and ternary targets, and multiple sampling intervals.

`Read the paper <https://arxiv.org/abs/2506.05764>`__

`Read the post <https://www.linkedin.com/feed/update/urn:li:activity:7084892137594499072/>`__

Slow Momentum with Fast Reversion: A Trading Strategy Using Deep Learning and Changepoint Detection
----------------------------------------------------------------------------------------------------

This paper extends the Deep Momentum Network line of research by inserting an online changepoint detection (CPD) module into the signal pipeline. The core idea is that classical and deep trend-following systems both struggle around violent turning points, where a slow momentum signal is still leaning the wrong way just as the market starts reversing. The authors use the CPD module to estimate both the location and the severity of a regime break, then let the network learn when to stay slow, when to flip quickly into a fast mean-reversion mode, and when to switch back.

Our summary: this is the most useful "Path B" paper after the original Deep Momentum Networks work because it tackles the exact failure mode that makes trend systems look fragile in crises: regime transitions. Instead of replacing momentum with a different signal family, it builds a gating layer on top of the existing momentum engine. Conceptually, it is a hybrid of slow trend capture plus tactical reversal response, which is much closer to how a discretionary CTA would actually think about crash periods than a pure one-regime model.

Key metrics: on the 1995-2020 backtest, adding the CPD module improves Sharpe ratio by roughly one-third relative to the base DMN pipeline. Over the more difficult 2015-2020 subperiod, the improvement rises to about two-thirds, which is exactly the period where many traditional momentum strategies struggled.

Datasets: the paper backtest uses the same commercial futures universe family as the Oxford momentum papers. The exact paper dataset is not publicly released. The shared official repo reproduces the workflow with the `Nasdaq Data Link CHRIS continuous futures dataset <https://data.nasdaq.com/data/CHRIS-wiki-continuous-futures/documentation>`__ and provides download plus feature-generation scripts. If you want the exact institutional data source used across the paper line, the authors also reference the `Pinnacle Data CLC Database <https://pinnacledata2.com/clc.html>`__.

By Kieran Wood, Stephen Roberts, and Stefan Zohren (Oxford-Man Institute, University of Oxford).

`Read the paper <https://arxiv.org/abs/2105.13727>`__

`Source code on GitHub <https://github.com/kieranjwood/slow-momentum-fast-reversion>`__

Building Cross-Sectional Systematic Strategies By Learning to Rank
------------------------------------------------------------------

This paper applies learning-to-rank methods to cross-sectional portfolio construction. Instead of forecasting returns or class labels asset by asset and then sorting those outputs afterwards, the model is trained directly on the ranking problem itself. Using cross-sectional momentum as the case study, the authors compare pairwise and listwise ranking approaches against more conventional regression and classification pipelines.

Our summary: this is the clean cross-sectional counterpart to the deep momentum literature. The paper's main contribution is not just "better ML", but better objective alignment: if the portfolio only cares about relative ordering across instruments, then the learning problem should optimize relative ordering directly. That makes it especially relevant for cross-sectional crypto and equity research, where the final portfolio is usually long the best-ranked names and short or underweight the worst-ranked ones. It is also a natural bridge from classical factor sorting to modern ranking losses.

Key metrics: the abstract reports that learning-to-rank methods materially improve ranking accuracy and deliver approximately a threefold boost in Sharpe ratios versus traditional cross-sectional momentum approaches built from standard regression or classification outputs.

Datasets: the study constructs monthly portfolios from `CRSP via WRDS <https://wrds-www.wharton.upenn.edu/pages/get-data/crsp/>`__, using actively traded NYSE common stocks (share codes 10 and 11) from 1980 to 2019 with prices above $1 and valid one-year trading histories. The paper does not bundle a downloadable copy of the panel; WRDS access is required to recreate it exactly.

By Daniel Poh, Bryan Lim, Stefan Zohren, and Stephen Roberts (University of Oxford, Oxford-Man Institute of Quantitative Finance).

`Read the paper <https://arxiv.org/abs/2012.07149>`__

DAM: A Universal Dual Attention Mechanism for Multimodal Timeseries Cryptocurrency Trend Forecasting
------------------------------------------------------------------------------------------------------

Yihang Fu, Mingyu Zhou, and Luyao Zhang propose DAM, a multimodal crypto forecasting architecture that combines market time-series with both news and social-media sentiment processed through CryptoBERT. The design uses two attention stages: one to model information within each modality and another to fuse information across modalities before passing the representation into an LSTM forecaster.

Our summary: this is not an X-Trend clone, but it is one of the clearest crypto papers in the same broad family of "context-aware" architectures. Instead of retrieving historical regimes with cross-attention, DAM conditions price forecasts on multiple external context streams and explicitly models how financial variables and sentiment interact. That makes it relevant if you want a crypto trend model that is richer than pure price-only transformers, especially when market narrative and crowd positioning matter as much as the chart itself.

Key metrics: on the Bitcoin dataset used in the paper, DAM-LSTM reports MAE 719.82, stationary-input MAE 431.86, and MAPE 0.0297. The paper reports roughly 20% improvement over the same LSTM architecture with simple concatenation and also shows the dual-attention version beating ablations that remove either intra-modal or cross-modal attention.

`Read the paper <https://arxiv.org/abs/2405.00522>`__

Temporal Fusion Transformer-Based Trading Strategy for Multi-Crypto Assets Using On-Chain and Technical Indicators
-------------------------------------------------------------------------------------------------------------------

Ming Che Lee introduces a Temporal Fusion Transformer (TFT)-based multi-asset cryptocurrency trading framework that combines technical indicators with on-chain features such as SOPR, TVL, active addresses, exchange net flow, Realized Cap HODL Waves, and the Crypto Fear and Greed Index. The paper moves beyond pure forecasting by translating TFT outputs into daily buy/hold/sell signals and evaluating the resulting trading strategy.

Our summary: among the crypto papers added here, this is one of the most practical bridges from transformer forecasting to deployable trading rules. It is not X-Trend-style few-shot regime retrieval, but it shares the same intuition that richer context helps the model adapt to fast-changing crypto conditions. The main contribution is the combination of interpretable attention with on-chain state variables, which gives the model a broader market picture than simple OHLCV trend systems.

Key metrics: across BTC, ETH, USDT, XRP, and BNB over 2022-2024, the TFT achieves the best average predictive scores among the tested baselines with RMSE 327.28, MAE 217.86, MAPE 3.18%, and R2 0.9432. The derived trading strategy posts a cumulative return of 38.6% and a Sharpe ratio of 1.06, beating LSTM (34.2%, Sharpe 0.98), GRU (31.5%, Sharpe 0.91), SVR (18.7%, Sharpe 0.61), buy-and-hold (28.1%), and naive momentum (26.4%).

`Read the paper <https://www.mdpi.com/2079-8954/13/6/474>`__

Helformer: an attention-based deep learning model for cryptocurrency price forecasting
--------------------------------------------------------------------------------------

T. O. Kehinde, Oluyinka J. Adedokun, Akpan Joseph, Kareem Morenikeji Kabirat, Hammed Adebayo Akano, and Oludolapo A. Olanrewaju introduce Helformer, a crypto forecasting architecture that combines Holt-Winters exponential smoothing with a Transformer-style attention stack and an LSTM component in place of the standard feed-forward block. The model is tuned with Optuna and then tested both on Bitcoin and, via transfer learning, across 15 additional cryptocurrencies.

Our summary: Helformer is one of the strongest crypto-specific transformer-family papers in this file if you care about transfer across assets. That transfer angle is the closest thing here to X-Trend's zero-shot or few-shot generalisation story, even though the architecture is very different. Rather than retrieving analogous regimes from a context set, Helformer decomposes trend and seasonality directly and then shows that patterns learned on BTC travel surprisingly well to other coins.

Key metrics: on optimized BTC forecasting, Helformer reports RMSE 7.7534, MAPE 0.0148%, MAE 5.9252, and near-perfect fit statistics (R2 and EVS both reported as 1). In the BTC trading backtest, the model achieves excess return 925.29%, volatility 0.0178, maximum drawdown approximately -0.00001943, and Sharpe ratio 18.0604, far ahead of the plain Transformer and buy-and-hold baselines. The transfer-learning section also reports strong cross-asset trading results, including ETH excess return 854.88% with Sharpe 16.46 and DOGE excess return 1354.79%.

`Read the paper <https://journalofbigdata.springeropen.com/articles/10.1186/s40537-025-01135-4>`__

Crypto foretell: a novel hybrid attention-correlation based forecasting approach for cryptocurrency
---------------------------------------------------------------------------------------------------

Rabbiya Younas, Hafiz Muhammad Raza Ur Rehman, and Gyu Sang Choi present a hybrid Transformer-based framework for cryptocurrency forecasting that combines self-attention with auto-correlation in a dual-branch architecture. One branch focuses on longer-range temporal structure, while the other is designed to preserve shorter-horizon dynamics that standard Transformer variants often blur away.

Our summary: this is one of the better "multi-timescale crypto transformer" papers and is conceptually adjacent to X-Trend because it explicitly separates long-horizon and short-horizon structure instead of forcing one mechanism to do everything. It is still a forecasting model rather than a regime-matching trend follower, but its hybrid branch design is a useful reference if you want a crypto architecture that can respond to both slow trend persistence and fast local reversals.

Key metrics: across 10 cryptocurrencies and multiple frequencies, the full proposed model reports MAE 1.3235, MSE 6.4343, MAPE 5.2670%, RMSE 1.4053, and Max Error 3.0506. The paper states these results outperform Autoformer, Informer, and FEDformer, and paired t-tests versus deep-learning baselines report statistically significant gains with p-values below 0.05.

`Read the paper <https://link.springer.com/article/10.1186/s40537-025-01291-7>`__

CryptoPulse: Short-Term Cryptocurrency Forecasting with Dual-Prediction and Cross-Correlated Market Indicators
----------------------------------------------------------------------------------------------------------------

Amit Kumar and Taoran Ji introduce CryptoPulse, a short-horizon crypto forecasting system that combines two prediction paths: one conditioned on the macro market environment represented by major cryptocurrencies, and another conditioned on the target asset's own price dynamics and technical indicators. The model then refines and fuses these predictions using market sentiment from cryptocurrency news, with sentiment labels generated through an LLM prompting pipeline.

Our summary: this is probably the closest paper here in spirit to X-Trend's "use contextual information outside the single target series" idea, even though it is aimed at next-day forecasting rather than medium-term trend following. Instead of attending over a library of historical regimes, CryptoPulse attends to cross-coin structure, technical state, and sentiment, then learns how to combine those views. If someone wanted to build an X-Trend-inspired crypto system, CryptoPulse is a strong adjacent reference point.

Key metrics: on the top-5 cryptocurrencies, CryptoPulse reports MAE/MSE/CORR of 0.0607/0.0095/0.9961 for BTC, 0.0529/0.0065/0.9937 for ETH, and 0.0563/0.0103/0.9949 for BNB. On broader aggregates it reports MAE 0.0905 for the top 10, 0.0758 for the top 15, and 0.0774 for the top 20, with the paper stating improvements in MAE of 10.4%-63.8% and in MSE of 17.2%-69.0% versus the best comparison method, while outperforming ten baselines overall.

`Read the paper <https://arxiv.org/abs/2502.19349>`__

QuantNet: Transferring Learning Across Systematic Trading Strategies
--------------------------------------------------------------------

Adriano Koshiyama, Sebastian Flennerhag, Stefano B. Blumberg, Nick Firoozye, and Philip Treleaven propose QuantNet, a transfer-learning architecture for systematic trading that learns market-agnostic patterns jointly with market-specific trading policies. Each market is assigned an encoder-decoder pair, while a shared global model captures transferable structure across markets and feeds that information back into local trading decisions.

Our summary: QuantNet is one of the earliest clean attempts to do transfer learning for end-to-end trading rather than training a separate model per market. The big idea is that many local alpha signals are too weak and noisy to learn well in isolation, but become learnable once a shared latent representation is trained across a large cross-section of markets. Conceptually it sits upstream of later trend and ranking papers: not yet a specialist CTA architecture, but very relevant if you want to transfer signal structure across countries, assets, or strategy families.

Key metrics: evaluated on 3,103 assets across 58 global equity markets, QuantNet delivers 51% higher Sharpe ratio and 69% higher Calmar ratio than the best baseline. Relative to the non-transfer-learning variant, the paper reports further improvements of 15% in Sharpe and 41% in Calmar. The abstract also notes that code is available in the appendix.

Datasets: all 58 market datasets were obtained through `Bloomberg <https://www.bloomberg.com/professional/solution/bloomberg-terminal/>`__. The exact paper dataset is not publicly released, so reproducing the panel requires Bloomberg access rather than a free public dump. The paper does publish an `asset and exchange list <https://www.dropbox.com/s/eobhg2w8ithbgsp/AssetsExchangeList.xlsx?dl=0>`__ for the markets it used.

`Read the paper <https://arxiv.org/abs/2004.03445>`__

`Related implementation on GitHub <https://github.com/alexandrebrilhante/quantnet>`__

Enhancing Cross-Sectional Currency Strategies by Context-Aware Learning to Rank with Self-Attention
----------------------------------------------------------------------------------------------------

Daniel Poh, Bryan Lim, Stefan Zohren, and Stephen Roberts adapt Transformer-style self-attention to the ranking stage of cross-sectional currency strategies. Instead of accepting the initial globally learned ranking at face value, the model uses the top- and bottom-ranked instruments as local context and then re-ranks the slate to account for regime-specific distributional shifts at the rebalancing date.

Our summary: this paper is important because it shifts attention from the forecast model to the portfolio-construction bottleneck itself. The method is especially useful during risk-off episodes, when globally trained rankers can become brittle precisely when ranking accuracy matters most. It is one of the clearest examples of using self-attention not for raw price forecasting, but for contextual portfolio refinement, and it provides a strong design pattern for cross-sectional crypto or macro momentum systems.

Key metrics: on a universe of 31 currencies, the context-aware re-ranking approach increases Sharpe ratio by around 30% and improves several other performance measures relative to the base ranking strategy. The paper also reports better Sharpe ratios when performance is conditioned separately on normal and risk-off market states.

Datasets: the paper uses daily USD exchange-rate data for 31 currencies from the `Bank for International Settlements <https://www.bis.org/statistics/xrusd.htm>`__ over 2000-2020, and it conditions risk-off states using `Cboe VIX historical data <https://www.cboe.com/tradable_products/vix/vix_historical_data/>`__.

`Read the paper <https://arxiv.org/abs/2105.10019>`__

Transfer Ranking in Finance: Applications to Cross-Sectional Momentum with Data Scarcity
----------------------------------------------------------------------------------------

Daniel Poh, Stephen Roberts, and Stefan Zohren introduce Fused Encoder Networks, a transfer-ranking architecture designed for settings where the target market has too little history to support a stable standalone model. The framework combines a source encoder trained on a larger related dataset with a target encoder focused on the small market of interest, while self-attention allows interactions across instruments to influence both training and inference.

Our summary: this is one of the most relevant papers here for crypto. The demonstration problem is cross-sectional momentum over the top ten cryptocurrencies by market capitalisation, which makes it a rare serious ML paper on crypto portfolio construction rather than just coin-by-coin prediction. The paper's core message is that transfer learning can rescue ranking models in data-scarce markets, and that using attention over the instrument set itself matters materially once the universe is small and heterogeneous.

Key metrics: on the top ten cryptocurrencies, the Fused Encoder Networks deliver roughly a three-fold boost in Sharpe ratio over classical momentum and an improvement of about 50% over the best benchmark model without transaction costs. The paper also reports that the model continues to outperform baselines after accounting for the high transaction costs associated with crypto trading.

Datasets: the target crypto panel uses daily close data from `CoinMarketCap <https://coinmarketcap.com/>`__ for the top ten cryptocurrencies by market capitalisation, downsampled to weekly frequency over 2016-2021. The source transfer panel uses 30 USD FX pairs derived from `BIS exchange-rate data <https://www.bis.org/statistics/xrusd.htm>`__, and risk-off labels use `Cboe VIX historical data <https://www.cboe.com/tradable_products/vix/vix_historical_data/>`__.

`Read the paper <https://arxiv.org/abs/2208.09968>`__

Constructing Time-Series Momentum Portfolios with Deep Multi-Task Learning
--------------------------------------------------------------------------

Joel Ong and Dorien Herremans propose a deep multi-task learning approach to time-series momentum that jointly learns the trading policy and several auxiliary volatility-related tasks, such as realised-volatility forecasting under multiple estimators. The goal is to stop treating signal generation and volatility estimation as independent modules and instead let the network learn both together.

Our summary: this is the strongest published non-Oxford line I found on ML-based trend following. The paper keeps close contact with the actual portfolio-construction problem by combining end-to-end TSMOM training with auxiliary tasks that improve volatility awareness. It is a practical bridge between classical volatility-targeted trend following and more modern representation learning, and it is especially useful if you want a model that remains recognisably "trend following" rather than becoming an opaque generic forecaster.

Key metrics: in backtests from January 2000 to December 2020 on a diversified portfolio of continuous futures contracts, the model outperforms existing TSMOM strategies even after accounting for transaction costs of up to 3 basis points. The paper also reports that adding the auxiliary volatility tasks materially improves portfolio performance versus the single-task baseline.

Datasets: the paper uses the commercial Stevens Continuous Futures feed obtained through `Nasdaq Data Link <https://data.nasdaq.com/>`__ from January 1990 to December 2020. The exact paper dataset is not redistributed, and the public repo does not ship the data because of licensing. Its README recommends either a `Bloomberg Terminal <https://www.bloomberg.com/professional/solution/bloomberg-terminal/>`__ or commercial vendor data such as `Pinnacle Data <https://pinnacledata2.com/clc.html>`__ or CQG to build backward-ratio continuous futures locally.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0957417423010898>`__

`Source code on GitHub <https://github.com/joelowj/mtl-tsmom>`__

Deep Inception Networks: A General End-to-End Framework for Multi-asset Quantitative Strategies
------------------------------------------------------------------------------------------------

Tom Liu, Stephen Roberts, and Stefan Zohren introduce Deep Inception Networks (DINs), a family of end-to-end systematic trading models that extract both time-series and cross-sectional features directly from daily returns without hand-crafted signals. DINs extend the Deep Momentum Network line by predicting portfolio-level position sizes directly and by regularising not only turnover but also systemic market-correlation exposure.

Our summary: DIN is one of the more ambitious papers in this literature because it moves from "learn a better single-asset momentum signal" to "learn the whole multi-asset portfolio construction problem end to end." The paper is also useful for its interpretability angle: it explicitly discusses using attention layers and Variable Selection Networks to explain the model's decisions when the feature set becomes large and dynamic.

Key metrics: on futures data, DIN models outperform traditional time-series and cross-sectional benchmarks, remain robust across a range of transaction costs, and perform consistently across random seeds. The paper also reports that the framework generalises across asset classes and supports customisable feature spaces when going beyond the baseline daily-return setting.

Datasets: DIN evaluates four official data sources: 50 cross-asset futures from the `Pinnacle Data CLC Database <https://pinnacledata2.com/clc.html>`__, EURO STOXX 50 equities from `Compustat on WRDS <https://wrds-www.wharton.upenn.edu/pages/about/data-vendors/compustat/>`__, cryptocurrency spot data from `CoinMarketCap <https://coinmarketcap.com/>`__, and FX spot rates from the `Federal Reserve H.10 release <https://www.federalreserve.gov/releases/h10/>`__. The exact combined paper panel is not publicly released, and the futures plus Compustat components require paid or institutional access. The futures dataset is the main one used for the headline trend-following comparison.

`Read the paper <https://arxiv.org/abs/2307.05522>`__

(Re-)Imag(in)ing Price Trends
-----------------------------

Jingwen Jiang, Bryan Kelly, and Dacheng Xiu revisit trend predictability using machine-learning image analysis. Instead of testing predefined chart rules such as momentum or reversal, they convert stock-level price histories into chart images and use convolutional neural networks to discover whatever visual patterns are most predictive of future returns.

Our summary: this paper is not a CTA trend-following paper in the narrow futures sense, but it is one of the most important ML papers on price trends full stop. The main contribution is methodological: if trend information is richer than a few hand-crafted lookbacks, then representing price history as an image and learning the pattern space directly is a natural move. The finding that short-horizon patterns transfer to longer horizons and from U.S. stocks to international markets makes it especially interesting as a general trend-learning reference.

Key metrics: the authors report more accurate return predictions and more profitable investment strategies than traditional price-momentum and reversal-style benchmarks, with robustness across specifications. The paper also highlights context independence: patterns learned on U.S. stocks transfer effectively to international data, and short-term patterns remain useful at longer horizons.

Datasets: the U.S. sample uses daily stock data from `CRSP via WRDS <https://wrds-www.wharton.upenn.edu/pages/get-data/crsp/>`__ for NYSE, AMEX, and NASDAQ firms from 1993 to 2019. The international transfer tests use daily stock data from `LSEG Datastream <https://www.lseg.com/en/data-analytics/financial-data/company-data/pricing-reference-data/datastream-macroeconomic-analysis>`__ for most markets and `CSMAR <https://cn.gtadata.com/>`__ for mainland China. The exact paper datasets are not publicly released, so reproducing the full study requires institutional data subscriptions rather than a single public download.

`Read the paper <https://doi.org/10.1111/jofi.13268>`__

DeepUnifiedMom: Unified Time-series Momentum Portfolio Construction via Multi-Task Learning with Multi-Gate Mixture of Experts
-------------------------------------------------------------------------------------------------------------------------------

Joel Ong and Dorien Herremans introduce DeepUnifiedMom, a unified momentum framework built around multi-task learning and a multi-gate mixture-of-experts architecture. Rather than treating different momentum horizons as separate models, DeepUnifiedMom tries to capture the whole spectrum of time-series momentum opportunities within one portfolio-construction engine.

Our summary: this paper is the natural sequel to the authors' earlier multi-task TSMOM work. The key conceptual advance is the explicit attempt to unify multiple momentum time frames under one model rather than stitching together separate fast, medium, and slow signals. That makes it particularly relevant for researchers who think the real edge lies in dynamically weighting multiple momentum horizons rather than in choosing one canonical lookback.

Key metrics: across equity indices, fixed income, foreign exchange, and commodities, the paper reports that DeepUnifiedMom consistently outperforms benchmark models even after transaction costs. The abstract frames the improvement as broad rather than asset-class-specific, with better risk-adjusted returns across the diversified multi-asset portfolio.

Datasets: the paper uses 49 continuous futures from the commercial `Pinnacle Data CLC Database <https://pinnacledata2.com/clc.html>`__ from 1990 to 2023. The exact paper dataset is not publicly released, and the public repo does not ship the data because of licensing; its README recommends reconstructing continuous futures from a `Bloomberg Terminal <https://www.bloomberg.com/professional/solution/bloomberg-terminal/>`__ or purchasing equivalent vendor data such as `Pinnacle Data <https://pinnacledata2.com/clc.html>`__ or CQG.

`Read the paper <https://arxiv.org/abs/2406.08742>`__

`Source code on GitHub <https://github.com/joelowj/unified_mom_mmoe>`__

DeePM: Regime-Robust Deep Learning for Systematic Macro Portfolio Management
----------------------------------------------------------------------------

Kieran Wood, Stephen J. Roberts, and Stefan Zohren propose DeePM (Deep Portfolio Manager), a structured macro portfolio model trained end to end to maximise a robust risk-adjusted utility. DeePM combines a directed-delay mechanism to handle asynchronous information arrival, a macroeconomic graph prior to regularise cross-asset structure, and a worst-window robust objective designed to improve behaviour in the most adverse historical subperiods.

Our summary: this is the most interesting new public paper I found after the Momentum Transformer and X-Trend line. DeePM pushes the literature from better trend signals toward robust macro portfolio management under regime instability. The architecture is unusually explicit about three real trading problems that many finance ML papers ignore: ragged information timing, low signal-to-noise ratios, and the need to optimise not just average Sharpe but resilience in the worst windows.

Key metrics: in large-scale backtests from 2010 to 2025 on 50 diversified futures with realistic transaction costs, DeePM achieves net risk-adjusted returns roughly twice those of classical trend-following strategies and passive benchmarks. The paper also reports an improvement of roughly 50% over the Momentum Transformer baseline while remaining resilient through the CTA winter of the 2010s, the COVID shock, and the post-2020 inflation regime.

Datasets: DeePM uses daily OHLC histories for 50 futures and FX contracts from the commercial `Pinnacle Data CLC Database <https://pinnacledata2.com/clc.html>`__, then constructs ratio-adjusted continuous return series and derives all features from close prices only. The exact paper dataset is not publicly released, so reproducing the setup requires Pinnacle or an equivalent futures vendor that lets you build backward-ratio continuous contracts.

`Read the paper <https://arxiv.org/abs/2601.05975>`__

Do LLMs Make Markets More Efficient?
-------------------------------------

Runjing Lu, Yongxin Xu, and Luka Vulicevic study whether large language models have changed short-horizon price discovery in equity markets. The paper uses outages at major LLM providers as plausibly exogenous shocks to LLM availability and measures how post-news drift changes when these tools are unavailable. The central finding is that LLM availability eliminates at least 46% to 61% of next-day post-news drift, with no offsetting reversal, suggesting that LLMs accelerate the incorporation of public information into prices.

Our summary: this is a clean event-study framing of a question that matters directly for systematic managers: if many market participants now use LLMs to process public text quickly, slow information-diffusion signals should decay faster. The outage design is attractive because it looks for temporary failures in the information-processing layer rather than just correlating LLM adoption with changing anomaly returns. It also highlights a market-structure risk: if LLM supply is concentrated, provider outages can temporarily reduce market-wide information processing capacity.

Code and data: no public replication package is linked from the paper. The outage sample is built from the official status pages for OpenAI, Anthropic/Claude, and Google/Gemini, beginning after the ChatGPT API release in March 2023. Firm-level news comes from Dow Jones Newswires through RavenPack 1.0, sentiment is measured with the RavenPack Event Sentiment Score, stock returns come from CRSP, and abnormal returns are computed against DGTW characteristic-adjusted benchmark portfolios. Reproducing the study therefore requires commercial news/sentiment and returns data plus the authors' precise outage classification.

Key metrics: LLM availability reduces next-day return predictability after news by 46% to 61%. A one-standard-deviation increase in news sentiment predicts 13 bps of day t + 1 abnormal return outside outages, 25 bps during any-provider outages, and 34 bps during multi-provider outages. The paper's long-short news-sentiment strategy earns about 20 bps on day t + 1 when LLMs are widely available and about 60 bps during multi-provider outages, a threefold increase. Runjing Lu's `discussion of the paper <https://www.linkedin.com/posts/runjing-lu-b5881361_what-happens-to-stock-markets-when-llms-go-activity-7439418213555220480-4ZEZ>`__ says this can amount to more than 600 bps annualised when outages occur every few weeks. The paper does not report Sharpe ratio, max drawdown, or win-rate statistics.

Mentioned by Ivan Blanco in this `LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-ideas-are-llms-making-equity-share-7449355315436900352-qKiz>`__, where he frames the result as evidence that slow public-information signals are decaying faster than they did a few years ago.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6417099>`__

Temporal Fusion Transformers for Interpretable Multi-horizon Time Series Forecasting
------------------------------------------------------------------------------------

Bryan Lim, Sercan O. Arik, Nicolas Loeff, and Tomas Pfister introduce the Temporal Fusion Transformer (TFT), a multi-horizon forecasting architecture that combines recurrent local processing, gating layers, variable-selection networks, static covariate encoders, and interpretable self-attention. The model is designed for settings where forecasts depend on a mixture of static attributes, known future inputs, and observed historical variables.

Our summary: this is the foundational TFT paper and the starting point for almost all later trading, price prediction, and volatility applications. Its relevance to finance is structural rather than asset-specific: markets often have many noisy covariates, regime-dependent feature importance, and a need for probabilistic multi-step forecasts. TFT's built-in quantile outputs and variable-importance diagnostics make it especially attractive for risk sizing and model debugging, although the paper itself evaluates general forecasting benchmarks rather than a trading strategy.

Key metrics: across multiple public forecasting datasets, TFT outperforms strong statistical and neural baselines in multi-horizon prediction accuracy. The paper reports interpretability results through static covariate importance, time-varying feature importance, and attention analysis rather than financial metrics such as Sharpe ratio, drawdown, or turnover.

Code and data: Google Research provides the original TensorFlow implementation in its public `TFT repository <https://github.com/google-research/google-research/tree/master/tft>`__. The benchmark datasets are general time-series datasets rather than market-specific data.

`Read the paper <https://arxiv.org/abs/1912.09363>`__

Causality-driven multivariate stock movement forecasting
--------------------------------------------------------

Kai Zhao and coauthors propose a multivariate stock movement forecasting framework that combines Dynamic Transfer Entropy with Temporal Fusion Transformers. The method first estimates directional information flow between stocks and then feeds those causality-aware relationships, together with market data and news sentiment features, into a TFT-style forecasting model.

Our summary: this paper is a useful stock-market application because it treats equities as an interacting system rather than as independent univariate price series. That is a good fit for TFT: the model can use exogenous information and variable-selection mechanisms while the causality layer supplies a finance-specific structure for cross-stock influence. The approach is most relevant for researchers building multi-asset equity forecasts or sentiment-aware stock movement classifiers.

Key metrics: the paper reports that the causality-driven TFT framework outperforms the compared baseline models for stock movement prediction. The evaluation focuses on forecasting/classification performance rather than portfolio-level trading metrics, so the result should be treated as predictive evidence rather than proof of an executable trading edge.

Code and data: the article is open access through PLOS ONE. The model uses stock market data and sentiment/news inputs; a standalone public replication repository was not identified during this pass.

`Read the paper <https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0302197>`__

A Novel Hybrid Temporal Fusion Transformer Graph Neural Network Model for Stock Market Prediction
-------------------------------------------------------------------------------------------------

Christopher J. Lynch, Mozhgan Derakhshan, and James Lynch combine Temporal Fusion Transformers with graph neural networks for stock-market prediction. The paper tests whether adding graph-based relational structure between assets improves on standalone time-series models, using major U.S. market instruments including AAPL, JPM, NVDA, and SPY.

Our summary: this is one of the more natural extensions of TFT for equities because stock returns are rarely independent. TFT handles multi-horizon temporal structure and covariates, while the graph component gives the model a way to represent relationships between instruments. For trading research, the paper is most useful as a design reference for combining asset-level forecasts with cross-sectional structure.

Key metrics: the hybrid TFT-GNN reports the best overall forecasting accuracy in the paper's comparison, with RMSE 2.1662 and R2 0.9645 versus standalone TFT RMSE 2.3369 and R2 0.9577. The paper emphasizes forecast accuracy, not a full transaction-cost-aware trading backtest with Sharpe, drawdown, and turnover.

Code and data: the paper is published open access by MDPI. The study uses major liquid U.S. equities and index data; no public replication package was identified in the article metadata during this pass.

`Read the paper <https://www.mdpi.com/2673-9909/5/4/176>`__

Stock Price Prediction Based on Temporal Fusion Transformer
-----------------------------------------------------------

Xiaoyu Hu applies Temporal Fusion Transformers to stock price prediction in one of the earlier finance-specific TFT papers. The work frames stock forecasting as a multi-feature time-series problem and compares the TFT approach against more traditional forecasting setups for market data.

Our summary: this paper is useful mainly as an early citation showing how quickly TFT moved from general forecasting into stock-price prediction. It is less practically compelling than later work that includes trading rules, graph structure, on-chain data, or volatility targets, but it belongs in the reading trail because many subsequent stock TFT projects cite it as a starting point.

Key metrics: the paper reports improved stock prediction performance from the TFT model relative to the baselines considered in the conference study. It does not provide the kind of full trading-performance attribution needed for strategy evaluation, such as annualized return, Sharpe ratio, maximum drawdown, or transaction-cost sensitivity.

Code and data: the canonical citation is the 2021 IEEE MLBDBI conference paper. A public replication repository was not identified during this pass.

`Read the paper <https://doi.org/10.1109/MLBDBI54094.2021.00019>`__

Sentiment-Aware Transformer for Cryptocurrency Volatility Prediction Using Multi-Source Market and News Sentiment
-----------------------------------------------------------------------------------------------------------------

This paper studies cryptocurrency volatility prediction with a Transformer-family model that combines market variables with multiple sentiment sources. The architecture is inspired by Temporal Fusion Transformer ideas, especially the use of attention and heterogeneous covariates, but it is better read as adjacent sentiment-aware volatility research rather than a canonical TFT implementation.

Our summary: the paper is relevant because it points to the same practical conclusion as the stronger TFT crypto and volatility papers: price-only inputs are usually too thin for unstable digital-asset markets. Combining market state, sentiment, and attention-based feature weighting is a plausible direction for volatility forecasting and risk control. The caveat is that this source is not as central as the original TFT paper, the Lee crypto trading paper, or the GARCH-TFT ETF volatility paper.

Key metrics: the paper reports forecasting improvements from adding multi-source sentiment features to the Transformer-style volatility model. It focuses on predictive accuracy for volatility rather than a complete trading or portfolio-sizing backtest with Sharpe, drawdown, and turnover.

Code and data: the article is available through JESSI. No public code repository was identified during this pass.

`Read the paper <https://journal.unm.ac.id/index.php/JESSI/article/view/10604>`__

Regime Switching Forecasting for Cryptocurrencies
-------------------------------------------------

Ilyas Agakishiev, Wolfgang Karl Härdle, Denis Becker, and Xiaorui Zuo combine regime-switching forecasting with reinforcement learning for cryptocurrency portfolio management. The paper defines three volatility regimes — low volatility, high volatility, and distress — using volatility and return quantiles with buffer zones to prevent excessive switching. An LSTM network with a weighted loss function predicts regime probabilities from Bitcoin on-chain metadata (sent coins, transaction fees, active addresses, exchange flows), and a Proximal Policy Optimization (PPO) reinforcement learning agent uses these regime predictions to determine hourly allocation weights for the CRIX cryptocurrency index. Published in Digital Finance, Vol. 7, pp. 107-131, 2025.

Our summary: this paper is useful for two distinct contributions. First, the regime definition framework — three states based on volatility quantiles plus a return-based distress criterion, with buffer zones to avoid whipsawing — is a practical template for building crypto regime labels that acknowledge the near-zero skewness of crypto returns (unlike equities where high volatility is predominantly downside). Second, the paper tests whether feeding regime probabilities versus hard regime labels versus no regimes into an RL agent makes a difference. The training-set results show clear separation: both regime probabilities and hard labels outperform the no-regime baseline in cumulative reward. However, out-of-sample performance differences are insignificant, which the authors attribute to insufficient data and non-stationarity. The LIME interpretability analysis reveals that trading-volume-related on-chain metadata are the most influential features for regime prediction, which aligns with the intuition that on-chain activity carries information about market state beyond what price alone provides. The weighting system for handling regime-class imbalance and upweighting regime-switch data points is a practical detail worth adopting for any regime-classification task on crypto data.

Data and code: daily Bitcoin metadata from the Blockchain Research Center (BRC) for regime prediction (September 2015 to May 2022) and hourly CRIX index data for RL trading. All code is available on the Quantlet platform, and a Courselet for the paper is available on Quantinar.

Key metrics: regime prediction F1-scores improve with the weighted LSTM compared to unweighted LSTM and ARMA-GARCH baselines, with the weighting hyperparameter lambda controlling emphasis on regime-switch accuracy. For RL trading, the regime-probability variant achieves the highest training reward, but out-of-sample annualized returns, volatility, and Sharpe ratios are not significantly different across the three variants (with regimes, without regimes, probabilities only). The paper does not report final out-of-sample Sharpe ratios or drawdown figures, focusing instead on the training reward progression and regime prediction accuracy.

`Read the paper <https://link.springer.com/article/10.1007/s42521-024-00123-2>`__

Signal Decomposition Methods for Financial Time Series
======================================================

This section covers research on Variational Mode Decomposition (VMD), Empirical Mode Decomposition (EMD), CEEMDAN, Empirical Wavelet Transform (EWT), and related signal decomposition methods applied to financial time series forecasting, volatility prediction, and trading strategies. These methods decompose complex, non-stationary financial signals into simpler components (intrinsic mode functions) that can be modeled individually — typically with deep learning architectures — and then ensembled for final predictions.

Foundational Method Papers
--------------------------

Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Konstantin Dragomiretskiy and Dominique Zosso introduce Variational Mode Decomposition (VMD), a completely non-recursive signal decomposition method that determines the relevant modes of a signal concurrently by solving a constrained variational optimization problem. Unlike Empirical Mode Decomposition (EMD), VMD decomposes a signal into a discrete number of band-limited intrinsic mode functions (IMFs) by seeking modes whose estimated bandwidths are minimized. The optimization is solved via the Alternating Direction Method of Multipliers (ADMM). VMD is provably robust to noise and sampling, and outperforms EMD in tone separation, noise robustness, and handling of signals with close frequencies. Published in IEEE Transactions on Signal Processing, Vol. 62, No. 3, pp. 531-544, 2014.

Our summary: this is the foundational paper for the entire VMD literature. The key insight is reformulating mode decomposition as a variational optimization problem rather than a recursive sifting process. This eliminates EMD's sensitivity to noise, mode mixing, and the need for numerous sifting iterations. For financial applications, VMD's ability to cleanly separate signals with similar frequencies is particularly valuable — financial time series contain overlapping cyclical components (trend, seasonal, noise) that EMD struggles to disentangle. The parameter K (number of modes) must be specified in advance, which has spawned a large literature on automatic K selection using information-theoretic criteria or metaheuristic optimization.

Code: MATLAB implementation provided by the authors. Python implementations available in the vmdpy package.

`Read the paper <https://ieeexplore.ieee.org/document/6655981/>`__

Successive Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

M. Nazari and S.M. Sakhaei propose Successive VMD (SVMD), which extracts modes one at a time rather than simultaneously. This removes the need to specify the number of modes K in advance — a major practical limitation of standard VMD. SVMD has lower computational complexity and is more robust to initialization than standard VMD. The method iteratively extracts the dominant mode, subtracts it from the residual, and continues until a stopping criterion is met. Published in Signal Processing, Vol. 174, 107610, 2020.

Our summary: SVMD solves the most criticized limitation of VMD — the requirement to pre-specify K. For financial time series where the number of meaningful frequency components is unknown and time-varying, SVMD offers a more practical decomposition. Recent financial applications (SVMD-LSTM, F-LOAM) show 10-52% improvements over standard VMD-LSTM approaches, suggesting the successive extraction captures more relevant structure.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0165168420301535>`__

Multivariate Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Naveed ur Rehman and Hania Aftab extend VMD to multichannel data, proposing Multivariate VMD (MVMD). The method models multivariate modulated oscillations with shared frequency components across all input channels and minimizes the sum of bandwidths across all channels simultaneously using ADMM. This enables joint decomposition of correlated financial time series — for example, decomposing OHLCV data or multiple asset prices together while preserving cross-channel frequency alignment. Published in IEEE Transactions on Signal Processing, Vol. 67, pp. 6039-6052, 2019.

Our summary: MVMD is significant for financial applications because markets generate multivariate data (price, volume, volatility, sentiment) that share common cyclical structures. Decomposing each series independently with standard VMD loses cross-variable frequency alignment. MVMD preserves this alignment, which recent papers (MVMD-NT-TiF, VD-MoGRU) have exploited for improved stock index prediction by jointly decomposing price and volume series.

`Read the paper <https://arxiv.org/abs/1907.04509>`__

Short-Time Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hao Jia, Pengfei Cao, Tong Liang, Cesar F. Caiafa, Zhe Sun et al. introduce Short-Time VMD (STVMD), which extends VMD by incorporating Short-Time Fourier Transform concepts. The method segments signals into short time windows and performs VMD within each window, allowing central frequencies to shift over time. Two variants are proposed: non-dynamic STVMD (fixed frequencies per window) and dynamic STVMD (frequencies evolve across windows). Published in Signal Processing, 2025. arXiv:2501.09174.

Our summary: STVMD is the newest VMD variant and addresses a fundamental limitation of standard VMD for financial data — the assumption of stationary frequency content. Financial time series exhibit time-varying spectral characteristics (e.g., volatility clustering shifts frequency content). Dynamic STVMD can track these shifts, making it theoretically superior for non-stationary financial data. As of 2025, no financial applications have been published yet, representing a research opportunity.

`Read the paper <https://arxiv.org/abs/2501.09174>`__

Orthogonalized Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Himpu Marbona, Daniel Rodriguez, Alejandro Martinez-Cava, and Eusebio Valero propose OVMD, which modifies VMD by adding an orthogonality constraint to the optimization problem. This prevents mode duplication — a known issue where standard VMD can produce redundant modes that capture the same signal component. OVMD enhances robustness against over-segmentation when K is overestimated. Published in Signal Processing, 2025.

Our summary: mode duplication is a practical problem when using VMD with metaheuristic K optimization — if K is set too high, standard VMD wastes capacity on duplicate modes. OVMD addresses this by enforcing orthogonality, making the decomposition more robust to K misspecification. For financial applications where automatic K selection is common, this provides a safety net.

`Read the paper <https://doi.org/10.2139/ssrn.5159413>`__

Generalized VMD and Sequential GVMD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wei Chen and Yong Zhang propose Generalized VMD (GVMD) for unknown modal numbers and its sequential variant SGVMD that extracts modes sequentially without requiring a predefined mode count. SGVMD-ARIMA and SGVMD-LSTM models have been tested on financial time series, demonstrating improved performance over traditional decomposition-prediction models. SSRN preprint, 2024. arXiv:2406.03157.

Our summary: SGVMD combines the benefits of successive extraction (no K required) with a more general optimization formulation. The SGVMD-ARIMA model shows high feasibility for non-stationary financial time series. This is conceptually similar to SVMD but with a different optimization framework.

`Read the paper <https://arxiv.org/abs/2406.03157>`__

Successive Multivariate Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Nazari et al. extend SVMD to multivariate settings, combining the successive extraction approach with multichannel data processing. This merges the advantages of SVMD (no need to pre-specify K) with MVMD (joint cross-channel decomposition). Published in Multidimensional Systems and Signal Processing, Springer, 2022.

Our summary: this method is the natural synthesis of SVMD and MVMD, enabling automatic mode extraction from multivariate financial data. Particularly relevant for joint decomposition of multi-asset portfolios or OHLCV data where both the number of modes and cross-channel alignment matter.

`Read the paper <https://link.springer.com/article/10.1007/s11045-022-00828-w>`__

VMD for Stock Price and Index Forecasting
-----------------------------------------

A Variational Mode Decomposition Approach for Analysis and Forecasting of Economic and Financial Time Series
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Salim Lahmiri applies VMD to economic and financial time series forecasting, combining VMD with General Regression Neural Networks (GRNN). This is one of the earliest papers applying VMD to finance, demonstrating VMD's superiority over EMD across multiple financial datasets. VMD+GRNN consistently produces lower forecast errors than EMD+GRNN for horizons of 1 to 22 days ahead. Published in Expert Systems with Applications, Vol. 55, pp. 268-273, 2016.

Our summary: this seminal paper established VMD as a viable alternative to EMD for financial decomposition. The key finding — that VMD's variational optimization produces cleaner mode separation than EMD's recursive sifting — has been confirmed by virtually every subsequent comparison study. The use of GRNN (a simple single-pass neural network) shows that VMD's decomposition quality is the primary driver of forecast improvement, not model complexity.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417416300562>`__

Intraday Stock Price Forecasting Based on Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Salim Lahmiri proposes a VMD-PSO-BPNN hybrid for intraday stock price forecasting using one-minute interval data from six American stocks. VMD decomposes noisy intraday prices into variational modes that serve as input features for a backpropagation neural network optimized by particle swarm optimization. Published in Journal of Computational Science, 2016.

Our summary: one of the first VMD applications to high-frequency financial data. The approach demonstrates that VMD can effectively denoise minute-level stock prices, which are particularly noisy. The VMD-PSO-BPNN hybrid outperforms the baseline PSO-BPNN without decomposition.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1877750315300466>`__

A Hybrid Stock Price Index Forecasting Model Based on Variational Mode Decomposition and LSTM Network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hongli Niu, Kunliang Xu, and Weiqing Wang introduce the VMD-LSTM decomposition-ensemble framework for stock price index prediction. VMD decomposes index series into smooth IMFs, individual LSTM networks predict each IMF, and predictions are aggregated. Tested on SENSEX and CSI 300 indices, VMD-LSTM achieves 73% reduction in error metrics compared to standalone LSTM for SENSEX. Published in Applied Intelligence, Vol. 50, pp. 4296-4309, 2020.

Our summary: this paper established the VMD-LSTM paradigm that dominates the field. The 73% error reduction on SENSEX is one of the largest reported improvements from adding VMD preprocessing. The decompose-predict-ensemble framework — where each IMF gets its own LSTM — became the template for dozens of subsequent papers. The key insight is that individual IMFs have simpler dynamics (quasi-stationary, narrow-band) that LSTM can learn more effectively than raw price series.

Key metrics: 73% RMSE reduction on SENSEX; significant improvements on CSI 300 vs. standalone LSTM, EMD-LSTM, and EEMD-LSTM baselines.

`Read the paper <https://link.springer.com/article/10.1007/s10489-020-01814-0>`__

A Hybrid Model Combining Variational Mode Decomposition and an Attention-GRU Network for Stock Price Index Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hongli Niu and Kunliang Xu combine VMD with attention-enhanced GRU for FTSE and NASDAQ index forecasting. The attention mechanism assigns different weights to input time steps, allowing the model to focus on the most informative parts of each decomposed IMF sequence. Published in Mathematical Biosciences and Engineering, Vol. 17(6), pp. 7151-7166, 2020.

Our summary: this paper adds attention to the VMD-RNN paradigm, showing that not all time steps in decomposed components are equally informative. The attention-GRU combination captures long-range dependencies more effectively than plain GRU or LSTM for stock index prediction.

`Read the paper <https://www.aimspress.com/article/doi/10.3934/mbe.2020367>`__

A Stock Price Prediction Method Based on Meta-Learning and Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Tengteng Liu, Xiang Ma, Shuo Li, Xue-mei Li, and Caiming Zhang propose VML, combining VMD with Model-Agnostic Meta-Learning (MAML) and LSTM. Critically, this paper addresses the data leakage problem in decomposition-based methods by decomposing sliding windows rather than the full time series. MAML enables rapid adaptation to new stocks with limited data. Published in Knowledge-Based Systems, Vol. 252, 2022.

Our summary: this paper makes two important contributions. First, it identifies and solves the temporal leakage problem — most VMD papers decompose the entire series (including future data) before train/test split, which inflates accuracy. VML decomposes only within sliding windows, making the decomposition causally valid. Second, the meta-learning component means a single model can adapt to new stocks, unlike per-stock VMD-LSTM models. This is one of the most methodologically rigorous VMD finance papers.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0950705122006645>`__

A Stock Series Prediction Model Based on Variational Mode Decomposition and Dual-Channel Attention Network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yepeng Liu et al. propose VMD-LSTMA+TCNA, a dual-channel attention model. Stock series are divided into equal-length sub-windows by sliding window to prevent information leakage, decomposed with VMD, then processed by parallel LSTM-attention (for long-term dependencies) and TCN-attention (for local patterns) channels. Tested on US and Hong Kong markets. Published in Expert Systems with Applications, Vol. 238, 2024.

Our summary: the dual-channel architecture is a practical innovation — LSTM-attention captures regime-level trends while TCN-attention captures short-term patterns, and combining both via attention weighting outperforms either channel alone. The sliding-window VMD approach follows VML in addressing temporal leakage.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417423022108>`__

Multi-step-ahead Stock Price Prediction Using Recurrent Fuzzy Neural Network and Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hamid Nasiri and Mohammad Mehdi Ebadzadeh propose VMD-MFRFNN, combining VMD with a multi-functional recurrent fuzzy neural network optimized by PSO. Each IMF is predicted by a separate MFRFNN, and results are reconstructed. Tested on Hang Seng Index, Shanghai Stock Exchange, and S&P 500 at 1, 3, 5, 7, 14, and 21-step horizons. Published in Applied Soft Computing, 2023. arXiv:2212.14687.

Our summary: this paper stands out for testing multi-step forecasting (up to 21 days ahead), where most VMD papers focus on 1-step prediction. The fuzzy neural network adds interpretability through fuzzy rules, and the PSO optimization of both VMD parameters and network weights makes the approach fully automated.

Key metrics: 35.93%, 24.88%, and 34.59% RMSE decreases on HSI, SSE, and S&P 500 respectively compared to the second-best model. Performance degrades gracefully from 1-step to 21-step horizons.

`Read the paper <https://arxiv.org/abs/2212.14687>`__

Enhanced Forecasting of Stock Prices Based on Variational Mode Decomposition, PatchTST, and Adaptive Scale-Weighted Layer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Xiaorui Xue, Shaofang Li, and Xiaonan Wang integrate VMD with PatchTST (Patch Time Series Transformer) and an adaptive scale-weighted layer (ASWL). Each VMD-decomposed IMF is modeled by PatchTST, and ASWL learns optimal weights for combining multi-scale predictions. Tested on S&P 500, Dow Jones, Shanghai Stock Exchange Composite, and FTSE from 2000 to 2024. arXiv:2408.16707, 2024.

Our summary: this paper represents the transition from VMD+LSTM to VMD+Transformer architectures. PatchTST's patch-based tokenization is well-suited to IMF sequences because each IMF has a dominant frequency that maps naturally to a patch size. The ASWL is the key innovation — rather than simple summation of IMF predictions, it learns frequency-dependent weights that adapt to market conditions.

Key metrics: best results on DJI with MSE of 67.66 and sMAPE of 0.35%. Consistent improvements across all four indices over VMD-LSTM and standalone PatchTST.

`Read the paper <https://arxiv.org/abs/2408.16707>`__

Variational Mode Decomposition and Linear Embeddings are What You Need For Time-Series Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hafizh Raihan Kurnia Putra, Novanto Yudistira, and Tirana Noor Fatyanosa demonstrate that VMD combined with simple linear models can match or outperform complex deep learning architectures for time-series forecasting. Testing across 13 datasets, Linear+VMD achieves average RMSE of 0.619 for univariate forecasting, and DLinear+VMD reaches 0.019 for multivariate settings, outperforming LSTM and RNN alternatives. arXiv:2408.16122, 2024.

Our summary: this is a provocative result — it suggests that VMD's decomposition does the heavy lifting, and the downstream model complexity matters much less than commonly assumed. If VMD decomposes a series into near-stationary components, even a linear model can forecast each component well. This has practical implications: VMD+linear is faster to train, more interpretable, and less prone to overfitting than VMD+LSTM or VMD+Transformer approaches.

Code: available at https://github.com/Espalemit/VMD-With-LTSF-Linear.git

`Read the paper <https://arxiv.org/abs/2408.16122>`__

Accurate and Efficient Stock Market Index Prediction: An Integrated Approach Based on VMD-SNNs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Xuchang Chen, Guoqiang Tang, Yumei Ren, Xin Lin, and Tongzhi Li combine SABO-optimized VMD with TCN-LSTM feature extraction and Spiking Neural Networks (SNNs) for stock index prediction. The approach separates periodic and trend components while reducing noise. Tested on CSI 300, DJI, Nikkei 225, and SMI. Published in Journal of Applied Statistics, Vol. 52(4), pp. 841-867, 2024.

Our summary: the SNN aspect is novel — spiking neural networks process information through spike timing rather than continuous activations, which is more biologically plausible and energy-efficient. The practical benefit is notably lower energy consumption compared to standard VMD-LSTM hybrids, which matters for real-time trading systems processing continuous data streams.

Key metrics: R² values of 0.856-0.886 across four indices; lowest RMSE, MAE, and MAPE among all compared models; strong multi-step performance at 1, 4, 12, and 24-step horizons.

`Read the paper <https://pmc.ncbi.nlm.nih.gov/articles/PMC11873965/>`__

An Intelligent Framework Based on Optimized Variational Mode Decomposition and Temporal Convolutional Network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes GA-VMD-TCN, using a genetic algorithm to optimize VMD parameters (K and penalty factor alpha), then applying Temporal Convolutional Networks for multi-step stock index forecasting. The GA optimization removes the need for manual parameter tuning. Published in Expert Systems with Applications, 2024.

Our summary: automatic VMD parameter optimization via GA is a practical contribution — manual K selection is the most common criticism of VMD. The TCN architecture is well-suited to decomposed series because its dilated causal convolutions can capture patterns at multiple time scales without the vanishing gradient issues of recurrent networks.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417424030896>`__

VMD-MSANet: A Multi-Scale Attention Network for Stock Series Prediction with Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Y. Chen, N. Ye, W. Zhang, S. Lv, L. Shao, and X. Li combine VMD with a multi-scale attention mechanism that captures both short-term and long-term temporal patterns in stock price series. Tested on the Chinese stock market. Published in Neurocomputing, Vol. 650, Article 130854, 2025.

Our summary: the multi-scale attention mechanism operates at different temporal granularities simultaneously, which aligns naturally with VMD's frequency-based decomposition. Low-frequency IMFs get coarse-grained attention while high-frequency IMFs get fine-grained attention.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0925231225015267>`__

Forecasting Airtel Stock Prices Through Decomposition and Integration: A Novel VMD-GARCH-LSTM Framework
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

John Kamwele Mutinda et al. propose a VMD-GARCH-LSTM hybrid where VMD decomposes stock prices into IMFs, high-frequency IMFs are processed with GARCH to capture time-varying volatility, and all components are fed into LSTM. The GARCH component explicitly models heteroscedasticity in the high-frequency modes. Tested on Airtel stock data from 2019-2024. Published in International Journal of Mathematics and Mathematical Sciences, 2025.

Our summary: the key insight is that different IMFs have different statistical properties — high-frequency IMFs exhibit volatility clustering (best modeled by GARCH) while low-frequency IMFs have smoother dynamics (better for LSTM). This selective model assignment based on frequency characteristics is more principled than applying the same model to all IMFs.

`Read the paper <https://onlinelibrary.wiley.com/doi/10.1155/ijmm/2710277>`__

Time-Series Forecasting Using SVMD-LSTM: A Hybrid Approach for Stock Market Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sanskar Agarwal, Shivam Sharma, Kazi Newaj Faisal, Rishi Raj Sharma, and Marek T. Malinowski combine Successive VMD (SVMD) with LSTM for stock market prediction. SVMD extracts modes without pre-specifying K. Tested on Hang Seng Index, SENSEX, S&P 500, and WTI crude oil, achieving R² values of 0.9994-1.000 and 10.3% improvement over standard VMD-LSTM. Published in Journal of Probability and Statistics, 2025.

Our summary: the 10.3% improvement over VMD-LSTM demonstrates the practical benefit of not having to specify K. SVMD's automatic mode extraction likely avoids both under-decomposition (too few modes, leaving mixed signals) and over-decomposition (too many modes, creating noise artifacts).

Key metrics: R² of 0.9994-1.000 on test sets; 10.3% improvement over VMD-LSTM; outperforms LSTM, SVM, MLP, and EMD-LSTM baselines.

`Read the paper <https://onlinelibrary.wiley.com/doi/10.1155/jpas/9464938>`__

F-LOAM: An Efficient Hybrid Model for Stock Price Prediction Based on SVMD Denoising
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper combines enhanced SVMD denoising (using Spearman Rank Correlation Coefficient for adaptive modal selection) with a cascaded LSTM-LightGBM architecture. SVMD adaptively selects which modes to retain based on their correlation with the original signal. Published in Discover Artificial Intelligence, Springer, 2025.

Our summary: the Spearman correlation-based mode selection is a practical approach to deciding which SVMD modes are signal vs. noise. Combined with the LSTM-LightGBM cascade (LSTM for temporal patterns, LightGBM for feature interactions), this achieves strong results with a practical trading evaluation.

Key metrics: 52.5-64.0% MSE reduction over baselines; 20.27% annualized return with 1.308 Sharpe ratio in trading simulation.

`Read the paper <https://link.springer.com/article/10.1007/s44163-025-00622-0>`__

Deep Learning-Based Financial Time Series Forecasting via Sliding Window and Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Luke Li proposes a sliding window + VMD preprocessing framework with LSTM. The sliding window approach prevents temporal leakage by decomposing only within causal windows. VMD-processed sequences produce superior performance and stability compared to raw time series across multiple financial datasets. arXiv:2508.12565, 2025.

Our summary: another paper addressing the critical data leakage issue in VMD-based forecasting. The sliding window approach improves price trend prediction accuracy by 5.28% and return prediction accuracy by 12.65% over non-decomposition models, while maintaining temporal causality.

`Read the paper <https://arxiv.org/abs/2508.12565>`__

A Two-Stage Model for Stock Price Prediction Based on Variational Mode Decomposition and Ensemble Machine Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes a two-stage approach: VMD decomposes stock prices into sub-series; SVR, ELM, and DNN predict each sub-series independently; then an ELM-based nonlinear ensemble combines the preliminary predictions. The nonlinear ensemble outperforms simple averaging or linear combination of component predictions. Published in Soft Computing, Springer, 2023.

Our summary: the nonlinear ensemble stage is the key contribution — it learns complex interactions between component predictions that simple aggregation misses. Using different model types (SVR for smooth components, DNN for complex ones) for different IMFs is a principled approach.

`Read the paper <https://link.springer.com/article/10.1007/s00500-023-08441-0>`__

Stock Price Prediction With Variational Mode Decomposition, Ecosystem-Based Optimization, and Radial Basis Function Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Y. Yang, H. Liu, and S. Yang combine VMD with Artificial Ecosystem-Based Optimization (AEO) and RBF networks for Korean KOSPI index prediction using 2018-2024 data. AEO optimizes both VMD parameters and RBF network architecture. Published in Computational Economics, Springer, 2025.

Our summary: the application to the Korean market provides geographic diversity in VMD literature, which is dominated by Chinese and US market studies. AEO is a newer metaheuristic that mimics ecosystem energy flows, and its application to VMD parameter optimization adds to the growing toolkit of automated VMD tuning methods.

`Read the paper <https://link.springer.com/article/10.1007/s10614-025-11137-2>`__

Optimizing Modelling Accuracy Using Variational Mode Decomposition and Elastic Net Regression
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Abdullah S. Al-Jawarneh, Ahmed R.M. Alsayed, and Heba N. Ayyoub propose VMD-ENet, combining VMD with elastic net regression for interpretable stock market prediction. Elastic net handles correlated predictors without discarding them (unlike LASSO), making it suitable for the correlated IMF components that VMD produces. Published in ScienceDirect, 2025.

Our summary: this paper offers interpretability — elastic net regression coefficients show which IMFs (frequency components) drive predictions, unlike black-box deep learning approaches. The finding that intermediate-frequency IMFs are most predictive is actionable for practitioners designing VMD-based trading signals.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S2590005625002309>`__

Sentiment-VMD-MTL: An Enhanced Risk-Aware Multi-Task Learning Framework with Dual-Source Sentiment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper integrates dual-source sentiment indicators (news and social media) with VMD and multi-head attention in a multi-task learning framework for stock ranking and forecasting. The multi-task approach jointly predicts returns and risk metrics. Published in Expert Systems with Applications, 2025.

Our summary: this is one of the first papers to combine VMD with sentiment analysis. The dual-source sentiment captures both institutional (news) and retail (social media) sentiment, and the multi-task framework ensures the model accounts for both return and risk — relevant for portfolio construction rather than pure prediction.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417426013758>`__

A Decision-Support Framework for Stock Index Forecasting and Trading: Genetic-Optimized VMD with Convolutional LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jiangcheng Li, You-Cheng Wang, Bin Gui, and Guang-Yan Zhong propose GA-VMD-C-LSTM with walk-forward validation. The genetic algorithm optimizes VMD parameters, convolutional LSTM captures spatiotemporal patterns in decomposed components, and walk-forward validation ensures realistic out-of-sample evaluation. Includes a threshold-based trading strategy evaluation. SSRN, 2025.

Our summary: walk-forward validation is critical but rarely used in VMD papers — most use simple train/test splits that overestimate real-world performance. The inclusion of a trading strategy evaluation with threshold-based entry/exit rules bridges the gap between forecast accuracy and trading profitability.

Key metrics: MAE reduction of 46.72%, RMSE reduction of 44.63% vs. baselines.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6136401>`__

Enhanced Stock Index Prediction Using Improved VMD, Energy-Frequency Feature Selection, and Deep Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

T. Wang et al. propose IVMD with information entropy for optimal decomposition parameter selection, combined with energy-frequency feature selection and deep learning for stock index prediction. The information entropy criterion automatically determines the optimal K and alpha parameters. SSRN, 2025.

Our summary: the information entropy approach to VMD parameter selection is more principled than metaheuristic optimization — it directly measures the information content of each decomposition level, stopping when additional modes add noise rather than signal.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5191431>`__

A Novel Hybrid Framework for Stock Price Prediction Integrating Adaptive Signal Decomposition and Multi-Scale Feature Extraction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper uses the Crested Porcupine Optimizer (CPO) to adaptively optimize VMD parameters, combined with multi-scale feature extraction and the Informer model for stock price prediction. Published in Applied Sciences, Vol. 15(23), 12450, 2025.

Our summary: the Informer architecture (with ProbSparse attention) is particularly efficient for long sequence forecasting, making VMD-Informer combinations attractive for multi-step-ahead prediction tasks where standard Transformers have quadratic complexity issues.

`Read the paper <https://www.mdpi.com/2076-3417/15/23/12450>`__

Predicting the Highest and Lowest Stock Price Indices Using Re-Decomposition with BiLSTM-SAM-TCN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes ICEEMDAN-PSO-VMD-BiLSTM-SAM-TCN — a two-stage decomposition model where ICEEMDAN performs primary decomposition and PSO-optimized VMD performs secondary decomposition of the residual. BiLSTM with self-attention mechanism and TCN predict the decomposed components. Published in Applied Soft Computing, 2024.

Our summary: the two-stage decomposition (ICEEMDAN then VMD) addresses the limitation that any single decomposition method may leave structure in the residual. By applying VMD specifically to the ICEEMDAN residual, the model captures frequency components that ICEEMDAN missed. This cascaded decomposition approach is increasingly common in the literature.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1568494624011670>`__

VMD-MF-GRU: An Improved GRU Financial Time Series Prediction Model
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper integrates VMD, multifractal analysis, and a state fusion strategy in a GRU-based model. Multifractal analysis characterizes the self-similarity properties of financial time series at different scales, providing additional features for the GRU predictor. Published in Fractal and Fractional, MDPI, 2025.

Our summary: the multifractal component adds fractal dimension features that capture the roughness and complexity of price dynamics at each VMD scale. This provides the GRU with information about local regularity that raw price values don't convey.

Key metrics: lower MAE, MAPE, RMSE than LSTM, GRU, and Transformer baselines.

`Read the paper <https://www.mdpi.com/2504-3900/10/4/227>`__

Multivariate VMD in Finance
----------------------------

Enhancing Stock Market Predictions with Multivariate Signal Decomposition and Dynamic Feature Optimization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes MVMD-NT-TiF, integrating Multivariate VMD with a Non-stationary Transformer and Temporal Informative Fusion module. MVMD jointly decomposes multivariate stock data (preserving cross-variable frequency alignment), the Non-stationary Transformer handles time-varying distributions, and TiF selects the most informative features dynamically. Published in ScienceDirect, 2025.

Our summary: this is the most sophisticated MVMD financial application to date. The three-component design addresses the three main challenges of multivariate financial forecasting: cross-variable heterogeneity (MVMD), temporal non-stationarity (Non-stationary Transformer), and feature irrelevance (TiF). The joint decomposition via MVMD is key — decomposing each variable independently would lose frequency coherence.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S106294082500186X>`__

Multivariate VMD with DFT and Lightweight Mixture-of-Experts (VD-MoGRU)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper combines MVMD with Discrete Fourier Transform for decomposition and a lightweight Mixture-of-Experts predictor (MoGRU) for multivariate time series with strong volatility. MVMD isolates main components; DFT decomposes the remainder. The MoE architecture routes different frequency components to specialized GRU experts. Published in Expert Systems with Applications, 2025.

Our summary: the MoE architecture is a natural fit for decomposition-based forecasting — each expert can specialize in a particular frequency band rather than being a generalist. The MVMD+DFT combination provides two complementary decomposition views: variational (MVMD) and spectral (DFT).

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417425043465>`__

Carbon Emission Price Point-Interval Forecasting Based on Multivariate VMD and Attention-LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

L. Zeng et al. apply MVMD with attention-LSTM for carbon emission price forecasting, producing both point and interval predictions. MVMD jointly decomposes carbon prices with related variables (energy prices, policy indices). Published in Applied Soft Computing, 2024.

Our summary: the interval prediction component is practically important — point forecasts alone don't convey uncertainty. The MVMD joint decomposition with energy prices captures the fundamental linkage between carbon and energy markets at multiple frequency scales.

Key metrics: MAPE less than 5.2% for carbon emission price prediction.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S156849462400317X>`__

VMD for Volatility Forecasting
------------------------------

Risk Forecasting in the Crude Oil Market: A Multiscale Convolutional Neural Network Approach
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yingchao Zou, Lean Yu, Geoffrey K.F. Tso, and Kaijian He propose a VMD-CNN model for Value-at-Risk estimation in crude oil markets. VMD extracts multiscale risk factors that are modeled with ARMA-GARCH, then CNN aggregates the risk forecasts. Published in Physica A, Vol. 541, 123360, 2020.

Our summary: this paper bridges VMD with risk management by targeting VaR rather than price prediction. The multiscale risk decomposition is intuitive — different VMD modes capture different risk horizons (intraday noise, weekly cycles, monthly trends), and the CNN learns how to combine these for accurate VaR estimates.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0378437119318795>`__

Hybrid ML Models for Volatility Prediction in Financial Risk Management
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

S. Kumar et al. propose Q-VMD-ANN-LSTM-GRU, combining optimized VMD with ANN, LSTM, and GRU for realized volatility prediction on SSE, INFY, and NIFTY indices. The Q-learning component dynamically selects the best model for each market condition. Published in International Review of Economics & Finance, Vol. 98, 2025.

Our summary: the Q-learning model selection is the innovation — instead of a fixed ensemble, the system learns which model performs best under different market regimes. VMD-enhanced models substantially outperform their standalone equivalents across all tested indices.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S1059056025000784>`__

Forecasting Volatility by Using Variational Mode Decomposition and Machine Learning Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wiem Ben Romdhane and Heni Boubaker integrate VMD with XGBoost, Random Forest, and SVR for S&P 500 realized volatility forecasting. VMD-SVR emerges as the top performer. The biggest accuracy gains occur during crisis periods (2008 financial crisis, 2020 COVID crash). Research Square preprint, 2025.

Our summary: the finding that VMD provides the largest improvements during crises is practically significant — crisis periods are when accurate volatility forecasts matter most for risk management. VMD's ability to separate crisis-frequency components from normal-regime dynamics likely drives this result.

`Read the paper <https://www.researchsquare.com/article/rs-7875740/v1>`__

Power of Decomposition in Volatility Forecasting for Bitcoins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Prakash Raj, Koushik Bera, and N. Selvaraju integrate RGARCH with EMD and VMD for Bitcoin volatility estimation using high-frequency realized measures. RGARCH-VMD achieves up to 71.14% reduction in forecasting errors compared to standard RGARCH. VMD demonstrates clear superiority over EMD for crypto volatility. Published in Pacific-Basin Finance Journal, 2025.

Our summary: the 71.14% error reduction is one of the largest reported gains from adding VMD to an established volatility model. Bitcoin's extreme volatility dynamics — fat tails, regime switches, bubble/crash cycles — create multiple overlapping frequency components that VMD can separate effectively.

Key metrics: up to 71.14% reduction in volatility forecasting errors with RGARCH-VMD vs. standard RGARCH.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0927538X25001763>`__

Novel Optimization Approach for Realized Volatility Forecast Based on Deep Reinforcement Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yuanyuan Yu, Yu Lin, Xianping Hou, and Xi Zhang propose GVMD-Q-DBN-LSTM-GRU, using grey wolf optimizer for VMD parameters and Q-learning to integrate predictions from Deep Belief Networks, LSTM, and GRU. Tested on SSEC, S&P 500, and FTSE realized volatility. Published in Expert Systems with Applications, 2024.

Our summary: the Q-learning integration of multiple deep learning models is more sophisticated than simple averaging or stacking — it learns state-dependent model selection, allocating more weight to whichever model performs best under current market conditions.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417423013829>`__

Dual-Uncertainty Modeling in Financial Time-Series via VMD-LSTM with Concrete Dropout and VMD-WGAN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jeonggyu Huh, Dajin Kim, Minseok Jung, and Seungwon Jeong propose a dual-path framework using VMD: LSTM with concrete dropout for epistemic uncertainty and conditional WGAN for aleatoric risk. Tested on S&P 500 and FTSE 100. Low-frequency VMD modes drive accuracy while the generative path reproduces heavy-tailed return distributions. Published in Networks and Heterogeneous Media, AIMS Press, 2025.

Our summary: uncertainty quantification is crucial but neglected in VMD forecasting literature. This paper separates model uncertainty (what the model doesn't know) from data uncertainty (inherent market randomness), and VMD enables this separation by routing different frequency modes through different uncertainty channels.

`Read the paper <https://www.aimspress.com/article/doi/10.3934/nhm.2025061>`__

Forecasting Stock Index Return and Volatility Based on GAVMD-Carbon-BiLSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zisheng Ouyang, Min Lu, and Yongzeng Lai combine genetic-algorithm-optimized VMD with BiLSTM for Chinese stock return and volatility prediction, incorporating carbon emission trading data as input features. Published in Energy Economics, Vol. 128, 2023.

Our summary: the inclusion of carbon emission data as a predictor for stock volatility reflects the growing linkage between carbon markets and equity markets, particularly in China where policy-driven carbon price movements can transmit to stock markets.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0140988323006321>`__

VMD-GARCH-DNN Framework for Realized Volatility
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes a VMD-GARCH-DNN decomposition-ensemble framework for realized volatility of Chinese stocks. VMD decomposes volatility series into IMFs, GARCH models high-frequency components, and DNN captures nonlinear dynamics in the residual. Published in Computational Economics, 2025.

Our summary: applying VMD to the realized volatility series itself (rather than to prices) is a natural approach since realized volatility already captures important information about the distributional dynamics.

`Read the paper <https://link.springer.com/article/10.1007/s10614-025-11020-0>`__

VMD for VIX Prediction
----------------------

A Variational-Mode-Decomposition-Cascaded Long Short-Term Memory with Attention Model for VIX Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper integrates VMD with cascaded LSTM and attention mechanism for VIX prediction using S&P 500 and VIX data from January 2020 to December 2024. VMD decomposes the VIX into IMFs isolating short-term and long-term fluctuation components. Published in Applied Sciences, Vol. 15(10), 5630, 2025.

Our summary: VIX prediction is directly actionable for options trading and volatility strategies. The cascaded LSTM architecture (stacked LSTM layers with attention between them) progressively refines predictions, and the 2020-2024 test period includes the COVID crash, post-pandemic recovery, and 2022 bear market — providing a rigorous evaluation across market regimes.

`Read the paper <https://www.mdpi.com/2076-3417/15/10/5630>`__

Disaggregating VIX
^^^^^^^^^^^^^^^^^^

Stavros Degiannakis and Eleftheria Kafousaki disaggregate VIX using six signal decomposition techniques: VMD, EMD, EEMD, SSA, HVD, and EWD. Decomposing VIX before modeling generates forecast gains that translate into improved trading profits for 1-22 day horizons. Published in International Journal of Forecasting, Vol. 41, Issue 4, 2025.

Our summary: this is the most comprehensive decomposition comparison for VIX specifically. The finding that decomposition improves trading profits (not just forecast accuracy) is critical — many papers show accuracy improvements that don't translate to profitability due to transaction costs and timing issues. The 1-22 day horizon range covers both short-term options trading and longer-term volatility strategies.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S016920702500007X>`__

VMD for Crude Oil and Commodities
---------------------------------

Crude Oil Price Analysis and Forecasting Based on VMD and Independent Component Analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes VMD-ICA-ARIMA, combining VMD with Independent Component Analysis for crude oil price forecasting. ICA separates the VMD modes into statistically independent components, providing a cleaner signal for ARIMA modeling. Published in Physica A, 2017.

Our summary: the VMD-ICA combination addresses the fact that VMD modes, while band-limited, are not necessarily statistically independent. ICA provides an additional separation step that can improve downstream model performance.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0378437117304703>`__

A New Crude Oil Price Forecasting Model Based on Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper demonstrates that VMD-decomposed crude oil price components exhibit simpler statistical characteristics than raw prices, making them easier to forecast with standard methods. Published in Knowledge-Based Systems, 2021.

Our summary: the simplification effect of VMD is well-documented for crude oil — mode-by-mode, the decomposed series have lower kurtosis, reduced serial correlation complexity, and more stable variance than the original series.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S095070512030798X>`__

Ensemble Forecasting for Product Futures Prices Using VMD and Artificial Neural Networks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Weiping Liu et al. propose a VMD-ANN decomposition-ensemble framework for energy and metal futures price forecasting, testing on corn, crude oil, and gold futures. VMD emerges as the ideal preprocessing method compared to EMD and EEMD. Published in Chaos, Solitons & Fractals, Vol. 146, 2021.

Our summary: the multi-commodity testing (corn, crude oil, gold) demonstrates VMD's generalizability across fundamentally different commodity markets with different price dynamics. The consistent outperformance over EMD and EEMD across all commodities strengthens the case for VMD as the default decomposition method.

`Read the paper <https://ideas.repec.org/a/eee/chsofr/v146y2021ics0960077921001740.html>`__

Forecasting Crude Oil Prices Based on VMD and Random Sparse Bayesian Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Taiyong Li et al. integrate VMD with Random Sparse Bayesian Learning (RSBL), building multiple RSBL predictors using random subsets and lag combinations for each VMD component. Published in Applied Soft Computing, Vol. 113, 2021.

Our summary: sparse Bayesian learning provides automatic relevance determination — it learns which lag orders matter for each VMD component, avoiding overfitting from using too many lags.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1568494621009546>`__

Crude Oil Price Time Series Forecasting: VMD, Time-Series Imaging, and Deep Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Z.J. Peng et al. combine VMD with time-series imaging (recurrence plots, Gramian Angular Fields) and bidirectional GRU for crude oil futures. The imaging step converts 1D time series into 2D images that can leverage CNN architectures. Published in IEEE Access, 2023.

Our summary: the time-series-to-image conversion is a creative approach that enables transfer learning from pre-trained image recognition models. VMD decomposition followed by imaging creates multi-channel images where each channel represents a different frequency band.

`Read the paper <https://ieeexplore.ieee.org/document/10207020/>`__

Forecasting Realized Volatility of Chinese Crude Oil Futures with Secondary Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wei Jiang, Wan-Wei Tang, and Xiao Liu propose VMD-ICEEMDAN-LSTM for Chinese crude oil futures realized volatility. VMD performs primary decomposition, ICEEMDAN decomposes the VMD residual. Published in Finance Research Letters, 2023.

Our summary: the secondary decomposition of the VMD residual captures structure that the primary VMD decomposition missed, particularly at very high frequencies where VMD's bandwidth minimization may smooth out important microstructure information.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1544612323006268>`__

China Crude Oil Futures Volatility Forecasting Using LSTM with Optimal Noise Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wei Jiang, Wanqing Tang, and Xiao Liu compare six decomposition methods for crude oil volatility prediction. VMD-LSTM demonstrates significant out-of-sample predictive power, outperforming other decomposition methods including EMD, EEMD, and CEEMDAN. Published in Discrete Dynamics in Nature and Society, 2024.

Our summary: the systematic comparison of six decomposition methods on the same dataset and prediction task provides a clean horse race. VMD's consistent top performance strengthens the evidence base.

`Read the paper <https://onlinelibrary.wiley.com/doi/10.1155/2024/8021444>`__

Crude Oil Futures Price Forecasting Based on VMD-EMD-Transformer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Linya Huang, Xite Yang, Yongzeng Lai, Ankang Zou, and Jilin Zhang propose a VMD-EMD-Transformer model where VMD performs primary decomposition into trend and residual, EMD decomposes the residual, and a Transformer predicts all components. Published in Mathematics, Vol. 12(24), 4034, 2024.

Our summary: the VMD-EMD combination leverages the complementary strengths of both methods — VMD excels at separating well-defined frequency components while EMD is better at capturing the irregular residual structure.

`Read the paper <https://www.mdpi.com/2227-7390/12/24/4034>`__

Probabilistic Oil Price Forecasting with VMD-GRU and Pinball Loss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes VMD-GRU with pinball loss for probabilistic crude oil price forecasting, producing prediction intervals rather than point forecasts. Published in International Review of Financial Analysis, 2024.

Our summary: the pinball loss function enables quantile regression, producing full predictive distributions rather than point estimates. This is critical for risk management — oil price risk assessment requires knowing the distribution tails, not just the expected value.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S2666764924000547>`__

RV-FELM: Futures Commodity Price Forecasting Based on RIME-VMD and FA-ELM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

VMD optimized by the RIME algorithm for commodity futures, with Fourier Attention and Extreme Learning Machines for prediction. Published in PMC, 2024.

Our summary: the RIME (frost crystallization-inspired) optimizer is a recent metaheuristic that shows competitive performance for VMD parameter tuning, and the Fourier Attention mechanism naturally complements VMD's frequency-domain decomposition.

Key metrics: MAPE for crude oil: 0.48% (1-step), 0.66% (3-step), 0.75% (6-step).

`Read the paper <https://pmc.ncbi.nlm.nih.gov/articles/PMC11400918/>`__

WOA-VMD-FE-Transformer for Crude Oil Prices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

L. Yu, X. Zhang, Y. Lin et al. use Whale Optimization Algorithm to optimize VMD parameters, fuzzy entropy to reorganize sub-sequences by frequency, and a Transformer model for prediction. Published in Computational Economics, 2025.

Our summary: the fuzzy entropy reorganization step groups VMD modes by complexity rather than frequency order, routing low-entropy (regular) modes to one prediction pathway and high-entropy (complex) modes to another.

`Read the paper <https://link.springer.com/article/10.1007/s10614-025-10861-z>`__

VMD-LSTM for Non-Ferrous Metals Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper applies VMD-LSTM to predict non-ferrous metal prices (copper, aluminum, etc.), demonstrating the framework's applicability beyond equities and crude oil. Published in Knowledge-Based Systems, 2020.

Our summary: metals markets have distinct dynamics from equities (supply-demand driven, inventory cycle effects, Chinese demand sensitivity), and VMD's effectiveness here shows the method's generalizability across asset classes.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0950705119304204>`__

Decomposing and Reconstructing Dynamic Risks in the Crude Oil Market Based on VMD and Lempel-Ziv
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hao Dong and Zhehao Huang use VMD and Lempel-Ziv complexity to assess crude oil risk. VMD decomposes Conditional VaR measures into submodes to distinguish commodity risk from financial risk attributes. Published in Electronic Research Archive, Vol. 30(12), pp. 4674-4696, 2022.

Our summary: decomposing risk measures (rather than prices) with VMD is a novel angle. The Lempel-Ziv complexity analysis reveals which VMD modes carry fundamental commodity risk vs. speculative financial risk, which is actionable for hedging strategy design.

`Read the paper <https://www.aimspress.com/article/doi/10.3934/era.2022237>`__

Metal Commodity Futures: Secondary Decomposition with VMD and CEEMDAN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper uses VMD and CEEMDAN in a secondary decomposition framework with error correction for metal commodity futures price forecasting. Published in Journal of Big Data, Springer, 2025.

Our summary: the error correction step is a practical addition — it models the systematic errors of the primary decomposition-ensemble forecast, capturing residual patterns that the main model missed.

`Read the paper <https://link.springer.com/article/10.1186/s40537-025-01240-4>`__

GA-VMD-LSTM for Agricultural Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper applies genetic algorithm-optimized VMD with LSTM to agricultural commodity price forecasting. Published in Scientific Reports, Nature, 2025.

Our summary: agricultural commodities exhibit seasonal patterns and weather-driven shocks that create distinct frequency components — VMD can separate the seasonal cycle from weather shocks and trend, enabling targeted modeling of each.

`Read the paper <https://www.nature.com/articles/s41598-025-94173-0>`__

VMD for Carbon Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Multi-Step-Ahead Carbon Price Forecasting Based on VMD and Whale Optimization
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

VMD with whale optimization-enhanced multi-output relevance vector regression for multi-step carbon price forecasting. Published in Energies, Vol. 12(1), 147, 2019.

`Read the paper <https://www.mdpi.com/1996-1073/12/1/147>`__

CEEMD-SE-VMD-LSTM for Chinese Carbon Prices
''''''''''''''''''''''''''''''''''''''''''''

Two-stage decomposition using CEEMD with sample entropy classification, then VMD on high-frequency components, with LSTM prediction. Achieves RMSE of 0.2640. Published in Systems Science & Control Engineering, Taylor & Francis, 2023.

`Read the paper <https://www.tandfonline.com/doi/full/10.1080/21642583.2023.2291409>`__

VMD for Cryptocurrency Forecasting
-----------------------------------

On Forecasting the Intraday Bitcoin Price Using VMD-GAM Ensemble
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Samuel Asante Gyamerah proposes a VMD-GAM (Generalized Additive Model) ensemble for intraday Bitcoin price prediction. VMD-GAM outperforms EMD-GAM with the lowest MAPE of 0.2341%. Published in Journal of King Saud University - Computer and Information Sciences, 2019.

Our summary: GAMs offer interpretability that deep learning lacks — the additive structure reveals how each VMD mode contributes to the prediction. The 0.2341% MAPE on intraday Bitcoin is impressive given crypto's extreme volatility.

Key metrics: MAPE of 0.2341% for intraday Bitcoin prediction.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S131915781931314X>`__

Multi-Step Bitcoin Price Forecasting Based on VMD and Ensemble Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ramon Gomes da Silva, Matheus Henrique Dal Molin Ribeiro et al. combine VMD with stacking-ensemble learning (KNN, SVR, ANN, GLM, Cubist) for multi-step Bitcoin forecasting. Published in IEEE IJCNN, 2020.

Our summary: the stacking ensemble is more robust than single-model approaches because different models excel at different VMD modes — KNN may capture the trend mode well while SVR handles the noisy high-frequency modes.

`Read the paper <https://ieeexplore.ieee.org/document/9207152/>`__

Two-Stage VMD + Technical Analysis for Bitcoin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Samuel Asante Gyamerah and Ning Cai combine VMD with technical indicators and SVR in a two-stage model for high-frequency intraday Bitcoin prediction. VMD eliminates noise signals and stochastic volatility. Published in Complexity, Hindawi, 2021.

Our summary: the integration of technical indicators (RSI, MACD, Bollinger Bands) with VMD modes provides both frequency-domain and feature-domain views of market dynamics.

`Read the paper <https://www.hindawi.com/journals/complexity/2021/1767708/>`__

Hybrid Data Decomposition-Based Deep Learning for Bitcoin Prediction and Algorithm Trading
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Y. Li, S. Jiang et al. propose VMD-LMH-BiLSTM, decomposing Bitcoin price into low/medium/high frequency components using VMD, then applying BiLSTM. Generates higher returns in algorithmic trading than benchmark strategies. Published in Financial Innovation, Springer, 2022.

Our summary: the LMH (Low-Medium-High) frequency grouping of VMD modes is a practical simplification — rather than modeling K individual modes, modes are grouped into three frequency bands, reducing model complexity while retaining the multi-scale structure.

`Read the paper <https://jfin-swufe.springeropen.com/articles/10.1186/s40854-022-00336-7>`__

Bitcoin Price Forecasting Based on Hybrid VMD and LSTM Network
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Emmanuel Boadi proposes a hybrid VMD+LSTM model for Bitcoin with 30-day forecasting horizons. The model outperforms standalone LSTM across RMSE, MAE, and R². arXiv:2510.15900, 2025.

`Read the paper <https://arxiv.org/abs/2510.15900>`__

Multi-Scale Decomposition for Deep Learning-Based Bitcoin Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Multi-scale decomposition approach including VMD for deep learning-based Bitcoin forecasting. Published in Finance Research Letters, 2025.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1544612326003065>`__

VMD for Forex and Exchange Rate Forecasting
-------------------------------------------

Forecasting Exchange Rate Using VMD and Entropy Theory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Kaijian He, Yanhui Chen, and Geoffrey K.F. Tso apply VMD with MSE and Error Entropy criterion for exchange rate decomposition. The entropy criterion optimizes VMD parameters by maximizing information content of each mode. Published in Physica A, Vol. 510, pp. 15-25, 2019.

Our summary: the error entropy criterion for VMD parameter selection is more information-theoretically motivated than grid search or metaheuristics — it directly measures the information content of the decomposition residual.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0378437118306873>`__

VMD-LSTM for Foreign Exchange Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

S.B. Tan and L. Wang combine VMD with LSTM for forex exchange rate prediction, showing significant improvements over standard prediction models. Published in Springer ICNC-FSKD Conference Proceedings, 2022.

`Read the paper <https://link.springer.com/chapter/10.1007/978-3-031-20738-9_13>`__

MVO-BiGRU for Monthly FX Rate Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper integrates VMD, data augmentation, Optuna-optimized hyperparameters, and bidirectional GRU for monthly foreign exchange rate forecasting. Published in Risks, MDPI, 2024.

`Read the paper <https://www.mdpi.com/2227-9091/12/9/139>`__

VMD-CEEMDAN-GRU-ATCN for Exchange Rate
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Kausar, Rehan, Farhat Iqbal, Abdul Raziq, and Naveed Sheikh combine VMD for initial decomposition and CEEMDAN for residual extraction with GRU and attention-based TCN for USD/PKR exchange rate forecasting. Published in Sains Malaysiana, 2023.

`Read the paper <https://www.researchgate.net/publication/377590512>`__

A Decomposition Clustering Ensemble for Forecasting Foreign Exchange Rates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

VMD with SOM clustering and Kernel Extreme Learning Machine (KELM) ensemble for USD/EUR, USD/CNY, and USD/JPY exchange rate forecasting. Statistically outperforms benchmarks in both directional and level accuracy. Published in Journal of Management Science and Engineering, 2019.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S2096232019300010>`__

VMD for Portfolio Optimization and Trading
------------------------------------------

Take Bitcoin into Your Portfolio: A Novel Ensemble Portfolio Optimization Framework
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Y. Li, S. Jiang, Y. Wei et al. propose a Novel Ensemble Portfolio Optimization (NEPO) framework integrating VMD-BiLSTM for return forecasting with reinforcement learning for asset weight optimization across commodities including Bitcoin. Published in Financial Innovation, Springer, 2021.

Our summary: this is one of the few papers connecting VMD-based forecasting to actual portfolio allocation decisions. The RL-based weight optimization adapts to changing market conditions, making portfolio weights dynamic rather than fixed.

`Read the paper <https://link.springer.com/article/10.1186/s40854-021-00281-x>`__

VMD-IMF Enhanced Hyper Graph Attention Module Based Reinforcement Learning for Portfolio Optimization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Venkata Siva Neeli and K.E. Srinivasa Desikan integrate VMD-derived IMFs with LSTM for temporal modeling and Hypergraph Attention Module for stock group-level dependencies, with an RL decision-making layer. Published in Springer Conference Proceedings, 2025.

Our summary: the hypergraph attention captures higher-order relationships between stocks (beyond pairwise correlations) — for example, sector-level co-movements that VMD decomposes into frequency bands. The RL layer translates multi-frequency portfolio signals into actionable allocation decisions.

`Read the paper <https://link.springer.com/chapter/10.1007/978-981-96-8889-0_3>`__

Forecasts for International Financial Series with VMD Algorithms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper applies VMD algorithms to forecast international financial time series across multiple markets, providing cross-country evidence of VMD's effectiveness. Published in Journal of International Money and Finance, 2022.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1049007822000185>`__

CEEMDAN-Based Financial Forecasting
------------------------------------

Forecasting Stock Index Price Using the CEEMDAN-LSTM Model
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yu Lin, Yangtian Yan, Jiali Xu, Ying Liao, and Feng Ma use CEEMDAN-LSTM to forecast S&P 500 and CSI 300 stock indices. CEEMDAN-LSTM is optimal in both emerging and developed markets, especially during high-volatility periods. Published in The North American Journal of Economics and Finance, Vol. 57, 2021.

Our summary: the finding that CEEMDAN-LSTM performs best during high-volatility periods (when forecasting matters most) is practically significant. CEEMDAN's completeness property (the decomposition is exact with negligible reconstruction error) gives it an advantage over EEMD for financial applications.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1062940821000553>`__

Forecasting the Realized Volatility of Stock Price Index: CEEMDAN and LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ying Liao et al. integrate CEEMDAN and LSTM to forecast realized volatility of CSI 300, S&P 500, and STOXX 50 indices. Best performance across emerging and developed markets. Published in Expert Systems with Applications, Vol. 206, 2022.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S095741742201017X>`__

Carbon Price Forecasting Based on CEEMDAN and LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Feite Zhou, Zhehao Huang, and Changhong Zhang forecast Guangzhou ETS carbon prices using CEEMDAN-LSTM with VMD re-decomposition. Achieves R² of 0.982 and MAPE of 0.555%. Published in Applied Energy, Vol. 311, 2022.

Key metrics: R² of 0.982, MAPE of 0.555%.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0306261922000782>`__

Algorithm Optimization Model of Trading Strategy Based on CEEMDAN-SE-LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper proposes a CEEMDAN-SE-LSTM trading strategy combining decomposition with sample entropy reconstruction and LSTM prediction for quantitative trading. Published in ACM ICCSIE Conference Proceedings, 2022.

`Read the paper <https://dl.acm.org/doi/abs/10.1145/3558819.3565218>`__

A Novel Hybrid Model for Financial Forecasting Based on CEEMDAN-SE and ARIMA-CNN-LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zefan Dong and Yonghui Zhou decompose data via CEEMDAN-SE into high-frequency (predicted by ARIMA) and low-frequency (predicted by CNN-LSTM) components. Published in Mathematics, Vol. 12(16), 2434, 2024.

Our summary: the model selection by frequency band (ARIMA for high-frequency, CNN-LSTM for low-frequency) is principled — ARIMA excels at short-memory linear dynamics (high-frequency noise) while CNN-LSTM captures long-memory nonlinear patterns.

`Read the paper <https://www.mdpi.com/2227-7390/12/16/2434>`__

Multi-Level Perspectives in Stock Price Forecasting: ICE2DE-MDL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zinnet Duygu Aksehir and Erdal Kilic propose a multi-level framework using improved CEEMDAN (ICE2DE) with multi-depth deep learning for stock price forecasting. Published in PeerJ Computer Science, 2024.

`Read the paper <https://pmc.ncbi.nlm.nih.gov/articles/PMC11232590/>`__

Stock Market Index Prediction Using CEEMDAN-LSTM-BPNN Decomposition Ensemble
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

John Kamwele Mutinda and Abebe Geletu forecast the DAX index using CEEMDAN, applying LSTM to medium/high-frequency components and BPNN to low-frequency components. Published in Journal of Applied Mathematics, Wiley, 2025.

`Read the paper <https://onlinelibrary.wiley.com/doi/10.1155/jama/7706431>`__

Enhancing Financial Time Series Forecasting with CEEMDAN-Informer-LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jiangcheng Li, Li-Ping Sun, Xiao Wu, and Chen Tao propose CEEMDAN-Informer-LSTM for CSI 300 prediction. Informer handles high-frequency components, LSTM handles low-frequency. Published in Applied Soft Computing, 2025.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1568494625005526>`__

CEEMDAN-GRU-Informer for Financial Time Series Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper combines CEEMDAN with GRU and Informer architectures for multi-scale financial time series prediction. Published in Computational Economics, 2025.

Our summary: This paper proposes a hybrid CEEMDAN-GRU-Informer architecture that decomposes financial time series via CEEMDAN, then routes high-frequency IMFs to GRU (which handles short-term patterns efficiently) and low-frequency IMFs to the Informer model (which captures long-range dependencies via its ProbSparse attention mechanism). The key contribution is the frequency-adaptive model assignment -- rather than using one model for all components, each IMF class gets the architecture best suited to its characteristics.

Key metrics: Exact numerical metrics were not fully extractable from the 11-page PDF rendering, but the paper demonstrates improvements over standalone GRU, LSTM, Informer, and non-decomposition baselines on RMSE, MAE, and MAPE.

Data: Financial time series data (stock market indices). Specific tickers and date ranges were described in the experimental section.

`Read the paper <https://link.springer.com/article/10.1007/s10614-025-11018-8>`__

Realized Volatility Forecasting with Rolling CEEMDAN and Machine Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Y. Zhang, Y. Peng, and Y. Song use rolling CEEMDAN to decompose realized volatility of major stock and futures indices. CEEMDAN-RF (Random Forest) is the best hybrid among 8 ML methods. Published in Computational Economics, Vol. 66, pp. 1215-1268, 2025.

Our summary: the rolling CEEMDAN approach prevents lookahead bias by decomposing only within expanding or rolling windows. The systematic comparison of 8 ML methods on CEEMDAN-decomposed data provides a practical guide for method selection.

`Read the paper <https://link.springer.com/article/10.1007/s10614-024-10732-z>`__

CEEMDAN-GARCH for Aerospace and Defense Sector Volatility
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper applies CEEMDAN-GARCH models to forecast volatility in the aerospace and defense sector. Published in Humanities and Social Sciences Communications, Nature, 2025.

`Read the paper <https://www.nature.com/articles/s41599-025-05027-z>`__

Stock Price Trend Forecasting with CEEMDAN Multi-Channel Complementary Network and Transformer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Multi-channel complementary network using CEEMDAN with independent LSTM modules per IMF and Transformer for residual prediction. Published in Expert Systems with Applications, 2025.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417425036449>`__

Probabilistic Forecasting of Cryptocurrency Volatility via CEEMDAN-DeepAR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

CEEMDAN-DeepAR framework for probabilistic volatility forecasting across six major cryptocurrencies, producing calibrated predictive distributions for tail risk quantification. Published in Physica A, 2026.

Our summary: probabilistic forecasting with full predictive distributions is essential for cryptocurrency risk management where tail events are common. The DeepAR autoregressive architecture naturally generates prediction intervals.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0378437126001007>`__

CEEMDAN-RF-LSTM for Cryptocurrency Realized Volatility
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

CEEMDAN-RF-LSTM hybrid for Bitcoin, Ethereum, and Binance Coin realized volatility prediction. CEEMDAN reduces RF prediction error by 52%. Published in Future Generation Computer Systems, 2024.

Key metrics: 52% reduction in Random Forest prediction error with CEEMDAN preprocessing.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0167739X24001729>`__

Ternary-Frequency CEEMDAN for Cryptocurrency Price Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Novel ternary-frequency prediction scheme using CEEMDAN for cryptocurrency, clustering IMFs into three frequency groups (high, medium, low). Published in Expert Systems with Applications, 2023.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417423015105>`__

CEEMDAN-VMD-CNN-BiLSTM for Crude Oil Price Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Shijie Zhu et al. propose two-stage decomposition (CEEMDAN then VMD on residuals) combined with CNN-BiLSTM for WTI crude oil price prediction. Published in Results in Engineering, 2025.

Key metrics: MAPE of 3.66%, R² of 95.94%.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S2590123025024612>`__

CEEMDAN-ALS-PSO-LSTM for Crude Oil Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ensemble-driven LSTM with CEEMDAN decomposition and adaptive learning strategy with PSO optimization for crude oil price forecasting. Published in Energy Science & Engineering, Wiley, 2023.

`Read the paper <https://scijournals.onlinelibrary.wiley.com/doi/full/10.1002/ese3.1561>`__

CEEMDAN-PCA-BiLSTM for Stock Price Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Combines CEEMDAN with PCA for feature enhancement in stock price prediction. Error reductions up to 96.8%. Published in Science World Journal, 2025.

`Read the paper <https://www.ajol.info/index.php/swj/article/view/312643>`__

CEEMDAN + Investor Attention for Quantitative Investment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

CEEMDAN-based signal decomposition combined with Baidu index (investor attention proxy) for quantitative investment decision-making on CSI 500. Published in Technological and Economic Development of Economy, 2024.

Our summary: This paper uniquely combines CEEMDAN decomposition with investor attention metrics (e.g., search volume, news sentiment) to build a quantitative trading strategy. Rather than decomposing price alone, it decomposes investor attention signals into multi-scale components and uses different frequency bands to generate trading signals -- high-frequency attention captures short-term sentiment shifts while low-frequency captures structural regime changes. This is a novel application of CEEMDAN to behavioral finance rather than pure price prediction.

Key metrics: Exact quantitative trading performance metrics were presented across the 7-page paper including strategy returns and risk-adjusted measures, though specific numbers were not fully extractable from the PDF rendering.

Data: Chinese stock market data with investor attention proxies (Baidu search index or similar).

`Read the paper <https://journals.vilniustech.lt/index.php/TEDE/article/view/18672>`__

GADHT: CEEMDAN + Hierarchical Transformer for Stock Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Khalid Bentaleb, Mohamed Ben Houad, and Mohammed Mestari propose a Generative Adaptive Decomposition Hierarchical Transformer framework using CEEMDAN to decompose price signals into IMFs combined with a hierarchical Transformer architecture. SSRN, 2025.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5379116>`__

EMD and EEMD-Based Financial Forecasting
----------------------------------------

A Hybrid Prediction Method for Stock Price Using LSTM and Ensemble EMD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yang Yujun et al. propose LSTM-EEMD for stock price prediction on DAX, ASX, S&P 500, and HSI. LSTM-EEMD outperforms LSTM-EMD across all four indices. Published in Complexity, Wiley/Hindawi, 2020.

`Read the paper <https://onlinelibrary.wiley.com/doi/10.1155/2020/6431712>`__

Empirical Mode Decomposition Using Deep Learning Model for Financial Market Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zebin Jin, Yixiao Jin, and Zhiyun Chen provide a comprehensive study of EMD combined with CNN, LSTM, and GRU for financial market forecasting across multiple assets. Published in PeerJ Computer Science, 2022.

`Read the paper <https://pmc.ncbi.nlm.nih.gov/articles/PMC9575866/>`__

A Stock Price Forecasting Model Integrating CEEMD, ICA, PSO, and LSTM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This paper integrates CEEMD with sample entropy, Independent Component Analysis, PSO optimization, and LSTM for stock price forecasting using frequency-based component grouping. Published in International Journal of Computational Intelligence Systems, Springer, 2022.

Our summary: This paper builds a 5-stage pipeline: CEEMD decomposition, Sample Entropy (SE) grouping, Independent Component Analysis (ICA) to reveal hidden source signals, PSO-optimized LSTM for prediction, and reconstruction. The novel contribution is the ICA step after decomposition -- rather than predicting IMFs directly, ICA extracts statistically independent latent factors from the grouped IMFs, and LSTM then predicts these cleaner independent components. PSO optimization of LSTM hyperparameters further boosts performance. This addresses two problems simultaneously: cumulative decomposition error (via SE grouping) and correlated IMF components (via ICA).

Key metrics: Performance metrics include MAPE, MAE, RMSE, directional accuracy (DA), and R-squared across four SSE 50 stocks (SH600518, SH600519, SH600999, SH601988). The CS-ICA-PSO-LSTM model outperforms benchmarks including LSTM, PSO-LSTM, CEEMD-PSO-LSTM, and EMD-LSTM on all metrics.

Data: Four stocks from the SSE 50 index (Shanghai Stock Exchange): SH600518, SH600519, SH600999, SH601988. Data from March 19, 2001 to March 16, 2021. Training: March 2001-April 2017; Testing: April 2017-March 2021. Train/test ratio 8:2.

Code: Not mentioned. Published as open access in International Journal of Computational Intelligence Systems (2022).

`Read the paper <https://link.springer.com/article/10.1007/s44196-022-00140-2>`__

Improved EMD with Akima Spline for Stock Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

M. Ali, D.M. Khan et al. propose an improved EMD using Akima spline interpolation (instead of cubic spline) combined with LSTM. Akima splines avoid the overshoot and oscillation artifacts of cubic splines, producing cleaner decompositions for noisy stock data. Published in Applied Sciences, Vol. 13(3), 1429, 2023.

`Read the paper <https://www.mdpi.com/2076-3417/13/3/1429>`__

Multivariate EMD with TCN for Stock Index Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yao Y., Zhang Z.-y., and Zhao Y. propose MEMD-TCN using multivariate EMD to jointly decompose COHLV (Close-Open-High-Low-Volume) data, then TCN predicts same-frequency subseries. Published in Applied Soft Computing, Vol. 142, 2023.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1568494623003745>`__

An End-to-End Structure with Improved EMD for Stock Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Chufeng Li and Jianyong Chen propose a novel end-to-end architecture with improved EMD for reducing short-term noise in stock data, tested on US ETFs over 10+ years. arXiv:2404.07969, 2024.

Our summary: Introduces ETT, an end-to-end model that integrates an improved EMD directly into a Transformer architecture for stock price prediction, eliminating the traditional two-stage decompose-then-predict pipeline. The improved EMD uses mirror extension and cubic spline optimization to reduce boundary effects. The key innovation is embedding decomposition within the neural network itself, allowing joint optimization and avoiding error propagation between stages.

Key metrics: On CSI 300: RMSE 43.99, MAE 33.68, R-squared 0.978. On S&P 500: RMSE 37.37, MAE 26.63, R-squared 0.986. ETT outperformed standalone Transformer (R-squared 0.930 on CSI 300), LSTM (R-squared 0.954), and traditional EMD-LSTM (R-squared 0.970). The improved EMD reduced RMSE by approximately 15-20% compared to standard EMD-Transformer.

Data: CSI 300 Index (China) and S&P 500 Index (US). Daily data from 2014 to 2023 (approximately 10 years).

`Read the paper <https://arxiv.org/abs/2404.07969>`__

Periodic and Non-Periodic Feature Separation via EMD for Stock Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A hybrid method separating periodic from non-periodic features using EMD decomposition for stock prediction. Published in EPJ Data Science, Springer, 2024.

`Read the paper <https://epjdatascience.springeropen.com/articles/10.1140/epjds/s13688-024-00517-7>`__

EMD-TI-LSTM for Enhanced Financial Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

EMD combined with technical indicators and LSTM for enhanced financial forecasting. Published in Mathematics, Vol. 12(17), 2794, 2024.

Our summary: Proposes EMD-TI-LSTM, which decomposes financial time series via EMD into IMFs, then enriches each IMF with technical indicators (EMA, RSI, Bollinger Bands) before feeding each enriched IMF into a separate LSTM for prediction. The key contribution is combining decomposition with per-IMF technical indicator features, which provides richer context than raw price decomposition alone. The model achieves an average 39.56% MAPE improvement over standard LSTM across diverse asset classes, and outperforms state-of-the-art BTC prediction methods with a MAPE of 1.69 versus the prior average of 2.96.

Key metrics: EMD-TI-LSTM results -- BTC: MAPE 1.69, RMSE 767, MAE 493. BIST: MAPE 3.47, RMSE 273, MAE 242. NASDAQ: MAPE 1.14, RMSE 207, MAE 170. GOLD: MAPE 0.79, RMSE 19, MAE 15. Average MAPE improvement over LSTM: 39.56%. Average RMSE improvement: 36.86%. Average MAE improvement: 39.90%. BTC MAPE 42.91% better than average of 9 state-of-the-art methods (2.96).

Data: BTC/USD, BIST 100 Index (Turkey), NASDAQ-100 Index, GOLD/USD. Daily closing prices from TradingView, covering Nov 15, 2013 to Nov 15, 2023 (10 years). Train/test ratio: 0.95/0.05.

Code: https://github.com/ojaayojaay/Financial-Forecasting-with-EMD-TI-LSM

`Read the paper <https://www.mdpi.com/2227-7390/12/17/2794>`__

CEEMD for RMB Exchange Rate Forecasting and Economic Factor Analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

CEEMD decomposition of RMB/USD exchange rate combined with correlation analysis and forecasting models. Published in Computational Economics, Springer, 2025.

Our summary: This paper applies CEEMD decomposition to RMB/USD exchange rate forecasting with a unique twist: after decomposing the exchange rate into IMFs, it uses correlation analysis to filter out noise components (those with the least influence on the original signal), then applies different prediction models to remaining components based on their characteristics. Beyond pure forecasting, the paper performs VAR-based economic factor analysis, linking each IMF to specific macroeconomic drivers (foreign exchange reserves, import/export balance, industrial growth rate, money supply, CPI, inflation). This dual contribution -- improved forecasting plus economic interpretability -- distinguishes it from purely prediction-focused papers.

Key metrics: Average relative error of the prediction model is 0.2124% for RMB/USD exchange rate within two months. Six economic factors identified as significant drivers via VAR analysis.

Data: RMB/USD exchange rate data plus macroeconomic indicators (foreign exchange reserves, import/export balance, industrial added value growth rate, money supply, CPI, inflation rate). Published July 2025 in Computational Economics.

`Read the paper <https://link.springer.com/article/10.1007/s10614-025-11043-7>`__

Energy-Frequency Spectrum for Financial Time Series via Complementary Ensemble EMD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Tim Leung and Theodore Zhao apply complementary ensemble EMD and Hilbert-Huang Transform to financial time series, computing instantaneous energy-frequency spectra for ETFs and cryptocurrencies. SSRN, 2020.

Our summary: the energy-frequency spectrum provides a time-frequency representation of financial signals that reveals how energy (volatility) is distributed across frequencies over time — directly relevant for detecting regime changes and volatility clustering.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3573243>`__

Financial Time Series Analysis and Forecasting with HHT Feature Generation and Machine Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Tim Leung and Theodore Zhao use Hilbert-Huang Transform (based on EMD) to generate features for ML models (regression trees, SVM, LSTM) for financial forecasting. SSRN, 2020.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3595914>`__

Two-Stage EMD/VMD + ELM + Harmony Search for Stock Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Two-stage ensemble combining EMD/VMD with Extreme Learning Machine and improved harmony search algorithm for stock price prediction. Published in Annals of Operations Research, Vol. 309(2), Springer, 2022.

`Read the paper <https://link.springer.com/article/10.1007/s10479-020-03690-w>`__

ICEEMDAN-LSTM-CNN-CBAM for Gold Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yanhui Liang, Yu Lin, and Qin Lu use Improved CEEMDAN to decompose gold prices, predicted by LSTM-CNN with Convolutional Block Attention Module. Achieves R² > 0.999 and MAPE < 0.3%. Published in Expert Systems with Applications, Vol. 206, 2022.

Key metrics: R² > 0.999, MAPE < 0.3% for gold price forecasting.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417422011034>`__

MEEMD-LSTM for Multi-Step Precious Metal Price Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Modified EEMD (MEEMD) with LSTM for multi-step precious metal price prediction. MEEMD shows better decomposition than EEMD. Published in Resources Policy, 2022.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0301420722003294>`__

CEEMD-CNN-BiLSTM with Attention for Stock Price
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

CEEMD-CNN-BiLSTM with attention mechanism for stock price prediction using S&P 500, Dow Jones, DAX, and Nikkei 225. Published in ACM Conference Proceedings, 2025.

`Read the paper <https://dl.acm.org/doi/10.1145/3745533.3745581>`__

Empirical Wavelet Transform Papers
-----------------------------------

EWT with Echo State Network for Time Series Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

EWT-ESN (Echo State Network) two-stage predictive algorithm. EWT adaptively decomposes time series into different resolution levels, validated on 12 public datasets including financial series. Published in Applied Soft Computing, 2021.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S156849462100034X>`__

Deep Multi-Hybrid Forecasting System with Random EWT for Crude Oil Futures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Multi-hybrid system integrating EWT with deep bidirectional LSTM and Elman RNN with variational learning rate for crude oil futures prediction. Published in Expert Systems with Applications, Vol. 157, 2020.

Our summary: Proposes a multi-hybrid system integrating Empirical Wavelet Transform (EWT) with random inheritance formula (RIF) error correction, deep bidirectional LSTM (DBLSTM), and Elman recurrent neural networks with variational learning rate. EWT decomposes crude oil futures into frequency components, then the prediction model is selected based on frequency characteristics -- DBLSTM for trend components and Elman RNN for oscillatory components. The RIF error correction and variational learning rate are novel algorithmic enhancements that improve training stability. Evaluated using q-DSCID (q-order dyadic scales complexity invariant distance) as a multi-scale evaluation metric.

Key metrics: The proposed RIF-DBGRUNN model outperformed all baselines on WTI, Brent, Natural Gas, and Heating Oil futures across MAPE, MAE, RMSE, and q-DSCID metrics. WTI: best MAPE among all compared models. The paper demonstrates superiority over SVM, RNN, GRU, ERNN, LSTM, and their variants across all four energy commodities.

Data: Four energy commodity futures: WTI crude oil, ICE Brent crude oil, Henry Hub Natural Gas, Heating Oil. Daily settlement prices from 2000 to 2019 (approximately 19 years).

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417420305108>`__

EWT-Based Deep Ensemble Learning for High-Frequency Futures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

EWT-based deep ensemble learning framework for high-frequency futures price forecasting using depth feature extraction. Published in Digital Signal Processing, 2022.

Our summary: Proposes a three-module framework for 5-minute high-frequency futures prediction: (1) VMD decomposition supported by MSE for signal decomposition and Savitzky-Golay filtering for denoising, with reconstruction via MSE into trend/oscillation/noise components; (2) ALSTM (Attention-LSTM) with Spearman correlation for feature selection and SAE (Stacked Autoencoder) for dimensionality reduction of exogenous variables; (3) LightGBM for nonlinear ensemble integration. The novelty is the complete pipeline combining decomposition, deep feature extraction of exogenous variables, and gradient boosting integration for high-frequency data.

Key metrics: Proposed framework on Apple futures: RMSE 34.3230, MAE 28.0488, MAPE 0.3480%. Rebar futures: RMSE 14.3128, MAE 11.5271, MAPE 0.2639%. CSI 300 futures: RMSE 11.1188, MAE 8.2559, MAPE 0.1676%. Compared to LSTM baseline: RMSE reduced by 30.84-71.11%, MAE reduced by 27.62-53.30%, MAPE reduced by 52.87-66.82%. Outperformed VMD-BiGRU, CEEMDAN-LSTM, VMD-LSTM-SVR, and CEEMDAN-SE-LSTM-RF.

Data: Chinese futures markets: Apple futures, Rebar futures, CSI 300 Index futures. 5-minute high-frequency data from January 2021 to January 2022. Includes exogenous variables (price factors, technical indicators, volume).

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1051200422001841>`__

Survey and Methodology Papers
-----------------------------

Information Leakage in Time Series Prediction Based on Empirical Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This critical paper analyzes information leakage (lookahead bias) in EMD-based time series prediction. When the full series is decomposed before train/test splitting, future information leaks into training data, inflating accuracy. The paper proposes three mitigation strategies: sliding window EMD, single-training-multiple-decomposition, and multiple-training-multiple-decomposition. Published in Scientific Reports, Nature, 2024.

Our summary: this is one of the most important methodological papers in the decomposition-forecasting literature. Many published VMD/EMD results are overly optimistic because they decompose the entire dataset (including test data) before splitting. Any practitioner using decomposition-based forecasting must implement one of the mitigation strategies proposed here to avoid deploying models with artificially inflated accuracy.

`Read the paper <https://www.nature.com/articles/s41598-024-80018-9>`__

VMDNet: Temporal Leakage-Free Variational Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Weibin Feng, Ran Tao, John Cartlidge, and Jin Zheng propose VMDNet with sample-wise VMD to eliminate temporal information leakage. Uses frequency-aware embeddings and parallel TCN decoders, with a bilevel Stackelberg optimization for hyperparameters. Consistently outperforms state-of-the-art baselines. arXiv:2509.15394, 2025.

Our summary: VMDNet represents the most complete solution to the data leakage problem. By performing VMD on each sample independently (rather than the full series), it guarantees causal decomposition. The Stackelberg game-theoretic approach to hyperparameter optimization is theoretically grounded and avoids the computational cost of grid search.

`Read the paper <https://arxiv.org/abs/2509.15394>`__

Deep Learning Models for Price Forecasting of Financial Time Series: A Review 2020-2022
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Cheng Zhang, Nilam Nur Amir Sjarif, and Roslina Ibrahim provide a comprehensive review of deep learning for financial price forecasting, covering decomposition techniques (EMD, VMD, CEEMDAN, wavelets) as preprocessing pipelines alongside Transformers, GANs, GNNs, and DQNNs. arXiv:2305.04811, 2023.

Our summary: this review provides an excellent roadmap of the decomposition-deep learning landscape as of 2022, identifying key gaps and future directions including the need for interval prediction, decomposition validation, and understanding data volume effects.

`Read the paper <https://arxiv.org/abs/2305.04811>`__

Decomposition Hybrid Methods for Crude Oil Price Forecasting: A Comprehensive Comparison
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Comprehensive comparison of EMD, EEMD, CEEMDAN, and VMD combined with statistical, ML, and DL models for crude oil price forecasting. VMD + Huber Regression emerges as the best combination overall. Published in Neural Computing and Applications, Springer, 2025.

Our summary: the finding that VMD + Huber Regression (a simple, robust linear model) outperforms VMD + deep learning is consistent with the "VMD + linear embeddings" paper — suggesting that VMD's decomposition quality, not downstream model complexity, drives forecast accuracy.

`Read the paper <https://link.springer.com/article/10.1007/s00521-025-11178-6>`__

Comparing CEEMDAN, VMD, and EPT for Bitcoin Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Systematic comparison of CEEMDAN, VMD, and Empirical Phase Transform combined with LSTM, BiLSTM, and TCN for Bitcoin price forecasting using 2019-2023 hourly data. Published in Computational Economics, Springer, 2025.

`Read the paper <https://link.springer.com/article/10.1007/s10614-025-10907-2>`__

Tutorial on Empirical Mode Decomposition for Non-Stationary Time Series
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Cole van Jaarsveldt, Gareth Peters, Matthew Ames, and Mike J. Chantler provide a tutorial on EMD theory, basis decomposition, and frequency-adaptive graduation for non-stationary time series, with financial applications. SSRN, 2021.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3913330>`__

OCEEMDAN + Deep Learning for Exchange Rate Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Framework integrating Optimal CEEMDAN (OCEEMDAN) with Bi-LSTM, GRU, and FNN using zebra optimization for exchange rate forecasting. Published in Journal of Financial Risk Management, MDPI, 2024.

`Read the paper <https://www.mdpi.com/2227-7072/13/3/151>`__

Multi-Scale GARCH with Graph Neural Networks for Stock Volatility
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Rentian Yu, Haotian Xiao, Yukun Zhu, and Gongqiu Zhang propose the GENSHIN framework integrating GARCH with multi-scale graph neural networks (MixHop + multi-head attention) for stock index volatility prediction. While not using VMD directly, this addresses multi-scale volatility decomposition highly relevant to VMD-GARCH approaches. Published in Finance Research Letters, 2025.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S1544612325004593>`__

Enhancing Portfolio Performance through Decomposition-Based Variational Encoder-Decoder Data Augmentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

FED2Port framework uses decomposition-based variational encoder-decoder for data augmentation, then reinforcement learning for portfolio diversification from augmented financial market scenarios. Published in Symmetry, MDPI, 2024.

Our summary: Introduces FED (Financial time-series decomposition-based variational Encoder-Decoder) for data augmentation and FED2Port for two-class portfolio diversification using reinforcement learning. FED decomposes latent variables into trend, dispersion, and residual components, generating realistic synthetic financial data that addresses uncertainty deficiency and insufficient training data in historical markets. FED2Port uses this augmented environment to train an RL agent with a market-adaptive reward function. The key innovation is applying decomposition not for prediction but for data augmentation to improve portfolio allocation decisions.

Key metrics: FED2Port achieved the highest Sharpe ratio across all 9 portfolio combinations tested. BND&SP500: Sharpe 1.7869 (vs best alternative RRL 1.1540). BSV&SP500: Sharpe 2.5377 (vs best alternative Tangency 1.5342). VCIT&SP500: Sharpe 2.2800 (vs best alternative RRL 1.5642). VCIT&DAX: Sharpe 2.1714 (vs best alternative RRL 1.7990). FED2Port consistently beat buy-and-hold, Markowitz tangency, risk budgeting, RRL, DDPG, TimeGAN2Port, and RTSGAN2Port on Sharpe ratio.

Data: S&P 500, DAX, KOSPI (high-risk); BND, BSV, VCIT (low-risk bond funds). Daily data from Yahoo Finance, Jan 2010 to Dec 2022. Training: 2010-2014, Testing: 2015-2022. 9 two-class portfolio combinations.

`Read the paper <https://www.mdpi.com/2073-8994/16/3/283>`__
