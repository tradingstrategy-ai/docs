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
