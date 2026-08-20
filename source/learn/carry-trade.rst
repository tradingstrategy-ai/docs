.. meta::
   :description: Research papers and posts on carry trade strategies, funding rate arbitrage, and basis trading in crypto and FX markets.

Carry Trade
~~~~~~~~~~~

Carry trade strategies profit from return differentials between assets: borrowing in low-yield instruments and investing in high-yield ones. In traditional FX markets, this means borrowing low-interest-rate currencies and investing in high-interest-rate ones. In cryptocurrency markets, carry trade takes the form of funding rate harvesting — capturing the premium embedded in perpetual futures funding rates — and cash-and-carry basis trading, where traders simultaneously hold spot and short futures positions to capture the basis. These strategies are fundamentally linked to risk premia embedded in the term structure of asset returns.

This collection covers the theoretical foundations of carry in cross-sectional and time-series contexts, empirical evidence on FX carry premia, geopolitical risk's impact on currency returns, and the specific mechanics of crypto carry trades. The crypto literature examines how perpetual futures returns decompose into directional and funding components, how to construct delta-neutral funding rate harvesting strategies, and how carry signals interact with momentum and basis for risk factor decomposition.

Related topics include :doc:`Cryptocurrency <./cryptocurrency>` for broader crypto asset pricing research, :doc:`Statistical Arbitrage <./statistical-arbitrage>` for related relative-value strategies, and :doc:`Market Regimes <./market-regimes>` for regime-conditional carry exposure management.

Dissecting Investment Strategies in the Cross Section and Time Series
---------------------------------------------------------------------

This paper provides a unified framework for decomposing carry, momentum, and value strategies across both cross-sectional and time-series dimensions. The analysis demonstrates that carry and momentum strategies are related but distinct risk premia, with carry capturing static income differences while momentum captures dynamic trend persistence. The framework helps practitioners understand when each factor is likely to dominate.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2695101>`__

Model-Free RL Framework for Portfolio Allocation with Carry Trade Signals
--------------------------------------------------------------------------

This paper applies model-free reinforcement learning to portfolio allocation problems that incorporate carry trade signals, comparing RL-based allocation against mean-variance optimization for FX carry strategies. The study demonstrates that RL agents can adapt to changing carry environments more effectively than static optimization approaches.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4150722>`__

Geopolitical Risk in Currency Markets
---------------------------------------

This paper introduces the GHML factor capturing geopolitical risk exposure in currency markets and documents how geopolitical events systematically affect carry trade returns. Countries with higher geopolitical risk exposure offer higher carry premia as compensation, creating a geopolitical carry trade that is distinct from the traditional interest rate carry.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3685139>`__

Anatomy of Cryptocurrency Perpetual Futures Returns
----------------------------------------------------

This paper decomposes the total returns of cryptocurrency perpetual futures into their constituent components, separating the directional price return from the funding rate component. The decomposition reveals how funding rates contribute to or detract from total returns across different market conditions, providing a quantitative framework for evaluating perpetual futures as investment vehicles.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4150724>`__

An Empirical Investigation on Risk Factors in Cryptocurrency Futures
--------------------------------------------------------------------

This paper identifies and characterizes risk factors driving cryptocurrency futures returns, including the basis (spot-futures spread), momentum, and basis-momentum factors. The factor structure provides a framework for understanding what drives cross-sectional differences in crypto futures returns and how these factors relate to traditional asset pricing factors.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3907667>`__

The Risk and Return of Cryptocurrency Carry Trade
-------------------------------------------------

This paper documents a cryptocurrency carry trade strategy that goes long high-funding-rate assets and shorts low-funding-rate assets, capturing the cross-sectional dispersion in perpetual futures funding rates. The strategy generates substantial risk-adjusted returns and provides evidence that funding rates represent a genuine risk premium in crypto markets.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4080671>`__

The Crypto Carry Trade
-----------------------

This paper examines the classic cash-and-carry trade structure in crypto markets: going long spot while simultaneously shorting perpetual futures to capture the basis premium. The analysis covers the mechanics, risks, and historical returns of this delta-neutral strategy and identifies conditions under which the carry premium is most reliably positive.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4262359>`__

Perpetual Futures and Basis Risk: Evidence from Cryptocurrency
--------------------------------------------------------------

This paper examines how perpetual futures behave compared to quarterly futures during cryptocurrency market crises, documenting that basis risk — the risk that spot and futures prices diverge — spikes during stress events. The analysis identifies the structural features of perpetuals that create basis risk and quantifies the impact on delta-neutral carry strategies.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4329400>`__

Predictability of Funding Rates
---------------------------------

This paper develops double-autoregressive models for predicting cryptocurrency perpetual futures funding rates, documenting significant time-series predictability. Funding rate predictability has direct implications for carry strategies and market timing: if funding rates are predictable, carry positions can be timed to enter when carry is most likely to remain positive.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4150725>`__

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

Predictability of Funding Rates: Out-of-Sample Evidence from Bitcoin Perpetuals
-------------------------------------------------------------------------------

Emre Inan (2025) investigates the out-of-sample predictability of perpetual futures funding rates, focusing on Bitcoin contracts traded on Binance and Bybit. The study generates one-step-ahead point forecasts from a set of double autoregressive (DAR) models, which jointly model the conditional mean and conditional variance of funding rates. The DAR specification is well-suited to funding rates because they exhibit both time-varying levels and time-varying volatility — the conditional variance itself follows an autoregressive process that differs from standard GARCH-type models.

Our summary: this paper provides clean out-of-sample evidence that funding rates are predictable, which has direct implications for the profitability and timing of delta-neutral carry strategies. If funding rates are forecastable, carry positions can be sized and timed more aggressively when the model predicts persistently positive (or negative) rates, rather than relying on the current observed rate as the best forecast. The DAR framework is a natural fit because funding rates are bounded, mean-reverting, and exhibit regime-dependent volatility that standard linear models miss.

Data: Bitcoin perpetual futures funding rate data from Binance and Bybit.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=5576424>`__

Crypto Factor Leadership and the Seven-Factor Composite
-------------------------------------------------------

Daniel Szemerey reports a first-half 2026 update on Aperiodic's cross-sectional crypto factors. The best single factor, Polaris, returned +15.35%, while Enhanced Carry returned +12.06%; but the main point is portfolio construction rather than leaderboard chasing. The seven-factor blend returned +9.25% year to date with a 1.80 Sharpe ratio, 9.9% volatility, and a 6.1% maximum drawdown, capturing most of the upside from the winning factor while avoiding the need to forecast which signal would lead.

Entry discussion: Enhanced Carry is the carry sleeve most directly connected to this file. It is not just a naive harvest of perpetual funding payments; the post says its return was largely driven by the predictive signal embedded in funding rates. In practice, that means ranking assets by cross-sectional funding pressure, using a composite across venues, and building a market-neutral long/short book that benefits when expensive-to-own perpetuals subsequently underperform cheaper or negative-funding assets. Supply Velocity is the on-chain supply-risk sleeve: assets with faster token supply growth or inflationary pressure are expected to lag assets with cleaner supply dynamics, although the factor cooled to +4.29% after a much stronger prior year. Margin Risk is a derivatives crowding and liquidation-overhang signal: assets with more positions near forced liquidation thresholds can underperform less leveraged assets because modest price moves can trigger mechanical selling or short-covering cascades. Altair and Relative Illiquidity are liquidity/microstructure signals; Retail Flow is a contrarian flow signal that rebounded as retail positioning shifted. The useful lesson is that these sleeves are economically different enough to diversify one another, so the composite can be more robust than any single "best" factor.

Mentioned by Daniel Szemerey in `this LinkedIn discussion <https://www.linkedin.com/posts/daniel-szemerey_our-best-crypto-alpha-factor-returned-1535-ugcPost-7480553339462754304-ZMPu/>`__, where he also links to `Aperiodic Factors <https://factors.aperiodic.io/>`__ for the live factor board.

By Daniel Szemerey.

`Read the post <https://www.linkedin.com/posts/daniel-szemerey_our-best-crypto-alpha-factor-returned-1535-ugcPost-7480553339462754304-ZMPu/>`__

Funding Monitor: Why Settlement Intervals Break Perpetual Carry Math
--------------------------------------------------------------------

A practitioner note on a subtlety that quietly corrupts carry calculations across perpetual futures venues: the settlement interval. The same headline funding rate means very different things depending on how often it is charged. A perp paying -0.10% per settlement costs 0.3%/day on an 8-hour cycle but 1.2%/day at four times the settlement frequency — identical headline rate, several times the real carry cost. Most funding-rate aggregators do not standardise for this, so tooling that assumes an 8-hour cycle everywhere produces carry math that is fiction precisely on the venues where the most extreme rates live.

The post documents hardening settlement-interval detection across 17 venues and fixing two live bugs. On Blofin, the venue's bulk spec was transiently flipping confirmed 1-hour contracts back to 8-hour, and the writer chain trusted the spec over observed settlement history; the fix inverts the authority chain so that settlement history outranks venue spec, which outranks the adapter default, enforced consistently across the detector, poller, backfill and drift monitor with a job lock against racing writers. On KuCoin, the per-symbol adapter hard-coded 8 hours and ignored the granularity field from the contracts endpoint. Venues lacking an authoritative spec field (Bitunix, HTX, CoinEx, Crypto.com, WhiteBIT) now fall back structurally to a detector-derived interval from settlement-timestamp medians, so no future adapter can silently default to 8 hours. The practical takeaway for anyone trading funding: check what your data source assumes about settlement frequency, because the answer is usually "8h" and usually wrong.

Mentioned by Mikko Ohtamaa (Margin Syndicate / Trading Strategy) in `this LinkedIn discussion <https://www.linkedin.com/posts/funding-monitor-update-settlement-interval-share-7485997110203490304-Zx3m/>`__, where he links to the `Funding Monitor <https://marginsyndicate.co.uk/funding-monitor>`__ tool showing a live funding matrix across venues.

By Mikko Ohtamaa.

`Read the post <https://www.linkedin.com/posts/funding-monitor-update-settlement-interval-share-7485997110203490304-Zx3m/>`__.

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

Basis Trading and HIP-3 Spread Capture
----------------------------------------

Pallas Fund's investment thesis for a delta-neutral vault trading spreads between Hyperliquid Core and HIP-3 builder markets. The framing is explicitly Grossman-Stiglitz: a perfectly efficient market is impossible because nobody would then have an incentive to make it efficient, so an equilibrium degree of disequilibrium persists and compensates whoever commits capital and infrastructure to harvesting it. HIP-3 is the structural change that creates the opportunity here — independent builders can deploy their own perpetual markets with their own liquidity pools, oracles, and funding parameters, so fragmentation is not noise around a single venue but a new venue topology. The post distinguishes this *structural* edge from an *informational* one along four dimensions: it is price-neutral rather than directional, it persists as long as the structure exists rather than degrading as the market learns, and crowding erodes it gradually within fee bounds rather than destroying it.

The most transferable section is the funding-mechanics comparison, which tabulates funding period, premium sampling cadence, funding cap, oracle source, and payment timing across Hyperliquid Core, HIP-3 builders, and a centralised-exchange reference. Core funds hourly at 1/8 of the 8h rate, samples the premium every 5 seconds, and caps funding at ±4% per hour — roughly 40x more aggressive than Binance's ±0.75% per 8 hours — while HIP-3 builder parameters are deployer-defined throughout. Each venue therefore computes a different fair price for the same asset at different times using different methodologies, which is presented as an outcome of fragmented market design rather than a defect. The claimed PnL decomposition over the reported period is 70% spread capture, 19% funding differential, 11% collateral yield, rotating across seven venues and 21 pairs in spot-perp, perp-perp, Core-HIP-3, and HIP-3-HIP-3 expressions, with asset selection retained as a discretionary overlay on top of the systematic scan.

Our summary: read this as a strategy exposition rather than as evidence. The performance figures — 20.7% annualised, 4.57 Sharpe, -0.82% max drawdown over 90 days of live trading from 11 December 2025 to 10 March 2026 — are self-reported by the operator on a marketing page for a private-beta vault, over a sample far too short for the Sharpe to mean much, and the March column covers only seven days. What survives independently of the track record is the mechanism description and, unusually for this genre, a candid risk section. Fees are the binding constraint and the document says so: 4.42 bps average against an 8.83 bps breakeven, with fees consuming 56.5% of gross PnL, meaning a doubling of execution cost eliminates the strategy entirely. COPPER is disclosed as a -10.5% PnL contributor with a 4,021-minute median hold — the spread-divergence failure mode made concrete — and smart contract risk on builder vaults plus stablecoin depeg risk across USDC, USDE, and USDH collateral are both flagged as critical. That fee-bounded moat argument is the part worth carrying elsewhere: an edge whose competitive protection is transaction cost rather than information should be expected to decay slowly and continuously, which is a different planning problem from an alpha that dies the moment it is discovered.

By Pallas Fund.

`Read the investment thesis <https://app.pallas.fund/thesis/basis-trading-hip-3>`__.
