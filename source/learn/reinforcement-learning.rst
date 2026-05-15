.. meta::
   :description: Research papers on reinforcement learning for trading, portfolio construction, order execution, market making, and hedging.

Reinforcement Learning
~~~~~~~~~~~~~~~~~~~~~~

Reinforcement learning offers a fundamentally different approach to trading compared to supervised forecasting: rather than predicting prices and translating predictions into trades, RL agents learn trading policies directly by interacting with market environments and optimising cumulative reward. This end-to-end formulation naturally handles sequential decision-making under uncertainty, transaction costs, inventory constraints, and the non-stationarity of financial markets — problems that supervised models address only indirectly through post-hoc trading rules.

The research here covers RL applied across the full spectrum of trading problems: portfolio construction and dynamic asset allocation, algorithmic trading strategies and signal generation, optimal order execution, market making, and derivatives hedging. A central methodological challenge is the gap between simulated and real markets — RL agents trained in environments with limited data and simplified dynamics often fail to generalise to live trading. The collection includes foundational surveys, key algorithmic contributions (from the Differential Sharpe Ratio to Deep Hedging), open-source frameworks, and practical implementations with realistic transaction cost modelling.

Related RL-relevant papers also appear in :doc:`Machine Learning <./machine-learning>` (DQN for portfolios, continuous-action DRL, Janus-Q event-driven trading), :doc:`Statistical Arbitrage <./statistical-arbitrage>` (RL pair trading, DQN for stat arb), :doc:`Carry Trade <./carry-trade>` (model-free RL for carry allocation), :doc:`Portfolio Construction <./portfolio-construction>` (Markowitz-to-DRL comparison), and :doc:`Signal Decomposition <./signal-decomposition>` (VMD+RL portfolio optimisation).

Reinforcement Learning for Trading
-----------------------------------

John Moody and Matthew Saffell (NeurIPS 1998; IEEE Transactions on Neural Networks, 2001) introduce Recurrent Reinforcement Learning (RRL) and the Differential Sharpe Ratio — a novel online, incremental reward function that enables gradient-based optimisation of risk-adjusted trading performance. Rather than forecasting prices, the RRL agent directly learns a mapping from market features to trading positions by maximising the Differential Sharpe Ratio through backpropagation. The agent outperforms the S&P 500 over a 25-year test period.

Our summary: this is the foundational paper for the entire field of RL applied to trading. The Differential Sharpe Ratio remains one of the most elegant reward formulations — it converts the Sharpe ratio into an online, differentiable objective that can be optimised incrementally as new data arrives. The key insight is that by optimising risk-adjusted returns directly, the agent learns to size positions and time entries in a way that no price-forecasting model can replicate, because the forecast-to-trade translation step is eliminated. Every subsequent paper in the field builds on this foundation.

`Read the paper <https://proceedings.neurips.cc/paper_files/paper/1998/hash/4e6cd95227cb0c280e99a195be5f6615-Abstract.html>`__

Recent Advances in Reinforcement Learning in Finance
-----------------------------------------------------

Ben Hambly, Renyuan Xu, and Huining Yang (Mathematical Finance, 2023) provide the authoritative survey of RL in finance, covering the MDP framework, value-based methods (Q-learning, DQN), policy-based methods (REINFORCE, PPO, A2C), and actor-critic architectures as applied to portfolio optimisation, option pricing, optimal execution, and market making. The paper rigorously contrasts classical stochastic control theory with modern RL approaches, identifying where RL offers genuine advantages (model-free flexibility, high-dimensional state spaces) and where classical methods remain superior (when the model is known and low-dimensional).

Our summary: this is the survey to read if you want to understand where RL fits in the broader landscape of quantitative finance. Published in Mathematical Finance — the top journal in the field — it provides the theoretical depth that practitioner-oriented surveys lack. The most valuable sections are the comparisons between RL and classical solutions for the same problems: optimal execution (RL vs Almgren-Chriss), portfolio allocation (RL vs Merton), and option pricing (RL vs Black-Scholes). These comparisons clarify when RL is genuinely useful versus when it is unnecessary complexity.

`Read the paper <https://arxiv.org/abs/2112.04553>`__

Reinforcement Learning for Quantitative Trading: A Survey
----------------------------------------------------------

Shuo Sun, Rundong Wang, and Bo An (ACM Transactions on Intelligent Systems and Technology, 2023) provide the first comprehensive survey specifically focused on RL-based quantitative trading, systematically reviewing over 100 papers across four problem domains: order execution, portfolio management, market making, and trading strategy design. The survey devises a unified taxonomy, compares algorithmic approaches within each domain, identifies common benchmarks and evaluation methodologies, and highlights open challenges including non-stationarity, partial observability, reward shaping, and sim-to-real transfer.

Our summary: this is the most practically useful RL-in-trading survey for practitioners deciding which algorithm to apply to which problem. The taxonomy is actionable: order execution favours value-based methods (DQN variants) because the action space is naturally discrete; portfolio management favours policy gradient methods (DDPG, PPO) because continuous weight allocation is more natural; market making benefits from actor-critic methods that balance inventory risk against spread capture. The identification of common failure modes — reward hacking, overfitting to specific market regimes, and the gap between simulated and real execution — is particularly valuable.

`Read the paper <https://dl.acm.org/doi/10.1145/3582560>`__

Deep Hedging
------------

Hans Buehler, Lukas Gonon, Josef Teichmann, and Ben Wood (J.P. Morgan and ETH Zurich; Quantitative Finance, 2019) propose Deep Hedging — a framework that learns to hedge portfolios of derivatives under realistic market frictions (transaction costs, liquidity constraints, risk limits) using deep reinforcement learning. The approach is model-agnostic: it does not require specifying the underlying price dynamics, instead learning the optimal hedging policy directly from simulated or historical data. The framework scales to arbitrary portfolio sizes and handles path-dependent options, multiple underlyings, and non-linear transaction costs.

Our summary: Deep Hedging is one of the most influential papers bridging RL and quantitative finance, and one of the few RL-in-finance results adopted by industry. The key innovation is framing hedging as a sequential decision problem where the agent chooses hedge ratios at each time step to minimise a convex risk measure (CVaR, entropic risk) of the terminal P&L. This naturally incorporates transaction costs — unlike classical delta hedging which ignores them and then applies ad-hoc adjustments. The approach outperforms the Black-Scholes delta hedge on S&P 500 options data when transaction costs are non-trivial, precisely because it learns to trade off hedging precision against rebalancing costs.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3355706>`__

DeepTrader: A Deep Reinforcement Learning Approach for Risk-Return Balanced Portfolio Management with Market Conditions Embedding
---------------------------------------------------------------------------------------------------------------------------------

Zhicheng Wang, Biwei Huang, Shikui Tu, Kun Zhang, and Lei Xu (AAAI 2021) propose DeepTrader, a dual-module RL architecture for portfolio management that embeds macro market conditions into the allocation decision. The Asset Scoring Unit uses dilated CNN and attention mechanisms to score individual assets, while the Market Scoring Unit uses a graph convolutional network (GCN) to capture cross-asset relationships and assess overall market conditions. The market score dynamically adjusts long/short fund proportions — increasing cash allocation in bearish regimes and leverage in bullish ones. The reward function uses negative maximum drawdown rather than raw returns, promoting risk-aware behaviour.

Our summary: DeepTrader's main contribution is the market-condition embedding — most RL portfolio agents treat each rebalancing step independently, ignoring whether the market is in a bull or bear regime. By conditioning the policy on a learned market state, the agent can shift between aggressive and defensive allocations. The GCN component is particularly relevant for capturing sector rotations and contagion effects that propagate through asset correlation networks. The negative-max-drawdown reward is a practical improvement over Sharpe-based rewards, which can produce strategies with acceptable Sharpe but catastrophic drawdowns.

`Read the paper <https://ojs.aaai.org/index.php/AAAI/article/view/16144>`__

Reinforcement-Learning Based Portfolio Management with Augmented Asset Movement Prediction States
-------------------------------------------------------------------------------------------------

Y. Ye, H. Pei, B. Wang, P.-Y. Chen, Y. Zhu, J. Xiao, and B. Li (AAAI 2020) propose SARL (State-Augmented RL), which augments the standard RL portfolio state with predicted asset movement directions from a supervised learning module. The supervised component processes heterogeneous data sources (price, volume, news text) to generate movement predictions, which are then appended to the RL agent's state representation. This bridges the gap between supervised forecasting and RL-based allocation: the RL agent benefits from predictive signals without being constrained by them.

Our summary: SARL addresses a fundamental question — should you forecast first and then allocate, or learn allocation end-to-end? The answer here is "both": the supervised prediction module provides a useful prior about asset movements, but the RL agent retains the freedom to override these predictions based on portfolio-level considerations (transaction costs, correlation, risk constraints). Tested on Bitcoin and HighTech stock markets with 7 years of Reuters news data, the approach outperforms both pure-RL and pure-forecasting baselines.

`Read the paper <https://ojs.aaai.org/index.php/AAAI/article/view/5462>`__

An Application of Deep Reinforcement Learning to Algorithmic Trading
--------------------------------------------------------------------

Thibaut Theate and Damien Ernst (Expert Systems with Applications, 2021) propose TDQN (Trading DQN), a DQN variant adapted specifically for algorithmic trading that maximises the Sharpe ratio as its reward signal. The paper's methodological contribution is a rigorous performance assessment framework: artificial trajectory generation from limited historical data for training, proper train/validation/test temporal splits to avoid lookahead bias, and statistical significance testing of results. The approach is tested on 30 highly-liquid stocks with realistic transaction costs.

Our summary: this is one of the most methodologically careful RL-trading papers. Most RL-trading research suffers from inadequate evaluation — training and testing on the same market regime, ignoring transaction costs, or reporting only cherry-picked assets. Theate and Ernst address all of these: the artificial trajectory generation provides data augmentation without future information leakage, the three-way temporal split prevents overfitting, and the statistical tests determine whether outperformance is genuine or due to chance. The TDQN algorithm itself is straightforward (standard DQN with experience replay and target networks), but the evaluation framework is exemplary and should be the minimum standard for RL-trading research.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0957417421000737>`__

Deep Direct Reinforcement Learning for Financial Signal Representation and Trading
-----------------------------------------------------------------------------------

Yue Deng, Feng Bao, Youyong Kong, Zhiquan Ren, and Qionghai Dai (IEEE Transactions on Neural Networks and Learning Systems, 2017) propose Deep Recurrent Reinforcement Learning (DRRL), combining deep learning for market condition sensing with recurrent RL for trading decision execution. The deep learning component extracts hierarchical features from raw market data (fuzzy representation of price, volume, and technical indicators), while the recurrent RL component learns a trading policy that accounts for temporal dependencies across decision steps. A task-aware backpropagation through time (BPTT) addresses the vanishing gradient problem in long trading sequences.

Our summary: this is one of the earliest papers to successfully combine deep feature extraction with RL for trading, predating the FinRL wave by several years. The key insight is that RL agents operating on raw price data struggle because the state space is too noisy; the deep learning component compresses market conditions into a low-dimensional, informative representation that makes the RL problem tractable. The fuzzy representation layer is an unusual but effective choice — it discretises continuous indicators into membership functions, providing a form of input regularisation.

`Read the paper <https://ieeexplore.ieee.org/document/7407387/>`__

Market Making via Reinforcement Learning
-----------------------------------------

Thomas Spooner, John Fearnley, Rahul Savani, and Andreas Koukorinis (AAMAS 2018) apply temporal-difference RL to the market-making problem using a high-fidelity limit order book simulation. The RL agent learns to dynamically adjust bid and ask quotes to maximise profit while controlling inventory risk through a custom reward function. The state representation uses tile coding for value function approximation, enabling efficient learning from the high-dimensional LOB state. The agent outperforms both fixed-spread benchmarks and online learning baselines.

Our summary: this paper demonstrates that RL can learn effective market-making policies in realistic environments — a practically important result because market making requires balancing multiple competing objectives (capturing spread, managing inventory, avoiding adverse selection) that are difficult to optimise analytically. The tile-coding approach is notably simpler than deep RL alternatives but achieves strong performance, suggesting that for market making the state representation matters more than the function approximator complexity.

`Read the paper <https://arxiv.org/abs/1804.04216>`__

Universal Trading for Order Execution with Oracle Policy Distillation
---------------------------------------------------------------------

Yuchen Fang, Kan Ren, Weiqing Liu, Dong Zhou, Weinan Zhang, Jiang Bian, Yong Yu, and Tie-Yan Liu (Microsoft Research; AAAI 2021) propose a teacher-student policy distillation framework for optimal order execution. An oracle teacher policy with access to perfect future information learns the theoretically optimal execution strategy, then distils this knowledge into a student policy that operates only on real-time market states. The framework bridges the gap between the noisy, partial information available in live markets and the optimal execution achievable with hindsight.

Our summary: the oracle distillation approach is elegant — rather than directly training an RL agent on noisy market data (where the reward signal is weak and delayed), the oracle teacher provides a clean supervision signal. The student learns "what would the optimal trader have done in this situation?" which is a much clearer learning objective than maximising long-term cumulative reward from scratch. This technique could be applied beyond execution to any trading problem where a hindsight-optimal policy can be computed.

`Read the paper <https://arxiv.org/abs/2103.10860>`__

FinRL-Meta: Market Environments and Benchmarks for Data-Driven Financial Reinforcement Learning
------------------------------------------------------------------------------------------------

Xiao-Yang Liu et al. (NeurIPS 2022, Datasets and Benchmarks Track) address the critical infrastructure gap in financial RL research: the lack of standardised, realistic market environments and reproducible benchmarks. FinRL-Meta provides hundreds of market environments through an automated DataOps pipeline from real market data sources, with built-in handling of survivorship bias, data quality issues, and train/test temporal separation. The platform supports community benchmarking of RL algorithms across diverse market conditions.

Our summary: FinRL-Meta solves the reproducibility crisis in financial RL. Most papers use custom environments with undisclosed data processing, making comparison impossible. By providing standardised environments with consistent data pipelines, the platform enables apples-to-apples algorithm comparison — essential for determining whether reported improvements are genuine or artifacts of different data preprocessing. Published at NeurIPS (Datasets and Benchmarks Track), which validates its contribution to the field's infrastructure.

`Read the paper <https://arxiv.org/abs/2211.03107>`__

Adversarial Deep Reinforcement Learning in Portfolio Management
---------------------------------------------------------------

Zhipeng Liang, Hao Chen, Junhao Zhu, Kangkang Jiang, and Yanran Li (2018) compare DDPG, PPO, and Policy Gradient for portfolio management on China A-shares and propose an adversarial training method that improves training efficiency and strategy robustness. The adversarial component introduces perturbations to the market environment during training, forcing the agent to learn policies that are robust to distribution shifts — a critical concern in financial markets where the training distribution rarely matches the deployment distribution.

Our summary: the adversarial training contribution is the paper's main value. Financial markets are non-stationary, and RL agents trained on historical data frequently fail when market dynamics change. By training against adversarially perturbed environments, the agent learns strategies that degrade gracefully rather than catastrophically when the market regime shifts. The comparison of DDPG, PPO, and PG on the same Chinese market data also provides a useful practical guide for algorithm selection in Asian equity markets.

`Read the paper <https://arxiv.org/abs/1808.09940>`__
