.. meta::
   :description: Research papers and posts on equity factor models, asset pricing anomalies, value, quality, and profitability factors.

Equity Factors
~~~~~~~~~~~~~~

Factor investing — also known as smart beta or systematic equity investing — seeks to capture documented return premia associated with specific stock characteristics. The classical Fama-French framework identified market, size, and value as systematic risk factors. Subsequent research extended this to momentum, profitability, investment, and quality, producing a proliferating "factor zoo." Modern research focuses on understanding which factors are genuine risk premia versus data mining artifacts, how factors interact and diversify each other, and whether factor returns are time-varying or episodic.

This collection covers the foundational factor papers, including quality-minus-junk, episodic factor pricing, R&D as a return predictor, and the value premium's structural source. It also includes practical research on factor timing, combining value and momentum signals, market concentration effects, and how traditional equity factors translate to Japanese markets. A key theme running through the literature is distinguishing genuine economic mechanisms from selection effects, and understanding why factor premia appear and disappear across time periods and geographies.

Related topics include :doc:`Momentum <./momentum>` for momentum factor strategies, :doc:`Portfolio Construction <./portfolio-construction>` for factor portfolio implementation, and :doc:`Machine Learning <./machine-learning>` for ML-based approaches to factor discovery and timing.

For complete worked examples of trading strategies and individual factors, see :doc:`Strategy Examples <./strategy-examples>` and :doc:`Factor Examples <./factor-examples>`.

Quality Minus Junk
------------------

This paper provides a tractable valuation model that shows how stock prices should increase in their quality characteristics: profitability, growth, and safety. A "quality" security is defined as one that is safe, profitable, growing, and well managed. Empirically, the authors find that high-quality stocks do have higher prices on average but not by a large margin, and high-quality stocks have high risk-adjusted returns. A quality-minus-junk (QMJ) factor that goes long high-quality stocks and shorts low-quality stocks earns significant risk-adjusted returns in the United States and across 24 countries.

By Clifford S. Asness, Andrea Frazzini, and Lasse Heje Pedersen.

Mentioned by Kurtis The Quant in `this discussion <https://x.com/Quant_Kurtis/status/2014420038951088341>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2312432>`__

Episodic Factor Pricing
------------------------

This paper challenges conventional factor models by showing that factor pricing power is time varying and frequently switches between active and inactive states. The authors propose a real-time method to identify factor pricing states, showing that conditioning on these states materially improves out-of-sample multifactor portfolio performance, even after transaction costs. A conditional stochastic discount factor with state-dependent risk prices provides a better description of the investment opportunity set. Across a broad set of factors, pricing power is concentrated in active states and largely absent otherwise, implying that factor premia and risk prices are inherently episodic rather than persistent.

By Sophia Zhengzi Li, Peixuan Yuan, and Guofu Zhou.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6083826>`__

A Unified Framework for Anomalies based on Daily Returns
---------------------------------------------------------

Numerous cross-sectional equity anomalies draw on the same underlying information: the sequence of daily returns over the previous month. Using a data-driven approach, the authors estimate the empirical mapping from the distribution of last month's daily returns to future performance without imposing functional forms. The resulting Daily Return Information Factor (DRIF) earns economically large premia, holds across subsamples and research designs, and remains significant after controlling for the modern factor zoo. DRIF subsumes most short-horizon and lottery-style anomalies and emerges as a key factor in asset pricing tests.

By Nusret Cakici, Christian Fieberg, Gabor Neszveda, Robert J. Bianchi, and Adam Zaremba.

Mentioned by Quantitativo in `this discussion <https://substack.com/@quantitativo/note/c-196576483>`__: "The factor zoo isn't crowded. It's redundant. Daily returns already contain the signal — we just kept slicing them the wrong way."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6005614>`__

R&D Alpha: Investment Intensity and Long-Term Stock Returns
-----------------------------------------------------------

This paper tests whether high research and development (R&D) intensity predicts higher subsequent equity returns in a large-cap U.S. universe using methodology designed for portfolio implementability. Each year, S&P 500 stocks are sorted into quintiles by R&D intensity (R&D expense divided by revenue) and subsequent returns are evaluated with timing designed to mitigate look-ahead bias.

The high-minus-low R&D factor averages 3.73% per year, with monthly factor spanning tests confirming a statistically distinct premium (FF5 alpha = 4.37%, p < 0.01). The investable RD20 strategy, a simple long-only portfolio holding the top 20 stocks by R&D intensity equal-weighted, delivers 7.52% annual excess return versus SPY after transaction costs. The paper documents sector tilts, factor exposures, and regime dependence, noting that much of the value comes from sector tilts and regime dependence rather than a clean textbook factor.

By Abhishek Sehgal.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2019799495723085860>`__: "Worth a read for anyone thinking seriously about intangible capital, innovation exposure, and practical factor implementation."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6002295>`__

Magnificent, but Not Extraordinary: Market Concentration in the US and Beyond
------------------------------------------------------------------------------

This paper examines equity market concentration in the US since 1926 and in several developed markets. The authors find that current index weights of the largest firms align with historical and international patterns, and that valuation concentration moves with earnings concentration. A geometric Brownian motion benchmark with firm-specific shocks reproduces observed concentration, with idiosyncratic volatility identified as the key driver.

The central finding is that high concentration alone does not justify deviations from market weights or policy conclusions about firm breakups. The market portfolio remains optimal in the authors' benchmark framework. Their evidence constrains pure multiple-expansion narratives and behavioral channels by linking valuations to fundamentals, pushing back on the popular narrative that the Magnificent 7 represent an unprecedented anomaly.

By Per Bye, Jens Soerlie Kvaerner, and Bas J.M. Werker.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance>`__: "If you believe today's US equity market is uniquely concentrated because of the Magnificent 7, history may disagree."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6080632>`__

Value Premium: Where Does It Really Come From?
-----------------------------------------------

This paper investigates the sources of the value premium by distinguishing between newly classified and incumbent value and growth stocks. The authors observe that roughly half of value and growth stocks are newly reclassified each year, and explore whether these "style migrants" — stocks that have recently transitioned into value or growth categories — drive the bulk of the value premium.

The key finding is that recent style migrants disproportionately drive the value premium. Newly promoted growth stocks persistently underperform, suggesting that the fresh rotations into style categories matter most for explaining the value effect. Not all value is created equal — the source of a stock's value or growth classification carries significant information about future returns.

The spread between new value and new growth stocks is 0.33% per month, more than double the 0.15% per month spread between incumbent value and growth stocks. Annualized, the new entrant value-growth spread is approximately 4.0%, compared to roughly 1.8% for incumbents, indicating that recent style migration accounts for the dominant share of the aggregate value premium.

By Chen, Huang & Jiang.

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2026337576387289360>`__: "Not all value is created equal. The fresh rotations matter most."

`Read the paper <https://doi.org/10.1080/0015198X.2026.2624532>`__

Multiples for Valuation: Go High, Go Low, Ignore the Middle
------------------------------------------------------------

This paper examines whether valuation multiples such as D/P (dividend-to-price), P/E (price-to-earnings), and CAPE (cyclically adjusted P/E) can forecast stock returns, and under what conditions they are most useful. Using US data spanning 1871–2025, the author finds that multiples are far more useful at predicting forward returns when they are at relatively high or low levels than when they sit in the middle of their historical range.

The key finding is that the predictive power of valuation multiples is concentrated at the extremes. When multiples fall into the top or bottom quartile of their historical distribution, the in-sample correlation with subsequent approximately ten-year returns is substantially higher, with R² reaching up to 0.70. Out-of-sample forecasts generated from extreme multiples also significantly outperform those derived from mid-range multiples. The practical implication is that investors should pay close attention to valuations when they are unusually stretched in either direction, but can largely ignore them when they are near the middle of their historical range.

By Javier Estrada (IESE Business School).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2027063861971415486>`__: "Do multiples predict returns? Valuations Only Matter at Extremes."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6152048>`__

Covariance Implied Risk Factors
---------------------------------

This paper examines the role of heteroskedasticity in extracting latent risk factors from asset returns. Standard principal component analysis (PCA) suffers from distortions when assets exhibit heterogeneous idiosyncratic variances, causing estimated factors to reflect clusters of idiosyncratic risk rather than true systematic risk. The author applies heteroskedastic PCA (heteroPCA) to correct for this bias by iteratively replacing the diagonal of the sample covariance matrix with estimates implied by the off-diagonal structure.

HeteroPCA delivers substantially better out-of-sample cross-sectional pricing performance compared to standard PCA across multiple equity portfolio sorts. The identified factors exhibit clearer economic interpretability, and the implied stochastic discount factor achieves lower Hansen-Jagannathan distances. The method trades off slightly worse time-series fit for much stronger cross-sectional pricing power, a tradeoff the author argues is economically favorable.

Key results: On AP-Tree portfolios, heteroPCA achieves out-of-sample Sharpe ratios of 0.46 (Tree10) and 0.55 (Tree40), compared to 0.18 and 0.26 from standard PCA. Across double-sorted portfolios, heteroPCA consistently outperforms: Size & Book-to-Market Sharpe ratio 0.28 vs 0.15, Size & Accruals 0.21 vs 0.13, Size & Investment 0.32 vs 0.20, and Size & Idiosyncratic Volatility 0.35 vs 0.21. Sharpe ratio gains often exceed 50% relative to standard PCA. RMS pricing errors are also lower, with heteroPCA reducing RMS alpha from 0.85-0.90 to 0.72-0.80 on AP-Tree portfolios.

By Mohammed Mehdi Kaebi (Insper Institute of Education and Research).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2029237686410612736>`__: "Your PCA might be lying to you. Standard PCA distorts latent factors when assets have different idiosyncratic variances. The fix? Heteroskedastic PCA."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6136149>`__

Anomaly Premiums with Dynamic Exits
-------------------------------------

Anomaly premiums are traditionally based on long-short portfolios held passively for a fixed horizon. This paper estimates premiums when exits are instead optimized using machine learning with a computationally light architecture. The authors use randomized kernels to generate high-dimensional representations of time-series inputs. A classifier ingests the inputs and predicts optimal exits. In a conservative universe with only large-cap value-weighted portfolios, dynamic exits generate premiums of about 100 basis points per month for momentum, profitability, and value. These premiums are not replicated with static or random exits, without random re-representations, in non-anomaly portfolios, and are robust to reasonable transaction cost hurdles.

By Nitin Kumar (Nanyang Technological University), Nagpurnanand Prabhala (Johns Hopkins Carey Business School), and Ravi Ranjan (UNC Kenan-Flagler Business School).

Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2018712332625445079>`__: "Most anomalies don't decay smoothly; they switch off and rotate. Dynamic exits materially improve Sharpe ratios across many classic anomalies, and drawdowns are meaningfully reduced by avoiding low-signal periods. The gains come more from risk control and timing exits than from boosting raw returns."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6076808>`__

Optimal Factor Timing in a High-Dimensional Setting
----------------------------------------------------

This paper develops a framework for equity factor timing in a high-dimensional setting when the number of factors and factor return predictors can be large. To ensure good out-of-sample performance, the approach is disciplined by shrinkage that effectively expresses a degree of skepticism about outsized gains from timing. In their empirical application, the predictors include macroeconomic variables and factor-specific characteristics spreads between the long and short legs of the factors. They find sizable gains from timing equity factors, including for factors constructed only from large-cap stocks.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4938729>`__

Cross-Sectional Skewness
--------------------------

This paper investigates what distribution best characterizes the time series and cross section of individual stock returns. The authors estimate the degree of cross-sectional return skewness relative to a flexible benchmark that nests many standard models in the literature, including lognormal, stochastic volatility, and jump-diffusion specifications. The central finding is a striking asymmetry across horizons: cross-sectional skewness in monthly returns far exceeds what the benchmark model predicts, while cross-sectional skewness in long-run returns is substantially below what the model predicts.

The resolution lies in fat-tailed idiosyncratic events — rare, firm-specific jumps that generate extreme short-term returns but whose effects attenuate over longer holding periods. The authors show that incorporating power-law-distributed idiosyncratic shocks into the return-generating process is necessary to reconcile both the excess short-horizon skewness and the deficit of long-horizon skewness observed in the data. This has direct implications for asset pricing and portfolio construction: models that ignore fat-tailed idiosyncratic risk will systematically misprice lottery-like payoffs at short horizons and underestimate diversification benefits at longer horizons.

Key metrics: This is a theoretical and empirical asset pricing paper rather than a backtested trading strategy. The primary quantitative results concern the magnitude of cross-sectional skewness relative to model predictions across different return horizons. No annualised return, Sharpe ratio, or drawdown figures are reported. The paper's contribution is to the understanding of return distributions and the role of rare idiosyncratic events in shaping cross-sectional risk.

By Sangmin Oh (Columbia Business School) and Jessica A. Wachter (Wharton / NBER / SEC). Published in Review of Asset Pricing Studies 12(1):155-198, March 2022.

Mentioned by Darren (@ReformedTrader) in `this discussion <https://x.com/ReformedTrader/status/2034719148690087962>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3079715>`__

Expected Returns with Cash Flow Trends and Cycles
--------------------------------------------------

This paper argues that cash flow growth contains a permanent trend component, rendering the price-dividend ratio a noisy proxy for expected returns. Using an Extended Kalman Filter to jointly estimate trend growth, cash flow cycles, and expected returns, the authors demonstrate that cash flow noise generates severe attenuation bias in standard predictive regressions — making valuation ratios appear far weaker than they truly are.

By decomposing the price-dividend ratio into discount-rate variation (the return-predicting signal) and cash-flow dynamics (the noise), and then purging this noise, return predictability is substantially restored. Discount-rate variation dominates price-dividend movements at short and medium horizons, while trend growth dominates at longer horizons.

The cleaned signal delivers out-of-sample R² of approximately 9% at the one-year horizon and 22% at the five-year horizon, where traditional valuation ratios uniformly fall short at every tested horizon.

Mentioned by `Ivan Blanco <https://www.linkedin.com/in/ivanblancosanchez>`__ in `this LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-valuation-ratios-arent-share-7442576675743256576-pQjJ/>`__: "Valuation ratios aren't weak predictors. They're noisy ones. There's a difference."

By Sebastian Hillenbrand and Odhrain McCarthy.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6332619>`__

Dynamic Factor Allocation via Momentum-Based Regime Switching
--------------------------------------------------------------

This paper develops a framework for dynamically allocating across equity factors using momentum-based regime switching signals. The approach identifies when each factor is in a favorable regime and adjusts portfolio weights accordingly, generating superior risk-adjusted returns compared to static equal-weight factor allocation.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6333378>`__

Don't Mix What Should Be Separated: Why Combining Value and Momentum Signals Destroys Alpha
--------------------------------------------------------------------------------------------

This paper demonstrates that combining value and momentum signals into a composite ranking — a common industry practice — destroys alpha compared to running separate long-short sleeves. The interaction between value and momentum signals is sufficiently negative that the diversification benefit is better captured through separate portfolios, with allocation between them determined at the portfolio construction level.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6255159>`__

Why Low Beta Improves Value in US Small Caps
--------------------------------------------

A research note examining whether combining low-beta filtering with value factor selection produces superior risk-adjusted returns across US and European equity universes. Using Portfolio123 infrastructure and FactSet data across nine long-only universes segmented by geography and market capitalisation, the study compares top-30 value stock portfolios constructed separately from the low-beta and high-beta halves of each universe over January 2005 to February 2026.

The central finding is that low-beta value portfolios deliver higher Sharpe ratios in 8 of 9 universes tested. The effect is most dramatic in US Small Caps, where Low Beta Value nearly doubles the CAGR of High Beta Value (19.9% vs 10.2%) with a Sharpe of 0.68 vs 0.27.

By Ivan Blanco. Mentioned by Ivan Blanco in `this discussion <https://x.com/iblanco_finance/status/2028513162149155197>`__.

`Read the article <https://www.ivanblanco.ai/notes/low-beta-value-factor>`__

The Concentration Game: Understanding Portfolio Effects of U.S. Equity Market Concentration
--------------------------------------------------------------------------------------------

A research piece from D. E. Shaw examining how rising concentration in the S&P 500 affects equity portfolio management and alpha generation. The ten largest constituents now represent over 40% of the index's weight — the highest level in decades. Unlike the late 1990s dot-com era, today's concentration reflects realized economic growth where both prices and earnings have increased substantially for mega-cap companies.

The article explores the risk implications: the top ten stocks now contribute over 50% of the S&P 500's total volatility, with aggregate volatility 1.5 times the index itself and betas above 1.0. For active managers, concentration constrains alpha generation through reduced transfer coefficients and narrower breadth.

By The D. E. Shaw Group.

`Read the article <https://www.deshaw.com/library/concentration-game>`__

Finding an Edge in IPOs: Research and a Backtested Mechanical Trading System
-----------------------------------------------------------------------------

Research into whether IPOs offer a tradable edge, backed by a fully backtested mechanical trading system. The post examines the well-documented IPO anomalies — initial underpricing and longer-term underperformance — and develops systematic rules to exploit these patterns. It covers the data challenges unique to IPO trading, the construction of entry and exit signals, and presents backtest results showing how a mechanical approach to IPO trading performs historically.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/finding-an-edge-in-ipos-research-and-a-backtested-mechanical-trading-system/>`__

.. _example-economic-uncertainty-and-the-beta-anomaly-in-g10-countries:

Economic Uncertainty and the Beta Anomaly in G10 Countries
-----------------------------------------------------------

This paper extends the finding that the beta anomaly — whereby low-beta stocks outperform high-beta stocks on a risk-adjusted basis — is conditional on the macroeconomic uncertainty regime. Building on Cao, Wu, and Wu's work published in Management Science showing the effect in US equities, the authors test whether the same mechanism holds across G10 economies. Using the global Economic Policy Uncertainty (EPU) index over 1997–2025, they partition each market into high- and low-uncertainty regimes. Across most G10 markets, the negative relationship between market beta and CAPM alpha is significant only during low-uncertainty periods and weakens or disappears when uncertainty is high.

The core mechanism is that during calm periods, investors are more risk-tolerant and over-allocate to high-beta stocks, bidding up their prices and depressing subsequent returns. When uncertainty rises, risk appetite diminishes, easing this overpricing effect and restoring the risk-return relation closer to CAPM predictions. The original US study found the Fama-French 3-factor alpha of the high-minus-low beta portfolio is -0.95% per month in low-uncertainty periods and insignificantly positive (+0.32%) in high-uncertainty periods. Evidence from mutual fund flows and trade-induced beta changes confirms the investor behaviour channel: actively managed funds reduce market risk exposure during high uncertainty, while index funds show no such pattern. The finding is robust to alternative uncertainty indices, beta estimation methods, and sample periods.

The study uses stock market data from G10 countries (US, UK, Japan, Germany, France, Canada, Italy, Switzerland, Netherlands, and their equivalents) with the macroeconomic uncertainty index of Jurado, Ludvigson, and Ng (2015) and the global EPU index. No code is provided for reproduction.

Key metrics from the US study: low-beta stocks outperform high-beta by roughly 1% per month during calm regimes. The high-minus-low beta portfolio alpha is -0.95% monthly in low-uncertainty periods versus +0.32% (insignificant) in high-uncertainty periods.

By Yigit Atilgan, K. Ozgur Demirtas, A. Doruk Gunaydin, and Aynur Dilan Tosun. Mentioned by Ivan Blanco in `this discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-ideas-the-beta-anomaly-only-share-7463217469998985217-BrW3>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6729938>`__.

The Sharpe-Optimal Long-Only Factor Portfolio Ends Up All AQR
-------------------------------------------------------------

A short X thread from Green Lark presenting a striking result from mean-variance optimisation over a universe of ten beta-hedged Fama-French and AQR equity factors (1963-2026). When you solve for the long-only portfolio that maximises the Sharpe ratio (here defined plainly as the mean-to-standard-deviation ratio of returns), every Fama-French factor falls out and the optimiser allocates exclusively to AQR factors: QMJ 37%, HML-Devil 31%, UMD 25%, and BAB 7%. The resulting blend posts a Sharpe of 1.50 (t-stat 11.9) versus 1.00 for the naive equal-weight portfolio of the same components.

A few terms are worth unpacking. *Fama-French (FF)* refers to the academic factor set built by Eugene Fama and Kenneth French (market, size/SMB, value/HML, and later profitability and investment). *AQR* is the quant asset manager AQR Capital, whose research desk publishes refined versions of these factors. *QMJ (Quality Minus Junk)* goes long high-quality, profitable, stable companies and short "junk". *UMD (Up Minus Down)* is the classic momentum factor, long recent winners and short recent losers. *BAB (Betting Against Beta)* goes long low-beta and short high-beta assets, levering up the safer leg. *HML-Devil* is AQR's improved value factor (Asness-Frazzini) that updates the price in the book-to-market ratio more frequently than the original HML, fixing a stale-price flaw. *Beta-hedged* means each factor's market exposure has been stripped out so the comparison is of pure factor premia.

The author's key observation is that HML-Devil earns a large 31% weight despite a weak standalone Sharpe. The reason is correlation, not standalone strength: value is a powerful hedge for momentum. In a momentum crash — the canonical example being spring 2009, when beaten-down "junk" stocks violently rebounded off the GFC bottom and momentum strategies suffered their worst drawdown on record — value rallies hard. An optimiser that is heavily long momentum (UMD) therefore pays up for value as insurance, which is exactly the complement the author says they are hunting for. This is the deeper lesson of the post: in portfolio construction a factor earns its weight from its covariance with everything else, not from its own Sharpe ratio, so a mediocre standalone factor can be indispensable as a hedge.

In the replies, eq (@derimonkeyfin) asks whether "Sharpe-optimal" means a mean-variance optimisation, and Green Lark confirms it is, clarifying the objective is the mean-to-standard-deviation ratio. Posted by Green Lark (@the_green_lark) in `this discussion <https://x.com/the_green_lark/status/2067925013575929937>`__.

`Read the post <https://x.com/the_green_lark/status/2067925013575929937>`__.

.. _example-skewness-managed-portfolios:

Skewness Managed Portfolios
---------------------------

This paper studies whether extreme, positively skewed stock returns drive the performance of cross-sectional anomaly portfolios. Using common-stock data from CRSP, Compustat, and the Open Source Asset Pricing database from July 1963 to December 2024, the authors examine 18 well-known anomalies and show that right-tail outliers systematically help or hurt long-short factors depending on whether high-skewness stocks sit in the long or short leg.

Our summary: the paper turns skewness from a diagnostic into a portfolio-construction rule. Each month, realized skewness is forecast from lagged firm characteristics including realized volatility, prior returns, momentum, size, industry, and exchange indicators. The skewness-managed version of each anomaly keeps the original anomaly sort but selects high-expected-skewness stocks for the long leg and low-expected-skewness stocks for the short leg. The adjustment produces significant abnormal returns even when tested against the original anomaly portfolios and standard factor models, implying that linear factor models miss an interaction between higher moments and firm characteristics.

Data and code: the empirical sample uses CRSP common stocks, Compustat, Chen and Zimmermann's Open Source Asset Pricing database, NBER recession indicators, VIX, credit spreads, Ludvigson-Ng macro factors, and Hasbrouck transaction-cost estimates. The paper describes the construction in detail but does not provide a public code repository.

Key metrics: across the 18 anomalies, skewness management raises annual returns by an average of 5.45 percentage points and Sharpe ratios by 0.12. The largest return gains are Value/BM (+9.75 percentage points) and Investment (+9.04 percentage points); spanning-regression alphas average about 6.7% annually and are significant for 14 of 18 anomalies. After transaction-cost estimates, average improvement falls to 1.58 percentage points but remains significant for Size, BM, and Investment. An equal-weighted managed anomaly portfolio grows $1 to about $530 by December 2024 versus $22 for the standard portfolio, with the incremental premium averaging 20.4% annually in NBER recessions versus 3.7% in expansions.

By Rui Gong, John Lynch, and Richard Ogden.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6913978>`__

Bank Stocks and Multifactor Models
----------------------------------

James W. Kolari, Wei Liu, Huiling Liao, and Hilal Anwar Butt investigate whether the multifactor models developed to price nonfinancial stocks can also price bank stocks — a question that matters because Fama and French excluded financial firms from their original three-factor work (banks' book equity is very low relative to nonfinancials), leaving a gap in the literature just as banking has grown from roughly $1.4 trillion in assets in 1980 to over $24 trillion by 2025. Using standard Fama-MacBeth cross-sectional regressions on CRSP daily returns from 1986 to 2023, they comparatively test the CAPM plus five well-known multifactor models against the Mean Variance Pricing (MVP) model of Kolari, Huang, Liu, and Liao (2025) — a parsimonious two-factor model whose factors are (1) the cross-sectional excess market return (beta risk) and (2) the cross-sectional standard deviation of returns, i.e. market return dispersion (so-called zeta risk).

Our summary: the headline is that bank stocks are far less anomalous to conventional asset-pricing factors than previously believed. As size, value, profitability, capital-investment, and momentum factors are progressively added to multifactor models, their ability to price bank portfolios markedly improves and average mispricing errors decline — but the two-factor MVP model normally outperforms the larger models on both goodness-of-fit and factor-loading significance, most clearly for size-sorted portfolios. A notable wrinkle is that CAPM market beta is significantly priced in bank returns but carries the "wrong" (negative) sign relative to theory. The authors reconcile MVP's edge by arguing that long/short factors in multifactor models are rough proxies for the cross-sectional distribution (dispersion) of returns and are therefore subsumed within MVP's total-market-dispersion factor. Augmenting models with interest-rate factors (term and credit spreads) helps size-sorted portfolios but not portfolios sorted on other market risks. This is an empirical asset-pricing study, not a trading strategy, so it reports pricing fit rather than backtested P&L.

Used data and code: daily bank-stock returns from CRSP (1,471 RSSD-PERMCO links, June 1986 to September 2023; return sample January 1986 to December 2023), with size, value, momentum, profitability, and investment factors from Kenneth French's data library and the market-dispersion factor computed as the value-weighted cross-sectional standard deviation of all US stock returns each day. Test assets are 25 size-sorted, 25 beta-sorted, 25 zeta-sorted, and 25 beta-zeta sorted equal-weighted bank portfolios. No public code repository is provided.

Key metrics: mean bank returns fall monotonically with size, from about 0.19% per day for the smallest banks to 0.05% per day for the largest. In out-of-sample cross-sectional tests on size-sorted bank portfolios the MVP model reaches an R² of roughly 99% with zeta-risk factor loadings whose t-statistics exceed 4, and it delivers smaller average mispricing errors than the competing multifactor models across the test-asset sets. JEL: G12, C20.

Mentioned by `Darren (@ReformedTrader) <https://x.com/ReformedTrader/status/2079644067231846804>`__ in a discussion where he highlights the paper's finding that "as factors are added to multifactor models, their ability to price bank stocks substantially improves," while "a recently proposed two-factor model outperforms other multifactor models."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6984958>`__

Estimation of Factors Using Higher-Order Multi-Cumulants in Weak Factor Models
--------------------------------------------------------------------------------

Guanglin Huang (SWUFE, Vrije Universiteit Brussel), Wanbo Lu (SWUFE) and Kris Boudt (Ghent, VUB, VU Amsterdam) attack a specific failure mode of statistical factor extraction: when factors are weak — that is, when loadings are spread thinly across the cross-section rather than concentrated — covariance-based methods such as PCA estimate them poorly. Their proposal, Higher-order multi-cumulant Factor Analysis (HFA), replaces the covariance matrix with a higher-order multi-cumulant matrix, estimating factors and loadings from the eigenvalue decomposition of the product of that matrix and its transpose. The asymptotic theory is derived under a weak factor model in which non-Gaussianity originates solely from the latent factors while idiosyncratic errors remain Gaussian, generalising the linear non-Gaussian factor model of Risk et al. (2019). The paper also supplies an Adaptive variant (AHFA) that automates the choice between PCA and HFA, collapsing to PCA when the higher-order structure offers nothing.

Our summary: the useful insight is that non-Gaussianity is an exploitable resource rather than a nuisance. Second moments discard information that third and fourth cumulants retain, and when the factor signal is too weak for the covariance matrix to separate it from idiosyncratic noise, that discarded information is exactly what makes recovery possible. This puts the paper alongside :doc:`Spectral Factor Models <./signal-decomposition>` as a second argument that the standard covariance-eigenvector recipe throws away structure a practitioner can use — one exploiting frequency, this one exploiting higher moments. Two properties make it more practically deployable than most econometric proposals of this kind. AHFA degrades gracefully by design: because it reduces to PCA when higher-order structure is absent, adopting it is close to a free option rather than a bet on non-Gaussianity holding. And the empirical setting is honest about its own applicability — the authors note FRED-MD exhibits both weak factor strength *and* pronounced non-normality in the extracted factors, which is precisely the regime HFA targets, so the result should not be read as evidence that HFA helps everywhere. The important caveat sits in the results table: the advantage over PCA depends on which criterion is used to choose the number of factors, and under the JJR criterion it largely disappears. Factor-count selection and estimation method are not separable decisions here.

Data and reproduction: the empirical work uses FRED-MD (McCracken and Ng, 2016), a monthly panel of 124 US macroeconomic and financial variables after dropping series with more than 30 missing values, spanning January 1959 to December 2018. Equity premium forecasts are one-month-ahead on rolling windows of 310 observations, evaluated over two out-of-sample periods — a pre-crisis window from January 1985 to October 2007, and a crisis-and-post-crisis window thereafter — with Diebold-Mariano tests on forecast differences. Simulations use 500 replications per setting with factor distributions calibrated to FRED-MD. The **R code is publicly available in the** ``hofa`` **package**, and further results sit in an online supplementary appendix. The published version is paywalled at Taylor & Francis; the near-final working paper (same title, dated 10 March 2026) is freely available on SSRN as abstract 3599632, which is the version catalogued here.

Key metrics: for one-month-ahead S&P 500 equity premium forecasts under the AGER factor-selection criterion, HFA4 achieves a full-sample out-of-sample R² of 0.055 (MSE 11.960) and AHFA 0.054 (11.978), against 0.025 for PCA (12.338) and 0.030 for JMCA (12.286), with the MSE ratios significant under Diebold-Mariano. The gap is widest in the crisis-and-post-crisis window, where PCA turns **negative** at −0.006 — worse than the historical-average benchmark — while HFA4 and AHFA both hold 0.044. Under the ER criterion the ordering is preserved (HFA4 0.053 full sample versus PCA 0.029), but under the JJR criterion it collapses: AHFA 0.024 against PCA 0.027, with no significant MSE improvement. In simulations calibrated to FRED-MD, (Adaptive) HFA recovers weak factors more accurately than PCA and improves the proportion of replications selecting the correct number of factors. JEL: G11, G12, G15.

`Read the paper <https://doi.org/10.1080/07350015.2026.2671240>`__

Factor Models and Fama-MacBeth: Explaining Variance vs. Pricing Risk
--------------------------------------------------------------------

A LinkedIn post by Andreas Steiner revisiting a subtle but important distinction in empirical asset pricing: a factor that explains variance in returns is not necessarily priced by the market. The Fama-MacBeth two-pass procedure addresses exactly this distinction and remains one of the most important tools in quantitative finance more than fifty years after its introduction. The first pass estimates each stock's sensitivity to the candidate factors via time-series regression, and the second pass regresses the cross-section of realised returns on those sensitivities period-by-period to extract a factor risk premium, averaged over time and tested with Newey-West standard errors to correct for serial correlation.

The post walks through a worked example using Swiss blue chip stocks. Factors are extracted via PCA from the return covariance matrix, and the Marchenko-Pastur bound provides a principled cutoff for which eigenvalues carry information — six factors clear the noise threshold of 117.24 in this sample. The Fama-MacBeth results are telling: the intercept is negative and significant (a well-documented anomaly), but none of the six factor premia are statistically significant, with large error bars crossing zero in every case. The factors structure the covariance matrix well, but the sample offers no strong evidence that they carry a priced risk premium. The broader lesson is that PCA tells you the directions of maximum variance while Fama-MacBeth tells you whether investors are actually compensated for bearing risk in those directions — two independent questions that only the full two-pass procedure can answer. Exposing yourself to factor risk is necessary but not sufficient to earn factor risk premia, turning the "factor zoo" (Cochrane, 2011) into what Steiner calls a "factor shop".

By Andreas Steiner.

`Read the LinkedIn post <https://www.linkedin.com/posts/andreassteiner_factor-models-are-central-to-empirical-asset-share-7446952080881213440-alFv>`__.

Is Return Seasonality Due to Risk or Mispricing? Evidence from Anomaly Seasonality
----------------------------------------------------------------------------------

Jiaqi Wang reexamines return seasonality in anomaly portfolios using 125 anomaly long-short portfolios and 1,238 corresponding raw portfolios constructed from U.S. equities. The central question is whether the well-documented seasonal patterns in anomaly returns—where certain factors tend to perform well in the same calendar months year after year—reflect genuine time-varying risk premiums or are mechanically inherited from stock-level seasonality through characteristic-based portfolio construction.

Our summary: the paper's main contribution is demonstrating an asymmetric spanning relationship that resolves the interpretation of anomaly seasonality. A seasonality factor constructed directly from individual stocks fully spans the seasonality present in anomaly portfolios, but anomaly-based seasonality factors cannot price seasonality strategies in individual stocks. This means the causation runs from stocks to anomalies, not the other way around: when you sort stocks into portfolios based on characteristics like value or momentum, the seasonal patterns of the individual stocks carry through into the portfolio returns, creating the illusion that the anomaly itself has seasonal risk premiums. For practitioners, this is an important diagnostic: if a factor strategy shows strong calendar-month patterns, those patterns may not represent a tradeable seasonal edge in the factor itself but rather a mechanical artefact of which stocks happen to load on that factor. Before adding a seasonal timing overlay to a factor strategy, one should check whether the seasonality survives controls for stock-level seasonal effects.

Data and code: U.S. equity data covering 125 anomaly long-short portfolios and 1,238 raw portfolios. The paper is 72 pages and available on SSRN. No public code repository was identified at time of writing.

Key metrics: the raw seasonality strategy generates 1.45% monthly alpha. After controlling for anomaly-based factors, alpha drops to 0.86–1.23%. After controlling for a proper stock-level seasonality factor, alpha collapses to 0.27%, indicating that most of what appears to be anomaly seasonality is subsumed by individual stock seasonality. Significant seasonality at annual lags is found across anomaly returns, but the spanning tests show this is inherited rather than intrinsic.

Mentioned by Ivan Blanco (`@iblanco_finance <https://www.linkedin.com/in/iblanco-finance/>`__) in `this discussion <https://www.linkedin.com/feed/update/urn:li:activity:7452728873336811521/>`__: "Most anomalies are just seasonality in disguise. A lot of what the literature calls anomaly seems to be the same calendar effect wearing different costumes."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6441120>`__
