.. meta::
   :description: Research papers and posts on carry trade strategies, funding rate arbitrage, and basis trading in crypto and FX markets.

Carry Trade
~~~~~~~~~~~

Carry trade strategies profit from return differentials between assets: borrowing in low-yield instruments and investing in high-yield ones. In traditional FX markets, this means borrowing low-interest-rate currencies and investing in high-interest-rate ones. In cryptocurrency markets, carry trade takes the form of funding rate harvesting — capturing the premium embedded in perpetual futures funding rates — and cash-and-carry basis trading, where traders simultaneously hold spot and short futures positions to capture the basis. These strategies are fundamentally linked to risk premia embedded in the term structure of asset returns.

This collection covers the theoretical foundations of carry in cross-sectional and time-series contexts, empirical evidence on FX carry premia, geopolitical risk's impact on currency returns, and the specific mechanics of crypto carry trades. The crypto literature examines how perpetual futures returns decompose into directional and funding components, how to construct delta-neutral funding rate harvesting strategies, and how carry signals interact with momentum and basis for risk factor decomposition.

Related topics include :doc:`Cryptocurrency <./cryptocurrency>` for broader crypto asset pricing research, :doc:`Statistical Arbitrage <./statistical-arbitrage>` for related relative-value strategies, and :doc:`Market Regimes <./market-regimes>` for regime-conditional carry exposure management.

For complete worked examples of trading strategies and individual factors, see :doc:`Strategy Examples <./strategy-examples>` and :doc:`Factor Examples <./factor-examples>`.

Dissecting Investment Strategies in the Cross Section and Time Series
---------------------------------------------------------------------

Jamil Baz, Nicolas Granger, Campbell R. Harvey, Nicolas Le Roux, and Sandy Rattray compare time-series and cross-sectional implementations of carry, momentum, and value across asset classes. Rather than treating the two portfolio constructions as interchangeable wrappers around the same anomaly, the paper studies when each representation works best and how the underlying market environment changes the relative edge.

Our summary: this is one of the clearest practitioner-academic bridges in the momentum literature. The important contribution is not merely that both time-series and cross-sectional versions can work, but that they load on different economic structures. Time-series approaches are better aligned with persistent directional trends, while cross-sectional portfolios often shine when dispersion across assets is more informative than the market's aggregate direction. For anyone designing trend systems, this paper is a reminder that "signal" and "portfolio construction" are inseparable design choices.

Key metrics: the paper does not reduce the result to a single headline Sharpe ratio because the focus is comparative across carry, momentum, and value in both time-series and cross-sectional form. Its main empirical claim is that market conditions materially affect which implementation dominates, and that the choice is strategy- and regime-dependent rather than universal.

`Read the paper <https://www.cmegroup.com/education/files/dissecting-investment-strategies-in-the-cross-section-and-time-series.pdf>`__.

Enhancing FX Portfolio Allocations through Reinforcement Learning
--------------------------------------------------------------------------

This paper introduces a model-free Reinforcement Learning (RL) framework for portfolio allocation across Foreign Exchange (FX) assets, with a particular focus on carry trade strategies. The study examines whether RL-based approaches can yield distinct outcomes compared to traditional portfolio allocation techniques, such as Mean-Variance Optimization (MVO). The objective is to evaluate the performance of an RL agent in constructing a portfolio driven by FX carry signals and benchmark it against MVO. This work contributes to the literature by demonstrating the adaptability of RL to dynamic FX environments and its potential to outperform static optimization methods under varying market conditions.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6004794>`__

Geopolitical Risk in Currency Markets
---------------------------------------

This paper by Alessandro Melone (Ohio State University) and Andreas Stathopoulos (UNC Chapel Hill) documents that geopolitical risk is a priced factor in the cross-section of currency returns. The authors sort currencies into five portfolios based on the rolling forecast coefficient of their excess returns on Caldara and Iacoviello's (2022) Global Geopolitical Threats (GPT) index. The resulting long-short strategy, GHML (Geopolitical High Minus Low), invests in currencies with high geopolitical exposure and shorts those with low exposure. GHML is nearly orthogonal to standard currency risk factors (DOL and CAR), representing a genuinely new source of systematic variation in FX markets.

The paper further links geopolitical risk factor loadings to international capital flows: countries that attract higher-than-average net capital flows during geopolitical turmoil have currencies that hedge geopolitical risk ("safe havens"), while countries experiencing capital outflows have geopolitically risky currencies ("danger zones"). Safe haven currencies carry a GHML loading 0.32 lower than danger zone currencies. Importantly, geopolitical factor loadings are unrelated to policy uncertainty measures like the Economic Policy Uncertainty (EPU) index or the Trade Policy Uncertainty (TPU) index, establishing geopolitical risk as a distinct phenomenon.

Key metrics: The GHML strategy yields an annualised excess return of 3.28%, with an annualised standard deviation of 8.37% and a Sharpe ratio of 0.39. After controlling for dollar (DOL) and carry (CAR) factors, the annualised alpha is 2.76%, with the regression adjusted R-squared for GHML at just 2% — confirming the factor is essentially unexplained by existing currency risk models. Portfolio GHML loadings increase monotonically from -0.49 (Portfolio 1) to 0.51 (Portfolio 5). The sample covers 41 developed and emerging market currencies from February 1988 to December 2024 (443 monthly observations).

Mentioned by `Ivan Blanco <https://www.linkedin.com/in/ivanblancosanchez>`__ in `this LinkedIn discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-geopolitical-risk-is-a-priced-share-7442578033414410240-Qbes>`__: "New research: geopolitical risk is a priced factor in the cross-section of currency returns."

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6438919>`__

Anatomy of Cryptocurrency Perpetual Futures Returns
----------------------------------------------------

Yi Cao, Pengfei Luo, Yuhan Cheng, and Yizhe Dong (University of Edinburgh) develop a cost-of-carry model tailored specifically to perpetual contracts and use it to decompose perpetual futures returns into a spot premium, a log basis, and an expected funding spread. They then run the most comprehensive horse race to date of candidate return predictors in the cross-section of crypto perpetuals, testing 134 signals drawn from the basis, momentum, volume, size, and volatility literatures.

Our summary: this is the paper to cite when arguing that basis is the dominant cross-sectional predictor in crypto perpetual futures. Of the 134 candidates tested, 48 deliver statistically significant cross-sectional spreads at the 5% level, and every single one of them is spanned by a two-factor model built from a basis factor and a price–volume factor. In other words, after controlling for basis and price–volume, no other signal in their universe carries incremental predictive power. This is a strong empirical argument for placing the perp-spot basis at the centre of any cross-sectional crypto strategy and treating other signals as secondary.

Key metrics: cross-sectional sorts on basis deliver statistically significant long-short spreads in perpetual futures returns, and the basis factor is the single strongest predictor among the 134 candidates tested. The two-factor (basis + price–volume) model prices all 48 significant anomalies with zero significant alphas. The paper does not report a single headline Sharpe but documents the basis factor as economically and statistically dominant.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6365329>`__

An Empirical Investigation on Risk Factors in Cryptocurrency Futures
--------------------------------------------------------------------

Yeguang Chi, Wenyan Hao, Jiangdong Hu, and Zhenkai Ran (Journal of Futures Markets 2023) test basis, momentum, and basis-momentum factors — borrowed from the commodity futures literature — in the cross-section of cryptocurrency futures from 2017 to 2021. They construct long-short factor portfolios sorted on each signal and measure their premia at daily, weekly, and monthly frequencies.

Our summary: the paper confirms that basis is the strongest single predictor of cross-sectional crypto futures returns, echoing Cao et al. A novel finding is that the basis-momentum factor — a robust premium in commodities — has a statistically significant raw return in crypto but is entirely subsumed by the basis factor once you control for it. Most importantly for implementation, the predictive content of basis is high-frequency: daily factor returns are strongest, weekly returns are weaker, and monthly returns are insignificant. This matters a lot for anyone building a basis-factor strategy — the alpha lives at daily or faster horizons.

Key metrics: daily long-short portfolios sorted on basis deliver statistically significant excess returns and Sharpe ratios that exceed momentum and basis-momentum factors in the same universe. The basis premium shrinks monotonically as the rebalancing frequency drops from daily to weekly to monthly, with the monthly premium indistinguishable from zero. Commodity-style basis-momentum has zero incremental alpha after controlling for basis.

`Read the paper <https://doi.org/10.1002/fut.22425>`__

The Risk and Return of Cryptocurrency Carry Trade
-------------------------------------------------

Zhenzhen Fan, Feng Jiao, Lei Lü and Xin Tong (2023) study a cross-sectional carry trade in cryptocurrencies based on interest rates rather than perpetual futures funding: the strategy buys high-interest cryptocurrencies and shorts low-interest ones. It earns an annualised return of 43.4% with a Sharpe ratio of 0.74. The returns are not explained by the usual crypto factors (market, size, momentum, volatility, liquidity, downside risk and platform collapse risk), and they are largely unrelated to the fiat currency carry trade. Instead, a significant part of the carry return is compensation for equity market volatility risk, which links crypto returns to risk factors in traditional markets.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4666425>`__

The Crypto Carry Trade
-----------------------

Nicolas Christin, Bryan Routledge, Kyle Soska, and Ariel Zetlin-Jones (Carnegie Mellon) study the long-spot, short-perpetual cash-and-carry trade in bitcoin. They document very large in-sample Sharpe ratios for the strategy and attribute the profits to differences of opinion between leveraged long speculators and capital-constrained arbitrageurs, amplified by exchange funding caps.

Our summary: this is the paper that first quantified just how large the cash-and-carry carry can be in crypto, and it is the reference point for anyone who claims that "funding rate = free money". The authors carefully separate USDT-settled perps (where carry is richest) from coin-settled perps (where the premium is smaller but still very large) and show that the USDT/coin gap maps directly onto differences in collateral constraints and funding caps. They also decompose carry into a mark-price premium plus an interest component, which lines up with the Ackerer–Hugonnier–Jermann pricing framework. The reported Sharpes are in-sample and benefit from not fully accounting for liquidation risk and exchange risk — but even after generous haircuts, the strategy is extraordinarily profitable relative to traditional carry trades.

Key metrics: in-sample annualised Sharpe ratios of approximately 12.8 for USDT-settled bitcoin perpetuals and 7.0 for coin-settled bitcoin perpetuals. Returns are tightly linked to the level and stickiness of the funding rate and are constrained by exchange-imposed funding caps. Tick-level data from Binance and BitMEX.

`Read the paper <https://www.andrew.cmu.edu/user/azj/files/CarryTrade.v1.0.pdf>`__

Perpetual Futures and Basis Risk: Evidence from Cryptocurrency
--------------------------------------------------------------

Will Gornall, Martin Rinaldi, and Yizhou Xiao compare perpetual versus quarterly bitcoin futures contracts and argue that the small, frequent funding payments embedded in perpetuals materially reduce basis risk during market crises. They develop a tractable model of capital-constrained arbitrage and test its predictions on BitMEX, Binance, and CME futures around large spot moves.

Our summary: this paper is the best explanation of *why* perpetuals dominate crypto derivatives volume. Dated futures are structurally fragile in crises because the basis is sensitive to the remaining time to expiry and to collateral availability, so during stress episodes the quarterly basis can blow out by 8–10%, eating through all of the expected carry in a single day. Perpetuals, by contrast, settle PnL continuously via funding payments, which damps the basis dislocation to around 3% in the same stress episodes. The practical implication for basis-trading strategies is that perpetuals are a far better instrument than quarterlies for cash-and-carry during volatile regimes, and funding-rate-based entry rules inherit this crisis-resilient property.

Key metrics: during large spot moves, quarterly bitcoin futures dislocate from spot by 8–10%, while perpetuals dislocate by only ~3%. Drawdowns of common cash-and-carry arbitrage strategies are cut by more than half when implemented on perpetuals instead of quarterlies. The comparison holds across BitMEX, Binance, and CME.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5036933>`__

Exploring Risk and Return Profiles of Funding Rate Arbitrage on CEX and DEX
----------------------------------------------------------------------------

This paper reports an empirical study of delta-neutral funding-rate arbitrage strategies implemented on both centralised (Binance, BitMEX) and decentralised (Drift, ApolloX) perpetual venues across BTC, ETH, XRP, BNB, and SOL. The strategies long spot and short perpetuals (or vice versa) to harvest funding payments while eliminating directional price risk.

Our summary: this paper documents some of the highest in-sample Sharpe ratios ever reported for a crypto trading strategy, driven by the very wide funding spreads available on DEX venues that have lower competition and thinner arbitrage capital. It's a useful reference point for the upper bound of what funding-rate harvesting can deliver under favourable conditions — but the reported numbers should be read with care, because the sample period is short, the DEX venues are niche, and the strategy's capacity is limited by each venue's liquidity.

Key metrics: reported Sharpe ratios of approximately 23.55 on Drift and 6.50 on ApolloX for funding-rate arbitrage strategies, versus ~2.89 for a HODL benchmark. Up to 115.9% return over six months with maximum drawdown around 1.92%.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S2096720925000818>`__

Harvesting Funding Rates with a Delta-Neutral Crypto Strategy
-------------------------------------------------------------

Research Article #63 from Trading Research Hub. Details a market-neutral strategy that harvests funding rates from cryptocurrency perpetual futures. The author reports making 5% return on capital in 18 days (approximately 169% annualized) using a completely delta-neutral approach that generated positive returns every day.

The strategy involves taking offsetting long and short positions to eliminate directional exposure while capturing the funding rate differential between perpetual futures and spot markets. The article outlines the mechanics of the trade, including margin requirements management, and demonstrates how this systematic approach can generate consistent returns independent of market direction.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/market-neutral-funding-harvesting>`__.

Forecasting Market Regimes with the sUSDe Term Structure
---------------------------------------------------------

An exploration of how the sUSDe term structure on Pendle can serve as a forward-looking signal for crypto market sentiment and regime forecasting. The article explains how crypto prices are heavily influenced by leveraged trading in perpetual futures, and how Ethena's sUSDe effectively captures the basis from funding rates through delta-neutral strategies.

With multiple sUSDe expirations trading on Pendle, the market reveals implied yields across various maturities, producing an onchain term structure. This yield curve indicates whether markets expect rising funding rates (contango) or declining rates (backwardation). The article demonstrates that the term spread—the difference between back month and front month implied yields—is highly correlated with underlying yield regimes and produces a stronger signal for returns than the underlying yield alone.

By Luke Leasure.

`Read the article <https://x.com/0xMether/article/2016201886395990198>`__

.. _funding-rate-predictability-oos:

Predictability of Funding Rates: Out-of-Sample Evidence from Bitcoin Perpetuals
-------------------------------------------------------------------------------

Emre Inan (2025) investigates the out-of-sample predictability of perpetual futures funding rates, focusing on Bitcoin contracts traded on Binance and Bybit. The study generates one-step-ahead point forecasts from a set of double autoregressive (DAR) models, which jointly model the conditional mean and conditional variance of funding rates. The DAR specification is well-suited to funding rates because they exhibit both time-varying levels and time-varying volatility — the conditional variance itself follows an autoregressive process that differs from standard GARCH-type models.

Our summary: this paper provides clean out-of-sample evidence that funding rates are predictable, which has direct implications for the profitability and timing of delta-neutral carry strategies. If funding rates are forecastable, carry positions can be sized and timed more aggressively when the model predicts persistently positive (or negative) rates, rather than relying on the current observed rate as the best forecast. The DAR framework is a natural fit because funding rates are bounded, mean-reverting, and exhibit regime-dependent volatility that standard linear models miss.

Data: Bitcoin perpetual futures funding rate data from Binance and Bybit.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5576424>`__

Funding Monitor: Why Settlement Intervals Break Perpetual Carry Math
--------------------------------------------------------------------

A practitioner note on a subtlety that quietly corrupts carry calculations across perpetual futures venues: the settlement interval. The same headline funding rate means very different things depending on how often it is charged. A perp paying -0.10% per settlement costs 0.3%/day on an 8-hour cycle but 1.2%/day at four times the settlement frequency — identical headline rate, several times the real carry cost. Most funding-rate aggregators do not standardise for this, so tooling that assumes an 8-hour cycle everywhere produces carry math that is fiction precisely on the venues where the most extreme rates live.

The post documents hardening settlement-interval detection across 17 venues and fixing two live bugs. On Blofin, the venue's bulk spec was transiently flipping confirmed 1-hour contracts back to 8-hour, and the writer chain trusted the spec over observed settlement history; the fix inverts the authority chain so that settlement history outranks venue spec, which outranks the adapter default, enforced consistently across the detector, poller, backfill and drift monitor with a job lock against racing writers. On KuCoin, the per-symbol adapter hard-coded 8 hours and ignored the granularity field from the contracts endpoint. Venues lacking an authoritative spec field (Bitunix, HTX, CoinEx, Crypto.com, WhiteBIT) now fall back structurally to a detector-derived interval from settlement-timestamp medians, so no future adapter can silently default to 8 hours. The practical takeaway for anyone trading funding: check what your data source assumes about settlement frequency, because the answer is usually "8h" and usually wrong.

Mentioned by Mikko Ohtamaa (Margin Syndicate / Trading Strategy) in `this LinkedIn discussion <https://www.linkedin.com/posts/funding-monitor-update-settlement-interval-share-7485997110203490304-Zx3m/>`__, where he links to the `Funding Monitor <https://marginsyndicate.co.uk/funding-monitor>`__ tool showing a live funding matrix across venues.

By Mikko Ohtamaa.

`Read the post <https://www.linkedin.com/posts/funding-monitor-update-settlement-interval-share-7485997110203490304-Zx3m/>`__.

.. _denoising-funding-rate-signals:

Denoising Funding Rate Signals with Z-Scores, Open Interest and Price
---------------------------------------------------------------------

A practitioner thread on why a raw funding rate is a poor trading factor on its own, and what to do about it. The core problem is that funding baselines differ structurally across tokens: retail-favoured coins sit at elevated rates more or less permanently, so ranking the cross-section on absolute funding measures "how retail a token is" rather than how crowded it currently is. The fix proposed is to normalise first and rank second — compute a rolling Z-score of funding within each token's own history to strip out its baseline, then run the cross-sectional rank on those standardised values. The same argument applies across venues: because Binance, Bybit, OKX and Hyperliquid each produce slightly different rates, the more rigorous construction is an open-interest-weighted composite funding index, and the dispersion between venues is itself treated as a sentiment signal rather than noise to be averaged away.

Entry discussion: the more interesting half is the cross-validation, which addresses a real ambiguity in funding-based carry and crowding signals. Identical high funding can correspond to opposite market structures and opposite forward returns, and open interest is what disambiguates them: high funding with rising OI means new longs are being opened and crowding is still accumulating, whereas high funding with falling OI means existing positions are being unwound and the crowding is clearing. Adding price as a third dimension sharpens it further — funding that stays high while price chops sideways or grinds lower indicates longs paying an expensive carry to sit in a losing position, which is a much stronger directional tell than any single dimension. The closing caveat is a useful one for anyone sizing this: crowding factors of this type decay quickly, so they are largely inaccessible to CTA-style programs rebalancing at daily or slower frequency and fit short- to medium-horizon swing strategies instead.

Originally posted in Chinese.

By SK (@StepOneAi).

`Read the post <https://x.com/StepOneAi/status/2085417405875167278>`__.

.. _how-exchanges-compute-funding:

How Exchanges Actually Compute Funding: Settlement Periods and Weighting
------------------------------------------------------------------------

Part of a series on high-frequency market-making infrastructure, this instalment covers market data conventions for funding rates. It opens with a failure the author describes as mundane but instructive: pulling funding rates for different contracts into one table and comparing them horizontally produced unstable conclusions, because in the same market conditions and at similar deviations some contracts' rates ran high while others barely moved. The initial reading was that sentiment simply differed across contracts. Reading the venue documentation showed the real cause — they were not comparing the same quantity at all. A funding rate is not a reading that emerges naturally from the market; it is a measurement the venue performs according to a published rule, and that rule contains configurable, occasionally adjusted components that were being treated as constants.

Entry discussion: the structural form is broadly consistent across major perpetuals — funding equals the average of the premium index plus a clamped interest-rate term — so the divergence hides inside the average. The premium index is sampled at a fixed interval and time-weighted over the settlement period, giving n = settlement period / sampling interval points. Two parameters are then easy to get wrong. First, the settlement period is a variable rather than a default eight hours: venues set it per contract and adjust it under certain conditions, and the existence of a dedicated funding-interval field in some APIs is itself evidence that it moves — yet funding history endpoints typically return only rate and timestamp, so aligning a historical series on an assumed 8-hour grid will misalign across any period change. Second, and more easily missed, "time-weighted average" does not pin down the weight function. The author documents at least two variants: documentation that stops at the phrase itself without publishing a formula, and documentation giving an explicitly linear ramp, (P₁×1 + P₂×2 + ... + Pₙ×n) / (1+2+...+n), under which the final sample carries n times the weight of the first — with 8 hours of one-minute samples, n is 480. The practical consequence is that any intuition about how much a pre-settlement deviation moves the final rate is venue-specific: where weights are explicitly back-loaded the closing segment dominates, and where the shape is unpublished you know only that it is time-weighted and have to measure the shape empirically.

Originally posted in Chinese. The author notes that all specific terms cited should be checked against the documentation for the contract you actually trade.

By SK (@StepOneAi).

`Read the post <https://x.com/StepOneAi/status/2085796207847514449>`__.

Funding Rate Data Caliber, Part Two: The Premium Index Measures Depth, Not the Book
------------------------------------------------------------------------------------

Part two of SK's series moves from the outer averaging layer to the quantity being averaged. Part one is catalogued above as :ref:`How Exchanges Actually Compute Funding: Settlement Periods and Weighting <how-exchanges-compute-funding>`. The premium index is not computed from the mid-price or the best bid and offer. It is built from impact prices — ``P = [max(0, Impact Bid − index price) − max(0, index price − Impact Ask)] / index price`` — where Impact Bid and Impact Ask are the average execution prices obtained by consuming a fixed nominal amount, the Impact Margin Notional (IMN). The design intent is defensive and sensible: measuring at depth prevents a single thin resting order from moving the funding rate.

The complication is how IMN is set, and the post identifies two incompatible conventions. Under the first, IMN is a configuration value — a hardcoded notional in the contract specification, unrelated to other parameters and announced separately when changed. Under the second, it is derived: ``IMN = a fixed margin amount / initial margin rate of the highest leverage tier``. Because the initial margin rate sits in the denominator, higher maximum leverage means a lower margin rate, a larger notional, and therefore deeper sampling. On a venue using the derived convention, two contracts on the same underlying are measured at different depths purely because their leverage tiers differ — which is exactly the cross-contract comparison failure that opened part one. The post adds two refinements. Depth here is an absolute notional, so the same IMN consumes only a few levels in a liquid book but penetrates far into a thin one, and relative to book thickness the ordering can reverse; judging the true sampling depth requires comparing IMN against the contract's actual book. And the measurement position moves: leverage and margin tiers are adjustable, so one tier change gives IMN a new value even though neither the market nor the order book has changed.

Our summary: the most useful observation is the timing one, and the author is careful to label it an observation rather than a rule — tier adjustments cluster in periods of amplified volatility and rising open interest, precisely when rates are under most scrutiny and the book is least stable. That means the measurement instrument changes at the moment the measurement matters most, which is a nasty property for any model calibrated on historical funding data. The operational conclusion follows directly from the two conventions: whether IMN is a constant has opposite answers depending on the venue, and that answer determines whether a parameter history is required or merely nice to have. Anyone building a cross-venue funding dataset has to resolve this per venue by reading contract specifications line by line, because no API will tell them.

Mentioned by SK (@StepOneAi) in `this discussion <https://x.com/StepOneAi/status/2085800169686396937>`__. Written in Chinese; the text used here is X's English translation.

By SK (@StepOneAi).

`Read the post <https://x.com/StepOneAi/status/2085800169686396937>`__.

Funding Rate Data Caliber, Part Three: Capped Values Are Censored Observations
--------------------------------------------------------------------------------

Part three generalises beyond funding rates, and is the most broadly applicable of the three. It follows :ref:`part one <how-exchanges-compute-funding>` and part two above. It begins with another debugging story: tail estimates from funding-rate history kept coming out too small relative to lived experience, and inspecting the raw sequence revealed batches of exactly identical values repeating at the same number. That is not coincidence — it is a cap. The post then makes the statistical distinction precisely. **Censoring** means the observation exists and is recorded, but only as a boundary value, with the true magnitude unknown. **Truncation** means out-of-range observations never enter the sample at all. Funding-rate caps are censoring, which the author argues is the more insidious of the two: the data looks complete, every row has a value, nothing is missing, and no pipeline will raise an error.

The post then catalogues how widespread hard boundaries are in trading data: funding rate caps, matching price protection bands and limit ranges, prices generated when protection mechanisms trigger, precision truncation below the minimum tick, and — the one it singles out — depth endpoints that return a fixed number of levels. Total book volume computed from a fixed level count is itself an observation censored at the last level, so it structurally cannot answer how deep the market is. Four consequences follow. Extreme quantiles and tail indices are biased optimistic because the distribution's extremes get shifted onto the boundary. Volatility is biased low, since censoring removes variance, and the bias is worst in extreme markets where accuracy matters most. Regression coefficients are biased when a censored variable is the dependent variable, with the direction depending on the censoring proportion. And the threshold itself moves: designs that tie the cap to the maintenance margin rate, roughly ``capped F = clamp(F, −k × maintenance margin rate, +k × maintenance margin rate)``, inherit adjustability from both the margin tiers and the per-contract multiple k, so the censoring point is a curve over time rather than a constant.

Our summary: this is the entry in the series with the widest reach, because the censoring problem it describes is not specific to crypto or to funding. Any risk model fitted on capped data will understate tails and volatility exactly where the estimate matters, and the failure is silent because censored data passes every completeness check. The structural parallel the author draws to part two is the sharp one: in both cases something assumed constant is actually a variable hanging off the leverage parameters — in part two it moves the measurement position, here it moves the truncation position. The practical requirement is correspondingly stricter than simply flagging capped rows: you need to know what the threshold was at each point in time, and while flagged values can be spotted by looking for repeats, a moving threshold can only be recovered from a parameter history you chose to record in advance.

Mentioned by SK (@StepOneAi) in `this discussion <https://x.com/StepOneAi/status/2085971924727865757>`__. Written in Chinese; the text used here is X's English translation.

By SK (@StepOneAi).

`Read the post <https://x.com/StepOneAi/status/2085971924727865757>`__.

.. _example-basis-trading-and-hip-3-spread-capture:

Basis Trading and HIP-3 Spread Capture
----------------------------------------

Pallas Fund's investment thesis for a delta-neutral strategy trading spreads and funding differentials between Hyperliquid Core and HIP-3 builder perpetual markets. The linked page is a summary; an "Open PDF" link on it serves the full 22-page document, which is the version worth reading. The theoretical framing stacks three papers. Grossman-Stiglitz supplies the base case that a perfectly efficient market is a logical impossibility, so an equilibrium degree of disequilibrium persists to compensate whoever expends resources on it. Lo's Adaptive Markets Hypothesis supplies the timing argument, that opportunities emerge when the environment changes — here HIP-3's October 2025 arrival, which let independent builders deploy perpetual markets with their own oracles, funding parameters, and liquidity pools. Shleifer and Vishny supply the reason the gap does not close: limits to arbitrage. The frictions are named concretely — collateral immobilised across venues in three stablecoins, smart contract risk on builder vaults, multi-venue execution complexity, 24/7 monitoring — and the document is explicit that these frictions *are* the moat, distinguishing a structural edge (price-neutral, persists while the structure does, erodes gradually within fee bounds) from an informational one (directional, degrades as the market learns, destroyed quickly by crowding).

The mechanism sections are the transferable part, and they are more precise than the marketing framing suggests. A funding-mechanics table contrasts Core, HIP-3 builders, and a centralised-exchange reference across funding period, premium sampling cadence, cap, oracle source, and payment timing: Core funds hourly at 1/8 of the 8h rate and caps at ±4% per hour, roughly 40x more aggressive than Binance's ±0.75% per 8 hours, while every builder parameter is deployer-defined. A second table separates mark, oracle, index, and last-trade prices by what each is used for and where each diverges — the operationally important consequence being that unrealised PnL and the health factor follow the mark while funding is computed on the oracle, so a divergence can trigger liquidation on a position that is sound against the oracle. Section 3.3 then enumerates why funding never fully drives the basis to zero: funding is discrete while the basis moves continuously, the cap saturates precisely in high volatility, separate builder pools mean two SILVER perps can carry opposite funding, and the clamp on the interest-rate component creates a dead zone that establishes a floor of inefficiency. The reframing of funding as "a tax on directional conviction" rather than an arbitrage mechanism is supported with a CoinGecko figure that aggregate BTC funding was negative on only 26 of 365 days in 2024.

Our summary: read this as a strategy exposition rather than as evidence. The headline figures — 20.7% annualised, 4.57 Sharpe, 5.99 Sortino, 25.26 Calmar, -0.82% max drawdown — are self-reported by the operator over 90 days of live trading from 11 December 2025 to 10 March 2026, a sample far too short for a Sharpe that size to carry information, and the Calmar in particular is an artefact of dividing by a drawdown that a 90-day window had no opportunity to produce. Treat the fee-sensitivity projections with more suspicion still: the claim that a 30% fee reduction lifts returns to ~26.4% and Sharpe to ~6.0 assumes gross PnL is independent of the fee level, which holds only if the scaling that earns the volume tier does not itself compress the spreads being harvested — the document concedes this offset is partial but models it nowhere. What survives independently of the track record is the mechanism description and a risk section unusually candid for the genre. Fees are the binding constraint and are stated as such: 4.42 bps average at 100% taker against an 8.83 bps breakeven, with 83% of fees incurred on builder venues that offer worse tiers than Core. COPPER is disclosed as a -10.5% PnL contributor on a 4,021-minute median hold, against SILVER's 59.1% on 131 minutes — the spread-divergence failure mode made concrete, and a reminder that a structural edge still depends on venue and asset choice. Smart contract exploit risk, stablecoin depeg across USDC, USDE, and USDH, and margin call on one leg are all rated critical in the risk matrix. The genuinely portable idea is the fee-bounded moat: an edge whose competitive protection is transaction cost rather than information should decay slowly and continuously as capital arrives, which is a different planning problem from an alpha that dies on discovery.

By Pallas Fund.

`Read the investment thesis <https://app.pallas.fund/thesis/basis-trading-hip-3>`__.

.. _example-trading-crypto-funding-rates-part-1-do-cheaper-funding-coins:

Trading Crypto Funding Rates — Part 1: Do Cheaper-Funding Coins Earn Better Returns?
------------------------------------------------------------------------------------

dima (@dima_quant) tests whether perpetual futures funding carries tradable cross-sectional information. Each day, rank Binance perpetuals by recent funding, go long the coins where funding is relatively cheap and short the ones where it is relatively expensive, then check whether the funding payments survive the price moves and trading costs. The sample covers Binance perpetuals from 2023 to 2025, including retired contracts to limit survivorship bias. It is split into historical Top 20, Top 50 and Top 100 universes using market caps known before each month. The write-up is a research log that keeps the parts that did not work.

What funding means here: a perpetual future never expires, so the exchange keeps its price anchored to spot with periodic payments between the two sides. When the perp trades rich to spot the rate is positive and longs pay shorts; when it trades cheap, shorts pay longs. The payment is charged on the position's notional at each settlement. A $10,000 short receives $10 at a +0.10% settlement but loses $200 if the price rises 2%, so funding is a cash flow layered on top of full price risk, not free income. In practice the rate is the price of leverage on one side of the market: persistently high funding means longs are crowded and are paying to stay in. The author sums the recorded settlements within each UTC day and annualises them. Settlements are counted rather than assumed to be three a day, because intervals vary by contract; one MYX day had 24 settlements summing to -38.46%. "Cheap" is relative to the other coins. A long in a coin at +10% annualised still pays funding, just less than one at +30%, so this is cross-sectional carry rather than only harvesting negative rates.

Our summary: funding is sticky. Higher funding tends to stay higher, most strongly one day ahead. With a 6-day average, 88% of Top 20 cheap-funding coins were still cheap the next day and 62% six days later. Ranking on the last three days into quintiles, cheapest minus most expensive averaged +10.7, +19.4 and +21.3 bps over the next 1, 3 and 7 days before costs. Over three days, that was +41.5 bps from funding minus 22.2 bps given back on price: cheap-funding coins collect the carry but lag on price. The other findings:

- Short 1–8 day lookbacks separated cheap from expensive better than 32–64 day ones.
- Cheap funding combined with relative price strength had the best averages.
- A wider funding gap did not reliably mean a bigger return.
- The smallest coins showed the largest spreads.
- The spread was positive in 2023 and 2024 but negative in 2025.
- The short-expensive leg dragged on the long-cheap leg.

The deliberately simple Top 50 daily long/short book had a gross Sharpe ratio of 0.55 but -0.47 net of 10 bps costs, on 177.9× annual turnover; the trading bill ate the return. A Part 2, not yet published at the time of writing, promises to test trading less and different position sizes.

Entry discussion, why forecasting funding matters: the study implicitly uses a trailing average of past funding as its forecast of future funding, and that is where the discussion picks up. A funding position earns the funding paid over its holding period, not the rate on the screen at entry. Stat Arb (@quant_arb) made this point in `an earlier thread on funding arbitrage <https://x.com/quant_arb/status/1936332646029619454>`__. Picking the highest current rate is a mistake, because a 10,000% APR that reverts ten seconds later is worth roughly nothing and loses money after fees. The job is to predict the lifetime value of the trade. The persistence dima measured is exactly the autocorrelation that makes this possible. @quant_arb's reply to the thread is that funding follows an autoregressive process: a recursive AR(X) model (autoregressive with exogenous inputs, refitted as new data arrives) beats an exponentially weighted moving average (EWMA) of funding for little effort. His follow-up goes further. For a serious attempt, build features and fit a ridge regression, checking that it holds out of sample. The features he names are the basis, open interest, the historical decay of past funding and the AR(X) forecast itself. His reason is that funding has strong regimes. He is candid about the payoff: it will not drive much PnL for most books, but for anyone running a large funding book it is worth what is realistically under a week of work. Another reply suggested a hidden Markov model for the regimes. @quant_arb has `argued before <https://x.com/quant_arb/status/1855256677630579160>`__ that a quantile threshold on a regime feature such as average funding gets most of the way there without one. The same idea appears in the academic literature on this page as :ref:`double-autoregressive forecasts of funding <funding-rate-predictability-oos>`. :ref:`Z-scoring funding within each token's history and cross-checking it against open interest <denoising-funding-rate-signals>` tackles the same regime and baseline problem from the feature side.

How a funding forecast plugs into strategies:

- **Cross-sectional carry** like dima's: rank coins on forecast funding over the intended holding period rather than on a trailing average, so that a transient spike the model expects to revert does not trigger a trade. This goes straight at the cost problem. At 177.9× turnover the main lever is trading less. Knowing how long a coin's cheapness or expensiveness is likely to last lets the book keep positions whose expected remaining funding still covers the round-trip cost, and ignore rank changes that will not.
- **Delta-neutral funding arbitrage** (long spot and short perp on the same venue, or perp against perp across venues): enter only when the predicted cumulative funding over the expected life of the position exceeds fees, slippage and the basis risk of unwinding, and exit when the forecast drops below that hurdle.
- **Any directional or statistical-arbitrage book holding perps**: expected funding is a carry-cost term for the portfolio optimiser. @quant_arb has `separately noted <https://x.com/quant_arb/status/1981772973091561512>`__ that security masters often get settlement intervals wrong. His rule of thumb is to count only negative funding as a cost, so the optimiser does not start trading funding for its own sake.
- **Regime filtering**: forecast funding and its regime can gate other signals, for example standing aside when funding sits at an extreme z-score, rather than serving as a return source in themselves.

Mentioned by Stat Arb (@quant_arb) in `this discussion <https://x.com/quant_arb/status/2103564946277847325>`__, quoting the "How sticky is funding?" post of the author's thread. He suggests fitting "a recursive AR (X) model to forecast funding out", calls it an easy incremental boost over an EWMA, and adds the ridge-regression feature set in `a follow-up quote <https://x.com/quant_arb/status/2103770465361633548>`__. The `original X thread <https://x.com/dima_quant/status/2103529064480804907>`__ summarises the article with its charts.

By dima (@dima_quant).

`Read the blog post <https://dimaquant.substack.com/p/does-funding-contain-useful-information>`__.

Funding Rate Suppression Detection in Crypto Derivatives Markets
----------------------------------------------------------------

A detailed analysis of funding rate manipulation on centralised crypto exchanges, with a focus on the BEAT token on Binance. The author identifies a stark anomaly: a 2:1 long/short ratio that should produce elevated positive funding, yet the rate sits pinned at 0.005% — flat and unresponsive to market conditions.

To systematically detect this behaviour, Margin Syndicate built a Funding Rate Suppression Detector with four layers: (1) **Cross-sectional analysis** — comparing a token's funding rate against its long/short imbalance relative to every other token on the exchange to flag statistical outliers; (2) **Event response** — checking whether funding moves after liquidation events (e.g. 179K in shorts liquidated with no rate movement suggests instant replacement); (3) **Variance analysis** — identifying tokens with near-zero funding variance over 24+ periods while the rest of the exchange fluctuates normally; and (4) **Cross-exchange comparison** — detecting divergences between venues (e.g. 0.60 short ratio on OKX vs 2.31 long ratio on Binance for the same token).

In a `follow-up discussion <https://www.linkedin.com/feed/update/urn:li:ugcPost:7441884273613246464?commentUrn=urn%3Ali%3Acomment%3A%28ugcPost%3A7441884273613246464%2C7441891124870500352%29&dashCommentUrn=urn%3Ali%3Afsd_comment%3A%287441891124870500352%2Curn%3Ali%3AugcPost%3A7441884273613246464%29>`__, the author maps these findings to MiCA Article 91 market manipulation provisions — covering wash trading ($5M reported volume vs $240 organic), artificial price positioning, dissemination of misleading volume figures, and cross-exchange manipulation via coordinated positions across venues. The mechanics are broken down: running opposing positions to keep the long/short ratio flat, timing around 8-hour settlement windows, instantly replacing liquidated shorts, and pinning the rate at a level too low to attract arbitrage traders but not negative enough to raise automated flags.

By Steven Paterson, `Margin Syndicate <https://marginsyndicate.co.uk/>`__.

`Read the post <https://www.linkedin.com/posts/steven-paterson-10a1619_why-is-the-funding-rate-on-binance-for-beat-ugcPost-7441884273613246464--e41>`__

Liminal and Rysk: Two Approaches to Yield Generation on Hyperliquid
-------------------------------------------------------------------

A detailed comparison of two DeFi protocols building yield-generating products on Hyperliquid's perpetual futures infrastructure: Liminal and Rysk Finance. Liminal automates delta-neutral carry strategies by holding spot and shorting perpetuals to capture funding rate payments — a technique long used by professional trading desks. Since crypto perpetual funding rates are positive 85–90% of the time (longs pay shorts), Liminal positions users on the receiving end. The neutral funding rate on Hyperliquid has historically averaged around 10.95% annualised, with rates spiking significantly during high-leverage demand periods. Users deposit stablecoins and receive yield-bearing xTokens (xHYPE, xBTC) that appreciate as funding accumulates, with composability across DeFi lending markets enabling stacked yields.

Rysk takes a different approach, generating yield from options volatility premiums through covered calls and cash-secured puts. The protocol uses a Request for Quote (RFQ) system where market makers compete in 2-second auctions to price options, with settlement handled on-chain. Covered calls on BTC offer 10–142% annualised depending on strike distance, while cash-secured puts pay users a premium for committing to buy at a lower price — effectively monetising conviction while waiting. All options are European-style, physically settled, and fully collateralised. The article provides concrete examples with current pricing, making it a practical primer on how both funding rate capture and options writing work as systematic yield strategies in crypto derivatives markets.

Mentioned by `@0xMacroGuy <https://x.com/0xMacroguy>`__ in `this discussion <https://x.com/0xMacroguy/status/2038991439162413164>`__.

`Read the article <https://x.com/0xMacroguy/status/2038991439162413164>`__

The Delta-Neutral Funding Rate Mechanics Problem: Entry Rate vs. Settlement Rate
--------------------------------------------------------------------------------

A Twitter thread by @zirodelta examining a key flaw in delta-neutral funding rate strategies: the assumption that the rate you enter at is the rate you receive. Ethena's $3B AUM delta-neutral strategy proved the core thesis — short the perp, hold spot, collect funding — but leaves open a crucial mechanics problem: funding periods run every 1–8 hours depending on the exchange, and the published rate is continuously recalculated within that window. If you enter at 0.03% per 8h but the rate drifts to 0.01% before settlement, you settle at the time-weighted average, not the entry rate. Ethena hedges this across many symbols, but does not eliminate the basis — it hedges it with size.

The thread argues that sharp Sharpe ratios in delta-neutral backtests are misleading: if you backtest using the published 8h rate and assume that is what you receive, you are overstating yield. Direction is predictable (89% of extreme rates mean-revert within 24 hours across a dataset of 9.4M settlements), but magnitude is not — Ornstein-Uhlenbeck describes the direction of travel, not the landing point. The thread introduces "Settled," a protocol designed to address magnitude uncertainty through binary outcomes resolving against actual settled rates. The analogy drawn is to interest rate swaps, which decoupled direction from duration risk; funding rate derivatives do the same one layer down.

By `@zirodelta <https://x.com/zirodelta>`__.

`Read the thread <https://twitter-thread.com/t/2040067413002289243>`__

Crypto Carry
------------

Maik Schmeling, Andreas Schrimpf, and Karamfil Todorov (BIS Working Paper 1087) analyse the dynamics of the carry — the difference between futures and spot prices — in bitcoin and ether derivatives. They document that crypto carry can exceed 40% per annum with substantial time variation and trace this to two forces: demand from smaller trend-chasing investors seeking leveraged long exposure, and limited arbitrage capital due to regulatory, funding, and margin frictions on the short side.

Our summary: this is the most rigorous academic treatment of the crypto cash-and-carry basis and its predictive content. Interest-rate differentials explain almost none of the variation in crypto carry; the dominant driver is a time-varying convenience yield linked to speculative demand for long leverage. Crucially, high carry is not a free lunch — it acts as a crash-risk premium. The paper explicitly shows that a 10% rise in standardised carry predicts roughly a 22% increase in short-futures liquidations as a fraction of total open interest over the following month, and is associated with richer option-implied crash-risk insurance. This reframes the perp-spot basis not just as an arbitrage target but as a state variable for tail risk.

Key metrics: the authors report crypto carry reaching peaks above 40% annualised across bitcoin and ether futures venues (CME and crypto-native exchanges). Predictive regressions of one-month-ahead short-side liquidations (scaled by open interest) on standardised carry produce statistically significant positive coefficients, implying ~2.2% liquidation response per 1% carry standardisation. Similar predictive content shows up in option skew changes. The carry premium is orders of magnitude larger than in traditional FX carry trades, and the drivers are structurally different.

`Read the paper <https://www.bis.org/publ/work1087.pdf>`__

Fundamentals of Perpetual Futures
---------------------------------

Songrun He, Asaf Manela, Omri Ross, and Victor von Wachter derive no-arbitrage prices for perpetual futures contracts in both frictionless and cost-adjusted markets. Unlike fixed-maturity futures, perpetual futures have no expiry date, so the usual convergence argument that pins the price to spot at maturity does not apply. Instead, alignment with spot is enforced only by the periodic funding mechanism. The paper derives explicit bounds on the perp-spot deviation in the presence of trading costs and funding frictions, and empirically characterises those deviations across major crypto venues.

Our summary: this paper provides the theoretical backbone for treating the perp-spot basis and funding rate as joint predictive signals. The key result is that perpetual futures are not guaranteed to track spot, so any persistent basis deviation is informative. Deviations are larger in crypto than in traditional FX perpetual analogues, comove strongly across coins (suggesting a common market-wide factor), and decline over time as markets mature — both of which are testable predictions for any trading model that uses basis features. The authors further show that the size of the current deviation is itself a predictor of the next funding payment, which ties the two signals together in a theoretically grounded way.

Key metrics: the authors construct an explicit arbitrage strategy — going long (or short) spot and taking the opposite side in the perpetual — that captures funding payments on BitMEX, Binance, FTX, and OKX. The reported Sharpe ratios of the arbitrage portfolio are high across all exchanges, with the cross-venue strategy delivering materially better risk-adjusted returns than any single-venue implementation. Measured deviations of perp prices from their no-arbitrage values are an order of magnitude larger in crypto than in perpetual-style FX contracts.

`Read the paper <https://arxiv.org/abs/2212.06888>`__

Perpetual Futures Pricing
-------------------------

Damien Ackerer, Julien Hugonnier, and Urban Jermann derive closed-form no-arbitrage prices for linear, inverse, and quanto perpetual futures contracts in both discrete and continuous time. The paper provides the first fully tractable pricing framework that accounts for the random-maturity nature of perpetuals (the funding mechanism can be viewed as a stream of infinitesimal settlements) and for the distinct payoff geometries of the three main contract types used in crypto derivatives markets.

Our summary: this is the canonical theoretical reference for anyone modelling perpetuals. The authors show that under standard diffusion assumptions, the perpetual-spot basis and the funding rate together encode information about expected spot returns and convenience yields, formalising the intuition behind all the empirical basis/funding predictability papers. Their framework allows a clean decomposition of observed basis into a "fair" component implied by the funding mechanism and a deviation term that can be interpreted as either an arbitrage opportunity or a risk premium. The paper is calibrated to bitcoin perpetual data and provides an explicit benchmark against which to measure empirical dislocations.

Key metrics: under the authors' calibration to BTC perpetuals, observed funding rates and basis deviations line up well with the model's predictions in normal market conditions but diverge in stress episodes. The divergence itself carries information content, consistent with the crash-prediction findings of Schmeling et al. and Gornall et al.

`Read the paper <https://finance.wharton.upenn.edu/~jermann/AHJ-main-10.pdf>`__

Pricing Efficiency and Arbitrage in the Bitcoin Spot and Futures Markets
------------------------------------------------------------------------

Seungho Lee, Nabil El Meslmani, and Lorne N. Switzer (Concordia University) study Bitcoin pricing efficiency using spot prices alongside all CBOE and CME futures contracts traded from January 2018 to March 2019. They test cost-of-carry and no-arbitrage conditions and the predictive content of the futures basis for subsequent spot moves.

Our summary: this is the empirical complement to He–Manela–Ross–von Wachter's theoretical perpetuals-pricing work, focused on the dated futures era (CBOE XBT, CME BTC). The authors find that the futures basis has some predictive power for future spot-price changes and for the risk premium but is a *biased* predictor, so it cannot be used as a clean standalone signal. Cointegration tests confirm that futures prices are biased predictors of spot. Arbitrage deviations are persistent and, crucially, *widen substantially* around Bitcoin-specific events — security incidents (hacks) and alt-coin launches — which is the same limits-to-arbitrage pattern documented by Hattori–Ishida. Published in Research in International Business and Finance Vol 53 (2020).

Key metrics: basis has predictive power for future spot moves but is a biased predictor; cointegration/VECM tests confirm the bias; no-arbitrage deviations widen around hacks and alt-coin launches, matching the capital-constraints-in-crises pattern seen in other basis-crypto studies.

`Read the paper <https://www.sciencedirect.com/science/article/pii/S0275531919309808>`__

The Relationship Between Arbitrage in Futures and Spot Markets and Bitcoin Price Movements
------------------------------------------------------------------------------------------

Takahiro Hattori and Ryo Ishida use intraday CBOE bitcoin futures and Gemini spot data to reconstruct the actual cash-and-carry condition faced by arbitrageurs in real time. They test how arbitrage profit opportunities vary across calm and crash regimes and relate the dislocation to capital constraints on the short side.

Our summary: this paper documents the uncomfortable truth about basis-based trading in crypto: the basis becomes most attractive exactly when you are least able to trade it. In normal markets, cash-and-carry opportunities are rare and small. During bitcoin crashes, the basis blows out dramatically — but exactly those episodes are when arbitrage capital is constrained, margin requirements jump, and liquidation risk is highest. This is a textbook limits-to-arbitrage story applied to crypto, and it mirrors Gornall et al.'s finding that quarterlies dislocate much more than perpetuals during crises. For anyone building a basis-trading strategy, the practical lesson is to size for the tails, not the averages.

Key metrics: the paper documents statistically significant widening of cash-and-carry arbitrage spreads during bitcoin crash episodes, with the basis reaching levels many standard deviations above normal-regime values. Arbitrage is typically unavailable outside these stress regimes. High-frequency CBOE-Gemini matched-pair data.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3209625>`__
