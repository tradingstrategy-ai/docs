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
