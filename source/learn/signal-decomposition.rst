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

How Hedge Funds Use The Kalman Filter To Read Hidden Markets In Real Time
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A practical breakdown of how hedge funds use the Kalman Filter to estimate hidden market states in real time. The article presents the Kalman Filter as a recursive Bayesian state-space model that infers unobservable market variables — such as true asset value, latent momentum, or regime state — from noisy price observations. Unlike static regression or moving average approaches, the Kalman Filter dynamically updates its estimates as each new data point arrives, making it well-suited for real-time trading systems where market conditions shift continuously.

The article shares an implementable quant framework for applying the Kalman Filter to trading, covering the predict-update cycle, state transition and observation models, and how to calibrate noise covariance parameters for financial data. This connects to the broader signal decomposition literature: the Kalman Filter can be viewed as optimally separating signal (true state) from noise in a sequential filtering framework, complementing frequency-domain decomposition methods like VMD and EMD covered elsewhere in this collection.

Mentioned by `Phosphen (@phosphenq) <https://x.com/phosphenq/status/2056438562451513660>`__ on X.

`Read the article <https://x.com/i/article/2056414759554015232>`__
