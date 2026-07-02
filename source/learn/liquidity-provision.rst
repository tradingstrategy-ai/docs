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
