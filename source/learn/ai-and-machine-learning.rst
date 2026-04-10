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

By Kieran Wood, Samuel Kessler, Stephen J. Roberts, and Stefan Zohren (Oxford-Man Institute, University of Oxford).

`Read the paper <https://arxiv.org/abs/2310.10500>`__

`Read the post <https://www.linkedin.com/feed/update/urn:li:activity:7084892137594499072/>`__