.. meta::
   :description: Research papers and posts on DeFi protocols, automated market makers, Uniswap, and on-chain trading mechanics.

DeFi & AMMs
~~~~~~~~~~~~

Decentralized finance (DeFi) represents a fundamentally new market structure where trading, lending, and liquidity provision occur on-chain through smart contracts rather than centralized intermediaries. Automated Market Makers (AMMs) like Uniswap replaced the traditional order book with a mathematical pricing formula — typically constant-product or concentrated liquidity — that allows anyone to provide liquidity and trade without a counterparty. This architecture creates unique opportunities and risks, including impermanent loss, loss-versus-rebalancing (LVR), MEV extraction, and novel arbitrage dynamics driven by on-chain price discovery.

The research collected here covers the mathematical foundations of CFMM pricing, optimal liquidity provision strategies on Uniswap v3's concentrated liquidity model, the relationship between AMM implied volatility and realized volatility, delta-neutral hedging using DeFi lending protocols, and the growing ecosystem of perpetual DEXes. Practical topics include reverse engineering proprietary AMM pricing curves, managing DeFi vault risks, and understanding how on-chain mechanics differ from traditional market microstructure.

Related topics include :doc:`Cryptocurrency <./cryptocurrency>` for broader crypto market dynamics, :doc:`Statistical Arbitrage <./statistical-arbitrage>` for cross-venue arbitrage strategies, and :doc:`Market Microstructure <./market-microstructure>` for foundational concepts that apply to DeFi markets.

An Efficient Algorithm for Optimal Routing Through Constant Function Market Makers
----------------------------------------------------------------------------------

Constant function market makers (CFMMs) such as Uniswap have facilitated trillions of dollars of digital asset trades and have billions of dollars of liquidity. One natural question is how to optimally route trades across a network of CFMMs in order to ensure the largest possible utility (as specified by a user). We present an efficient algorithm, based on a decomposition method, to solve the problem of optimally executing an order across a network of decentralized exchanges.

`Read the paper <https://angeris.github.io/papers/routing-algorithm.pdf>`__.

Automated Market Making and Arbitrage Profits in the Presence of Fees
----------------------------------------------------------------------

We consider the impact of trading fees on the profits of arbitrageurs trading against an automated market maker (AMM) or, equivalently, on the adverse selection incurred by liquidity providers due to arbitrage. We extend the model of Milionis et al. [2022] for a general class of two asset AMMs to both introduce fees and discrete Poisson block generation times. In our setting, we are able to compute the expected instantaneous rate of arbitrage profit in closed form. When the fees are low, in the fast block asymptotic regime, the impact of fees takes a particularly simple form: fees simply scale down arbitrage profits by the fraction of time that an arriving arbitrageur finds a profitable trade.

`Read the paper <https://moallemi.com/ciamac/papers/lvr-fee-model-2023.pdf>`__.

Optimizing Liquidity Provision on Uniswap v3: A Comparative Analysis of Adaptive Strategies
---------------------------------------------------------------------------------------------

This paper examines adaptive strategies for liquidity provision on Uniswap v3's concentrated liquidity framework, comparing passive range selection against dynamic rebalancing approaches. The analysis quantifies how different range widths and rebalancing triggers affect LP returns across different volatility regimes, providing practical guidance for capital-efficient liquidity provision.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4590720>`__

How Demeter Improves the Calculation of Liquidity Fees in Uniswap V3
---------------------------------------------------------------------

This paper addresses boundary crossing effects in Uniswap v3 fee calculations, demonstrating that naive fee computation methods introduce systematic errors when prices cross tick boundaries during a single block. The Demeter framework provides more accurate fee accounting that better reflects the actual income received by concentrated liquidity providers.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645182>`__

Pricing Uniswap V3 with Stochastic Process, Part 4
----------------------------------------------------

This paper applies optimal stopping theory and Chapman-Kolmogorov equations to value Uniswap v3 liquidity positions as derivatives contracts. The stochastic process framework provides a principled approach to pricing LP positions that accounts for the path-dependent nature of fee income and impermanent loss under concentrated liquidity.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645183>`__

Delta Neutral Strategy and Optimization of Uniswap V3
------------------------------------------------------

This paper develops a delta-neutral hedging strategy for Uniswap v3 LP positions using AAVE borrowing to offset directional exposure. By dynamically adjusting the hedge ratio, LPs can reduce their impermanent loss exposure while retaining fee income, creating a more stable return stream from concentrated liquidity positions.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645184>`__

Pricing Uniswap V3 with Stochastic Process, Part 5
----------------------------------------------------

Extending the stochastic process valuation framework, this paper develops European and American-style option analogies for Uniswap v3 positions. The framework allows LPs to compute fair values for their positions and optimal rebalancing timing using classical options pricing techniques adapted to the DeFi context.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645185>`__

An LVR Approach Proof of Guillaume Lambert's Uniswap V3 Implied Volatility
---------------------------------------------------------------------------

This paper provides a formal proof of the equivalence between loss-versus-rebalancing (LVR) and the implied volatility embedded in Uniswap v3 LP positions. The result connects DeFi liquidity provision to options pricing theory, showing that LP positions are equivalent to selling options at the AMM's implied volatility.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645186>`__

Implied Volatility from Uniswap V3 Liquidity Positions
-------------------------------------------------------

This paper extracts implied volatility signals from the distribution of Uniswap v3 liquidity positions across the price range. The concentration of LP positions reveals market participants' collective beliefs about future price ranges, providing a decentralized measure of implied volatility derived entirely from on-chain data.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645187>`__

Uniswap v4: Insights on Performance
-------------------------------------

This paper provides a comparative analysis of Uniswap v4 versus v3, examining how the new hook architecture, singleton design, and gas optimization changes affect LP returns, arbitrage dynamics, and overall market efficiency. The analysis covers early performance data and theoretical implications of v4's architectural improvements.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645188>`__

Stochastic Processes and the Pricing of Uniswap V2
----------------------------------------------------

This paper applies stochastic process theory to value Uniswap v2 LP positions, deriving closed-form expressions for impermanent loss and loss-versus-rebalancing under geometric Brownian motion price dynamics. The framework establishes the theoretical foundation for understanding AMM LP positions as derivatives contracts.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645189>`__

Vault Allocation Strategies
----------------------------

This paper examines the limitations and risks of crypto yield vault strategies, analyzing how TVL growth, rebalancing mechanics, and market impact constraints affect realized returns. The study provides a practical framework for evaluating vault strategy sustainability and identifying when yield-bearing vault products can no longer deliver their historical returns.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645190>`__

Arbitrage Opportunities and Efficiency Tests in Crypto Derivatives
------------------------------------------------------------------

This paper tests fiat-free put-call parity conditions in cryptocurrency derivatives markets, documenting the frequency and magnitude of arbitrage deviations. The study examines whether crypto options markets are efficiently priced relative to each other and identifies structural factors that allow deviations to persist.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3609519>`__

Yield as a Risk Signal: Part II
---------------------------------

A data-driven analysis of market making vaults on perpetual DEXs, examining whether these products should be treated as cash-like instruments or risk assets. The article analyzes four vaults - Hyperliquid's HLP, Lighter.xyz's LLP, Paradex's Gigavault, and Ostium Labs' oLP - examining max drawdowns, underwater durations, APY vs realized paths, risk-adjusted returns, and tail risks.

The core finding is that MM vaults do not behave like cash. With 5-9% drawdowns for most vaults and months spent underwater after market shocks, these products are fundamentally incompatible with expectations of redeeming at par. The article demonstrates that while Sharpe ratios can be attractive (4.71 for LLP, 2.89 for HLP), early-life metrics are often front-loaded and compress over time as TVL grows. The piece also examines venue-level tail risks, including the JELLYJELLY incident on Hyperliquid where LPs became the backstop for structural failures. The conclusion: allocators should treat MM vaults as risk assets with structural edge, not cash substitutes.

By Chaos Labs.

`Read the article <https://x.com/chaoslabs/status/2019498892761374811>`__

List of Perpetual Futures DEXes
--------------------------------

A comprehensive ecosystem map of decentralized perpetual futures exchanges, categorizing platforms by their underlying architecture into three design families: orderbook-based, AMM-based, and exotic perps. The classification highlights that not all perp DEXes are built the same — orderbook-based platforms prioritize execution speed and price discovery through central limit order books, AMM-based platforms use liquidity pools and synthetic pricing for permissionless trading, and exotic perp platforms enable markets on non-traditional data feeds and novel asset types.

**Orderbook-Based:** `Hyperliquid <https://hyperliquid.xyz/>`__, `dYdX <https://dydx.exchange/>`__, `Vertex Protocol <https://vertexprotocol.com/>`__, `Aevo <https://aevo.xyz/>`__, `Paradex <https://www.paradex.gg/>`__, `Lighter <https://lighter.xyz/>`__, `Aster DEX <https://www.asterdex.com/>`__, `Backpack <https://backpack.exchange/>`__, `edgeX <https://edgex.exchange/>`__, `Nado <https://www.nado.xyz/>`__, `Pacifica <https://pacifica.fi/>`__, `GRVT <https://grvt.io/>`__, `Hibachi <https://hibachi.xyz/>`__.

**AMM-Based:** `GMX <https://gmx.io/>`__, `Gains Network <https://gains.trade/>`__, `Synthetix <https://synthetix.io/>`__, `Drift Protocol <https://drift.trade/>`__, `Ostium <https://www.ostium.com/>`__, `ApeX <https://www.apex.exchange/>`__.

**Exotic Perps:** `Overlay Protocol <https://overlay.market/>`__, `Variational <https://variational.io/>`__, `Extended <https://extended.xyz/>`__.

Mentioned by `Stacy Muur <https://x.com/stacy_muur>`__ in `this discussion <https://x.com/stacy_muur/status/2021216093394915574>`__.

`Read the post <https://x.com/stacy_muur/status/2021216093394915574>`__.

A Simple Market Making Bot for 01 Exchange
-----------------------------------------------------------

An open-source TypeScript market making bot for `01 Exchange <https://01.xyz/>`__, a Solana-based perpetual futures DEX. The project demonstrates how to connect to 01 Exchange using the official SDK (@n1xyz/nord-ts) and implement a basic market making strategy. It places buy and sell orders symmetrically around a fair price derived from Binance mid-price, with a configurable spread (default 10 bps). When positions grow beyond a threshold, the bot switches to a close-only mode with tighter spreads (5 bps) to reduce exposure.

The repository includes a clean project structure with separate modules for quote generation, position tracking, price feeds (via Binance WebSocket), and order management. Configuration options cover spread size, order size in USD, close-mode thresholds, update throttling, and fair price calculation windows. The bot supports BTC and ETH markets and can be deployed via Docker Compose.

Mentioned by `URA <https://x.com/uradyor>`__ in `this discussion <https://x.com/uradyor/status/2018107463795720336>`__.

`View the repository <https://github.com/yat1ma30/zo-market-maker-ts>`__.

Happy Farming: How Loopers Get Squeezed
-----------------------------------------

This article explains the dynamics of DeFi looping — a strategy where traders leverage exposure to an asset's yield by borrowing correlated assets, such as borrowing WETH against wstETH collateral. The piece walks through how looping works mechanically, the math behind leveraged yield positions, and how spread compression, price deviation, and withdrawal queue length can interact to produce dangerous squeezes for leveraged loopers.

The article covers the key risk factors: borrow rate spikes that compress or invert the carry spread, wstETH market price deviations from redemption value, and Ethereum beacon chain withdrawal queue delays. It then shows how these can combine into a self-reinforcing squeeze scenario and concludes with practical tools for managing risk, including Aave's E-Mode for higher LTV borrowing and flash loans for efficient position entry and exit.

By Joe Wait.

`Read the article <https://x.com/JoeWaitOfficial/article/2024781759498358824>`__.

Reverse Engineering propAMMs Pricing Curves
--------------------------------------------

A deep technical analysis of five proprietary automated market makers (propAMMs) on Solana — BisonFi, GoonFi, HumidiFi, SolFi, and Tessera — reverse-engineered using nothing but swap simulations and compute unit traces. Without access to source code, the researchers reconstructed each system's pricing logic by segmenting price curves via rate derivatives and compute unit analysis, then fitting candidate mathematical functions (linear, quadratic, cubic, sqrt-mixed, log-linear) using weighted least squares and Bayesian Information Criterion (BIC) for model selection.

The study achieved pricing reconstruction accuracies below 0.001% MAPE across most systems, revealing distinct architectural choices: some propAMMs use simple linear pricing while others employ more complex nonlinear curves. The methodology — combining on-chain simulation data with statistical model selection — provides a replicable framework for analyzing any black-box AMM.

By moon shiesty.

`Read the article <https://x.com/i/article/2019626170774413312>`__.
