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

Key findings from surveyed papers: RL improves Implementation Shortfall over Almgren-Chriss by up to 10.3% on average for optimal execution; RL market-making agents achieve 20-30% higher terminal wealth while exposing to only ~60% of inventory risk compared to benchmarks; PPO achieves best performance among RL algorithms for European options hedging in terms of both PnL and training time.

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

Our summary: this paper demonstrates that RL can learn effective market-making policies in realistic environments — a practically important result because market making requires balancing multiple competing objectives (capturing spread, managing inventory, avoiding adverse selection) that are difficult to optimise analytically. The tile-coding approach is notably simpler than deep RL alternatives but achieves strong performance, suggesting that for market making the state representation matters more than the function approximator complexity. The key innovation is the asymmetrically dampened reward function that penalises inventory accumulation directionally, producing dramatically lower mean absolute position (near-zero inventory) compared to all benchmarks while maintaining positive PnL.

Data: 10 equities across 5 European venues (including HSBA.L, GSK.L, VOD.L, ING.AS, SAN.MC) from 4 sectors, 8 months of millisecond-resolution LOB data (January-August 2010), 5 levels of depth. Code: https://github.com/tspooner/rl_markets

Key metrics: the consolidated agent (SARSA + asymmetric dampening + LCTC state) achieves positive normalised daily PnL on 7/10 stocks (e.g. 15.43 on HSBA.L, 7.32 on GSK.L, 5.67 on SAN.MC in units of 10^4) while maintaining near-zero mean absolute position — outperforming both fixed-spread strategies and the MMMW online learning benchmark which suffers from excessive inventory (MAP 4,684-8,865 units).

`Read the paper <https://arxiv.org/abs/1804.04216>`__

Universal Trading for Order Execution with Oracle Policy Distillation
---------------------------------------------------------------------

Yuchen Fang, Kan Ren, Weiqing Liu, Dong Zhou, Weinan Zhang, Jiang Bian, Yong Yu, and Tie-Yan Liu (Microsoft Research; AAAI 2021) propose a teacher-student policy distillation framework for optimal order execution. An oracle teacher policy with access to perfect future information learns the theoretically optimal execution strategy, then distils this knowledge into a student policy that operates only on real-time market states. The framework bridges the gap between the noisy, partial information available in live markets and the optimal execution achievable with hindsight.

Our summary: the oracle distillation approach is elegant — rather than directly training an RL agent on noisy market data (where the reward signal is weak and delayed), the oracle teacher provides a clean supervision signal. The student learns "what would the optimal trader have done in this situation?" which is a much clearer learning objective than maximising long-term cumulative reward from scratch. This technique could be applied beyond execution to any trading problem where a hindsight-optimal policy can be computed.

Data: China A-shares market, minute-level price-volume data. Training: 3,566 instruments with 1,654,385 orders (January 2017-February 2019). Test: 855 CSI 800 instruments with 33,176 orders (May-June 2019). Code: https://seqml.github.io/opd/

Key metrics: OPD achieves 6.17 BPs price advantage (p < 0.01) versus TWAP baseline (0 BPs), outperforming DDQN (4.15 BPs) and PPO (2.52 BPs). Gain-loss ratio of 1.35 versus 1.07 for DDQN. All model-based methods (TWAP, Almgren-Chriss, VWAP) are outperformed by learning-based methods.

`Read the paper <https://arxiv.org/abs/2103.10860>`__

FinRL-Meta: Market Environments and Benchmarks for Data-Driven Financial Reinforcement Learning
------------------------------------------------------------------------------------------------

Xiao-Yang Liu et al. (NeurIPS 2022, Datasets and Benchmarks Track) address the critical infrastructure gap in financial RL research: the lack of standardised, realistic market environments and reproducible benchmarks. FinRL-Meta provides hundreds of market environments through an automated DataOps pipeline from real market data sources, with built-in handling of survivorship bias, data quality issues, and train/test temporal separation. The platform supports community benchmarking of RL algorithms across diverse market conditions.

Our summary: FinRL-Meta solves the reproducibility crisis in financial RL. Most papers use custom environments with undisclosed data processing, making comparison impossible. By providing standardised environments with consistent data pipelines, the platform enables apples-to-apples algorithm comparison — essential for determining whether reported improvements are genuine or artifacts of different data preprocessing. Published at NeurIPS (Datasets and Benchmarks Track), which validates its contribution to the field's infrastructure.

Data: 30 DJIA stocks from Yahoo Finance; training January 2009-June 2020, testing July 2020-March 2022. Supports 30+ data sources including Alpaca, WRDS, Binance, Polygon. Code: https://github.com/AI4Finance-Foundation/FinRL-Meta

Key metrics: ensemble strategy (A2C+PPO+DDPG with quarterly rolling window) achieves 25.9% annual return, Sharpe ratio 1.53, Calmar ratio 2.27, and max drawdown -11.4% on DJIA stocks — outperforming individual agents (A2C Sharpe 1.37, PPO 0.99, DDPG 0.88) and the DJIA index itself (Sharpe 1.32, 19.7% annual return).

`Read the paper <https://arxiv.org/abs/2211.03107>`__

Adversarial Deep Reinforcement Learning in Portfolio Management
---------------------------------------------------------------

Zhipeng Liang, Hao Chen, Junhao Zhu, Kangkang Jiang, and Yanran Li (2018) compare DDPG, PPO, and Policy Gradient for portfolio management on China A-shares and propose an adversarial training method that improves training efficiency and strategy robustness. The adversarial component introduces perturbations to the market environment during training, forcing the agent to learn policies that are robust to distribution shifts — a critical concern in financial markets where the training distribution rarely matches the deployment distribution.

Our summary: the adversarial training contribution is the paper's main value. Financial markets are non-stationary, and RL agents trained on historical data frequently fail when market dynamics change. By training against adversarially perturbed environments (Gaussian noise N(0, 0.002) added to price data), the agent learns strategies that degrade gracefully rather than catastrophically when the market regime shifts. The comparison of DDPG, PPO, and PG on the same Chinese market data also provides a useful practical guide for algorithm selection in Asian equity markets.

Data: China A-shares market, portfolios of 5 randomly selected assets with minimum 1,200 trading days history, ~2015-2018. Transaction cost 0.25% per trade. Code: https://github.com/qq303067814/Reinforcement-learning-in-portfolio-management-

Key metrics: across 25 experiments, adversarial training improves average daily return (t-test p = 0.0076, 99% confidence) and Sharpe ratio (p = 0.0338, 95% confidence) compared to non-adversarial training. PG agent statistically outperforms Uniform Constant Rebalanced Portfolio on both daily return (p = 0.039) and Sharpe ratio (p = 0.013). Best feature combination: closing + high prices.

`Read the paper <https://arxiv.org/abs/1808.09940>`__

No-Trade Bands vs Deep Hedging: Hedging Options Under Transaction Costs
----------------------------------------------------------------------

Under Black–Scholes, continuous rebalancing is theoretically optimal, but once trading frictions are introduced it becomes economically unrealistic: hedging reduces P&L variance while every rebalance incurs transaction costs, and their interplay creates a no-trade region whose width is governed by risk aversion. This post contrasts two ways of solving the problem. The classical Whalley & Wilmott approach analytically derives a no-trade band around the Black–Scholes hedge under GBM and small transaction-cost asymptotics — inside the band the expected variance reduction is too small to justify trading costs, so the hedge is left unchanged, and as maturity approaches Gamma concentration forces reactions to ever-smaller price moves, collapsing the band.

Differentiable Deep Hedging reformulates hedging as an end-to-end differentiable stochastic control problem closely related to reinforcement learning and policy optimization: a neural network learns an inventory-aware hedge policy directly from simulated market states, with transaction costs and terminal P&L accumulated pathwise on the forward pass and gradients of terminal risk backpropagated to optimize the policy. Strikingly, under similar GBM assumptions and a variance-minimization objective, the learned hedge/no-hedge regions resemble the classical Whalley–Wilmott geometry even though the network is never given those boundaries. The deep approach generalises further — the market state can include realized volatility, order flow, liquidity, spreads, and latent regimes; it extends beyond Black–Scholes (e.g. wider no-trade regions in mean-reverting markets); and alternative objectives such as CVaR yield different hedge geometries. The trade-offs are real: it is computationally expensive, sensitive to training assumptions, prone to overfitting, and exposed to the simulation-to-reality gap, though recent work pushes toward ambiguity-averse and distributionally robust policies.

By Sofien Kaabar, CFA (crediting Alexander Nevolin as the source).

`Read the post <https://www.linkedin.com/posts/sofienkaabar_under-blackscholes-continuous-rebalancing-share-7467650816829652992-EVti/>`__

Code Repositories
-----------------

TensorTrade
^^^^^^^^^^^

Open-source RL framework for training, evaluating, and deploying robust trading agents. TensorTrade provides a modular component architecture with pluggable exchanges, action schemes, and reward schemes, enabling rapid prototyping of RL trading strategies. Integrates with Stable Baselines for algorithm selection (PPO, A2C, DQN) and supports both backtesting and live trading on stocks and crypto. The modular design means each component (data feed, broker, reward function, action space) can be swapped independently, which is essential for systematic experimentation.

Our summary: TensorTrade is the most mature general-purpose RL trading framework outside the FinRL ecosystem. Its main advantage is the clean separation of concerns — the environment, agent, and evaluation components are fully decoupled, making it straightforward to test the same agent across different markets or the same market with different reward functions. For practitioners, this is the closest thing to a production-ready RL trading toolkit. The 6,250 stars and active maintenance (last push February 2026) reflect genuine community adoption. Apache-2.0 license.

`View repository <https://github.com/tensortrade-org/tensortrade>`__

ElegantRL
^^^^^^^^^

Massively parallel deep reinforcement learning library that serves as the algorithm layer for the FinRL ecosystem. ElegantRL implements a comprehensive set of single-agent algorithms (DDPG, TD3, SAC, PPO, DQN, Double DQN, D3QN) and multi-agent algorithms (QMIX, VDN, MADDPG, MAPPO, MATD3), with scaling support for hundreds of GPU nodes. The library uses Isaac Gym-style vectorised environments for parallel training, enabling the throughput needed for financial RL where sample efficiency is critical due to limited historical data.

Our summary: ElegantRL addresses the computational bottleneck in financial RL — training agents on realistic market environments requires millions of episodes, and single-threaded simulation is prohibitively slow. The multi-agent support (QMIX, MAPPO) is particularly relevant for market simulation research where multiple RL agents interact in a shared order book. 4,328 stars, active through February 2026. Python, custom license.

`View repository <https://github.com/AI4Finance-Foundation/ElegantRL>`__

Deep Hedging (Official Implementation)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Official implementation of the vanilla Deep Hedging engine by Hans Buehler (J.P. Morgan), the lead author of the seminal Deep Hedging paper. The repository provides sample notebooks demonstrating the framework for hedging derivatives portfolios under market frictions using deep reinforcement learning. This is the reference implementation that practitioners and researchers use to reproduce and extend the Deep Hedging results.

Our summary: this is the canonical codebase for Deep Hedging — written by the paper's author at J.P. Morgan. The Jupyter notebook format makes it accessible for experimentation, though the code is conceptual rather than production-grade. For anyone implementing deep hedging in practice, this is the starting point. 339 stars, GPL-3.0 license, last push January 2026.

`View repository <https://github.com/hansbuehler/deephedging>`__

AlphaTrade (JAX-LOB)
^^^^^^^^^^^^^^^^^^^^

First GPU-accelerated limit order book simulator designed specifically for large-scale reinforcement learning training. AlphaTrade uses JAX to process thousands of order books in parallel on GPU, achieving up to 75x faster per-message processing compared to CPU-based LOB simulators. The simulator supports end-to-end RL training for optimal execution strategies directly on GPU without CPU-GPU data transfer bottlenecks. Published at ACM ICAIF 2023.

Our summary: the computational cost of realistic LOB simulation has been the primary bottleneck preventing RL agents from achieving sufficient training data for order execution and market making. AlphaTrade removes this bottleneck by moving the entire simulation-training loop to GPU. The 75x speedup is transformative — it enables the kind of large-scale experimentation needed to determine whether RL execution agents genuinely outperform TWAP/VWAP baselines or are merely overfitting to specific market conditions. 141 stars, active through March 2026.

`View repository <https://github.com/KangOxford/AlphaTrade>`__

JaxMARL-HFT
^^^^^^^^^^^^

First GPU-accelerated open-source multi-agent reinforcement learning environment for high-frequency trading on market-by-order data. Built on top of JAX-LOB, JaxMARL-HFT enables training multiple interacting agents (order execution + market making) in a shared LOB environment with up to 240x training speedup and 350K environment steps per second. Uses IPPO (Independent Proximal Policy Optimization) for multi-agent training. Published at ACM ICAIF 2024.

Our summary: multi-agent RL for HFT is arguably the most realistic formulation of the market making and execution problems — real markets have multiple strategic agents interacting, and single-agent RL ignores the game-theoretic dynamics. JaxMARL-HFT makes this computationally tractable for the first time. The 240x speedup over CPU baselines enables research that was previously infeasible. 56 stars, Apache-2.0 license, active through March 2026.

`View repository <https://github.com/vmohl/JaxMARL-HFT>`__

PGPortfolio
^^^^^^^^^^^

Reference implementation of "A Deep Reinforcement Learning Framework for the Financial Portfolio Management Problem" (Jiang, Xu, Liang, 2017) — one of the most cited papers in DRL portfolio management. The repository implements the Ensemble of Identical Independent Evaluators (EIIE) topology with Policy Gradient optimisation, Portfolio-Vector Memory (PVM), and Online Stochastic Batch Learning (OSBL). Tested on cryptocurrency markets with 30-minute trading intervals.

Our summary: PGPortfolio is the foundational implementation for policy-gradient portfolio management. The EIIE architecture — where each asset is evaluated by an identical but independently parameterised network — became the standard design pattern for DRL portfolio agents. The 1,850 stars reflect its influence. While the code is no longer actively maintained (last push 2021), the architecture and training methodology remain relevant as a baseline. GPL-3.0 license.

`View repository <https://github.com/ZhengyaoJiang/PGPortfolio>`__

TDQN: An Application of Deep Reinforcement Learning to Algorithmic Trading
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Official experimental code for the TDQN (Trading Deep Q-Network) paper by Thibaut Theate and Damien Ernst. The repository implements the complete evaluation framework described in the paper: artificial trajectory generation for data augmentation, proper temporal train/validation/test splits, statistical significance testing, and Sharpe ratio maximisation as the reward function. Tested on 30 highly-liquid stocks with transaction costs.

Our summary: this implementation is valuable not just for the TDQN algorithm but for the rigorous evaluation methodology — it is one of the few RL trading codebases that implements proper temporal validation and statistical testing out of the box. Any researcher building an RL trading system should use this evaluation framework as a minimum standard. 214 stars, Python.

`View repository <https://github.com/ThibautTheate/An-Application-of-Deep-Reinforcement-Learning-to-Algorithmic-Trading>`__

A Tutorial on Thompson Sampling
-------------------------------

This monograph by Daniel Russo, Benjamin Van Roy, Abbas Kazerouni, Ian Osband and Zheng Wen ("A Tutorial on Thompson Sampling," *Foundations and Trends in Machine Learning* 11(1):1-96, 2018; arXiv:1707.02038) is the standard reference for Thompson sampling — the Bayesian algorithm for online sequential decision-making that underlies the multi-armed-bandit framing of strategy selection and capital allocation. Thompson sampling maintains a posterior over each action's payoff and, at each step, samples once from each posterior and plays the best sampled arm, which automatically balances exploiting what is currently known against exploring to gather information. The tutorial covers the core algorithm, why it works, and practical approximate posterior-sampling methods (Laplace approximation, MCMC, and the bootstrap) for the non-conjugate cases that arise in practice.

Our summary: for a systematic trader this is the entry point to treating "which of my strategies should get capital right now?" as a bandit problem. Rather than hard-switching on recent performance, Thompson sampling allocates in proportion to the posterior probability that each strategy is best — naturally exploring uncertain-but-promising strategies while concentrating on proven ones, and gracefully handling non-stationarity. Note the tutorial itself is general (it does not cover trading); the trading/allocation application is developed in companion work such as Zhu et al. (2019) below. Read this for the mechanism and the approximate-sampling toolbox, then adapt the reward model to your P&L.

Data and code: a tutorial monograph with worked examples (news recommendation, shortest path, etc.); accompanying code is referenced in the text. No trading data.

Key metrics: not applicable — a methods tutorial. Its value is the algorithm, the regret intuition, and the practical posterior-approximation recipes.

`Read the paper <https://arxiv.org/abs/1707.02038>`__

Adaptive Portfolio by Solving Multi-armed Bandit via Thompson Sampling
----------------------------------------------------------------------

This paper by Mengying Zhu, Xiaolin Zheng, Yan Wang, Yuyuan Li and Qianqiao Liang (2019, arXiv:1911.05309; IJCAI) applies Thompson sampling directly to portfolio selection by framing classic allocation strategies as the arms of a multi-armed bandit. Because Markowitz mean-variance optimization is fragile to parameter estimation and naive baselines (equal-weight, value-weight) sometimes win in particular periods, the authors treat several classic strategies as "strategic arms" and use Thompson sampling to choose among them online, maximizing reward through the exploration-exploitation trade-off. They add a reward function parameterized by the investor's risk preference so the same machinery adapts to different investment styles.

Our summary: this is the practitioner-facing complement to the Russo et al. tutorial — a concrete instance of Bayesian-bandit capital allocation *across strategies* rather than across assets. The "strategies-as-arms" design is exactly the pattern a systematic desk wants: stop trying to forecast which model is best and instead let posterior sampling rotate capital toward whichever strategic arm is currently winning, adapting as regimes shift. The evaluation is on equity-market datasets rather than crypto, so treat it as a transferable template; whether Bayesian-bandit allocation beats simpler heuristics (equal-weight, momentum-of-strategies) on live crypto books is still an open question worth testing.

Data and code: experiments on representative real-world equity-market datasets; no public code released.

Key metrics: the authors report superiority of the Thompson-sampling portfolio strategy across multiple real-world datasets on a range of evaluation criteria (return and risk-adjusted measures) versus classic single-strategy baselines; specific Sharpe/return tables are dataset-dependent and reported in the paper.

`Read the paper <https://arxiv.org/abs/1911.05309>`__
