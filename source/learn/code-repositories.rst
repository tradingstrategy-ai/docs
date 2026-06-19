.. meta::
   :description: Curated code repositories, examples, tools, and reproducible projects.

Code repositories
~~~~~~~~~~~~~~~~~

This section contains curated code repositories for learning, research, and practical development. These may include reusable libraries, example projects, notebooks, research implementations, developer tools, datasets with code, and reproducible experiments.

Entries focus on what the repository is useful for, what is included, how practical it is to run, and whether examples, data, licensing, or maintenance signals are available.

HARNet
------

TensorFlow implementation of HARNet, the convolutional neural-network extension of the heterogeneous autoregressive realized-volatility model from Reisenhofer, Bayer, and Hautsch. It is the official codebase for reproducing and extending the HARNet paper.

Our summary: this is the best starting point for HARNet work because it contains the core model package, preset experiment configurations, and a sample Oxford-Man realized-volatility dataset. The useful detail is that the repository does not only expose HARNet runs: it also includes HAR, HARSVJ, and HARNetSVJ configurations with receptive fields of 20 and 80, plus MAE, MSE, and QLIKE loss variants, so it is well suited for baseline comparisons.

Practical details: primary language Python with shell scripts; install with ``pip install -e HARNet/`` after cloning, then run examples such as ``harnet ./configs/RV/RecField_20/HAR20_OLS.in`` or ``harnet ./configs/RV/RecField_20/QLIKE/HARNet20_QLIKE_OLS.in`` from the repository root. The repo includes ``run_all.sh``, TensorBoard/result output support, ``data/MAN_data.csv`` from Oxford-Man, an MIT license, and visible maintenance signals of 28 stars, 5 forks, no open issues, and last push on 2023-07-16.

`View repository <https://github.com/mdsunivie/HARNet>`__

HAR-RV
------

Notebook implementation of a simple heterogeneous autoregressive realized-volatility model for forecasting SPY realized volatility. The notebook uses daily, weekly, and monthly realized-volatility components, plus VIX and SPY volume, to build a readable HAR-RV baseline.

Our summary: this is not HARNet, but it is a useful bridge for readers who want to understand the classic HAR baseline before moving to convolutional HARNet variants. Its value is pedagogical and compact: one Jupyter notebook shows the model-building workflow rather than presenting a reusable package.

Practical details: primary language Jupyter Notebook; the repository contains ``HAR-RV_forecast.ipynb`` and a short README. No license file is detected, so reuse terms are unclear. GitHub reports 22 stars, 22 forks, no open issues, and last push on 2020-06-22.

`View repository <https://github.com/deep-hedger-Peng/HAR-RV>`__

qlikeHAR Replications
---------------------

R replication package for "Coherent Forecasting of Realized Volatility" by M. Puke and K. Schweikert. The repository supports figures and experiments around QLIKE-HAR forecasting and coherent realized-volatility forecasts.

Our summary: this is highly relevant context for HARNet users because the HARNet paper emphasizes QLIKE as a stabilizing and performance-improving training loss. The repo is not a HARNet implementation, but it gives concrete replication material for qlikeHAR functions, simulations, data cleaning, and an empirical application on realized quantities for DJIA constituents.

Practical details: primary language R; the repository is organized into ``00_functions/``, ``01_simulations/``, ``02_data/``, and ``03_application/`` with an RStudio project file and rendered README assets. It uses CAPIRE realized-quantity data from the Universita degli Studi di Padova data repository, carries an MIT license, has no open issues, and was last pushed on 2026-02-11.

`View repository <https://github.com/marius-cp/qlikeHAR_replications>`__

SpotV2Net
---------

Codebase for "SpotV2Net: Multivariate Intraday Spot Volatility Forecasting via Vol-of-Vol-Informed Graph Attention Networks" by Alessio Brini and Giacomo Toscano. It focuses on multivariate intraday spot-volatility forecasting with graph neural networks and related baselines.

Our summary: this is the strongest adjacent repository when the goal moves from daily HARNet-style realized-volatility forecasting to intraday multivariate volatility. It includes an end-to-end numbered workflow for preprocessing TAQ data, creating matrix datasets, training SpotV2Net and LSTM models, running Optuna tuning, fitting HAR/XGBoost baselines in the results notebook, and reproducing evaluation tables and figures.

Practical details: primary language Jupyter Notebook with substantial Python scripts; dependencies listed in the README include Dask, h5py, NumPy, Optuna, pandas, scikit-learn, PyTorch, PyTorch Geometric, tqdm, and statsmodels. The workflow depends on WRDS TAQ data and a MATLAB volatility-estimation step, so it is heavier to reproduce than HARNet; the authors used an NVIDIA RTX 2080 Ti for neural-network training, while HAR and XGBoost baselines can run locally. No license file is detected, and GitHub reports one fork, no open issues, and last push on 2024-10-21.

`View repository <https://github.com/Alessiobrini/SpotV2Net>`__

Google Research TFT
-------------------

Original Google Research implementation of Temporal Fusion Transformers for interpretable multi-horizon time-series forecasting. The repository contains the reference TensorFlow code, data formatters, experiment settings, hyperparameter optimization scripts, and fixed-parameter training scripts associated with the foundational TFT paper.

Our summary: this is the canonical source for understanding the architecture as introduced by Lim, Arik, Loeff, and Pfister. It is less convenient for new finance experiments than modern PyTorch libraries, but it remains valuable when you need to check the original data abstractions, gating/attention design, and interpretability workflow.

Practical details: primary language Python inside the larger Google Research monorepo; install requirements are listed under the ``tft/`` subdirectory and the workflow is driven by scripts such as ``script_download_data.py``, ``script_hyperparam_opt.py``, and ``script_train_fixed_params.py``. License follows the Google Research repository terms. Maintenance is tied to the broader monorepo rather than a standalone TFT package.

`View repository <https://github.com/google-research/google-research/tree/master/tft>`__

PyTorch Forecasting
-------------------

PyTorch Forecasting is a high-level PyTorch and Lightning package for deep-learning time-series forecasting. It includes a production-friendly ``TemporalFusionTransformer`` implementation with ``TimeSeriesDataSet`` abstractions, quantile losses, logging, visualization helpers, hyperparameter tuning support, and tutorials.

Our summary: this is the best practical starting point for most TFT trading and volatility experiments in Python. It is mature, widely used, and much easier to adapt to financial panels than the original TensorFlow research code. The main caveat is that the package handles forecasting, not trading: users still need to build their own leakage-safe data pipeline, walk-forward evaluation, signal generation, and transaction-cost-aware backtest.

Practical details: primary language Python; install with ``pip install pytorch-forecasting`` or conda. The repository uses an MIT license and was visibly active in April 2026, with about 4.9k stars, 860 forks, and many open issues due to its broad user base.

`View repository <https://github.com/sktime/pytorch-forecasting>`__

Darts
-----

Darts is a Python library for forecasting and anomaly detection on time series. It provides a unified ``fit``/``predict`` interface across statistical models, classical machine-learning models, and deep-learning models, including Temporal Fusion Transformer support through its forecasting API.

Our summary: Darts is a good choice when you want to compare TFT against many baselines quickly. That matters in finance because TFT should be tested against simpler models before being trusted. The library also supports backtesting-style workflows and probabilistic forecasting, making it useful for volatility and risk experiments where forecast intervals matter.

Practical details: primary language Python; install with ``pip install darts``. The repository uses an Apache-2.0 license and was highly active in April 2026, with about 9.3k stars, 1.0k forks, and continuing releases. It is a general forecasting library rather than a trading framework.

`View repository <https://github.com/unit8co/darts>`__

NeuralForecast
--------------

Nixtla's NeuralForecast is a scalable neural forecasting library with a broad collection of models, including ``TFT``, NBEATS, NHITS, DeepAR, Informer, Autoformer, PatchTST, iTransformer, and other Transformer-family models. It focuses on efficient forecasting workflows with exogenous variables, probabilistic losses, and a familiar fit/predict interface.

Our summary: this is a strong modern alternative to PyTorch Forecasting and Darts when the goal is to benchmark many neural forecasters under a consistent interface. For trading research, its value is fast experimentation and baseline comparison rather than turnkey strategy construction. It is especially useful if you want to compare TFT with more recent long-horizon Transformer variants.

Practical details: primary language Python; install with ``pip install neuralforecast`` or conda. The repository uses an Apache-2.0 license and was active in April 2026, with about 4.1k stars, 487 forks, and documentation at ``nixtlaverse.nixtla.io/neuralforecast``.

`View repository <https://github.com/Nixtla/neuralforecast>`__

GARCH-TFT
---------

Companion repository for "A GARCH-Temporal Fusion Transformer Model for the Volatility Prediction of Exchange Traded Funds." The project is tied to the paper's hybrid GARCH plus TFT approach for ETF volatility forecasting.

Our summary: this is the most directly relevant repository for the GARCH-TFT volatility paper, but it should be treated cautiously. The README says the repository is intended to contain the code and data for the manuscript, and at the time checked it was still sparse. It is worth tracking because the associated paper is highly relevant, not because the repository is already a polished replication package.

Practical details: primary language Python; no license file is detected. GitHub reports 2 stars, no forks, no open issues, and last push on 2025-08-04. The repository is small and does not currently provide the same level of runnable workflow detail as HARNet or SpotV2Net.

`View repository <https://github.com/lbacco/garch-tft>`__

Stock-TFT
---------

Stock price prediction project using a Temporal Fusion Transformer. The repository includes a writeup, Python/PyTorch code, and instructions to install requirements and run ``PytorchForecasting.py``.

Our summary: this is one of the more visible stock-specific TFT example repositories and is useful as an educational implementation. It is not a production trading framework, but it gives a concrete example of applying TFT-style modeling to liquid-asset valuation forecasts and comparing the idea with more classical forecasting intuition.

Practical details: primary language is reported by GitHub as TeX because of the included writeup, with Python code in the project. The README mentions Python 3.8, PyTorch 1.10, and an MIT badge, though GitHub's license detector does not identify a license file. GitHub reports 124 stars, 35 forks, no open issues, and last push on 2023-04-04.

`View repository <https://github.com/Soham-Deshpande/Stock-TFT>`__

tft-stocks
----------

Small inference-oriented repository for stock prediction using Temporal Fusion Transformers for interpretable multi-horizon time-series forecasting.

Our summary: this is a compact stock TFT example rather than a full research or trading system. Its value is mainly as a minimal reference for inference workflow and model packaging. Because the README is very short, users should inspect the notebooks and code directly before relying on it for reproducible experiments.

Practical details: primary language Jupyter Notebook; MIT license detected by GitHub. GitHub reports 14 stars, 4 forks, no open issues, and last push on 2023-12-25.

`View repository <https://github.com/MuralidharB/tft-stocks>`__

QuantTraderDL
-------------

Educational quant and AI repository that combines Temporal Fusion Transformer index forecasting, QuantConnect strategy examples, and a reinforcement-learning trading bot component. The TFT component targets major indices such as the S&P 500, Nasdaq, IBEX 35, Dow Jones, and EURO STOXX 50.

Our summary: this repository is useful as a broad playground for connecting forecasting models with trading concepts. The TFT and DRL components are independent rather than a single integrated production system, so it is best read as educational research scaffolding. The README includes feature lists, variable descriptions, installation guidance, and reported TFT forecast results, but the trading bot is still described as work in progress.

Practical details: primary language Jupyter Notebook with supporting Python files; no license file is detected. GitHub reports 21 stars, 3 forks, no open issues, and last push on 2025-05-21. Install instructions use ``pip install -r requirements.txt`` and the README notes Python/version compatibility issues for some dependencies.

`View repository <https://github.com/MrGG14/QuantTraderDL>`__

index_fund_volatility
---------------------

Project using Temporal Fusion Transformer to forecast multi-day volatility for sector-specific ETFs. The model forecasts 5-day historical volatility over a 10-day horizon for ETFs such as XLK, XLP, XLF, XLV, XLE, XLI, and XLU, with quantile outputs for prediction intervals.

Our summary: this is a useful applied volatility example because it leans into TFT's natural strengths: multi-horizon forecasting, quantile loss, and interpretability through variable importance and attention diagnostics. It is more practical for risk forecasting than for alpha generation, and it uses Yahoo Finance daily data rather than high-frequency realized-volatility inputs.

Practical details: primary language Python; no license file is detected. The README describes Yahoo Finance as the data source, training scripts under ``training/``, Bayesian hyperparameter optimization, and an AWS Elastic Beanstalk API endpoint. GitHub reports 5 stars, 1 fork, no open issues, and last push on 2023-09-09.

`View repository <https://github.com/vladkramarov/index_fund_volatility>`__

Adaptive-TFT
------------

Notebook project titled "Adaptive Temporal Fusion Transformers for Cryptocurrency Trading: Leveraging Dynamic Subseries Lengths and Categorization." The repository contains notebooks and a PDF diagram for an adaptive TFT crypto-trading concept.

Our summary: this is an idea-oriented crypto TFT repository rather than a polished package. It is relevant because it explores dynamic subseries lengths and categorization, which are natural responses to regime changes in crypto markets. The caveat is that the repository has limited documentation and should be inspected as exploratory research material.

Practical details: primary language Jupyter Notebook; no license file is detected. Repository contents include ``Main.ipynb``, ``Based models.ipynb``, and an architecture diagram PDF. GitHub reports 6 stars, 2 forks, no open issues, and last push on 2025-08-18.

`View repository <https://github.com/arashitc2/Adaptive-TFT>`__

TFT Crypto Trading Model
------------------------

Public excerpt of the SabrBot Trading Framework focused on a Temporal Fusion Transformer crypto trading strategy. The repository generates buy/sell/hold classification signals or next-step return regression outputs from historical candlestick data, with optional Bybit data fetching.

Our summary: this is a more strategy-shaped crypto TFT example than many notebook repos because it includes an end-to-end script, feature engineering, label generation, scaling, splits, and training logic. The author is explicit that it is only a partial public excerpt: it does not include proprietary execution infrastructure or live trading components, so it should be treated as a signal-research skeleton rather than a full bot.

Practical details: primary language Python; no license file is detected. Install with ``pip install -r requirements.txt`` after creating a virtual environment. The README documents ``scripts/run_end_to_end.py`` for classification or regression modes, outputs such as ``tft_results.csv`` and checkpoints under ``artifacts/``. GitHub reports no stars, no forks, no open issues, and last push on 2026-01-28.

`View repository <https://github.com/kutpat/TFT_Crypto_Trading_Model>`__

Ethereum Price Prediction TFT
-----------------------------

Repository applying a Temporal Fusion Transformer to Ethereum price prediction. It uses 4-hour OHLCV crypto data from the Alpaca Crypto API, technical indicators, rolling volatility, RSI, moving averages, and BTC/ETH rolling correlation to generate simple buy/sell/hold trading signals.

Our summary: this is a useful cautionary example because it reports both a positive ending portfolio value and poor risk characteristics. The strategy starts with $10,000 and ends at $11,071.54, but the README reports a Sharpe ratio of only 0.0158 and maximum drawdown of -76.43%, with about 96.5% hold signals. That makes it good teaching material for why forecast-driven trading needs risk-aware evaluation.

Practical details: primary language HTML according to GitHub, with notebook and presentation artifacts described in the README. No license file is detected. Install instructions use ``pip install -r requirements.txt``. GitHub reports no stars, no forks, no open issues, and last push on 2025-05-05.

`View repository <https://github.com/Vighnesh-Raj/eth-price-prediction-tft>`__

Auto-Quant
----------

An LLM-native autonomous quant research loop that applies Andrej Karpathy's "autoresearch" pattern to FreqTrade strategy development on BTC/USDT and ETH/USDT at the 1-hour timeframe. The setup gives an LLM agent (Claude Code, Codex, Cursor, or similar) a FreqTrade backtest harness and a strategy directory. The agent modifies strategies, runs backtests, evaluates results, decides whether to keep or discard changes, and repeats — all driven by a ``program.md`` instruction file rather than a traditional orchestrator. The project is explicitly framed as a prototype to validate whether autonomous LLM research loops transfer to quantitative strategy development, with the success metric being "did the loop run and produce interpretable results," not "did we find a profitable strategy."

Our summary: the repo is well-structured with clear separation between the agent-owned workspace (``user_data/strategies/``) and the fixed evaluation contract (``config.json``, ``prepare.py``, ``run.py``). The v0.1.0 retrospective is the most interesting artifact: over 99 experiments the agent plateaued at Sharpe 1.44, and notably the agent itself identified and discarded higher-Sharpe runs as oracle-gaming (ROI-clipping that compressed return variance without improving real returns). The v0.2.0 multi-strategy design addresses the single-paradigm anchoring observed in v0.1.0 by allowing up to 3 concurrent strategies with fork/evolve/kill lifecycle rules. The ``results.tsv`` event log survives ``git reset --hard`` (gitignored), preserving institutional memory across experimental resets. Key caveats: the backtests use a single pair universe (BTC/USDT + ETH/USDT) on a single timeframe (1h), the agent runs arbitrary shell commands within the repo directory, and nothing prevents the agent from overfitting to the fixed backtest window — the retrospective acknowledges this risk but does not implement walk-forward or out-of-sample validation.

Practical details: primary language Python (73%) with Jupyter Notebook (27%) for post-hoc analysis. Requires Python 3.11+, uv, and the TA-Lib C library. Install via ``uv sync`` followed by ``uv run prepare.py`` for one-time data download. MIT license. 204 stars on GitHub, created 2026-04-22, last push 2026-04-23.

`View repository <https://github.com/TraderAlice/Auto-Quant>`__

Conditional-Skew
----------------

Autoregressive models for VIX and SPY where the noise distribution is a skewed generalized error distribution (SGED) whose scale, skewness, and tail-shape parameters vary as explicit functions of the lagged VIX level. The project progresses through four model tiers — plain AR with Gaussian residuals, AR with GED (heavy tails, no skew), AR with constant SGED (heavy tails plus skew), and AR with level-dependent SGED — and uses BIC comparisons to show that each generalisation is justified by the data. The key empirical finding is that when VIX is low the conditional distribution of log-VIX innovations has higher positive skew and heavier tails, capturing the asymmetric jump risk that standard volatility models miss.

Our summary: the repository is a focused, well-documented research tool rather than a turnkey trading system, but its findings have direct implications for algorithmic trading. First, any strategy that prices or hedges VIX derivatives, variance swaps, or tail-risk overlays needs an accurate model of how VIX innovations are distributed — this project shows that assuming fixed skew and kurtosis underestimates the probability of large upward VIX spikes when volatility is low, exactly the regime where short-vol strategies accumulate risk. Second, the level-dependent SGED framework can improve regime-aware position sizing: when the fitted model indicates high conditional skew (low VIX), a strategy can widen its upside stop or reduce short-vol exposure; when skew compresses (high VIX), mean-reversion signals become more symmetric and conventional sizing applies. Third, the SPY analysis — fitting returns and returns normalised by lagged VIX — provides a cleaner residual distribution for signal generation, which can tighten probability-based entry thresholds and improve fill assumptions in simulation. The scripts are modular and each tier builds on shared fitting utilities, making it straightforward to swap in a different state variable or asset pair. Caveats: there is no out-of-sample or walk-forward validation, the sample covers 1990–2026 without sub-period robustness checks, and the code maximises log-likelihood numerically (scipy.optimize) which can be sensitive to starting values.

Practical details: Python 100%. No formal install instructions — clone and run the scripts directly with scipy, numpy, and pandas available. Data files (``vix.csv``, ``vix_spy.csv``) are included in the repository. Six main scripts progressing from ``xxar.py`` (plain AR) through ``xar_sged_level.py`` (level-dependent SGED) and ``xvix_spy_sged.py`` (two-series VIX/SPY application). MIT license. 19 stars, single contributor (Vivek Rao), last push April 2026.

Mentioned by Vivek V Rao in `this post <https://x.com/VivekVRao1/status/2048044236537246008>`__: VIX and log(VIX) are mean-reverting AR(1) processes whose noise has positive skew and excess kurtosis, fit progressively better by Laplace, then SGED, then level-varying SGED where the shape parameters change with VIX level.

`View repository <https://github.com/vivek-v-rao/Conditional-Skew>`__

AutomataGPT
-----------

Decoder-only transformer trained to perform forward prediction and inverse rule inference for two-dimensional binary deterministic cellular automata (CA) on toroidal grids. The repository covers three tasks: predicting the next CA state given a rule matrix and initial condition, inferring the rule matrix from an initial condition and an observed future state, and approximating continuous dynamical systems (Allen-Cahn phase-field equation) with inferred CA surrogates by binarizing continuous fields. Pre-trained checkpoints and training datasets are hosted on HuggingFace at ``lamm-mit/AutomataGPT``.

Our summary: the codebase is the companion implementation for the paper `AutomataGPT: Transformer-Based Forecasting and Ruleset Inference for Two-Dimensional Cellular Automata <https://arxiv.org/abs/2506.17333>`__ (Advanced Science, Berkovich, David, and Buehler, MIT). The repo's main value is the trained checkpoints and the evaluation scripts (``evaluate_model.py`` for forward prediction, ``evaluate_inverse_model.py`` for inverse inference), which reproduce the paper's 98.5% forward accuracy and 82% exact rule-matrix matching. The ``Experiments/Exp4_PDE_to_CA_v6.ipynb`` notebook is the most scientifically interesting artifact: it shows the full Allen-Cahn frame-spacing study and the PDE-to-CA workflow where a continuous phase-field trajectory is binarized, fed to the inverse model, and the inferred CA rules are used to generate a surrogate trajectory. The architecture uses ``x-transformers`` with rotary position embeddings and flash attention. The main practical limitation for financial users is that the tokenization and rule-matrix format are specific to binary deterministic 2D CA — applying this to financial time-series data would require a significant reformulation of the input representation.

Practical details: primary language Python; conda environment files for both Windows (``AutomataGPT.yml``) and Linux (``AutomataGPT_linux.yml``). Install with ``conda env create -f AutomataGPT_linux.yml && conda activate automatagpt``, then ``git lfs pull`` to retrieve large files. Datasets (``CA_datasets/``) and checkpoints (``model_parameters/``) are gitignored locally and must be downloaded from HuggingFace separately using ``huggingface_hub.snapshot_download``. Apache 2.0 license. Repository by the lamm-mit lab (Markus J. Buehler group, MIT).

`View repository <https://github.com/lamm-mit/AutomataGPT>`__

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

Coursework Financial Risk Models
---------------------------------

Three applied coursework projects from the Quantitative Financial Risk Management course at Vrije Universiteit Amsterdam (Charles Bos, 2026). The repository covers market risk measurement, model validation, dependence modelling, and tail-risk analysis using real financial time-series data. All work is implemented in Jupyter Notebooks with accompanying PDF reports.

Our summary: a well-structured teaching repository that walks through the core quantitative risk management curriculum end to end. Each assignment builds on the previous one, progressing from standard portfolio VaR estimation through independent model review to advanced dependence and extreme-value methods. The notebooks are clearly sectioned, use real market data from Yahoo Finance, and include both the code and the written reports. The main limitation is that data files are not included in the repository (they are generated by the notebooks via yfinance downloads), no license is specified, and there is no out-of-sample or walk-forward validation. The repository is academic coursework rather than a reusable library.

**Assignment 1 — Portfolio VaR and Expected Shortfall.** The assignment constructs a multi-asset portfolio of European and US equities (ASML, Shell, JPM), indices (S&P 500, STOXX 50), EUR/USD, and a EURIBOR-linked loan, with mean-variance optimised weights on a EUR 1M notional. It estimates Value at Risk and Expected Shortfall at 95% and 99% confidence levels under five models: Normal variance-covariance, Student-t variance-covariance, Historical Simulation, CCC-GARCH(1,1) with conditional covariance matrices, and EWMA-Filtered Historical Simulation. Each model is backtested over the 2017–2026 sample with expanding-window VaR violation counts, yearly violation tables, and loss-vs-VaR time-series plots. The assignment also includes stress testing and one-step-ahead conditional risk forecasts. This is useful as a reference implementation for anyone learning to compare parametric, semi-parametric, and conditional VaR/ES approaches on a realistic multi-asset portfolio.

**Assignment 2 — Model Validation.** The assignment is a peer-review exercise: the team independently reviews and validates another group's risk model submission. The work assesses documentation quality, modelling assumptions, data handling, and numerical reproducibility. The goal is to identify where choices in cleaning, distributional assumptions, or missing documentation could affect the reliability of the risk estimates. This is useful as an example of how model validation is structured in practice — checking not just whether numbers match, but whether the modelling pipeline is transparent and robust. Only the PDF report is included (no notebook), reflecting the review-oriented nature of the task.

**Assignment 3 — PCA, Factor Analysis, Copulas, and Extreme Value Theory.** The assignment works with a 10-asset universe spanning stocks (ASML, Shell, Walmart), bond ETFs (BND, Euro government bonds), indices (AEX, S&P 500), and commodity ETFs (Gold, Oil, Iron). It covers four areas. PCA on standardised returns to extract common risk drivers and eigenvalue structure. Factor Analysis using fundamental factor-mimicking portfolios (equity, bond, commodity factors) with cross-sectional regressions on each asset, deliberately excluding the asset itself from its own factor group to avoid mechanical fit. Copula modelling with Gaussian and Student-t copulas fitted to selected asset pairs, including tail-dependence analysis and time-varying dependence diagnostics. Extreme Value Theory via Peak-over-Threshold GPD fitting to the heaviest-tailed asset, with threshold diagnostics (mean excess plots, GPD parameter stability), QQ plots, and a final comparison of EVT VaR/ES against Historical Simulation and GARCH-Student-t estimates at multiple confidence levels. This is useful as a comprehensive worked example of dependence and tail-risk methods applied to a diversified portfolio.

Practical details: primary language Jupyter Notebook with Python (numpy, pandas, scipy, matplotlib, yfinance, arch). Three assignment folders: ``A1 - Portfolio VaR and ES`` (notebook + PDF report), ``A2 - Model Validation`` (PDF report only), ``A3 - PCA/FA/Copula/EVT`` (notebook + PDF report). No license file. No included datasets (data is downloaded via yfinance). Created 2026-05-31, single contributor.

`View repository <https://github.com/Milanpeter-77/Coursework-Financial-Risk-Models>`__

.. _giotto-tda-toolkit:

giotto-tda: A Topological Data Analysis Toolkit for Machine Learning and Data Exploration
------------------------------------------------------------------------------------------

A Python library that integrates high-performance topological data analysis (TDA) with machine learning via a scikit-learn-compatible API. The library provides persistent homology computation, persistence diagrams and landscapes, Vietoris-Rips and cubical complex construction, and a plotting API for topological summaries. The C++ backend handles the computational bottleneck of persistence calculations while the Python layer exposes familiar fit/transform interfaces.

Relevant to financial applications because TDA is increasingly used for crash detection (see :ref:`tda-landscapes-of-crashes` in :doc:`./time-series`) and regime identification in multivariate return series. The scikit-learn compatibility means persistence features can be plugged directly into standard ML pipelines. Published in JMLR 22, 2021. By Tauzin, Lupo, Tunstall, Burella Pérez, Caorsi, Reise, Medina-Mardones, Dassatti, and Hess.

`View repository <https://github.com/giotto-ai/giotto-tda>`__

Volatility-Surface-Construction
--------------------------------

End-to-end implied volatility surface construction from a raw SPY options chain. The repository implements a Newton-Raphson IV solver with Brent fallback, SVI parametrisation following Gatheral (2004), arbitrage-free constraint checking (both calendar spread and butterfly), 3D surface visualisation, Greeks surfaces, and term structure modelling. The pipeline starts from 209 options across 19 strikes and 11 expiries, computes implied volatilities from scratch, fits SVI parameters per expiry slice, and produces a full suite of charts including a Bloomberg-style animated dashboard.

Our summary: a clean, self-contained teaching implementation that walks through the three structural phenomena visible in every equity vol surface — volatility skew (7D OTM put IV ~40% vs OTM call ~14%), term structure (ATM IV declining from 22% at 7 days to 17% at 365 days), and maturity-dependent smile curvature. The SVI calibration achieves RMSE below 0.001 across all 11 expiry slices with Nelder-Mead optimisation and 50 random restarts. The source modules (``bs_engine.py``, ``svi_model.py``, ``surface_analytics.py``) are well-factored and expose standard vol surface analytics — skew, risk reversal, butterfly spread — as standalone functions. Useful as a reference for anyone building vol surface infrastructure or learning derivatives pricing from first principles. The repository references Gatheral's *The Volatility Surface* (2006), Gatheral and Jacquier's arbitrage-free SVI paper (2014), and the foundational Black-Scholes, Dupire, and Heston papers.

Practical details: Python (NumPy, SciPy, Matplotlib). Five Jupyter notebooks covering IV solving, 3D surface construction, heatmaps, SVI calibration, and Greeks/term structure. Includes sample data (``options_chain.csv``, ``iv_surface.csv``, ``term_structure.csv``) and pre-rendered result charts. No license file. Created by Niraj Neupane (Quantitative Risk Analyst, MS Financial Economics, University of Wisconsin–Madison).

Mentioned by `Niraj Neupane in this LinkedIn post <https://www.linkedin.com/feed/update/urn:li:activity:7470038147985301504/>`__: walks through the three phenomena the surface encodes — skew, term structure, and smile curvature — with the specific numbers from the SPY chain, and asks what practitioners use for vol surface construction (SVI, SABR, local vol, or proprietary).

`View repository <https://github.com/nirajneupane17/Volatility-Surface-Construction>`__

Statistical Arbitrage Research Platform
---------------------------------------

A quantitative research platform for discovering, ranking, backtesting, and evaluating pairs-trading statistical arbitrage opportunities. The pipeline runs end to end: correlation screening, Engle-Granger cointegration testing, OLS hedge-ratio estimation, spread construction, ADF stationarity validation, half-life estimation, rolling z-score signal generation with entry/exit thresholds, a backtesting engine (Sharpe, max drawdown, win rate, trade logs), a composite pair-ranking score, in-sample/out-of-sample walk-forward validation, volatility-weighted multi-pair portfolio construction, grid-search parameter optimisation of z-score thresholds, and a Random Forest layer that tries to predict out-of-sample Sharpe from pair characteristics (correlation, cointegration p-value, hedge ratio, half-life, spread stats, training Sharpe/drawdown, trade count).

Our summary: a clean, self-contained teaching implementation of the full pairs-trading research workflow, with each stage broken into a focused module under ``src/`` (``cointegration.py``, ``signals.py``, ``walkforward.py``, ``optimization.py``, ``feature_engineering.py``, ``ml_model.py``, etc.) and a single ``main.py`` driver. The honest part is its handling of the ML stage: the README reports that the ML-selected portfolio (Sharpe -0.02, drawdown -29.6%) badly underperformed the research-ranked portfolio (Sharpe 2.73), and the author explicitly draws the right conclusion — that simple statistical features were insufficient to forecast future Sharpe and that out-of-sample validation matters. Caveat: the headline backtest numbers (research portfolio Sharpe 2.73, average walk-forward test Sharpe 2.76) are high for a small US large-cap equity universe and should be read as illustrative of the framework rather than evidence of a deployable edge; there is no transaction-cost or slippage modelling (both are listed under future work), and look-ahead is only guarded by signal shifting.

Practical details: Python (pandas, numpy, statsmodels, scikit-learn, matplotlib, yfinance). No documented install/run commands, but the structure is conventional — ``pip install -r requirements.txt`` then run ``src/main.py``. Ships with sample data (``data/prices.csv``), a full set of generated CSV outputs and pre-rendered plots (equity curves, drawdowns, spreads, feature importance) under ``results/``, so the outputs can be inspected without re-running. No license file. Freshly created single-author repository (June 2026) with minimal activity, so treat it as a learning reference rather than a maintained library.

`View repository <https://github.com/Frreyah20/statistical-arbitrage-research-platform>`__

jumpmodels — Statistical Jump Models in Python
----------------------------------------------

``jumpmodels`` is a Python library by Yizhan Shu (Princeton University) implementing the family of statistical jump models for unsupervised regime identification in time series. It includes the original discrete jump model (JM), the continuous jump model (CJM), and the sparse jump model (SJM) with feature selection — the reference implementation of the methods described in the :ref:`market regime papers <learning-hmm-penalizing-jumps>` by Nystrup, Kolm, Lindström, Aydınhan, Mulvey and Shu. The library follows a ``scikit-learn``-style API and works directly with ``pandas`` DataFrames.

Our summary: this is the canonical, actively published implementation of the jump-model lineage, written by a co-author of the continuous jump model paper, so it stays faithful to the published methodology. The API design is its main strength for practitioners: ``JumpModel`` and ``SparseJumpModel`` expose familiar ``.fit()``, ``.predict()``, ``.predict_proba()`` and ``.set_params()`` methods, plus ``.predict_online()`` and ``.predict_proba_online()`` for online (out-of-sample, sequential) regime inference — the latter being exactly what is needed to avoid the look-ahead bias that the underlying papers flag as their key limitation. The single discrete/continuous toggle and built-in feature-selection path mean all three model variants are reachable from one consistent interface. It is not a fork; it is the primary upstream package distributed on PyPI.

Practical details: Python (>=3.8), depends on ``numpy``, ``pandas``, ``scipy``, ``scikit-learn`` and ``matplotlib``; install with ``pip install jumpmodels`` (use ``pip install jumpmodels[example]`` to pull in ``yfinance`` and ``jupyterlab`` for the demo). A comprehensive worked example lives in ``examples/Nasdaq/example.ipynb``, analysing the Nasdaq-100 index from fully public Yahoo Finance data; the README also documents the value-factor regime application from Shu and Mulvey (2024). Plotting functions render best with a local LaTeX install but degrade gracefully without it. Apache-2.0 licensed, ~150 GitHub stars, last released January 2025, not archived.

`View repository <https://github.com/Yizhan-Oliver-Shu/jump-models>`__

Machine Learning for Trading (Stefan Jansen)
--------------------------------------------

Official companion code repository for Stefan Jansen's *Machine Learning for Trading*, now in its 3rd edition. The 3rd edition is a ground-up rebuild organised around a single end-to-end workflow — how a research idea is defined and developed iteratively into a strategy that can actually be run — spanning 27 chapters across six workflow-aligned parts: Financial Data, Research Design and Feature Engineering, Model Development, Strategy Implementation, Advanced AI, and Production. It teaches practitioners to build, test, and deploy ML-driven trading strategies across multiple asset classes, from data sourcing through live execution.

Our summary: this is one of the most comprehensive and widely used open-source resources for applied ML in trading, and the single best starting point for anyone wanting a structured, code-first path through the whole quant ML pipeline rather than isolated techniques. The breadth is the headline: Part I covers the financial data universe, NASDAQ ITCH market microstructure and limit order books, SEC EDGAR fundamental/alternative data, and synthetic data generation (TimeGAN, Tail-GAN, Sig-CWGAN, diffusion); Part III covers regularised linear models, gradient boosting (XGBoost, LightGBM, CatBoost), newer tabular models (TabPFN, TabM), deep time-series architectures (LSTM, N-BEATS, Transformers, PatchTST, iTransformer, TSMixer, TCN, Mamba), latent-factor/autoencoder models, and causal ML (Double ML, Bayesian structural time series, causal discovery); Part IV adds full chapters on transaction costs and risk management (VaR/CVaR, drawdown controls, deep hedging) plus backtesting with overfitting controls such as the Deflated Sharpe Ratio; Part V covers reinforcement learning for execution/hedging, RAG over SEC filings, knowledge graphs/Graph RAG, and autonomous multi-agent research systems (ReAct, LangGraph, Claude SDK). Nine case studies (ETFs, crypto perps, NASDAQ-100 intraday, S&P 500 equity+options, US firm characteristics, FX pairs, CME futures, S&P 500 options, US equities) are carried through the same pipeline. The main caveat is scope: the repository is a teaching and research codebase that emphasises methodological rigour (walk-forward validation, multiple-testing control, conformal prediction) rather than a turnkey production trading system, and reproducing the heavier deep-learning and alternative-data chapters requires real compute and data access.

Practical details: primary language Python (Jupyter notebooks plus library code), with PyTorch, LightGBM, Optuna, Polars, and Plotly across the modelling and data stack; every chapter ships in reproducible Docker environments. Data spans 19+ providers behind a unified ``ml4t-data`` interface, NASDAQ ITCH, SEC EDGAR, on-chain crypto, and prediction-market sources, with storage formats including Parquet, DuckDB, and TimescaleDB. The book is supported by six production Python libraries (``ml4t-data``, ``ml4t-engineer``, ``ml4t-models``, ``ml4t-diagnostic``, ``ml4t-backtest``, ``ml4t-live``) and a companion website at ml4trading.io with concept primers and reusable agent skills. Code is MIT licensed (book content © 2026 Stefan Jansen, all rights reserved). Maintenance signals are strong: about 19.2k stars, 5.3k forks, no open issues, created 2018-05-09, and last pushed 2026-06-19; not archived, not a fork.

`View repository <https://github.com/stefan-jansen/machine-learning-for-trading>`__
