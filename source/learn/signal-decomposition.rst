.. meta::
   :description: Signal decomposition methods for financial time series forecasting including VMD, CEEMDAN, EMD, EEMD, and Empirical Wavelet Transform.

Signal Decomposition
~~~~~~~~~~~~~~~~~~~~

Signal decomposition methods — primarily Variational Mode Decomposition (VMD) and its relatives CEEMDAN, EMD, and EEMD — have become one of the most active research areas in financial time series prediction. These techniques decompose non-stationary price and volatility series into a set of band-limited components (Intrinsic Mode Functions or IMFs) that are individually more stationary and easier to forecast than the raw series. The decompose-predict-reconstruct paradigm consistently outperforms direct forecasting approaches across equities, cryptocurrencies, commodities, and foreign exchange markets.

The papers collected here cover the full pipeline: VMD and CEEMDAN applied to stock price prediction, volatility forecasting (including VIX, realized volatility, and GARCH hybrids), crude oil and energy futures, foreign exchange rates, and cryptocurrency price prediction. A key methodological concern addressed by several papers is temporal leakage — decomposing the entire dataset before train/test splitting inadvertently allows future information into the model. The collection includes critical papers exposing this problem and proposing sliding-window solutions. Sub-topics include parameter optimization (genetic algorithms, whale optimization, particle swarm), multi-step forecasting, probabilistic interval prediction, and multivariate VMD for joint decomposition of multiple assets.

Related topics include :doc:`Time Series Forecasting <./time-series>` for foundational ARIMA/cointegration methods, :doc:`Volatility Modeling <./volatility>` for GARCH-family approaches, and :doc:`Machine Learning <./machine-learning>` for general deep learning methods applied to trading without the decomposition preprocessing step.

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

`Read the paper <https://arxiv.org/abs /1907.04509>`__

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

Jiang-Cheng Li, You-Cheng Wang, Bin Gui and Guang-Yan Zhong (Yunnan University of Finance and Economics; SSRN preprint, 2026) build a two-part decision-support system: a hybrid forecasting model, GA-VMD-C-LSTM, and a trading application on top of it. A genetic algorithm searches the VMD parameters — the mode count *K*, the bandwidth penalty *α*, and, unusually, the update step *τ*, which the authors note is routinely neglected — and the resulting components feed an LSTM with convolutional layers. A grid search then fixes the baseline hyperparameters, and comparative experiments vary the number of convolutional layers. Crucially, evaluation is **walk-forward** across six consecutive annual windows, and the forecasts are converted into positions by a threshold-based timing rule.

Our summary: the methodology deserves attention more than the numbers. Walk-forward validation with per-window re-estimation is rare in the VMD literature — most papers in this collection decompose once over the full series and use a simple split, which is exactly the leakage failure documented in the caveat entries on this page. Re-decomposing within each window is what makes the reported trading result worth reading at all. The threshold-based trading layer is the other good practice: it closes the gap between error metrics and profitability that most decomposition papers leave open, and the paper reports Sharpe and maximum drawdown rather than stopping at RMSE. Two cautions. The evaluation window (2019–2025) contains a long CSI 300 drawdown in which buy-and-hold earned 2.11% annualised, so a long/flat timing rule clears a very low bar; and the six model configurations span 19.01% to 29.94% annualised, meaning configuration choice moves the result by more than the gap between the median configuration and the benchmark. Treat the best cell as an upper bound rather than an expectation.

Data and reproduction: the CSI 300 Index closing price, 11 April 2005 to 22 August 2025, 4,952 daily observations, with closing price as the sole input feature. Walk-forward evaluation runs six annual windows from 22 August 2019 to 22 August 2025. Sample entropy uses a tolerance of r = 0.25 × standard deviation. No code release accompanies the preprint, and it is explicitly marked as not yet peer reviewed.

Key metrics: against the best-performing benchmark model, MAE falls 46.72% and RMSE falls 44.63%. On the trading side, buy-and-hold over the concatenated evaluation windows returns 2.11% annualised with a Sharpe of 0.2042 and a maximum drawdown of −46.66%. The model-driven strategies return between 19.01% and 29.94% annualised, with Sharpe ratios of 0.9567 to 1.4072 and drawdowns of −21.43% to −23.06% — so the drawdown roughly halves across every configuration, which is a more robust finding than the return spread. Individual buy-and-hold years range from +29.98% to −13.86%, confirming the benchmark's weakness over this particular window.

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

How Hedge Funds Use The Kalman Filter To Read Hidden Markets In Real Time
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A practical breakdown of how hedge funds use the Kalman Filter to estimate hidden market states in real time. The article presents the Kalman Filter as a recursive Bayesian state-space model that infers unobservable market variables — such as true asset value, latent momentum, or regime state — from noisy price observations. Unlike static regression or moving average approaches, the Kalman Filter dynamically updates its estimates as each new data point arrives, making it well-suited for real-time trading systems where market conditions shift continuously.

The article shares an implementable quant framework for applying the Kalman Filter to trading, covering the predict-update cycle, state transition and observation models, and how to calibrate noise covariance parameters for financial data. This connects to the broader signal decomposition literature: the Kalman Filter can be viewed as optimally separating signal (true state) from noise in a sequential filtering framework, complementing frequency-domain decomposition methods like VMD and EMD covered elsewhere in this collection.

Mentioned by `Phosphen (@phosphenq) <https://x.com/phosphenq/status/2056438562451513660>`__ on X.

`Read the article <https://x.com/i/article/2056414759554015232>`__

Multiresolution Forecasting for Futures Trading Using Wavelet Decompositions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zhang, Coggins, Jabri, Dersch and Flower (IEEE Transactions on Neural Networks, 2001) investigate a financial time-series forecasting strategy that exploits the multiresolution property of the wavelet transform. A financial series is decomposed into an overcomplete, shift-invariant, scale-related representation, and in transform space each individual wavelet series is modelled by a separate multilayer perceptron (MLP). The Bayesian method of automatic relevance determination is used to choose short past windows (short-term history) as inputs to the MLPs at lower scales and long past windows (long-term history) at higher scales.

Our summary: this is the foundational "one model per scale" template for wavelet-based algotrading — decompose, forecast each frequency band independently, then recombine. The individual forecasts are recombined either by the linear reconstruction property of the inverse transform (with the chosen autocorrelation-shell representation) or by a second perceptron that learns the weight of each scale in predicting the original series. Crucially, the forecasts are then passed to a money-management system to generate actual trades, making this one of the earliest end-to-end multiscale-to-execution designs rather than a pure forecast-error study.

Data and reproduction: futures price series; the paper predates public code release (IEEE TNN, 2001). Full text obtained via DOI 10.1109/72.935090.

`Read the paper <https://pubmed.ncbi.nlm.nih.gov/18249912/>`__

A Learning-Based Contrarian Trading Strategy via a Dual-Classifier Model
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Szu-Hao Huang and Shang-Hong Lai (National Tsing Hua University) with Shih-Hsien Tai (Cathay United Bank; *ACM Transactions on Intelligent Systems and Technology*, 2011) attack the weak point of classical contrarian trading — that the loser portfolio contains both genuine overreactions and stocks that are falling for good reason. Rather than replacing the contrarian rule, they add a learned filter on top of it: a dual-classifier framework that selects which candidates from the raw De Bondt-Thaler style winner and loser portfolios actually belong in the refined portfolio. Each candidate is represented in a **381-dimensional** feature space built from three sources — wavelet-transform coefficients, historical return-distribution statistics, and conventional technical indicators — and classified with AdaBoost and support vector machines across four learning kernels.

Our summary: this is the earliest entry in the collection using wavelet coefficients as *features alongside* ordinary signals rather than as a denoised price to trade directly, and that framing has aged far better than the denoise-then-forecast designs of the same era. The architecture is also a useful pattern in its own right: keep a well-understood economic rule as the candidate generator and use machine learning only for selection, so the model never has to discover the anomaly from scratch — it only has to rank within it. The reported improvement is large, but the honest reading is that selection accuracy rising from 57.47% to 66.41% is the primary result and the return figure follows from it; a near-nine-point gain in a binary classification that starts barely above a coin flip is a big relative move but leaves substantial residual error. Note also that the paper reports gross returns over an era of higher trading costs, and that the three-year holding period means the 195 overlapping test windows are heavily autocorrelated, so the effective sample is much smaller than the count suggests.

Data and reproduction: constituent stocks of the **S&P 100**, with monthly returns spanning January 1989 to March 2005 and 195 overlapping three-year test windows. Training uses a six-year block (the first sample runs January 1990 to January 1996) with investment decisions made at the start of the following period. The 381 features and the four kernels are specified in the paper; no code or data release accompanies it, and the published version is behind the ACM paywall (this entry is written from the retrieved PDF).

Key metrics: the three-year return improves from **26.79% to 53.75%** and portfolio selection accuracy from **57.47% to 66.41%** relative to the unfiltered contrarian strategy. For context the paper reports a comparable three-year benchmark of 15.16% for the base strategy setting against 15.07% for three-year US Treasuries. Returns are gross of transaction costs, and no Sharpe ratio, drawdown or turnover figures are reported — a material omission for a strategy that rebalances a filtered long-short book.

`Read the paper <https://scholar.nycu.edu.tw/en/publications/a-learning-based-contrarian-trading-strategy-via-a-dual-classifie/>`__

Forecasting East Asian Indices Futures via a Novel Hybrid of Wavelet-PCA Denoising and ANN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jacinta Chan Phooi M'ng and Mohammadali Mehralizadeh (PLoS ONE, 2016) combine wavelet decomposition, principal component analysis (PCA), and an artificial neural network into a hybrid forecasting model (WPCA-NN). The key idea is an enhanced denoising process that treats the open-high-low-close data as a multivariate signal and removes common noise across the four channels before forecasting, rather than denoising each series in isolation.

Our summary: this is one of the stronger papers in the wavelet-trading literature precisely because it evaluates trading profitability and abnormal returns, not merely forecast error. Applied to Hong Kong's Hang Seng, Japan's NIKKEI 225, Singapore's MSCI, South Korea's KOSPI 200, and Taiwan's TAIEX index futures over 2005-2014, and using a panel of technical indicators (RSI, MACD, MACD Signal, Stochastic Fast %K, Stochastic Slow %K, Stochastic %D, Ultimate Oscillator), the model's annual mean returns exceed a threshold buy-and-hold across validation, test, and evaluation periods — evidence against the random-walk hypothesis and consistent with the technical-analysis literature.

Data and reproduction: five East Asian index-futures series, 2005-2014; open-access paper (DOI 10.1371/journal.pone.0156338). Key metrics: WPCA-NN annual mean returns exceed threshold buy-and-hold in all out-of-sample windows.

`Read the paper <https://pubmed.ncbi.nlm.nih.gov/27248692/>`__

Discrete Wavelet Transform-Based Prediction of the National Stock Exchange Fifty Index
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dhanya Jothimani, Ravi Shankar and Surendra S. Yadav (2016) propose a hybrid approach integrating a decomposition model — the Maximal Overlap Discrete Wavelet Transform (MODWT) — with machine-learning models (ANN and SVR) to predict India's National Stock Exchange Fifty (Nifty 50) index. In the first phase the series is decomposed into a smaller number of subseries via MODWT; in the second phase each subseries is predicted with ANN or SVR; the predicted subseries are then aggregated into the final forecast.

Our summary: MODWT is the attractive decomposition choice here because, unlike the ordinary DWT, it does not downsample and keeps coefficients aligned to timestamps, which makes it well-suited for feature engineering on financial series. The paper's headline practical result is a trading evaluation, not just an accuracy comparison: the return on investment from trading rules built on the MODWT-SVR forecasts exceeded a buy-and-hold strategy, and MODWT-ANN/MODWT-SVR outperformed plain ANN and SVR.

Data and reproduction: NSE Fifty (Nifty 50) index series; arXiv preprint 1605.07278. Key metric: MODWT-SVR trading-rule ROI > buy-and-hold.

`Read the paper <https://arxiv.org/abs/1605.07278>`__

Combining Wavelet Decomposition with Machine Learning to Forecast Gold Returns
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Marian Risse (Helmut Schmidt University; *International Journal of Forecasting* 35, 601–615, 2019) combines the discrete wavelet transform with support vector regression to forecast monthly gold returns. Nine economic and financial predictors — CPI, the trade-weighted dollar index, T-bond yield, the term spread, the S&P 500, the GSCI and CRB commodity indices, central-bank reserves and volatility — are each decomposed into six wavelet details (D1–D6) plus a smooth (S6), turning nine series into 63 scale-specific predictors that feed an SVR. Performance is judged two ways: a statistical out-of-sample R² against the historical mean, and an economically motivated trading rule in which a mean-variance investor reallocates between gold and the risk-free asset each month using the forecast.

Our summary: this is the cleanest evidence in the collection that the decomposition, not the learner, is what earns the money. Plain SVR on the raw predictors adds 0.25 to the Sharpe ratio over the historical-mean benchmark; the identical SVR fed wavelet-decomposed predictors adds 0.45, and it is the only one of seven models to beat the benchmark significantly at the 1% level. Both the statistical and economic gains survive against OLS, equal-weighted OLS, LASSO, boosting and random forest, so the result is not an artefact of one weak baseline. The second finding is the one with design consequences: the relative importance of fast details (D1–D3) versus slow details (D4–D6) and the smooth is *not stable* across the evaluation period, which is a direct argument for rolling re-estimation rather than a single fixed decomposition depth chosen once. A useful implementation note buried in the footnotes — adding even one extra lag expands the predictor space by another 63 columns and causes an enormous performance drop, so the scale expansion is only affordable if the base predictor set stays small.

Data and reproduction: nine standard macro-financial predictors, monthly, with an evaluation window of January 1992 to December 2016 and a separately reported crisis period of October 2007 to March 2013. Because series such as CPI are revised, the author is careful to call this pseudo real-time rather than true real-time. The wavelet step uses six decomposition levels; the SVR hyperparameters are given in the table notes. No code release accompanies the paper, but every input is public and the construction is fully specified.

Key metrics: over the full sample, using all predictors jointly, DWT-SVR delivers out-of-sample R² of 0.93% (significant at 5%), ΔCER 5.28, ΔTW 5.77 and ΔSharpe 0.45 (1% significance), against buy-and-hold at ΔCER 2.02, ΔTW 1.82, ΔSharpe 0.24 and plain SVR at 0.67% / 2.30 / 2.29 / 0.25. Every non-wavelet alternative is weaker: OLS 0.20, OLS-EW 0.23, LASSO 0.23, boosting 0.08, random forest 0.14 on ΔSharpe. In the crisis period DWT-SVR remains the only model with a significant ΔSharpe (0.16 at 1%), though buy-and-hold's raw 0.25 is higher — gold rallied through that window. Among single predictors the strongest wavelet-decomposed case is the GSCI commodity index (ΔSharpe 0.59). Terminal wealth for passive gold over the full sample is 2.14 units from a starting unit.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0169207019300020>`__

Learning to Trade in Financial Time Series Using Wavelet Transformation and Deep Reinforcement Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jimin Lee (Ewha Womans University), Hayeong Koh and Hi Jun Choe (Yonsei University; *Applied Intelligence*, 2021) decompose index price series with a Haar wavelet, discard the low-frequency part, and feed **only the high-frequency mother-wavelet coefficients** into an LSTM-based deep Q-network that outputs buy/hold/sell actions directly. The architecture is deliberately model-free: no price forecast is produced at any stage, and the policy is trained on realised trading rewards. Six variants are compared — high-frequency-only versus full-decomposition versus raw input, each with an LSTM or an RNN core — plus buy-and-hold, across the S&P 500, DJI and KOSPI 200.

Our summary: the interesting claim here is the ablation rather than the headline. Feeding the agent *only* high-frequency coefficients (HW LSTM RL) beats feeding it both high and low frequencies (W LSTM RL) on every index, and both beat the undecomposed input — which is the opposite of the low-frequency-wins pattern found in the gold-returns, HAR-wavelet and L1-filter entries elsewhere in this collection. The reconciliation is that those studies forecast a *level or direction* over a horizon, where slow components carry the signal, whereas an RL policy is choosing when to act, and the actionable variation lives in the fast band. Read the two findings as complementary rather than contradictory: decompose, then match the band to the decision being made. Two caveats temper the result. The gain is concentrated in volatile markets and in specific years — buy-and-hold beats the proposed structure outright in three of twelve KOSPI years — and the input dimensionality differs across variants (16 versus 23 versus 9), so the comparison is not a clean like-for-like ablation of the wavelet step alone. Transaction costs are modelled, at 0.05% per trade, which is more than most papers in this branch do.

Data and reproduction: S&P 500, DJI and KOSPI 200 daily index data evaluated on rolling 30-month training / 12-month test splits across twelve consecutive years, plus a separate seven-year-training configuration. The wavelet is Haar, chosen because its instantaneous jumps match the shape of price series. Training runs 500 epochs with a three-dimensional output layer; transaction cost is 0.05%. No code release is advertised, and the paper's full text sits behind the Springer paywall (this entry is written from the retrieved PDF).

Key metrics: on the S&P 500 the proposed HW LSTM RL averages a Sharpe ratio of 0.8827 across the twelve annual test windows, against 0.7449 for HW RNN RL, 0.7366 for plain LSTM RL, 0.7090 for W LSTM RL and 0.6935 for buy-and-hold. On the DJI it averages 1.0548 versus 0.8581 for the runner-up. Year-by-year dispersion is wide — from −0.4228 (Year 2) to 2.5242 (Year 11) on the S&P 500 — and buy-and-hold wins in individual years, so the edge is an average across regimes rather than a consistent per-year advantage. No drawdown, turnover or win-rate figures are reported.

`Read the paper <https://doi.org/10.1007/s10489-021-02218-4>`__

Financial Trading with Feature Preprocessing and Recurrent Reinforcement Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Lin Li (2021) trades financial assets automatically using feature-preprocessing techniques together with a Recurrent Reinforcement Learning (RRL) algorithm. Technical indicators extracted from market data are preprocessed by Principal Component Analysis (PCA) and the Discrete Wavelet Transform (DWT) and then fed into the RRL agent to make trading decisions.

Our summary: this paper is a clean baseline for the exact question a practitioner should ask before adopting wavelets — does DWT add value *beyond* technical indicators and PCA? Because the pipeline is technical-indicators → PCA/DWT → RRL, it isolates the marginal contribution of wavelet preprocessing. The reported evidence is that the preprocessing makes the RRL strategy more effective and robust and mitigates drawbacks of trading with RRL alone, which supports wavelets as a denoising/feature step rather than as a standalone signal.

Data and reproduction: asset market data with technical indicators; arXiv preprint 2109.05283.

`Read the paper <https://arxiv.org/abs/2109.05283>`__

Wavelet Denoised-ResNet CNN and LightGBM Method to Predict Forex Rate of Change
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yiqi Zhao and Matloob Khushi (2021) propose a Wavelet Denoised-ResNet with LightGBM model to predict the Forex rate of change five intervals into the future — far enough ahead to leave time to execute trades. All prices are denoised by wavelet transform; a matrix of 30 time intervals is built from technical indicators, image features are extracted by feeding that matrix into a ResNet, and the technical indicators plus ResNet image features are finally fed to LightGBM.

Our summary: this is a good example of a hybrid tree/deep-feature architecture — a CNN (ResNet) to learn representations from a wavelet-denoised indicator matrix, and a gradient-boosted tree (LightGBM) as the predictor on top. It supports the pattern of combining deep feature extraction with tree-based prediction, though it reports forecasting errors rather than a full execution-grade backtest with costs, so the "window of opportunity for algorithmic trading" claim is a forecasting result rather than a demonstrated net-of-cost strategy.

Data and reproduction: 5-minute USDJPY; code available from the authors (mkhushi.github.io). Key metrics: prediction 25 minutes ahead with MAE 0.240977e-3, MSE 0.156e-6, RMSE 0.395185e-3, outperforming baseline models.

`Read the paper <https://arxiv.org/abs/2102.04861>`__

WaveLSFormer: A Learnable Wavelet Transformer for Long-Short Equity Trading
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Shuozhe Li, Du Cheng and Leqi Liu (2026) propose WaveLSFormer, a learnable wavelet-based long-short Transformer that jointly performs multi-scale decomposition and return-oriented decision learning. Unlike standard forecasting that optimises prediction error and needs a separate position-sizing step, the model directly outputs a market-neutral long/short portfolio and is trained end-to-end on a trading objective with risk-aware regularization. A learnable wavelet front-end generates low- and high-frequency components via an end-to-end trained filter bank guided by spectral regularizers, and a low-guided high-frequency injection (LGHI) module refines low-frequency representations with high-frequency cues while controlling training stability; the output portfolio is rescaled to satisfy a fixed risk budget.

Our summary: this is the most promising current direction in the collection — instead of picking a fixed wavelet family and level a priori, the model *learns* the filter bank (the scales) end-to-end, optimised directly for risk-adjusted return rather than reconstruction or forecast accuracy. The end-to-end trading objective and explicit risk budgeting are exactly what earlier forecast-error studies lacked; the caveat is that, as a recent preprint, its edge still needs independent, cost-aware replication before being taken at face value.

Data and reproduction: five years of hourly data across related equities; arXiv preprint 2601.13435. Objective: risk-adjusted long-short return with spectral and risk-aware regularization.

`Read the paper <https://arxiv.org/abs/2601.13435>`__

.. _boundary-problem-data-leakage:

Boundary Problem and Data Leakage: A Caveat for Wavelet-Based Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ryo Hasumi and Yuto Kajita (2018) issue an essential methodological warning for the entire wavelet-forecasting literature: naive application of the wavelet decomposition to a time series easily produces data leakage. Standard full-sample wavelet denoising uses observations near the endpoint that include future information (the boundary problem), so backtests that decompose the whole series once, then split into train and test, silently leak the future into the past and report extremely — and spuriously — high precision.

Our summary: this is the single most important caveat to read before trusting any wavelet-trading result, including several of the papers catalogued above. The authors note that many wavelet-forecasting papers do not disclose enough about how the series was processed to rule out leakage. The practical remedy is strictly past-only (one-sided) denoising: recompute every wavelet feature at time *t* using only data through *t*, select the wavelet family, level and threshold inside each training fold, walk forward, and report net Sharpe, turnover, drawdown and cost sensitivity rather than RMSE or directional accuracy alone.

Data and reproduction: methodological/working paper; full text hosted on ResearchGate (Cloudflare-protected, not machine-downloadable).

`Read the paper <https://www.researchgate.net/publication/329443818_Boundary_problem_and_data_leakage_A_caveat_for_wavelet-based_forecasting>`__

Strictly Chronological CNN Embeddings with Gradient-Boosted Trees for Next-Day Log-Return Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zezhi Bao, Xiaofei Li, Menghuan Shi, Yueen Huang and Junjie Du (Symmetry, 2026) tackle one-step-ahead daily log-return prediction under low signal-to-noise, heavy-tailed innovations and distribution drift. They propose a CNN-LightGBM hybrid that transfers a last-step CNN embedding to a gradient-boosted tree regressor through explicit embedding standardization, and reduce train-to-evaluation mismatch with split-wise, training-only standardization and a recency-aware "fit-latest-W" rule.

Our summary: this paper is the concrete, leakage-aware answer to the boundary-problem caveat above — its return-related predictors are anchored on a *one-sided* (strictly past-only) wavelet-denoised close series, while other market channels are kept in raw form to preserve episodic extremes, and it evaluates with walk-forward model selection. That discipline is exactly what a credible wavelet backtest requires. On NIFTY50 it shows statistically reliable accuracy gains over a Naive0 benchmark and competitive performance against deep sequence baselines, with supplementary out-of-sample evidence on HDFC and INDA, and a long-or-cash decision rule that yields positive returns.

Data and reproduction: NIFTY50 (plus HDFC and INDA) daily data with walk-forward selection; open-access (DOI 10.3390/sym18030416). Key result: statistically reliable accuracy gains over Naive0 and a positive long-or-cash trading rule under a strictly chronological protocol.

`Read the paper <https://www.mdpi.com/2073-8994/18/3/416>`__

Multilevel Wavelet Decomposition Network for Interpretable Time Series Analysis (mWDN)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wang, Wang, Li and Wu (KDD 2018) embed a multilevel discrete wavelet decomposition *inside* a neural network so that all filter parameters are fine-tuned by backpropagation while the layers retain their wavelet frequency semantics. Two downstream heads are built on the decomposition: a Residual Classification Flow for classification and a multi-frequency LSTM for forecasting, evaluated across 40 UCR datasets plus a real user-volume dataset.

Our summary: this is the original learnable-wavelet paper and the direct ancestor of the whole "learnable filter bank" line that culminates in WaveLSFormer (A5 above). Because it keeps the wavelet structure but lets the filters adapt, it is also the cleanest baseline for the fixed-versus-learned ablation — the question of whether learning the basis actually beats a standard wavelet. Note that mWDN as published applies the transform inside the network without an explicit causal/boundary discipline, so a live trading port must add per-bar recomputation.

`Read the paper <https://arxiv.org/abs/1806.08946>`__

W-Transformers: A Wavelet-Based Transformer Framework for Univariate Time Series Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sasal, Chakraborty and Hadid (2022) apply the Maximal Overlap Discrete Wavelet Transform (MODWT) and train local Transformer encoders on each decomposed level, explicitly targeting non-stationarity and long-range non-linear dependence in univariate series.

Our summary: the notable design choice is the deliberate use of MODWT — shift-invariant and without downsampling — which is exactly the right transform for a rolling or live pipeline where coefficients must stay aligned to timestamps. It is a citable precedent for pairing a scale decomposition with per-band sequence models rather than one monolithic model on the raw series.

`Read the paper <https://arxiv.org/abs/2209.03945>`__

WFTNet: Exploiting Global and Local Periodicity in Long-Term Time Series Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Liu et al. (arXiv 2023; ICASSP 2024) combine the Fourier transform (for global periodicity) and the continuous wavelet transform (for local frequency structure) inside WFTBlocks that lift a 1D series into a 2D representation, with a Periodicity-Weighted Coefficient balancing the global and local contributions.

Our summary: this directly addresses the standard complaint that Fourier captures global cycles but misses locally-stable structure — a relevant limitation when crypto periodicity (funding cadence, session effects, halving windows) is only locally stationary. The Fourier/wavelet split is a useful template for feature construction when both a stable global period and a drifting local one are present.

`Read the paper <https://arxiv.org/abs/2309.11319>`__

AdaWaveNet: Adaptive Wavelet Network for Time Series Analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yu, Guo and Sano (arXiv 2024; TMLR 2025) use a lifting-scheme decomposition so the transform itself is adaptive and learnable rather than a fixed basis, evaluated on forecasting, imputation, and a newly-introduced super-resolution task across ten datasets.

Our summary: the lifting scheme is the most principled route to a learnable wavelet because it guarantees *perfect reconstruction* by construction — a meaningful advantage over ad-hoc learned FIR filters, which can drift away from an invertible transform. If a pipeline commits to adaptive wavelets, the lifting scheme is preferable to unconstrained learned filters for exactly this reason.

`Read the paper <https://arxiv.org/abs/2405.11124>`__

Wave-Mask/Mix: Wavelet-Based Augmentations for Time Series Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Arabi, Bakhshaliyev, Coskuner, Madhusudhanan and Uckardes (2024) propose two DWT-based data augmentations: WaveMask drops selected coefficients per decomposition level, and WaveMix swaps coefficients between training instances. Both adjust frequency content while preserving temporal dependency, and are also tested in cold-start settings; code is public.

Our summary: the key property for this domain is that these augmentations are *structurally immune to look-ahead* — they only perturb training inputs and never touch test-time features, so they add none of the leakage surface that denoise-then-predict opens. That makes wavelet augmentation an attractive fallback if wavelet *features* themselves fail out-of-sample validation.

`Read the paper <https://arxiv.org/abs/2408.10951>`__

WaveToken: Wavelet-Based Tokenization for Time Series Foundation Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Masserano, Ansari, Han et al. (Amazon, 2024) build a discrete vocabulary by scaling, wavelet-decomposing, thresholding, and quantizing coefficients, then pre-train an autoregressive foundation model to forecast those coefficients. With only 1,024 tokens it reports the best average ranking across 42 datasets on three metrics, both in-domain and zero-shot.

Our summary: this uses wavelets as a *tokenizer* rather than a denoiser, which sidesteps the denoising-leakage surface entirely — there is no smoothed price to accidentally contaminate with future data. It is also directly compatible with a forecast-model track built on foundation models, making it one of the more transferable ideas in the modern-architecture group.

`Read the paper <https://arxiv.org/abs/2412.05244>`__

SWIFT: Mapping Sub-Series with Wavelet Decomposition Improves Time Series Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Xie and Cao (2025) use the wavelet transform for lossless downsampling, a learnable filter for cross-band fusion, and then a single shared linear layer for prediction. SWIFT-Linear achieves competitive accuracy with roughly 25% of the parameters of a single-layer time-domain linear model.

Our summary: the important evidence here is the ablation implication — that the *wavelet front-end, not model capacity, carries the lift*. That is precisely the control experiment to run before adding an expensive transformer to any wavelet pipeline: if a shared linear layer on wavelet sub-series already captures most of the gain, the capacity is not where the signal is.

`Read the paper <https://arxiv.org/abs/2501.16178>`__

WaveTS: Wavelet Mixture of Experts for Time Series Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zhou, Xiong, Zhang, Xia and Xie (2025) combine wavelet-domain MLPs with a channel-clustering Mixture-of-Experts gating across series; the multi-channel variant WaveTS-M shows the larger gains over the single-channel baseline.

Our summary: the channel-clustering Mixture-of-Experts is the natural architecture for a cross-sectional perpetual-futures universe, where different coins exhibit different scale behaviour and a single shared model averages them together. It connects to the fractal-dynamics evidence (Celeste et al., C5) that BTC-fitted scale structure does not automatically transfer to altcoins — a reason to let experts specialise by cluster.

`Read the paper <https://arxiv.org/abs/2508.08825>`__

Addressing the Incorrect Usage of Wavelet-Based Hydrological Forecasting Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Quilty and Adamowski (Journal of Hydrology, 2018) give the canonical statement of the wavelet-forecasting leakage bug, written from hydrology rather than finance — which is likely why finance keeps rediscovering it independently. They argue that a large published body of wavelet-based forecasting models "cannot be used for real forecasting" because of three failure sources: using future data not available at decision time; inappropriate decomposition level and filter choice; and careless calibration/validation partitioning.

Our summary: this pairs directly with Hasumi & Kajita (B1) as the second pillar of the leakage literature, and it goes further by proposing a named remedy rather than only a warning — boundary-corrected coefficients formalised as the Wavelet Data-Driven Forecasting Framework (WDDFF). The blunt consequence the authors document is that incorrectly developed models "often result in much better performance than what is realistically achievable," which is exactly the tell to watch for on any wavelet trading branch: an implausibly good number is evidence of a leak, not of alpha.

`Read the paper <https://doi.org/10.1016/j.jhydrol.2018.05.003>`__

Research on Information Leakage in Time Series Prediction Based on Empirical Mode Decomposition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yang, Li and Jiang (Scientific Reports, 2024) extend the leakage analysis to the "class EMD" family (EMD, EEMD, VMD, CEEMDAN) rather than wavelets, and propose three causal replacements described concretely enough to implement: SW-EMD (paired sliding windows, one sample per component), STMP-EMD (decompose once to train, then re-decompose the trailing window at each prediction step with a single training pass — the cheapest correct option), and MTMP-EMD (re-decompose and retrain per step — most accurate but very computationally intensive).

Our summary: the value here is a second independent leakage-delta framework alongside Hasumi & Kajita, plus a taxonomy of causal fixes that transfers in spirit to wavelets even though the paper does not claim to. Two cautions for anyone lifting numbers from it: the fixed-component-count constraint that SW/STMP require, and the fact that the widely-quoted +1.958% RMSE figure measures improvement over a plain LSTM baseline, not the leakage delta itself.

`Read the paper <https://www.nature.com/articles/s41598-024-80018-9>`__

Enhancing Algorithmic Trading with Wavelet-Based Deep Reinforcement Learning
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Antonio José Martínez Casares (University of Alcalá; *Neural Computing and Applications* 37, 25339–25385, 2025) runs a grid of wavelet front-ends against deep reinforcement-learning trading agents on S&P 500 futures. Four wavelet families (Daubechies, Symlets, Coiflets, Biorthogonal) are crossed with three DRL algorithms (PPO, A2C, DQN), using level-2 decomposition with conservative soft thresholding applied not to price but to three market-microstructure indicators: DIX, GEX and VIX.

Our summary: the design choice that distinguishes this from the rest of the wavelet-plus-RL branch is *what* gets decomposed. Denoising dealer-positioning and volatility indicators rather than the price series sidesteps the objection raised in the tutorial entry above — that a random walk is intrinsically rough rather than noisy — because these indicators genuinely are noisy measurements of a slower-moving latent state. The reported signal-to-noise improvement of 25–41 dB is only meaningful under that reading. The feature-set ablation is the most useful result for a practitioner: DIX, GEX and VIX combined beat any single-indicator configuration by 18.7% in Sharpe, so the gain comes from combining complementary microstructure signals, not from the wavelet step alone. Treat the headline numbers with the usual caution for a single-author grid search over 12 wavelet-algorithm combinations reported without a stated multiple-testing correction — the best cell of a 12-cell grid is an optimistic estimate by construction, and the paper's own significance rates (below) are computed across pairwise comparisons rather than against that selection. The acknowledgements also disclose extensive generative-AI assistance for formulas, code debugging and writing, which is worth knowing when weighing the derivations.

Data and reproduction: DIX from SqueezeMetrics and SPX from TradingView, both stated in the paper's data-availability section, with code released at `dirac34/Trading-with-Wavelet-Based-Deep-Reinforcement-Learning <https://github.com/dirac34/Trading-with-Wavelet-Based-Deep-Reinforcement-Learning>`__. The full text sits behind a Springer paywall and was not downloadable for this collection, so this entry is written from the publisher abstract, data statement and acknowledgements; the tables, sample period and train/test protocol are unverified.

Key metrics: the best combination is coif4 + DQN at a Sharpe ratio of 0.96 and total return of 112.5%, followed by A2C + db1 (Sharpe 0.803) and PPO + db4 (Sharpe 0.801). Against XGBoost, random forest and logistic regression baselines, the wavelet-DRL agents report a 35–70% higher Sharpe and lower maximum drawdowns (0.28–0.34 versus 0.39–0.42). Statistical testing finds 82.1% of maximum-drawdown comparisons and 67.9% of Sharpe comparisons significant at the 5% level. No transaction-cost treatment, sample period or turnover figure is stated in the abstract.

`Read the paper <https://doi.org/10.1007/s00521-025-11581-z>`__

Using Wavelets for Time Series Forecasting: Does It Pay Off?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Stephan Schlüter and Carola Deuschle (IWQW Discussion Paper 04/2010, Friedrich-Alexander University Erlangen-Nuremberg) compare classical forecasting against wavelet-based extensions of the same methods on four deliberately dissimilar price series, at two horizons, under three error measures. The classical side is the structural time series model and ARMA/ARIMA; the wavelet side is denoise-then-ARIMA and multiscale decompose-then-ARIMA-per-band, plus wavelet-based STSMs and locally stationary wavelet processes.

Our summary: despite the sceptical title this is a **positive** result, and it should not be miscited as negative evidence — a correction worth stating explicitly, because the title invites the opposite reading and the paper is frequently cited that way. The finding that actually transfers is conditional rather than global: in every scenario tested, *some* wavelet method beat the classical techniques, but which one depends on the series. Where a long-term structure dominates the short-term oscillation, as in oil prices, denoising plus ARIMA wins. Where a medium-term structure coexists with meaningful oscillation, as in the exchange rate and the Deutsche Bank stock, multiscale ARIMA per band wins. Where the series is dominated by a strong random component, as in UK power prices, wavelets add almost nothing — which is the same conclusion the tutorial entry on this page reaches from theory, that denoising helps when there is real measurement noise to remove and not when the signal is intrinsically rough. The paper also *fails to replicate* two prior positive claims: it cannot confirm Wong et al. (2003) or Fryzlewicz et al. (2003) that wavelet-based STSMs or locally stationary wavelet processes improve forecast quality. That negative replication is the part most often lost when this paper is summarised.

Data and reproduction: four series, chosen for contrasting character — WTI oil (commodity, strong long-term pattern), Deutsche Bank stock (trend with minor jumps), EUR/USD (long-term component with distinct jumps), and UK day-ahead power prices from the APX Group (minor trend, strong daily oscillation). The first three use weekday closing prices from 1 January 2007 to 30 June 2009; the power series includes weekends and runs 7 July 2007 to 13 March 2009. Forecasts are one-day and one-week ahead (a step of five days for the weekday series, seven for power), evaluated on RMSE, MAE and a third standard measure. The Haar wavelet is used for the STSM and locally stationary wavelet techniques; Census X-12 implements the STSM. Freely available from EconStor; no code release.

Key metrics: this is a forecast-accuracy study with no trading rule, so it reports no return, Sharpe ratio or drawdown. Its results are the per-series, per-horizon rankings under RMSE and MAE described above. Note the short sample — roughly two and a half years spanning the financial crisis — which limits how far the per-series conclusions should be generalised.

`Read the paper <https://www.econstor.eu/handle/10419/36698>`__

Wavelet-Based Combined Signal Filtering and Prediction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Renaud, Starck and Murtagh (IEEE Transactions on Systems, Man, and Cybernetics — Part B, 2005) build a multiresolution filtering-and-prediction method on the redundant à trous transform, compared against a Kalman filter, and show that multiresolution prediction captures both short-range and long-term dependence with few estimated parameters.

Our summary: the à trous (redundant, undecimated) transform is causal-friendly, which makes this the classic answer to the practical question "how do I get multiresolution features without using future samples?" It is the methodological ancestor of the causal, keep-only-the-last-coefficient designs that later leakage-aware papers (Zhang et al. 2001, Bao et al. 2026) converge on, and a good reference for the sparse-parameterisation argument in favour of scale-decomposed prediction.

`Read the paper <https://doi.org/10.1109/TSMCB.2005.850182>`__

Deep Multi-Hybrid Forecasting System with Random EWT Extraction for Crude Oil Futures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wang and Wang (Expert Systems with Applications, 2020) segment the Fourier spectrum into six components with the Empirical Wavelet Transform (EWT): the low-frequency trend is routed to a deep bidirectional LSTM, the five high-frequency components to an Elman RNN with a "variational learning rate," and a random-inheritance-formula error-correction step downweights older samples. Applied to WTI and Brent daily futures (1500 train / 500 test, 2011/12–2019), it reports R² 0.9977 (Brent) / 0.9966 (WTI) and SMAPE 0.34%.

Our summary: treat those headline numbers as unusable as a benchmark. The words "leakage" and "look-ahead" never appear, the decomposition figures span the full 2000-point sample while the split is only 1500/500, and R² near 0.998 on daily oil is precisely the pattern the leakage literature (B1–B3) diagnoses — matching it would itself be evidence of a leak. The genuinely portable ideas are frequency-routed model selection (different model per band) and the causal time-decay loss weighting.

`Read the paper <https://doi.org/10.1016/j.eswa.2020.113686>`__

Depth Feature Extraction-Based Deep Ensemble Learning for High-Frequency Futures Price Forecasting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Wang, Chen, Zhu and Xu (Digital Signal Processing, 2022) build a VMD-based pipeline (often misfiled as EWT): Variational Mode Decomposition followed by Savitzky-Golay denoising and multi-scale-entropy band consolidation, with exogenous variables screened by Spearman correlation and compressed by a stacked autoencoder, an attention-LSTM per component, and a LightGBM ensemble that combines the component forecasts non-additively. Applied to CSI 300, rebar and apple futures at 5-minute frequency (2021), it reports MAPE 0.3480 / 0.2639 / 0.1676%.

Our summary: this is another decompose-then-split leak — the decomposition precedes the 60/20/20 split, and the centred Savitzky-Golay filter (window 19) uses samples up to t+9 by construction, roughly 45 minutes of future information on 5-minute bars. The reusable, causally-safe ideas are entropy-based band consolidation and the non-linear (rather than additive) recombination of per-band forecasts via a gradient-boosted ensemble.

`Read the paper <https://doi.org/10.1016/j.dsp.2022.103567>`__

A Practical Guide to Wavelet Analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Torrence and Compo (Bulletin of the American Meteorological Society, 1998) give the step-by-step recipe for the continuous wavelet transform with an ENSO example: basis choice, the scale-to-Fourier-frequency relation, significance testing against a red-noise background, and — critically for trading — edge effects on finite series and the cone of influence.

Our summary: this is one of the most-cited wavelet primers in any field, and its operational value here is the cone of influence — the concrete tool for marking which coefficients near the most-recent edge of a finite series are contaminated by boundary effects. That makes it directly usable for a live crypto feature, where the newest bar is exactly the one you must trade on and exactly the one the boundary problem corrupts. Read it alongside the leakage papers (B1, B2) as the practical companion that tells you *which* coefficients to distrust.

`Read the paper <https://psl.noaa.gov/people/gilbert.p.compo/Torrence_compo1998.pdf>`__

Wavelets in Economics and Finance: Past and Future
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ramsey (Studies in Nonlinear Dynamics & Econometrics, 2002) offers a retrospective that frames wavelets as a "lens" for relationships invisible in the pure time domain — localized shocks, abrupt regime changes, and time-varying frequency and amplitude.

Our summary: this is the clearest statement of *why* one would decompose by scale in a financial context, which makes it the right thing to read before building features — it forces an honest hypothesis about what scale structure you expect and why, rather than decomposing reflexively. Catalogued from its abstract, as the full text is paywalled.

`Read the paper <https://doi.org/10.2202/1558-3708.1090>`__

Application of the Cross Wavelet Transform and Wavelet Coherence to Geophysical Time Series
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Grinsted, Moore and Jevrejeva (Nonlinear Processes in Geophysics, 2004) introduce the cross-wavelet transform and wavelet coherence with phase-angle statistics for lead/lag inference and Monte Carlo significance testing against a red-noise background.

Our summary: although written for geophysics, this is the methodological engine behind essentially every finance wavelet-coherence paper — the accompanying MATLAB toolbox is what the Bitcoin/gold and Bitcoin/S&P coherence studies (C2, C3) actually run. It is the reference for phase-angle lead/lag reading and for testing coherence significance, both of which are needed if scale-band co-movement is to become a tradable cross-asset feature rather than a descriptive picture.

`Read the paper <https://doi.org/10.5194/npg-11-561-2004>`__

The Continuous Wavelet Transform: Moving Beyond Uni- and Bivariate Analysis
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Aguiar-Conraria and Soares (Journal of Economic Surveys, 2014) survey continuous-wavelet-transform theory and implementation and generalise coherency to *partial* and *multiple* wavelet coherency — controlling for a third series in the time-frequency domain.

Our summary: partial wavelet coherence is the tool that answers a genuinely market-neutral question — "does this altcoin still co-move with a factor once Bitcoin is partialled out, at this particular horizon?" That is exactly the conditional, scale-resolved dependence a cross-sectional perp book cares about, and this survey is the clearest treatment of it. An earlier primer version is freely available.

`Read the paper <https://doi.org/10.1111/joes.12012>`__

Forecasting Market Indices Using Stacked Autoencoders and LSTM (a leakage critique)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jonathan Kinlay's practitioner critique of Bao, Yue and Rao (2017, PLoS ONE 12(7) e0180944) and its claim of 90–95% one-day directional accuracy from Haar-DWT plus stacked autoencoders plus LSTM — a level Kinlay notes would be extraordinary given that even 60% would be outstanding.

Our summary: this is the shortest, bluntest thing to hand anyone who asks "why can't we just denoise the price first?" Kinlay identifies two specific defects that inflate the headline number — the DWT is applied to the *entire dataset before* the train/test split, and the test data is standardised using test-set statistics — and reports that his own replication with gradient-boosted trees on the autoencoded features scored roughly 50%, with another public repository also failing to replicate. It is the informal, hands-on counterpart to the formal leakage papers (Hasumi & Kajita, Quilty & Adamowski) in this collection.

By Jonathan Kinlay.

`Read the post <https://jonathankinlay.com/2022/08/forecasting-market-indices-using-stacked-autoencoders-lstm/>`__

Financial Signal Processing in Python IX: Wavelet Data Denoising
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sofien Kaabar, CFA (29 August 2025), part IX of the *Financial Signal Processing in Python* series on decomposing time series. The post walks through the standard denoising recipe with runnable ``pywt`` code: decompose, soft-threshold the detail coefficients while leaving the approximation untouched, and reconstruct. It uses the level-wise universal threshold, and adds cycle-spinning — denoising several circularly shifted copies and averaging — to approximate the translation-invariant stationary wavelet transform cheaply.

Our summary: the tutorial's real value is the caveats it states honestly, which are precisely the ones the applied papers on this page tend to omit. Three matter. The critically sampled DWT is not translation-invariant, so a small circular shift changes which coefficients cross the threshold and therefore changes the denoised output — cycle-spinning is the practical mitigation and visibly reduces ringing artefacts. Finite signals need explicit edge handling. And most importantly, wavelet denoising targets *measurement* noise added on top of a smooth underlying signal; for a random walk the path is **intrinsically rough** rather than noisy, so there is no clean signal underneath to recover. That distinction is the sharpest available argument against feeding denoised prices into a model, and it explains the pattern seen empirically in the Schlüter and Deuschle entry above, where wavelets helped least on the series dominated by a random component. Denoising is defensible when you have a genuinely noisy observation of a slower latent state — which is the design the wavelet-DRL paper adopts by decomposing DIX, GEX and VIX rather than price.

Data and reproduction: fully self-contained — the post ships working ``pywt`` code that synthesises a noisy random walk, denoises it, and prints the per-level thresholds from coarsest to finest, so the whole example can be run without external data. Uses the ``db8`` wavelet. Freely readable with no subscription required.

Key metrics: a tutorial rather than a study — no backtest, return, Sharpe ratio or forecast-error benchmark is reported, and none is claimed.

By Sofien Kaabar.

`Read the post <https://abouttrading.substack.com/p/financial-signal-processing-in-python-dd0>`__

Multi-Scale and Frequency-Based Momentum
------------------------------------------

Papers that decompose a price or factor series by time scale or frequency and use the components as a trading or pricing signal, rather than as a forecasting preprocessor. This is the bridge between the wavelet material above and the :doc:`Momentum <./momentum>` and :doc:`Trend Following <./trend-following>` collections.

Decomposing and Reconstructing Time-Series Momentum with Discrete Wavelet Transform
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Patrik Akrenius (Aalto University School of Business, master's thesis, 2016) replicates the time-series momentum portfolios of Moskowitz, Ooi and Pedersen (2012) on monthly S&P 500 returns from January 1965 to December 2015, then replaces the raw return signal with wavelet-decomposed versions of it. The motivation is that traders act on horizons from minutes to years, so a decomposition into wavelet coefficients — which separates a series into an approximation (low-frequency trend) component and a set of detail components at successive scales — should isolate the constituents of momentum that a single lookback window blends together. The thesis uses the decomposition both to identify which scales carry the momentum signal and to denoise the series before forming portfolios.

Our summary: this is the clearest statement of the "decompose, then run TSMOM on the components" construction, and as far as this collection can establish it is close to the only work doing exactly that — the surrounding literature approaches multi-scale momentum through trend filters or frequency-domain factor models instead. It should be read as a construction sketch rather than as evidence. The headline is that wavelet decomposition produces almost seven times the return of the standard time-series momentum strategy over the in-sample period, achieved through substantially higher portfolio turnover, with the author noting that a real-world implementation would need further filtering of the signal's statistical significance to avoid unnecessary transactions. Two cautions apply and both are load-bearing. First, the result is in-sample, with no out-of-sample or transaction-cost-net evaluation. Second, and more seriously, a DWT reconstruction at time *t* draws on filter coefficients that touch observations after *t* unless the transform is made explicitly causal, so a hyper-reactive signal delivering a large in-sample multiple is precisely the signature of boundary leakage described in :ref:`Boundary Problem and Data Leakage: A Caveat for Wavelet-Based Forecasting <boundary-problem-data-leakage>` and in the EMD leakage papers catalogued on this page. The thesis does not report the boundary-handling scheme, so the 7× figure cannot be taken at face value without reproducing the transform under a strictly causal window.

Data and reproduction: monthly S&P 500 returns, January 1965 to December 2015, with the portfolio construction following Moskowitz, Ooi and Pedersen (2012), so the inputs are standard and freely available. No code accompanies the thesis. The full text is not openly published — Aalto's repository lists only an electronic archive copy available through the Aalto Thesis Database, so the record page carries the abstract and metadata (31 pages, advisors Esa Jokivuolle and Matti Suominen) but no downloadable PDF. This entry is catalogued from that record; the wavelet family, decomposition depth, thresholding rule and boundary treatment are therefore unverified.

Key metrics: approximately seven times the in-sample return of the benchmark time-series momentum strategy over 1965–2015, at the cost of a materially higher turnover rate. The record does not report Sharpe ratio, maximum drawdown, win rate, or any transaction-cost-net or out-of-sample figures, and no significance tests on the return difference are stated.

`Read the thesis <https://aaltodoc.aalto.fi/items/b8ae5d15-08fc-4cb8-a595-7fff116c607d>`__

Trend Filtering Methods for Momentum Strategies
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Benjamin Bruder, Tung-Lam Dao, Jean-Charles Richard and Thierry Roncalli (Lyxor Asset Management, 2011) survey the econometric estimators used to extract a trend from a price series, framed explicitly as the signal-construction problem inside a momentum strategy. The review separates linear from nonlinear filtering and univariate from multivariate, covering moving averages, the Hodrick-Prescott and Kalman filters, L1/L2 penalised filtering, singular spectrum analysis, and wavelet denoising, with each method applied to the S&P 500 index for illustration. The paper then treats calibration as a first-class problem, presenting two approaches — minimising prediction error, and matching a benchmark estimator — and closes with the practical issues that arise when turning a trend estimate into positions.

Our summary: this is the closest published bridge between the wavelet material on this page and the momentum literature, because it treats wavelet denoising as one trend filter among many rather than as a forecasting curiosity. Its wavelet section states the construction in exactly the terms a multi-scale momentum design needs: compute the wavelet transform of the price signal, modify the coefficients by a shrinkage rule, and invert the transform to recover the trend, with the two live choices being the mother wavelet and the denoising rule (hard, soft, or quantile shrinkage in the sense of Donoho and Johnstone). The paper's real contribution to a practitioner is its insistence that filter choice is inseparable from calibration and from estimator variance — a trend estimate is a random variable, and two filters with similar in-sample fit can differ sharply in the stability of the positions they generate. The concluding section is unusually candid about what the survey does *not* solve: aggregating a pool of filters, sizing positions from a trend estimate, whether to use asset correlations or strategy correlations in a multi-asset trend book, and whether to hold risk constant through volatility spikes. Read it as the methodological map for building a decomposition-based momentum signal, not as evidence that any particular filter wins.

Data and reproduction: all illustrations use the S&P 500 index, and every estimator is specified in closed form or as a stated optimisation problem, so the methods are directly implementable. No code or dataset is released. Note that the paper is a survey with illustrative applications rather than a horse race — it does not run a like-for-like backtest across the filters it reviews.

Key metrics: none are reported, and this is by design. The paper presents no strategy backtest, no Sharpe ratio, no drawdown and no performance ranking of the filters; its output is a catalogue of estimators with their stated advantages, disadvantages and calibration procedures. For a backtested comparison of a subset of these filters on the same index, see the companion entry on Momentum Strategies with L1 Filter below.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2289097>`__

Momentum Strategies with L1 Filter
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Tung-Lam Dao (Capital Fund Management, 2014; arXiv 1403.4069) develops L1 trend filtering as a momentum signal. An L1 penalty on the second difference of the filtered series produces an estimate composed of piecewise straight trends with a small number of breaks, where the regularisation parameter controls the break count and is set by cross-validation. The paper's organising idea is that a price series carries a long-term global trend alongside short-term local trends, and that the combination of the two time scales gives a simple model of a trending process with mean-reverting properties. Three momentum strategies are then backtested on the S&P 500: one driven by the local trend, one by the global trend, and one blending both.

Our summary: this is the natural control experiment for any wavelet-momentum design, because it isolates the two-time-scale idea without the wavelet machinery. The local/global split is a two-level decomposition by another name, and the finding that the blend of scales beats either scale used alone is the same qualitative claim a multi-scale momentum strategy rests on. The results also sharpen where the benefit comes from: over the test window the S&P 500 has no clear directional trend, so the local-trend model — the fast, high-frequency signal — is worst, and the global trend carries almost all of the performance. That ordering is a caution against reading strong high-frequency detail signals as edge, and it echoes the finding elsewhere in this collection that low-frequency components carry the tradable content. A structural advantage of L1 filtering over wavelet reconstruction is worth noting for anyone weighing the two: L1 filtering is a causal optimisation over past data with an explicit break structure, so it does not carry the boundary-leakage hazard that makes in-sample wavelet results hard to trust.

Data and reproduction: the backtest uses the S&P 500 index from January 1998 to December 2010, with the trend re-estimated daily, a long/short exposure bounded to [−1, +1], a local-trend test window of 6 months (130 trading days) and a global-trend window of one year (520 trading days), and a training set four times the test-set length. The filter is a standard constrained least-squares problem with an L1 penalty, fully specified in the paper. No code release accompanies it; the preprint is freely available on arXiv.

Key metrics: over 1998–2010 the S&P 500 benchmark returns 2.04% annualised at 21.83% volatility with a Sharpe of −0.06 and a 56.78% drawdown. The L1 global-trend model is the best strategy at 6.95% return, 19.01% volatility, Sharpe 0.19, information ratio 0.14 and 31.02% drawdown; the two-trend (local plus global) blend follows at 6.47%, 18.18% volatility, Sharpe 0.17, IR 0.13 and 31.99% drawdown; the Hodrick-Prescott filter is comparable at 6.39% and Sharpe 0.17. The local-trend-only model is materially worse at 3.17% and Sharpe −0.01, though it delivers the smallest drawdown of the set at 25.11%, and a plain moving-average filter returns 3.13% at Sharpe −0.01. Note the modest absolute level of all these Sharpe ratios — the contribution is the relative ordering across scales, not a compelling standalone strategy.

`Read the paper <https://arxiv.org/abs/1403.4069>`__

Spectral Factor Models
^^^^^^^^^^^^^^^^^^^^^^^^^

Federico M. Bandi, Shomesh E. Chaudhuri, Andrew W. Lo and Andrea Tamoni (Journal of Financial Economics, 2021) represent a risk factor as a sum of orthogonal components, each capturing fluctuations with cycles of a specific length, and define a spectral factor model in which excess returns load on those components rather than on the aggregate factor. Systematic risk at each frequency is captured by a spectral beta. The paper shows that a traditional factor model is the restricted case in which spectral betas are forced to be equal across frequencies, and that the ordinary beta is a weighted average of spectral betas with no cross-beta terms, so all frequency-specific information sits in the spectral betas. Because the decomposition is built on an orthogonal Wold representation, it is defined in the time domain rather than the frequency domain.

Our summary: this is the asset-pricing justification for treating scale as a first-class dimension of a signal, and it is the paper to cite when arguing that scale-specific momentum portfolios should exist rather than that they merely can be constructed. The empirical result is striking in how much it discards: a single business-cycle component of the market excess return — the sixth Wold scale, capturing cycles of 32 to 64 months — prices a broad set of test assets, with a price of risk that is stable across cross sections and significant under standard errors robust to model misspecification. The implication runs opposite to the intuition behind high-frequency detail signals: the fast-moving market components carry limited pricing information while the slow-moving component carries a strong signal. The paper also documents a rotation across scales that is directly useful as a design prior — spectral covariances show a marked size tilt at the 2–4 and 4–8 month scales, rotating toward value at lower frequencies, so which characteristic a signal captures depends on the scale it is measured at. The authors frame this as a route to dimensionality reduction: attention to frequency alongside style may discipline factor proliferation, since one well-chosen scale of one factor can substitute for several factors.

Data and reproduction: the empirical work uses standard public data — value-weighted decile portfolios formed on book-to-market from Kenneth French's library from January 1967 through December 2018, the 25 Fama-French size and book-to-market portfolios, 25 size and momentum portfolios, and 48 portfolios sorted on 24 anomaly characteristics drawn from Ehsani and Linnainmaa. Wold components are extracted parametrically from a VAR with lag length 18 (results reported robust to nearby choices) or nonparametrically. The scale mapping is stated explicitly: j = 1 covers 1–2 months, then 2–4, 4–8, 8–16, 16–32, and j = 6 covers 32–64 months, with a residual beyond 64 months. No code release is advertised, but every construction step is specified and the data are public.

Key metrics: this is a cross-sectional pricing study, so it reports prices of risk, cross-sectional R² and misspecification-robust comparison tests rather than strategy performance — there is no annualised return, Sharpe ratio, drawdown or win rate. The headline empirical claim is that a one-factor spectral model using only the 32–64 month market component is not rejected against the Fama-French five-factor model or the Hou-Xue-Zhang four-factor model under misspecification-robust tests of equal fit. The market excess return has 15.25% annualised volatility over the sample, and the six extracted market components plus residual have sharply decreasing variances (7.701, 6.921, 3.845, 2.308, 0.677, 0.289, 0.147), which is what makes the pricing power of the small, slow sixth component notable.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3275567>`__

A Persistence-Based Wold-Type Decomposition for Stationary Time Series
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fulvio Ortu, Federico Severino, Andrea Tamoni and Claudio Tebaldi (Quantitative Economics, 2020) show how to decompose a weakly stationary time series into a sum, across time scales, of uncorrelated components each associated with a specific degree of persistence. The construction — an Extended Wold Decomposition — is built on an isometric scaling operator that averages process innovations, so the component at scale *j* is an infinite moving average driven by uncorrelated innovations spaced on a grid 2^j times coarser than the original. Because the components are uncorrelated, the representation induces a persistence-based variance decomposition of any weakly stationary process. Two empirical applications follow: the drivers of realized volatility in currency markets, and the relation between economic uncertainty and future excess market returns.

Our summary: this is the formal machinery underneath scale-based signal construction, and it is worth reading precisely because it is *not* an ad-hoc choice of wavelet family and decomposition depth. The decomposition is obtained in the time domain, which the authors argue makes it better suited to predictive work than frequency-domain methods, since time adaptation and localisation in both time and frequency matter for forecasting. The volatility application is the one with immediate practical bite: three components operating at semiannual, annual and biannual frequencies account for a substantial fraction of the variability of daily realized variance, and a forecasting model using only those three components performs well against the HAR model of Corsi (2009). The interpretive result is sharper than the horse race — the analysis indicates that HAR's daily, weekly and monthly regressors are in fact proxying for phenomena occurring over much longer scales, between half a year and two years. Anyone building scale-band volatility features should treat that as a warning that the nominal horizon of a regressor is not the horizon of the phenomenon it captures. A useful companion to Spectral Factor Models above, which applies the same Wold-component machinery to the cross-section of returns.

Data and reproduction: the paper is primarily theoretical, with the decomposition stated constructively and proofs supplied, so implementation follows directly from the text. The empirical applications use daily realized variance from currency markets and standard aggregate market return and economic uncertainty series. The article is open access at Quantitative Economics; no code release accompanies it.

Key metrics: an econometric methods paper, so it reports no annualised return, Sharpe ratio, drawdown or win rate. Its quantitative claims are the share of daily realized variance variability attributable to the semiannual, annual and biannual components, the competitive forecasting performance of that three-component model against HAR, and — in the second application, drawing on related work by Bandi and coauthors — a hump-shaped relation between future excess market returns and past economic uncertainty whose predictive R² peaks around a 16-year scale.

`Read the paper <https://doi.org/10.3982/QE994>`__
