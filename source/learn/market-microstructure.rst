.. meta::
   :description: Research papers and posts on market microstructure, market making, price formation, bid-ask spreads, and limit order book dynamics.

Market Microstructure
~~~~~~~~~~~~~~~~~~~~~

Market microstructure is the branch of financial economics that studies how asset prices are determined through the trading process — how buyers and sellers interact, how information is incorporated into prices, and how market structure affects the cost and quality of price discovery. Key concepts include the bid-ask spread and its components (order processing, inventory, and adverse selection costs), price impact of trades, the limit order book as the primary mechanism for price formation in modern electronic markets, and the role of market makers as liquidity providers.

The research here spans foundational theory — the Glosten-Milgrom and Kyle models of informed trading, inventory models for optimal market maker quoting, the structure of strategic trading — and empirical applications: how market makers navigate the fill probability versus post-fill returns tradeoff, optimal exchange fee design, Bitcoin price discovery across fragmented venues, and the mechanics of the two-tiered funding rate market. Practical implementations range from the Avellaneda-Stoikov framework for high-frequency market making to order type taxonomy and execution strategy design.

Related topics include :doc:`Order Flow <./order-flow>` for OFI-based signals and flow toxicity, :doc:`Statistical Arbitrage <./statistical-arbitrage>` for cross-venue relative-value strategies, and :doc:`Algorithmic Trading <./algorithmic-trading>` for execution and live deployment topics.

The Market Maker's Dilemma: Navigating the Fill Probability vs. Post-Fill Returns Trade-Off
--------------------------------------------------------------------------------------------

This paper presents results from a live trading experiment on the Binance Bitcoin perpetual futures market, the most liquid crypto market globally. The authors submitted 232,897 minimum-sized maker orders over one week in a continuous quoting mode (always maintaining orders at top-of-book on both sides), of which 127,051 filled and 105,846 were cancelled unfilled. The experiment reveals a fundamental negative correlation between an order's fill probability and its post-fill returns: conditions that make fills more likely (such as adverse order book imbalance where the opposite queue is large and the near-side queue is small) are precisely the conditions that predict poor post-fill returns due to price persistence.

The paper demonstrates the consequences with a naive market making strategy that continuously quotes at the touch and rebalances to zero inventory after each fill. This strategy lost nearly 60% in three days, producing an annualised Sharpe ratio of −109 with an average holding time of 11 seconds and an average loss of 0.44 basis points per roundtrip. The authors then model "reversals" using logistic regression and random forest classifiers. A balanced-inventory strategy that only trades when the model predicts a reversal with probability exceeding the 0.24 threshold improves the Sharpe ratio to 11.97 (logistic regression) while maintaining 327 roundtrips per day.

`Read the paper <https://arxiv.org/abs/2404.18822>`__

Optimal Make-Take Fees in a Multi Market Maker Environment
-----------------------------------------------------------

This paper develops the optimal exchange fee structure when multiple market makers compete to provide liquidity. The analysis shows how maker rebates and taker fees should be set to maximize market quality, volume, and exchange revenue simultaneously, with implications for how exchange design affects market maker behavior and trading costs.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3851173>`__

Where Is the Price of Bitcoin Determined? Price Discovery in a Fragmented Market
----------------------------------------------------------------------------------

Riccardo Cosenza and Simon Stalder investigate price discovery for Bitcoin across regulated and unregulated spot and perpetual-futures venues using high-frequency data. They apply Hasbrouck information shares, Gonzalo–Granger component shares, and Putniņš information-leadership shares.

Our summary: this is the reference paper for the question "which venue sets the Bitcoin price?" The answer is blunt: unregulated crypto-native venues (primarily Binance spot and perpetual futures) dominate price discovery during the vast majority of trading hours. Regulated venues like Coinbase gain relative importance around specific fixing windows, notably the NY 4pm fixing used as an ETF NAV reference.

Key metrics: Binance's information share dominates across most hours of the trading day; Coinbase's share rises around the NY 4pm fixing.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4983566>`__

The Two-Tiered Structure of Cryptocurrency Funding Rate Markets
----------------------------------------------------------------

This paper examines the price discovery dynamics for perpetual futures funding rates across CEX and DEX venues, documenting a two-tiered structure where CEX funding rates lead DEX rates. The analysis quantifies the lead-lag relationship and identifies the structural factors — trading volume, liquidity, and participant composition — that determine which venue plays the price discovery role.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4645191>`__

Market Microstructure Foundations
----------------------------------

A comprehensive introduction to market microstructure, the branch of financial economics that studies how investors' latent demands are translated into executed trades. The article covers the core building blocks including order-driven versus quote-driven markets, the role of market makers, price discovery mechanisms, and the concept of information asymmetry between market participants.

The post explores foundational theoretical models and their practical implications for trading decisions, risk management, and understanding the forces that shape asset prices. Topics include bid-ask spreads, transaction costs, market efficiency at the microstructure level, and the impact of market structure on price formation.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/market-microstructure-foundations-aabb765d9fd2>`__.

Strategic Trading Models
------------------------

An exploration of strategic trading models that provide rigorous frameworks for executing large orders while minimizing market impact and preserving informational advantages. The article covers foundational concepts including Kyle's Lambda estimation, the mechanics of price impact, and advanced execution tactics such as trade splitting, stealth trading, and the logic behind parent order strategies.

The post delves into how institutional traders balance the trade-off between execution speed and market impact, drawing on Kyle's 1985 seminal model and its extensions. It examines how informed traders optimally reveal their information through trading, and how these theoretical insights translate into practical algorithmic execution strategies used by quantitative trading firms.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/strategic-trading-models-baf99eecdf11>`__.

Information-Based Models in Market Microstructure
--------------------------------------------------

A comprehensive overview of information-based models in market microstructure, providing a framework for understanding how private information is incorporated into asset prices. The article traces the development of these models from Bagehot's foundational insights through to modern metrics like the Probability of Informed Trading (PIN) and Volume-Synchronized PIN (VPIN).

The post explores the theoretical underpinnings of information asymmetry, adverse selection, and the strategic behavior of informed and uninformed traders. It covers the Glosten-Milgrom sequential trade model, the Kyle continuous auction model, and how these frameworks explain the mechanics of price discovery, liquidity provision, and trading costs in modern markets.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/information-based-models-in-market-microstructure-6d8c7b8dbfa9>`__.

Inventory Models in Market Microstructure
-----------------------------------------

A comprehensive overview of inventory models in market microstructure, which provide a systematic framework for understanding how market makers quote bid-ask spreads to control inventory risk and maximize profitability. The article covers foundational models by Garman (1976), Stoll (1978), and Ho and Stoll (1981), as well as advanced topics such as optimal inventory control and the Avellaneda-Stoikov framework.

The post explores how uncontrolled inventory exposes market makers to adverse price movements, and how optimal quoting strategies dynamically adjust spreads based on current inventory levels, risk aversion, and market volatility. The Avellaneda-Stoikov model is presented as the modern standard for high-frequency market making.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/inventory-models-in-market-microstructure-2956ba9b31cb>`__.

Bid-Ask Spread Decomposition
-----------------------------

A detailed guide to decomposing the bid-ask spread into its fundamental components: order processing costs, inventory holding costs, and adverse selection costs. The article covers the theoretical models behind each component, methods for empirical estimation including the Roll (1984) and Madhavan-Richardson-Roomans (1997) approaches, and their behavior across different market conditions.

The post also examines time-varying spread dynamics, cross-sectional variation in spread components across different assets, intraday U-shaped spread patterns, and the impact of electronic versus floor trading on spread composition.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/bid-ask-spread-decomposition-1a5ddfd8f554>`__.

Market Liquidity
----------------

An overview of essential measures of market liquidity, from classic spread-based measures to more advanced model-based indicators. The article covers effective spread, realized spread, quoted depth, Amihud illiquidity ratio, Kyle's Lambda, and other key metrics used to quantify the ease with which assets can be traded without significantly affecting their price.

The post explores the theoretical underpinnings and practical applications of each liquidity measure, explaining how they capture different dimensions of liquidity including tightness, depth, resiliency, and immediacy.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/market-liquidity-c66bd2c8ca5a>`__.

Limit Order Book Structure
--------------------------

A comprehensive overview of the limit order book (LOB), the fundamental data structure representing real-time supply and demand for financial instruments. The article covers key components including price-time priority, pro-rata allocation, order book depth, Level I/II/III market data, order book imbalance as a predictor of short-term price movements, queue position, and visible versus hidden depth.

The post explains how understanding LOB structure provides insights into market sentiment, liquidity, and short-term price dynamics. For traders and portfolio managers, this knowledge informs trading strategies, improves execution quality, and enhances risk management.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/limit-order-book-structure-2aed9971e998>`__.

Understanding Order Types
--------------------------

A detailed guide to the order types that translate trading strategies into executed trades in modern financial markets. The article covers market orders, limit orders, stop orders, stop-limit orders, iceberg orders, and more complex conditional and algorithmic order variants, examining their mechanics and strategic applications within the limit order book framework.

The post emphasizes that understanding order types is fundamental to managing execution costs, controlling market impact, and optimizing portfolio performance.

By Simone Menaldo.

`Read the article <https://medium.com/@simomenaldo/understanding-order-types-462f69e62a85>`__.

Why Cumulative Volume Delta Fails Traders
-----------------------------------------

An examination of why Cumulative Volume Delta (CVD), despite its apparent objectivity, consistently misleads traders. The post argues that CVD wins traders over in hindsight — after a session ends, the CVD chart appears to confirm moves cleanly — but in real time, the signal breaks down because CVD measures aggression totals, not who is actually in control of the auction.

The core issue is that CVD assumes aggressive buying should push price up and aggressive selling should push it down, but this ignores the role of passive absorption by limit orders. Instead of relying on CVD as a directional signal, the author advocates examining delta on lower timeframes to observe how aggression is being absorbed or accepted at specific price levels.

By Sierra Trading.

`Read the blog post <https://beyondcandlesticks.substack.com/p/why-cumulative-volume-delta-fails>`__.

TradeFM: A Generative Foundation Model for Trade-flow and Market Microstructure
--------------------------------------------------------------------------------

TradeFM is a 524M-parameter generative Transformer that learns unified trade-flow dynamics directly from billions of trade events across more than 9,000 US equities. The model introduces scale-invariant features and a universal tokenization scheme that map the heterogeneous, multi-modal event stream of order flow into a unified discrete sequence, eliminating asset-specific calibration. Integrated with a deterministic market simulator, TradeFM-generated rollouts reproduce key stylized facts of financial returns including heavy tails, volatility clustering, and absence of return autocorrelation. The model generalizes zero-shot to geographically out-of-distribution APAC markets (Japan and China) with moderate perplexity degradation.

Our summary: the paper's core contribution is demonstrating that the foundation model paradigm — pre-train a large model on massive heterogeneous data, then transfer — works for market microstructure. Rather than calibrating separate models per asset, TradeFM learns a single model across all liquidity regimes and asset types. Practical applications include synthetic data generation for illiquid assets, stress testing under counterfactual scenarios, and training reinforcement-learning-based trading agents.

Key metrics: TradeFM achieves 2-3x lower distributional error than Compound Hawkes baselines across all return intervals.

Mentioned by Iqbal Zainal in `this discussion <https://www.linkedin.com/posts/yllvar_technical-research-publication-ugcPost-7452713814543761408-KFAI/>`__.

`Read the paper <https://arxiv.org/abs/2602.23784v1>`__
