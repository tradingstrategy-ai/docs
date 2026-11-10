.. meta::
   :description: Research papers and posts on order flow imbalance, VPIN, LOB alpha, and microstructure-driven trading signals.

Order Flow
~~~~~~~~~~

Order flow — the signed sequence of buyer- and seller-initiated trades — is the most direct reflection of market participants' intentions and the primary driver of short-term price dynamics. Order flow imbalance (OFI), which measures the excess of buy pressure over sell pressure, has been shown to predict short-term returns with remarkable accuracy across asset classes. The research tradition here spans from Evans and Lyons's foundational work on FX order flow explaining over 50% of exchange rate variation, to modern deep learning approaches that extract alpha from multiple levels of the limit order book simultaneously.

The collection covers OFI measurement at different levels of the order book and different time horizons, VPIN (Volume-Synchronized Probability of Informed Neotarding) as a toxicity measure that predicts price jumps, microstructure features specific to cryptocurrency markets, and the relationship between signed order flow and Bitcoin crash risk. Practical posts cover hands-on implementations of OFI calculation and its use as a trading signal component.

Related topics include :doc:`Market Microstructure <./market-microstructure>` for the theoretical foundations of price formation and market making, :doc:`Statistical Arbitrage <./statistical-arbitrage>` for cross-asset applications of order flow signals, and :doc:`Cryptocurrency <./cryptocurrency>` for Bitcoin-specific market dynamics.

Order Flow and Exchange Rate Dynamics
--------------------------------------

The landmark Evans and Lyons paper demonstrating that FX order flow explains more than 50% of daily exchange rate variation, far more than macroeconomic fundamentals. The paper establishes order flow as the primary short-term price-formation mechanism in currency markets and provides the conceptual foundation for all subsequent work on order flow as a price predictor.

`Read the paper <https://www.nber.org/papers/w7317>`__

Order Flow and Cryptocurrency Returns
--------------------------------------

This paper investigates the role of order flow in explaining and predicting cryptocurrency returns. The authors construct an aggregate "world" order flow measure from 11 major fiat currencies across multiple exchanges and test its explanatory power on a cross-section of 82 cryptocurrencies using panel regressions with controls for established return predictors.

World order flow explains approximately 11% of daily and 20% of weekly cross-sectional cryptocurrency returns, with strong evidence of permanent price impact — indicating that order flow carries genuine information rather than transient liquidity effects. The paper demonstrates that order flow dominates macroeconomic fundamentals for out-of-sample prediction, especially when using non-linear machine learning models. Long-short portfolios constructed from ML forecasts conditioning on daily order flow achieve an alpha of up to 0.79% per day with an annualized Sharpe ratio of 3.63.

By Alexia Anastasopoulos, Nikola Gradojevic, Jiaao Liu, Alex Maynard, and Christos Tsiakas. Published in Journal of Financial Markets (2026).

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5020002>`__

Flow Toxicity and Liquidity in a High Frequency World
------------------------------------------------------

Order flow is toxic when it adversely selects market makers, who may be unaware they are providing liquidity at a loss. This paper by David Easley, Marcos López de Prado, and Maureen O'Hara introduces the Volume-Synchronized Probability of Informed Trading (VPIN) — a real-time, high-frequency metric for estimating the probability that order flow is driven by informed participants. Unlike the earlier PIN model, which requires maximum-likelihood estimation of unobservable parameters, VPIN operates in volume time rather than clock time and uses a novel Bulk Volume Classification (BVC) procedure to classify trade volume as buy- or sell-initiated without requiring tick-level quote data. The metric is updated continuously as volume buckets fill, making it directly applicable to high-frequency and algorithmic trading environments.

The paper's central empirical contribution is the application of VPIN to the May 6, 2010 Flash Crash. The authors demonstrate that the cumulative distribution function of VPIN (CDF(VPIN)) reached its 0.97 threshold more than one hour before the crash, signalling historically elevated order flow toxicity well before the market collapsed. As informed traders concentrated activity on the sell side, market makers faced severe adverse selection. The resulting withdrawal of liquidity amplified the crash dynamics. Beyond the Flash Crash, the authors show that VPIN serves as a useful short-term indicator of toxicity-induced volatility. Practitioner-calibrated thresholds place sustained readings above 0.85 (90th–95th percentile) as operationally significant for liquidity risk monitoring. Subsequent debate — notably by Andersen and Bondarenko (2014) — has questioned the precise timing and predictive power of VPIN around the Flash Crash, arguing that elevated readings occurred partly after the event and reflect a mechanical relationship with trading intensity. The original authors have responded and refined their analysis, but the controversy underscores the importance of understanding VPIN's assumptions before deploying it in production.

Published in the Review of Financial Studies, Vol. 25, No. 5, pp. 1457–1493, 2012.

Mentioned by `0xAlcibiades <https://x.com/0xAlcibiades>`__ in `this discussion <https://x.com/0xAlcibiades/status/2040056013189943678>`__: "In 2010 Easley, Lopez de Prado, and O'Hara built a way to measure this. VPIN."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1695596>`__

The Price Impact of Order Book Events
---------------------------------------

This paper by Rama Cont, Arseniy Kukanov, and Sasha Stoikov demonstrates that a simple linear combination of order book event counts — additions, cancellations, and executions at the best bid and ask — provides a clean measure of order flow imbalance that linearly predicts price changes. The OFI metric defined in this paper became the standard reference for subsequent LOB research.

`Read the paper <https://arxiv.org/abs/1011.6402>`__

Queue Imbalance as a One-Tick-Ahead Price Predictor in a Limit Order Book
--------------------------------------------------------------------------

This paper demonstrates that the imbalance between the bid and ask queue sizes at the best level of the limit order book provides significant one-tick-ahead predictive power for price direction. The metric is computable in real time and provides a valuable signal for high-frequency market making and execution algorithms.

`Read the paper <https://arxiv.org/abs/1512.03492>`__

The Micro-Price: A High-Frequency Estimator of Future Prices
-------------------------------------------------------------

Sasha Stoikov defines the *micro-price* as the limit of a sequence of martingale mid-price estimates conditioned on the order book state. Formally, Pᵗᵐⁱᶜʳᵒ = lim Pᵗⁱ, where Pᵗⁱ = E[M_{τᵢ} | ℱₜ] and τ₁, …, τₙ are the (random) times at which the mid-price next changes. The order book state is summarised by the triple (Mₜ, Iₜ, Sₜ) — mid-price, imbalance Iₜ = Qᵇ/(Qᵇ+Qᵃ), and bid-ask spread Sₜ — and assumed to form a Markov process whose dynamics are independent of the price level. Under these assumptions, the micro-price is a Markovian, martingale, and computationally tractable adjustment to the mid-price.

Our summary: the paper provides a principled answer to the question "what is the fair value of an asset given its order book?" The mid-price is not a martingale because of the bid-ask bounce, and the volume-weighted mid-price *Mʷ = I·Pᵃ + (1−I)·Pᵇ* produces counter-intuitive behaviour (e.g., the "fair" price can move *down* after a cancellation on the ask side). Stoikov's micro-price fixes both issues by iterating the conditional expectation until convergence, yielding a fair value that lives between the bid and ask and reacts smoothly to changes in imbalance and spread. The resulting estimator can be pre-computed as a table indexed by (I, S) and used as a continuous predictive signal rather than a discrete trading trigger. Empirically, it is a better short-term predictor than either the mid-price or the weighted mid-price and serves as a standard building block for high-frequency market making and execution models.

Key metrics: Stoikov reports empirical results on Nasdaq data for liquid stocks showing that the micro-price dominates both the mid-price and the weighted mid-price as a predictor of future mid-price realisations at horizons of a few ticks. The micro-price adjustment can be material — a significant fraction of the spread for imbalanced books — and is reported as a smooth, bounded function of imbalance that vanishes at the extremes.

`Read the paper <https://www.tandfonline.com/doi/full/10.1080/14697688.2018.1489139>`__

Deep Order Flow Imbalance: Extracting Alpha at Multiple Horizons from the Limit Order Book
-------------------------------------------------------------------------------------------

Petter N. Kolm, Jeremy Turiel, and Nicholas Westray apply deep learning to high-frequency return prediction for 115 Nasdaq-listed stocks using the full depth of the limit order book. Their central finding is that models trained on *order flow* features (stationary increments at each level of the book) significantly outperform models trained on raw order book *states* (volumes at each level). They show that simple LSTM and feed-forward neural network architectures trained on multi-level order-flow imbalance features deliver superior predictive performance to more elaborate architectures fed raw state, and the predictions remain useful across multiple forecasting horizons.

Our summary: the paper generalises the Cont–Kukanov–Stoikov OFI idea by (a) extending order flow imbalance beyond the top of book to all quoted levels, (b) making the features properly stationary so that neural networks can learn from them without collapsing, and (c) comparing forecasting performance across horizons rather than at a single fixed lag. The result is a practical recipe for feature engineering in deep microstructure models: instead of feeding raw book snapshots into a network and hoping it learns the right invariance, construct multi-level OFI features first and let the network focus on the nonlinear dynamics. The authors also document cross-sectional heterogeneity — some stocks are "information-rich" with higher predictability, and useful stock-specific forecasts extend to roughly two average price changes.

Key metrics: across 115 Nasdaq stocks, deep OFI models achieve materially higher out-of-sample R² than models trained on raw book states at short horizons (seconds to tens of seconds). Forecasting performance degrades gracefully with horizon but remains significant out to approximately two average mid-price moves per stock. LSTM variants give a modest lift over feed-forward networks once the input is already stationary OFI, suggesting most of the predictable signal lives in the feature construction rather than the architecture.

`Read the paper <https://ideas.repec.org/a/bla/mathfi/v33y2023i4p1044-1081.html>`__

Cross-Impact of Order Flow Imbalance in Equity Markets
-------------------------------------------------------

Rama Cont, Mihai Cucuringu, and Chao Zhang investigate cross-asset order-flow-imbalance effects in a multi-asset equity setting. They propose a systematic way to combine OFIs at the top levels of the limit order book into an integrated OFI variable and test whether lagged cross-asset OFIs add predictive power for future returns beyond the contemporaneous impact of own-asset OFI.

Our summary: once you have properly integrated multi-level own-OFI, cross-asset contemporaneous cross-impact vanishes — sparse single-asset models explain as much as dense cross-impact models. However, lagged cross-asset OFI does improve short-horizon return forecasting, and that lead-lag information decays rapidly. Practical takeaway: for contemporaneous price-impact modelling, focus on own-asset multi-level OFI; for short-horizon return prediction, a small amount of lagged cross-sectional OFI adds value.

Key metrics: integrated multi-level OFI materially outperforms best-level OFI for contemporaneous impact; lagged cross-asset OFIs add meaningful forecasting power over short horizons with rapid decay.

`Read the paper <https://arxiv.org/abs/2112.13213>`__

Bitcoin Wild Moves: Evidence from Order Flow Toxicity and Price Jumps
---------------------------------------------------------------------

Atiwat Kitvanitphasu et al. study the dynamic relationship between order-flow toxicity (measured via VPIN) and Bitcoin price jumps using high-frequency data in a vector autoregression framework.

Our summary: this is the single most directly relevant paper for "can microstructure features predict future large crypto moves?" Unlike the bulk of the OFI/LOB literature, which is pinned to horizons of seconds to a few price changes, this paper explicitly shows that VPIN predicts future Bitcoin price jumps in a VAR framework — not just contemporaneously. It also documents positive serial correlation in both VPIN and jump size and time-of-day and day-of-week patterns in VPIN levels.

Key metrics: VPIN Granger-causes Bitcoin jump occurrence and size in a bipolar VAR; positive autocorrelation in VPIN and in jump magnitudes; significant time-of-day / day-of-week seasonality in VPIN levels.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0275531925004192>`__

High-Frequency Jump Analysis of the Bitcoin Market
---------------------------------------------------

Olivier Scaillet, Adrien Treccani, and Christopher Trevisan use the leaked Mt. Gox database — covering June 2011 through November 2013 with trader identifiers at a tick-transaction level — to study the jump dynamics of Bitcoin.

Our summary: this is the foundational jump-clustering paper for Bitcoin and a primary reference for anyone modelling crypto microstructure tail events. The authors document that jumps are frequent and temporally clustered, and they identify specific microstructure precursors — elevated order-flow imbalance, an increased share of aggressive (liquidity-taking) traders, and a widening bid-ask spread — that predict jump arrivals.

Key metrics: jumps are frequent and cluster in time; OFI, aggressive-trader share, and widening bid-ask spread all predict jump arrivals with statistically significant coefficients.

`Read the paper <https://arxiv.org/abs/1704.08175>`__

Good and Bad Self-Excitation in Bitcoin: Asymmetric Self-Exciting Jumps
-----------------------------------------------------------------------

Chuanhai Zhang et al. model asymmetric self-exciting jump clustering in Bitcoin returns using a bivariate Hawkes-type jump process that separates positive ("good") and negative ("bad") jumps. The paper studies how each jump type contributes to subsequent jump intensity.

Our summary: this paper formalises the intuition that Bitcoin's tail risk is skewed — bad news begets more bad news faster than good news begets more good news. The bivariate Hawkes setup allows separate branching ratios for good and bad jumps and tests whether they are different. The empirical answer is clear: negative self-excitation is strictly stronger than positive self-excitation.

`Read the paper <https://www.sciencedirect.com/science/article/abs/pii/S0264999322003613>`__

Nowcasting Bitcoin's Crash Risk with Order Imbalance
-----------------------------------------------------

Dimitrios Koutmos and Wang Chun Wei build an early-warning system for Bitcoin price crashes using generalized extreme value (GEV) and logistic regression models integrating order-flow imbalance with blockchain-activity and network-value controls.

Our summary: this is the clearest-cut empirical study of order imbalance as a crash predictor on Bitcoin at the daily horizon. The best logistic specification reaches a McFadden pseudo-R² of 30.74%, with the GEV variant at 29.95% — both extremely high for a binary daily crash model.

Key metrics: McFadden pseudo-R² of 30.74% (logistic) and 29.95% (GEV) on the best specification; OFI materially improves crash nowcasting versus on-chain and network-value controls alone.

`Read the paper <https://pmc.ncbi.nlm.nih.gov/articles/PMC10040314/>`__

Multi-Level Order-Flow Imbalance in a Limit Order Book
-------------------------------------------------------

Ke Xu, Martin D. Gould, and Sam D. Howison (University of Oxford) define multi-level order-flow imbalance (MLOFI) as a vector quantity that tracks the net buy-sell flow at each quoted price level of a limit order book, not just the best bid and ask.

Our summary: this is the canonical extension of Cont–Kukanov–Stoikov's top-of-book OFI to the full book depth. The authors find monotonic R² improvements for every one of the 6 stocks tested as levels are added, which is strong evidence that resting liquidity deeper in the book carries real information about the short-term price-formation process.

Key metrics: out-of-sample R² monotonically improves with each additional price level for all 6 Nasdaq stocks tested.

`Read the paper <https://arxiv.org/abs/1907.06230>`__

Deep Limit Order Book Forecasting
----------------------------------

Antonio Briola, Silvia Bartolucci, and Tomaso Aste (University College London) use state-of-the-art deep learning models to forecast short-horizon mid-price moves from limit order book data. They release LOBFrame, an open-source codebase for large-scale LOB processing and deep model benchmarking, and introduce a novel operational evaluation metric based on the probability of accurately forecasting complete transactions.

Our summary: this is the paper to cite whenever someone claims a high-accuracy deep LOB model. The stark headline: "high forecasting power does not necessarily correspond to actionable trading signals."

`Read the paper <https://arxiv.org/abs/2403.09267>`__

Order Flow Analysis of Cryptocurrency Markets
----------------------------------------------

An analysis of Level II order book data from the BitMEX XBTUSD perpetual swap contract, examining how order flow imbalance influences price changes in cryptocurrency markets. The post defines and compares two measures: order flow imbalance (OFI), computed from changes in best bid/ask prices and quantities, and trade flow imbalance (TFI), computed from actual executed trades.

The key finding is that trade flow imbalance explains up to approximately 75% of price changes at hourly horizons — substantially higher than OFI at longer timescales. The analysis notes that crypto order books are particularly noisy due to spoofing and rapid cancellations, making trade-based measures more reliable than order-book-based ones.

By Ed Silantyev.

`Read the blog post <https://medium.com/@eliquinox/order-flow-analysis-of-cryptocurrency-markets-b479a0216ad8>`__

.. _example-order-flow-imbalance-a-high-frequency-trading-signal:

Order Flow Imbalance — A High Frequency Trading Signal
-------------------------------------------------------

A step-by-step walkthrough of calculating order flow imbalance (OFI) from order book data and evaluating it as a high-frequency trading signal. Using Bitcoin data from Coinbase, the post builds a linear regression model to predict short-term returns from OFI.

The OFI metric shows statistical significance in predicting price direction with an out-of-sample R² of approximately 3% and a hit ratio of 53%. However, the standalone Sharpe ratio of 0.12 is far below profitable thresholds. The practical takeaway is that OFI is better suited as an input to market-making or execution algorithms rather than as a standalone directional signal.

By Dean Markwick.

`Read the blog post <https://dm13450.github.io/2022/02/02/Order-Flow-Imbalance.html>`__

Aperiodic: Democratizing Crypto Order Flow, Liquidity & Market Microstructure Metrics
-------------------------------------------------------------------------------------

An announcement and technical overview of Aperiodic, a cryptocurrency data platform designed to democratize access to institutional-grade market microstructure metrics. The authors identify a significant gap in the crypto data market where existing platforms provide incomplete solutions: building quantitative strategies requires point-in-time data, comprehensive liquidity metrics, unique microstructure indicators, full exchange coverage without survivorship bias, and locally-timestamped time series — and existing providers typically offer only one or two of these.

Aperiodic provides over 100 metrics including deep L2 order book imbalances across multiple depth levels, flow entropy (Shannon entropy measuring order flow predictability — low entropy indicates structured, trend-friendly markets; high entropy suggests choppy, mean-reverting conditions), slippage against live order books, Kyle Lambda (price impact per unit of signed order flow), and large trade reversal metrics distinguishing informed flow from uninformed liquidity-driven flow. The platform delivers pre-signed parquet files enabling unlimited concurrent downloads, with a lightweight Python wrapper for simplified access. This eliminates the need for organizations to independently purchase, store, and maintain terabytes of raw tick data.

By Mark Aron Szulyovszky and Daniel Szemerey.

`Read the blog post <https://blog.unravel.finance/p/aperiodic-democratizing-crypto-order>`__

Most-Predictive: Which Microstructure Metric Best Forecasts Short-Term Crypto Returns
-------------------------------------------------------------------------------------

An interactive notebook from Aperiodic that tackles a deceptively simple question: across the full catalog of crypto microstructure metrics — order flow, book imbalance, funding rates, trade size distributions, spread dynamics — which single metric is the most predictive of short-term returns? The notebook provides a reproducible framework for ranking dozens of pre-aggregated metrics by their forecasting power across instruments and horizons, letting users run the same analysis to surface similar signals on their own.

The approach works because crypto perpetual futures have a relatively transparent microstructure where aggressive (taker) order flow is the primary short-term price driver. Market makers continuously adjust quotes in response to net buy/sell pressure, so metrics that capture directional flow imbalance — the difference between taker buy and taker sell volume — tend to carry strong predictive signal over intrabar and multi-bar horizons. Unlike derived indicators built on price alone, order flow metrics observe the cause (aggressive trading activity) rather than the effect (price movement), giving them a structural information advantage. The notebook demonstrates this empirically: flow-based features dominate book-state and derivatives-based features in out-of-sample predictive power, consistent with the broader academic literature on order flow and cryptocurrency returns. For practitioners, the key takeaway is that a single, well-constructed order flow metric can outperform complex multi-factor models for short-horizon alpha, especially in instruments with high taker-driven volume like BTC and ETH perpetuals.

The notebook sits within a broader framework described by the same author in `How Speculative Money Flows into Crypto <https://blog.unravel.finance/p/how-speculative-money-flows-into>`__, which maps the full chain of crypto liquidity drivers from the outside in: macro-level speculative flow (measured via Bitcoin's rolling correlation with gold versus tech equities), ecosystem-level capital inflows (stablecoin exchange deposits tracked across 40+ exchanges, spot ETF netflows), and leverage proxies (perpetual funding rates, liquidation volumes, long/short ratios, margin borrow rates). Each layer operates on a different timescale — macro factors are slow-moving regime indicators, stablecoin flows are medium-frequency positioning signals, and microstructure metrics like order flow imbalance update tick-by-tick.

This layered view explains why the "most predictive" metric for short-term returns comes from the innermost ring: at the shortest horizons, the macro and ecosystem layers are essentially constant, so all the predictive variation concentrates in order-level activity. The framework also highlights the risk management application — when ecosystem-wide leverage is elevated and capital inflows are drying up, even a small shock can cascade into forced liquidations. A composite speculative flow index that combines metrics across these layers shows meaningful predictive power for medium-term drawdown risk, complementing the short-horizon alpha signal that the most-predictive notebook isolates.

Mentioned by `Mark Aron Szulyovszky <https://www.linkedin.com/in/almostintuitive/>`__ in `this discussion <https://www.linkedin.com/posts/almostintuitive_its-kind-of-an-open-secret-in-crypto-microstructure-share-7444821512399781888-EEfI>`__: "It's kind of an open secret in crypto microstructure: one metric predicts short-term returns better than almost anything else."

By `Aperiodic <https://aperiodic.io>`__.

`Run the notebook <https://aperiodic.io/notebooks/most-predictive>`__

One-Sided Flow Becomes Toxic When the Market Moves With It
----------------------------------------------------------

A short note from Aperiodic introducing its *flow toxicity score*, a crypto order-flow metric that estimates how likely it is that the aggressive flow hitting the book is informed. The idea comes from VPIN (see *Flow Toxicity and Liquidity in a High Frequency World* earlier in this file), which measures order imbalance in volume time and links it to liquidity providers pulling back. Aperiodic's version is deliberately simpler and works on ordinary time bars, so it can sit alongside other bar-based features without building volume buckets or classifying trades in bulk.

The score is defined as past-normalized signed notional flow multiplied by past-normalized short-horizon realized volatility. Normalizing each input against its own history turns both into z-score-like quantities, and multiplying them means the score only spikes when both are abnormal at once. The author's point is that one-sided trading on its own is not necessarily informative, and neither is volatility, even though the two are correlated. What matters is the moment when aggressive flow is both unusually one-sided and moving the price, the point at which the market struggles to absorb it and market makers are most likely trading against informed or urgent flow. The accompanying chart shows the three series side by side: a burst of signed flow and a volatility spike line up, and the toxicity score rises to around 4σ only where they overlap. Compared with VPIN, this is a signed measure, so it shows which side the toxic flow came from as well as how strong it was. The score is served as one field of Aperiodic's `flow metrics <https://aperiodic.io/catalog/flow>`__, alongside volume delta, flow entropy and taker size-bucket breakdowns, as part of the platform's 100+ point-in-time microstructure, flow and liquidity metrics.

By `Mark Aron Szulyovszky <https://www.linkedin.com/in/almostintuitive/>`__ (`Aperiodic <https://aperiodic.io>`__).

`Read the post <https://www.linkedin.com/feed/update/urn:li:activity:7511449664941064192/>`__

Beyond Anonymous Order Flow: Wallet Identity as a Feature for Short-Horizon Return Prediction
---------------------------------------------------------------------------------------------

Public order-book data summarises trading without identifying the accounts behind it, but Hyperliquid's Level-4 record also exposes persistent pseudonymous wallet addresses. The authors reconstruct full-depth books from consensus-ordered messages and test wallet identity as a feature for short-horizon return prediction, asking whether wallet markout rankings persist across disjoint windows and whether the activity of previously high-ranked wallets improves forecasts beyond a literature-based anonymous benchmark. Accepted at ACM ICAIF '26.

The study scores wallets on July 1-10, 2026, fits models on July 11-20 and evaluates on July 21-27. A wallet's score is its notional-weighted ten-second signed markout on aggressive orders, excluding TWAP and liquidation events, and the 231 top-decile wallets among the 2,314 scored form the "toxic" cohort. The authors stress that this is a descriptive label and not a claim of private information. A ten-variable anonymous block covers prices, quotes and flow. Eleven identity variables then add cohort versions of the quote and flow measures, plus wallet-only measures such as distinct-buyer breadth and the cohort's share of best-quote depth. Ridge and LightGBM forecast forward midpoint returns on a 100 ms grid for BTC, ETH and SOL, chosen to match the venue's block clock (median gap 67.6 ms).

Top-decile markouts keep rising after the trade, from 1.25 bp at half a second to 2.11 bp at ten seconds, and stay elevated at five minutes, which argues against purely transient price pressure. Simple latency arbitrage against the venue's oracle does not explain them either, as top-decile orders trade on the side of the oracle gap only 41.3% of the time against 57.9% for the bottom decile. That check uses an oracle polled every ten seconds, so it cannot rule out sub-second cross-venue arbitrage. Identity features alone reach 10.06% R-squared at one second, close to the anonymous block, while the two combined add only 1.43 points. The authors therefore note that the two blocks largely span each other and that identity may partly be a lower-noise readout of the same flow. Drop-one refits fit this: near-touch imbalance contributes 1.93 points in the anonymous model but only 0.24 once identity is added.

The paper is unusually open about its limits. The top-decile focus, the near-touch volatility scaling and the July evaluation window were all selected after results were available, so the authors call it a chronological out-of-sample comparison and not a prospectively locked test, and treat the *t*-statistics as descriptive. The December 2025 replication is specification-dependent: without the volatility scaling, its one-second ridge increment is -1.17 percentage points. The evaluation covers only seven days, carries states forward across data gaps, and indexes timing by consensus timestamp and not by audited receipt time. The anonymous benchmark is also deliberately non-maximal, and richer predictors may shrink the increment.

**Data and code.** July 1-27, 2026 Hyperliquid Level-4 data collected by the authors through a non-validating node: 17.1 billion messages, 14.3 million aggressive orders by 147,113 wallets and $84.3 billion in taker notional across ten perpetual markets, with estimation on BTC, ETH and SOL only. The December 2025 comparison uses the public release of `An Open Book: Level 4 Order Book Data from the Hyperliquid Exchange <https://doi.org/10.5281/zenodo.18184441>`__. The paper links no code repository and does not state that the July dataset is available, so the headline results cannot be reproduced directly.

**Key metrics.** The paper reports forecasting fit only and no annualised return, Sharpe, maximum drawdown or win rate. It states that it does not establish executable profit, which would still depend on latency, queue priority, fill probabilities, spreads, fees and inventory.

- Score persistence: Spearman rank correlation of 0.52 across adjacent ten-day windows (965 wallets), with an adjusted validation markout of 3.11 bp in the top ventile
- One-second out-of-sample R-squared, ridge: 10.88% to 12.31% (+13.2%, *t* = 9.2)
- One-second out-of-sample R-squared, gradient-boosted trees: 19.48% to 20.65% (+6.0%, *t* = 5.0)
- Horizon decay of the relative gain, 200 ms to 30 s: 18.7% to 3.0% for ridge, 10.7% to 2.7% for trees
- Placebo: the 1.43-point increment compares with 0.88 for the best of 200 activity-matched cohorts, although those cohorts are slightly smaller
- Peer-adjusted score: a smaller one-second ridge gain of 6.8%
- Feature delays of 200 and 300 ms: ridge gains of 10.2% and 9.1%, while the anonymous R-squared falls to 6.40% at 300 ms
- December 2025 sample with the same volatility-scaled specification: 12.36% to 14.16% (+14.6%, *t* = 3.9)

Mentioned by `Quant Beckman <https://x.com/quantbeckman>`__ in `this discussion <https://x.com/quantbeckman/status/2118231160841007524>`__, who notes that the study does separate wallet scoring, model fitting and evaluation chronologically, but that the authors disclose choosing the top-decile focus, volatility scaling and evaluation window after results were available.

By Jingqiu Ding and Daojing Zhai.

`Read the paper <https://arxiv.org/abs/2611.05218>`__

Order Book Imbalance and the Direction of the Next Mid-Price Change: Evidence from Nasdaq TotalView-ITCH
--------------------------------------------------------------------------------------------------------

VisualHFT Research tests whether order book imbalance, as computed by the VisualHFT order book visualization application, predicts the direction of the next mid-price change. On four held-out days, under a pre-analysis plan fixed before their outcomes were computed, the sign of the reading matched the next change 55.1% of the time against a base rate of 50.0%, over 7.7 million events among the 100 most active Nasdaq-listed stocks of each day. The relation is stronger at a one-tick spread, for lower-priced stocks and for mid-price changes that arrive soonest, and it survives controls for the last mid-price change and recent signed volume.

Our summary: the paper takes the queue-race model of Avellaneda, Reed and Stoikov and of Cont and de Larrard as its theory. At a one-tick spread the mid price moves only when one of the best queues empties, and the shorter queue tends to lose the race. From this the authors derive five testable predictions: direction, a stronger relation at a one-tick spread, a stronger relation for large-tick (cheap) stocks, information beyond the last price change and recent trades, and a weaker relation the longer the next change takes. The measure is a distance-weighted imbalance over ten book levels per side, with weights that fall with distance from the best quote measured in running-median spreads. It covers more than the two best queues the model uses, so the extra levels act partly as measurement error. The paper's main strength is its discipline. The measure's settings were chosen on a different day in an earlier study. The hold-out days, the six hypotheses, the pass rule (p < 0.01 and at least 3 percentage points, pooled and on each day) and every robustness check were committed before any hold-out day was replayed. The tests use Holm familywise correction with standard errors clustered by stock. All five predictions and the shape test are supported. One-parameter independent-queue calibration fails, however: the data are steeper near zero and flatter at the extremes than the arctan form allows.

The practical conclusion is negative for directional taker trading. The next mid move, signed by the reading, averages 0.186 ticks against a mean half spread of 5.73 ticks (0.15 against 0.50 at a one-tick spread). Crossing the spread to act on the reading pays more on entry than the predicted move. The authors suggest the signal may still be useful for passive decisions such as where to rest orders and when to cancel them, but they do not test this. Their own classification puts the evidence in the middle "mechanism" class, not the "tradeable" class. Two caveats: the book and mid price are Nasdaq-only rather than the consolidated NBBO, and 40.8% of next changes arrive within one millisecond, so the results assume zero reaction latency. Check (f), which keeps only changes at least 1 ms after the reading, still gives a slope of 0.183. VisualHFT builds and sells the software whose measure is studied, a conflict of interest the paper discloses.

Data and code: seven full days of Nasdaq's public TotalView-ITCH 5.0 sample files (2019-01-30 to 2020-01-30, four of them held out), plus a 2023-08-22 packet capture held by VisualHFT that is reported separately. The imbalance code (ImbalanceCalculator.cs, SpreadScaleResolver.cs, P2Quantile.cs) is open source in the `VisualHFT repository <https://github.com/visualHFT/VisualHFT>`__. The replay program, analysis code and pre-analysis plan are available to researchers on request, and their commit hashes and SHA-256 digests are printed in the appendix.

Key metrics:

- Pre-registered hold-out test, 4 days, 7,722,048 events, 183 stocks: hit rate 55.1% against a base rate of 50.0%, difference 5.02 pp (s.e. 0.30, z = 16.9, 99% CI 4.26 to 5.79 pp); each day passes on its own (4.88 to 5.11 pp), and the difference is positive for 99% of stocks
- Linear probability slope of P(up) on the reading, 7 pooled day files, 14.8M events: 0.202 (t = 14.4); 0.180 (t = 18.3) with controls for the last change and signed volume, retaining 89%
- Slope by spread: 0.413 at one tick against 0.134 at 11+ ticks; one-tick hit rate 59.9% (+9.9 pp)
- Price interaction: −0.058 per tenfold increase in price; time-to-change interaction: −0.021 per tenfold increase in time
- Calibration: share of up moves rises from 40.2% in the lowest reading bin to 60.8% in the highest; fitted arctan attenuation λ = 0.302, with gaps of up to 6.6 pp in the tails
- Replication: positive, significant slope on all 7 days (0.179 to 0.234); capture day 0.244, hit rate 56.0%
- Economic magnitude: mean signed move 0.186 ticks against a mean half spread of 5.73 ticks (ratio 0.032); 0.181 against 5.37 (ratio 0.034) on the hold-out days

By VisualHFT Research.

`Read the paper <https://visualhft.com/research/lob-imbalance>`__
