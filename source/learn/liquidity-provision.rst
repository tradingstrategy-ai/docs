Liquidity provision
~~~~~~~~~~~~~~~~~~~

How to become a :term:`liquidity provider` (:term:`market maker`) on :term:`CLMM` and :term:`AMM` :term:`DEXes <DEX>`.

See :doc:`papers <./papers>` for more advanced learning material.

Tools
=====

Revert Finance
--------------

A tool website to watch Uniswap 3 LP positions.

`View website <https://revert.finance/>`__.

Papers
======

What Drives Liquidity on Decentralized Exchanges? Evidence from the Uniswap Protocol
------------------------------------------------------------------------------------

We empirically study liquidity and market depth on decentralized exchanges (DEXs), identifying factors at the blockchain, token pair, and pool levels that predict future effective spreads for fixed trade sizes on Uniswap v3 pools. Introducing the v2 counterfactual spread metric, a novel criterion that assesses the degree of liquidity concentration in pools using the ``concentrated liquidity'' mechanism, we decompose the effect of each factor on market depth into two channels: total value locked (TVL) and concentration. We further explore how external liquidity from competing DEXs and fillers with private inventory on DEX aggregators influence market depth. We find, for moderately-sized swaps, that (i) gas prices, returns, and volatility affect spreads primarily through concentration, (ii) internalization of swaps by private liquidity sources affects spreads primarily through TVL, and (iii) fee revenue, markout, and DEX competition affect spreads through both channels.

`Read the paper <https://arxiv.org/abs/2410.19107>`__

Providing Liquidity in Uniswap V3
---------------------------------

One of the largest :term:`DEX` :term:`Uniswap` released their version v3 in 2021 and introduced
the concept of concentrated liquidity. Now liquidity providers in Uniswap v3
need to choose a range in which they want to provide liquidity. We built a
robust and precise backtester based on the original Uniswap v3 smart contract
and used it to test eleven different strategies for liquidity providers. We analyzed
those strategies on the USDC-ETH pool with 0.05% transaction fee. We found
strategies that performed really well when Ethereum was going up, but most of
these strategies did not perform so well when Ethereum was going down. We
also analyzed the delta of liquidity provision strategies.

`Read the paper <https://pub.tik.ee.ethz.ch/students/2021-HS/BA-2021-21.pdf>`__

Opportunity Costs and Profitability: Insights into LP Behavior
--------------------------------------------------------------

Analysis on which :term:`liquidity providers <liquidity provider>` are profitable on :term:`Uniswap` v3.

`Read the post <https://medium.com/zelos-research/opportunity-costs-and-profitability-insights-into-lp-behavior-953933f65d19>`__

Backtesting Framework for Concentrated Liquidity Market Makers on Uniswap V3 Decentralized Exchange
---------------------------------------------------------------------------------------------------

Decentralized finance (DeFi) has revolutionized the financial landscape, with protocols like Uniswap
offering innovative automated market-making mechanisms. This article explores the development of
a backtesting framework specifically tailored for concentrated liquidity market makers (CLMM). The
focus is on leveraging the liquidity distribution approximated using a parametric model, to estimate
the rewards within liquidity pools. The article details the design, implementation, and insights derived
from this novel approach to backtesting within the context of Uniswap V3. The developed backtester
was successfully utilized to assess reward levels across several pools using historical data from 2023
(pools Uniswap v3 for pairs of altcoins, stablecoins and USDC/ETH with different fee levels). Moreover,
the error in modeling the level of rewards for the period under review for each pool was less than 1%.
This demonstrated the effectiveness of the backtester in quantifying liquidity pool rewards and its
potential in estimating LP’s revenues as part of the pool rewards, as focus of our next research. The
backtester serves as a tool to simulate trading strategies and liquidity provision scenarios, providing a
quantitative assessment of potential returns for liquidity providers (LP). By incorporating statistical
tools to mirror CLMM pool liquidity dynamics, this framework can be further leveraged for strategy
enhancement and risk evaluation for LPs operating within decentralized exchanges.

`Read the paper <https://arxiv.org/pdf/2410.09983>`__

Earning Yield on Bitcoin via Leveraged WBTC/cbBTC Liquidity Provision on Fluid
-----------------------------------------------------------------------------

In this X thread, letsgetonchain walks through what they argue may be one of the best risk-adjusted yields available on Bitcoin: roughly 16% trailing 30-day APY (and more than 11% realized over the trailing year) earned by providing WBTC ↔ cbBTC liquidity on the Fluid DEX. The strategy is a leveraged "looping" position built from Fluid's smart-collateral and smart-debt primitives: the trader supplies a WBTC/cbBTC collateral position and borrows a WBTC/cbBTC debt position against it, recycling the borrow back into more collateral to lever up the underlying liquidity-provision exposure. Because BTC borrow demand on Fluid is low, the spread between supply and borrow APY is only about −0.20%, and a trading-fee APY of roughly 0.1% on the pair offsets most of that bleed — the trader earns fees on both the collateral and the debt legs.

The core yield comes from DEX trading fees, which have averaged about 0.7% APY on the WBTC ↔ cbBTC pair over the past twelve months; leverage (the thread's trade calculator shows around 18.3x producing a net ~15% APY) multiplies that thin fee stream into a double-digit return. The author argues the risk profile is unusually benign for a leveraged position: both WBTC and cbBTC are marked at 1 BTC by the oracle, so a temporary secondary-market depeg between the two wrapped-BTC tokens never touches the oracle input and cannot by itself force a liquidation. The one genuine risk is a spike in BTC borrow rates on Fluid — which happened in February 2026 when smart debt concentrated into cbBTC and spiked its utilization — but tighter borrow caps have since made a repeat less likely. Entry and exit costs, normally a major drag on high-turnover looping strategies where the amount swapped is large relative to the equity supplied, are near zero here because the LP shares are borrowed in the pool's prevailing ratio, which makes short holding periods feasible.

The thread closes on the capital-efficiency argument for Fluid's design: supplying the same WBTC/cbBTC pair on Uniswap yields under 2% APY, and although Uniswap holds more than $25m of BTC TVL in these pools versus Fluid's under $10m, Fluid generated more than half of the previous day's WBTC ↔ cbBTC volume on Ethereum — evidence that smart-collateral/smart-debt leverage lets much less capital do far more market-making work. Throughout, the author points to the analytics tool Creddit (@credditxyz) for analyzing the sustainability of these looping strategies, inspecting the oracle setup, and simulating entry/exit costs for a given loop.

Posted as a thread by letsgetonchain (@letsgetonchain, whose bio reads "everything onchain capital markets"). One reply from @litocoen jokes, "ffs you just made me deposit now you re diluting my yield," underscoring the thread's remark that only limited spare capacity remains in the strategy.

`Read the thread <https://x.com/letsgetonchain/status/2072659542194688441>`__

Optimal Size in Market Making under State-Dependent Hawkes Process
------------------------------------------------------------------

This paper models executed volume in market making as an average order size times an exponential demand function times a Prony-series multiplier in quote depth, market-order count and state-dependent Hawkes (sdHawkes) intensity. On MSFT limit-order-book data, the authors report that the selected calibration achieves higher terminal utility than a baseline while respecting the inventory bound, in retrospective evaluations conditional on realised order-flow paths.

On a one-second grid, count bins and queue imbalance give twelve event types and five states, for 1452 sdHawkes parameters. Cancellations are omitted. Two Prony terms per side give 16 coefficients, which CMA-ES tunes as policy parameters by maximising the initial value of a backward recursion across training days, under a hard bound of 10,000 shares.

The central caveat is in Section 3.1. On the evaluation day the recursion is solved again on that day's path, so "this policy incorporates order-flow observations subsequent to each decision time", and the experiment evaluates the size parameters "retrospectively, conditional on the observed daily path". The authors offer no further justification and no causal variant, and Sections 5.5 and 6 quote "out-of-sample" values without repeating the caveat. Our reading: out-of-sample applies only to the frozen parameters, and the dollar figures do not measure what a live policy would earn. Intensity inputs do use only records strictly before each grid time (Section 4.4).

The authors flag sensitivity to local optima. CMA-ES first sampled a feasible candidate at generation 6 and its best value stayed there. The headline policy Sopt uses parameters trained without the hard bound, then evaluated under it with a no-post action that went unused. Our reading: the choice between Sopt and the bound-trained Sretr rests on the single evaluation day.

**Data and code.** LOBSTER-format, millisecond-stamped MSFT messages with ten book levels, November 3-7, 2014, 09:30-16:00: approximately 5.4×10^6 messages and 117,000 one-second intervals. November 3-6 is training and November 7 is evaluation. The paper links no code repository, so reproduction needs the data and a reimplementation.

**Key metrics.** The paper reports daily dollar values and inventories for one stock and one evaluation day, plus in-sample values. There is no annualised return, Sharpe ratio, drawdown or win rate. Every November 7 figure is conditional on that day's realised path.

- Sopt on November 7, 2014 (penalty 0.05, bound 10,000 shares): $119,707/day, peak absolute inventory 9,988 shares, terminal inventory -16.5 shares.

- Sretr: $10,460/day, peak 9,992 shares, terminal +7.5 shares. Trivial multiplier S0 (f ≡ 1): $8,559/day, peak 9,944 shares, terminal -12.4 shares.

- Sopt uplift as stated by the authors: 11.4× over Sretr and 14.0× over S0.

- Inventory-blind baselines: fixed quote N1 at -$24,712,461, ending at +222,627 shares, and myopic greedy N2 at -$20,250,905, ending at -201,894 shares. Both breach the bound.

- Intraday cumulative reward: Sopt $100,277 against N2 $103,512, with the value gap attributed to inventory at the close.

- In-sample value: $7,462.80/day against $4,338.39/day for f ≡ 1 under the same bound, a factor of 1.72.

- Soft penalty at 0.01, 0.05, 0.10 under the bound: training value $7,462.80 to $7,462.41, evaluation value $10,516.24 to $10,443.89, with identical coefficients.

- Sopt action mix in active seconds: L+ = 2 in 47.8%, L+ = 1 in 40.7%, L- = 1 in 59.1%, L- = 2 in 36.9%.

- sdHawkes fit: largest self-excitation ratio 0.42 (buy N = 0, neutral state), at most 0.02 for active bins, decay rates from 0.15 to 2.62 per second.

Mentioned by `Quant Beckman <https://x.com/quantbeckman>`__ in `this discussion <https://x.com/quantbeckman/status/2114605183736967665>`__, who says the authors acknowledge in Section 3.1 that the dynamic program uses the entire realised order-flow path of the evaluation day, including information arriving after each decision, and calls this look-ahead bias. Section 3.1 confirms the mechanism and calls the experiment retrospective, without using that term.

By Jonathan Chávez Casillas and Li Gan.

`Read the paper <https://arxiv.org/abs/2610.31903>`__

HFT for Dummies, Part 1: Basic Intro to Algo-Trading
----------------------------------------------------

Tristan opens a planned 11-part X series on building a low-latency market maker for crypto perpetual futures. The strategy is a delta-neutral, reference-price market maker: stream Binance market data as the fair-price reference, quote a bid and an ask around it on another venue, and hedge inventory. The example venue is Bullet. The author reports $6K PnL in 30 days on $10K of capital over $158M+ of volume, with the strategy built together with Claude as an LLM "quant". These are unaudited, self-reported figures.

Our summary: this first post sets out the economics and the engineering targets rather than code. The edge per fill is under half a basis point per dollar traded, so profit comes from volume. The main risk is adverse selection: if the reference market moves and your quotes are slow to update, takers pick off the stale prices. The stated goal is under 10 ms from tick to order sent, under 1 ms as a stretch target, with a focus on cutting jitter, because the slowest orders lose the most PnL. Bullet's 100 ms speed bump on takers is presented as a buffer that lets small market makers compete with professional HFT firms. The planned agenda moves from "saving seconds" (a simple Rust market maker, telemetry and Amdahl's law, AWS colocation) through "saving millis" (websockets instead of polling, order execution, API rate limits, Linux CPU pinning and IRQ tuning) to "saving micros" (hot-path profiling in Rust, last-mile AWS networking, DeFi nonce quirks). An architecture diagram maps the tick-to-trade loop: Binance websocket, parse, fair price (reference mid or microprice), strategy with inventory skew, non-blocking executor, venue order websocket, and fill acknowledgements feeding inventory state back into the quotes.

The author's development timeline is a useful reality check. A basic harness and venue integrations took days, a semi-competitive version took weeks, and tuning it to proper profitability took months. The author expects one-person quant shops on on-chain venues such as Hyperliquid to become a significant trend as market data and connectivity become open to everyone.

By `Tristan <https://x.com/Tristan0x>`__.

`Read the post <https://x.com/Tristan0x/status/2115509914768687299>`__
