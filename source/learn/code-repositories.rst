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
