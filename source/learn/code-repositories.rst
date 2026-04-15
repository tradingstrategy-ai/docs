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
