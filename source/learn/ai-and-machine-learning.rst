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

