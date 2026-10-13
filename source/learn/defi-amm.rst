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

A comprehensive six-month backtesting study (April-September 2024) comparing multiple liquidity provision strategies on ETH/USDC pools in Uniswap v3. Tested approaches include constant intervals, moving averages, and dual-range allocations. The study examines capital efficiency, range width effects, and market volatility impacts, with parameter optimization across different strategy configurations. Results highlight the challenges of active liquidity management in volatile market conditions. By Zelos Research.

`Read the post <https://medium.com/zelos-research/optimizing-liquidity-provision-on-uniswap-v3-a-comparative-analysis-of-adaptive-strategies-for-c049dc30fb7b>`__

How Demeter Improves the Calculation of Liquidity Fees in Uniswap V3
---------------------------------------------------------------------

This post addresses the problem of fee calculation accuracy when prices cross liquidity position boundaries within a single minute. The enhanced algorithm assumes uniform price movement within one-minute intervals and allocates fees proportionally based on how many ticks the price has passed within the market-making range. This boundary crossing detection and linear price interpolation significantly improves backtesting precision for Uniswap V3 liquidity positions. By Zelos Research.

`Read the post <https://medium.com/zelos-research/how-demeter-improves-the-calculation-of-liquidity-fees-in-uniswap-v3-81272aa1bf35>`__

Pricing Uniswap V3 with Stochastic Process, Part 4
----------------------------------------------------

A technical exposition of mathematical tools needed for pricing Uniswap V3 positions, including optimal stopping theorems, Laplace transforms, and Chapman-Kolmogorov equations. The authors establish foundations for deriving stopping time formulas that determine when liquidity positions reach price boundaries, covering martingale stopping theorem, two-boundary stopping problems, and exponential martingales. By Zelos Research.

`Read the post <https://medium.com/zelos-research/pricing-uniswap-v3-with-stochastic-process-part4-98c8465696b4>`__

Delta Neutral Strategy and Optimization of Uniswap V3
------------------------------------------------------

Explores hedging strategies for Uniswap V3 liquidity provision using delta neutrality via AAVE borrowing. The approach divides the initial capital into two parts and uses borrowed assets to offset directional exposure while capturing fee income. The study performs backtesting to identify optimal market-making ranges through volatility-linked parameters, covering Greeks analysis, leveraged liquidity, capital allocation formulas, and volatility-adjusted range selection using the Demeter backtesting framework. By Zelos Research.

`Read the post <https://medium.com/zelos-research/delta-neutral-strategy-and-optimization-of-uniswap-v3-a399d07b28d3>`__

Pricing Uniswap V3 with Stochastic Process, Part 5
----------------------------------------------------

Presents pricing models for Uniswap V3 positions using stochastic calculus. The work assumes geometric Brownian motion price dynamics and derives both European-style (exit only at boundaries) and American-style (exit anytime) valuation formulas. Fee collection models transition from boundary-only to continuous collection scenarios, covering optimal stopping strategies and boundary crossing problems. By Zelos Research.

`Read the post <https://medium.com/zelos-research/pricing-uniswap-v3-with-stochastic-process-part5-dda219a45b0f>`__

An LVR Approach Proof of Guillaume Lambert's Uniswap V3 Implied Volatility
---------------------------------------------------------------------------

Demonstrates that LVR-based and Guillaume Lambert's approaches produce identical implied volatility formulas for Uniswap V3 positions. The authors prove mathematical consistency between the two methodologies, showing both rely on similar assumptions about risk-free rates and instantaneous liquidity conditions. The proof covers LVR instantaneous loss calculations, Lambert's IV formula, normalization approaches, and fee acquisition rates. By Zelos Research.

`Read the post <https://medium.com/zelos-research/an-lvr-approach-proof-of-guillaume-lambert-s-uniswap-v3-implied-volatility-6671883e46e2>`__

Implied Volatility from Uniswap V3 Liquidity Positions
-------------------------------------------------------

Presents methodology for calculating implied volatility in Uniswap V3 by deriving volatility perspectives from liquidity provider behaviors. The approach uses bisection methods to align theoretical option pricing with real market conditions, enabling a distribution of volatility views weighted by their liquidity's dollar value. Covers option pricing formulas, position-level IV analysis, time series IV tracking, and weighted averaging methodology. Part 6 in the Uniswap V3 pricing series. By Zelos Research.

`Read the post <https://medium.com/zelos-research/part6-implied-volatility-d8bfee4b7db2>`__

Uniswap v4: Insights on Performance
-------------------------------------

A comparative performance analysis of Uniswap v4 versus v3, examining trading execution and liquidity provision metrics. The research shows that v4 trading participation has been gradually increasing and overtaking v3, and for small-to-mid size trades, v4 achieves lower levels of slippage. However, v4 maintains lower overall liquidity than v3, though fee returns are more stable. Covers hook features, trading participation metrics, slippage analysis, and fee generation stability. By Zelos Research.

`Read the post <https://medium.com/zelos-research/uniswap-v4-insights-on-performance-a012671e2020>`__

Stochastic Processes and the Pricing of Uniswap V2
----------------------------------------------------

Analyzes Uniswap V2 liquidity provider positions through stochastic processes, examining impermanent loss (IL) and loss versus rebalancing (LVR). The authors apply martingale stopping methods to derive pricing formulas for V2 positions, treating them as exotic options. Key findings include that the value of the V2 position is independent of volatility in their model, though they acknowledge this oversimplifies by ignoring position reconstruction costs during price swings. Covers geometric Brownian motion modeling, American perpetual option pricing, and Jensen's inequality applications. By Zelos Research.

`Read the post <https://medium.com/zelos-research/stochastic-processes-and-the-pricing-of-uniswap-v2-f8daf81b0f7b>`__

Vault Allocation Strategies
----------------------------

This post examines the quantitative limitations of current crypto vault allocation strategies in DeFi. The author argues that most vault strategies marketed as "yield optimization" are in practice rule-of-thumb routing engines rather than proper quantitative portfolio construction. The analysis identifies five structural weaknesses: absence of formal optimization frameworks (no mean-variance or drawdown minimization, just "higher APY wins"), weak risk modeling relying on caps and allowlists rather than distributions and tail scenarios, ignored correlation across risk factors, static or reactive allocation with little predictive signal, and under-modeled liquidity where withdrawal queues are not priced into allocation decisions.

The post concludes that current vaults are constrained routing engines with basic risk controls sitting on top of structural yield sources (emissions, lending demand, structural carry), not quantitative funds. The author proposes that the next generation of vaults should incorporate proper objective functions, factor-aware allocation, correlation modeling, and liquidity-adjusted returns to move from the "rules-based allocator" phase to a true "quant portfolio" phase.

No quantitative backtest metrics are presented — the post is a qualitative framework analysis rather than an empirical study with performance results.

Mentioned by `Amy O. Khaldoun <https://www.linkedin.com/in/amykhaldoun>`__ (Vess3l, Quant Consultant) in `this LinkedIn post <https://www.linkedin.com/posts/amykhaldoun_vault-allocation-strategies-ugcPost-7439522102115737600-m6ip/>`__.

`Read the post <https://www.linkedin.com/posts/amykhaldoun_vault-allocation-strategies-ugcPost-7439522102115737600-m6ip/>`__

Arbitrage Opportunities and Efficiency Tests in Crypto Derivatives
------------------------------------------------------------------

Carol Alexander, Xi Chen, Jun Deng, and Tianyi Wang test joint efficiency of bitcoin and ether options and perpetual futures markets using a fiat-currency-free put–call parity relation. They identify the determinants and time-variation of cross-market arbitrage profits and quantify how arbitrage profitability has evolved as crypto derivatives markets have matured.

Our summary: the paper extends the basis/funding predictability toolkit to include options. Their put–call parity relation ties together spot, perpetual futures, and options on a single instrument and provides a unified framework for detecting mispricings across all three markets. The arbitrage strategies that exploit these mispricings remain profitable after slippage, especially during high-volume and congestion regimes, although the opportunities are shrinking over time as liquidity improves. BTC markets are measurably more efficient than ETH markets. For a basis-trading model, this paper provides a rigorous benchmark against which to measure whether observed deviations represent tradable alpha or just execution friction.

Key metrics: arbitrage strategies linking perpetuals and options remain profitable even after slippage, especially in high-volume and congestion regimes. BTC derivatives markets are more efficient than ETH, and efficiency is improving over time, particularly for options with maturity ≥ 15 days. Deribit-sourced option data combined with perp data from major venues.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4495548>`__

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
