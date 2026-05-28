.. meta::
   :description: Research papers and blog posts on momentum strategies in equities, cryptocurrency, and multi-asset portfolios.

Momentum
~~~~~~~~

Momentum strategies exploit the tendency for assets that have recently outperformed to continue outperforming, and for recent laggards to continue lagging. This phenomenon is one of the most robust and well-documented anomalies in finance, persisting across asset classes, geographies, and time periods spanning over a century. Researchers distinguish between time-series momentum — where an asset's own past return predicts its future return — and cross-sectional momentum, which ranks assets relative to each other. Both forms have been documented in equities, currencies, futures, commodities, and cryptocurrencies.

The papers and posts collected here span the full range of momentum research: foundational academic work establishing the statistical evidence, practitioner-focused studies on crypto and equity market implementation, and applied frameworks for combining momentum with volatility targeting, regime filters, and risk-adjusted ranking. Key topics include dual momentum, lookback period selection, the relationship between momentum and behavioral biases, and the question of whether momentum is truly a risk premium or an exploitable inefficiency.

Related topics include :doc:`Trend Following <./trend-following>`, which shares conceptual roots but focuses on time-series signals and longer-horizon systematic programs, :doc:`Equity Factors <./equity-factors>` for momentum within factor model contexts, and :doc:`Mean Reversion <./mean-reversion>`, which represents the opposite force and is often combined with momentum for balanced portfolio construction.

Momentum and trend following trading strategies for currencies and bitcoin
--------------------------------------------------------------------------

This paper tests EMA-based time-series and cross-sectional momentum strategies on currencies and Bitcoin. The authors find that momentum signals generate positive risk-adjusted returns in both asset classes, with Bitcoin exhibiting particularly strong trending behavior. The paper compares various lookback periods and provides practical guidance on implementation for systematic traders.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3306117>`__

Momentum trading in cryptocurrencies: short-term returns and diversification benefits
--------------------------------------------------------------------------------------

This paper studies J/K momentum strategies in cryptocurrency markets, examining whether buying recent winners and selling recent losers generates risk-adjusted returns. Using DCC correlation models to analyze portfolio diversification, the authors document positive momentum payoffs in crypto markets and explore how these strategies interact with traditional asset portfolios.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3505204>`__

Pure Momentum in Cryptocurrency Markets
----------------------------------------

This paper documents a pure momentum anomaly in cryptocurrency markets, attributing it to the behavioral dynamics of a 24/7 trading environment with no circuit breakers. The authors find momentum effects that are distinct from those in equity markets, driven by the unique microstructure and participant composition of crypto markets.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3984188>`__

Optimizing the Persistence of Price Momentum: Which Trends Are Your Friends?
-----------------------------------------------------------------------------

This paper examines the persistence of price momentum across different market segments, finding that style and industry momentum exhibit different decay patterns than traditional cross-sectional momentum. The authors develop methods for identifying which momentum trends are most likely to persist and provide guidance on lookback period selection.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2906243>`__

All Days Are Not Created Equal: Understanding Momentum by Learning to Weight Past Returns
-----------------------------------------------------------------------------------------

This paper introduces a flexible framework for weighting past returns when constructing momentum signals, challenging the standard equal-weighting of each month in a formation window. The authors learn optimal past-return weights from data, showing that simple modifications to return weighting can significantly improve momentum signal quality and out-of-sample performance.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3745000>`__

Beat the Market: An Effective Intraday Momentum Strategy for S&P500 ETF (SPY)
------------------------------------------------------------------------------

This paper documents an intraday momentum effect in S&P 500 ETF trading, showing that the first half-hour return predicts the last half-hour return with sufficient consistency to generate a strategy that delivered approximately 1,985% return over the sample period. The strategy exploits persistent intraday autocorrelation that has proven robust over multiple years of testing.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2687349>`__

Risk-adjusted Momentum Strategy Construction and Industry Heterogeneity Analysis Based on STARR Indicator
----------------------------------------------------------------------------------------------------------

This paper proposes using the STARR (Stable Tail Adjusted Return Ratio) indicator to construct risk-adjusted momentum strategies that control for downside risk while capturing momentum premia. The authors document industry heterogeneity in momentum returns and show that risk-adjusted construction improves risk-adjusted performance relative to raw return momentum.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4401552>`__

A Tale of Two Anomalies: The Implications of Investor Attention for Price and Earnings Momentum
------------------------------------------------------------------------------------------------

This paper studies how investor attention amplifies both price momentum and earnings momentum, finding that assets receiving less investor attention tend to exhibit stronger momentum effects. The results connect momentum to the gradual information diffusion hypothesis, where attention constraints slow the market's incorporation of fundamental information.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1462497>`__

Time Series Momentum
---------------------

The seminal Moskowitz, Ooi, and Pedersen paper documenting time-series momentum across 58 liquid futures contracts in equities, currencies, commodities, and fixed income. The paper shows that past 12-month returns positively predict the next month's returns across all asset classes, with a t-statistic exceeding 5.0. This is the foundational reference for all subsequent time-series momentum research.

By Tobias J. Moskowitz, Yao Hua Ooi, and Lasse Heje Pedersen.

`Read the paper <https://pages.stern.nyu.edu/~lpederse/papers/TimeSeriesMomentum.pdf>`__

Time Series Momentum and Volatility Scaling
--------------------------------------------

This paper decomposes the returns of time-series momentum strategies to show that volatility scaling — adjusting position sizes inversely to recent volatility — is the primary source of their superior risk-adjusted performance. The authors demonstrate that the constant-volatility version of TSMOM outperforms the raw version, providing theoretical and empirical support for volatility-targeted implementation.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2599874>`__

Is Momentum Really Momentum?
------------------------------

This paper examines the detailed structure of the momentum effect in equities, finding that the 12-7 month lookback window — which skips the most recent month — is the specification that generates the most robust and statistically significant momentum profits. The paper addresses concerns about data mining and provides guidance on which lookback configurations are most reliable.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1898995>`__

Time Series Momentum: Is It There?
------------------------------------

A skeptical reexamination of the time-series momentum evidence, testing whether the phenomenon holds up under alternative specifications, out-of-sample periods, and risk adjustment methods. The paper provides a balanced assessment of the evidence and identifies conditions under which TSMOM profits are most reliably present.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2657404>`__

Bitcoin Intraday Time-Series Momentum
---------------------------------------

This paper documents an intraday time-series momentum effect in Bitcoin, showing that the first half-hour of Bitcoin trading predicts the last half-hour with statistical significance. The effect is analogous to the SPY intraday momentum documented by Gao et al. and suggests that the mechanisms driving intraday autocorrelation operate similarly in crypto markets.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3681439>`__

Value and Momentum Everywhere
------------------------------

AQR's landmark cross-asset study documenting value and momentum premia across 8 major asset classes including equities, bonds, currencies, and commodities. The paper shows that momentum and value are pervasively positive across all asset classes and that they are negatively correlated with each other, making them natural complements in a diversified systematic portfolio.

By Clifford S. Asness, Tobias J. Moskowitz, and Lasse Heje Pedersen.

`Read the paper <https://pages.stern.nyu.edu/~lpederse/papers/ValMomEverywhere.pdf>`__

Cryptocurrencies and Momentum
------------------------------

This paper tests classic cross-sectional momentum strategies across a large universe of 143 cryptocurrencies from 2014 to 2018. The authors find that for the broad universe, winner-minus-loser returns are close to zero and generally insignificant, challenging the straightforward application of equity momentum strategies to crypto markets. Some trimmed-sample specifications produce negative rather than positive momentum returns.

`Read the paper <https://osuva.uwasa.fi/bitstream/handle/10024/10391/Osuva_Grobys_Sapkota_2019.pdf>`__

Dynamic Time Series Momentum of Cryptocurrencies
--------------------------------------------------

This paper studies time-series momentum across 20 major cryptocurrencies, finding that the TSMOM effect in crypto is stronger and persists over longer horizons than in traditional equity markets. The authors develop a dynamic version of TSMOM that adapts to the unique distributional characteristics of crypto returns.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3901012>`__

A Trend Factor for the Cross Section of Cryptocurrency Returns
---------------------------------------------------------------

This paper develops the CTREND factor — a trend-based cross-sectional factor for cryptocurrency returns — and shows that it explains a significant portion of the cross-section of crypto returns. The factor captures both time-series and cross-sectional momentum components and provides a unified framework for understanding trend-related return predictability in crypto markets.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3913248>`__

Nonlinear Time Series Momentum
--------------------------------

This paper applies machine learning methods to capture nonlinear features of time-series momentum signals, documenting that momentum signals exhibit nonlinear dynamics that linear models miss. The authors show that ML-enhanced momentum strategies outperform their linear counterparts, particularly in periods of regime change.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3950660>`__

Simple Crypto Momentum Strategy: Buying Corrections
-----------------------------------------------------

A straightforward crypto trading approach shared by Pavel demonstrating that simple strategies can work effectively in cryptocurrency markets. The strategy involves: buying corrections on the highest momentum coins, holding positions for one day, and applying a basic regime filter to avoid unfavorable market conditions.

The equity curve shown suggests consistent performance with this systematic approach. The strategy exemplifies how basic momentum and mean-reversion concepts can be combined—buying dips in strong trending assets while using regime filtering to stay out during adverse market conditions.

By Pavel (Robuxio).

`See the original discussion <https://x.com/PKycek/status/1966803799278055516>`__

A Delta-Neutral Cross-Sectional Momentum Strategy in Crypto
------------------------------------------------------------

Research Article #73 from Trading Research Hub. Explores a delta-neutral cross-sectional momentum strategy applied to cryptocurrency markets. Cross-sectional momentum ranks assets against each other based on their relative performance, going long the strongest performers and short the weakest to create a market-neutral portfolio.

The strategy aims to capture the momentum premium in crypto while eliminating directional market exposure. By maintaining delta neutrality, the approach seeks to profit from the spread between winners and losers regardless of overall market direction, making it particularly relevant for volatile crypto markets where directional risk can overwhelm individual alpha signals.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/a-delta-neutral-cross-sectional-momentum>`__.

Systematic Momentum in Crypto: 249% Returns with 82% Less Volatility
----------------------------------------------------------------------

Research Article #61 from Trading Research Hub. Presents a systematic momentum strategy that delivered 249% returns with 82% less volatility than the broader crypto market. The article addresses the core challenge of crypto investing: extreme drawdowns exceeding 90% and volatility above 80% that make buy-and-hold approaches impractical for most investors.

The strategy uses a systematic momentum approach with volatility targeting to deliver steady growth while avoiding the worst of crypto's drawdown episodes. The article demonstrates how disciplined risk management can capture a significant portion of crypto's upside while making the return stream suitable for investors who cannot tolerate the asset class's native risk profile.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/249-returns-with-82-less-volatility>`__.

A Counter-Intuitive RSI Strategy Delivering 602% Returns at Half the Drawdown
-------------------------------------------------------------------------------

Research Article #60 from Trading Research Hub. Presents a systematic RSI-based trading strategy that achieved 602.91% total return while limiting maximum drawdown to -33.22% compared to the market's -92.58%. The strategy delivered a Sharpe Ratio of 0.9925, significantly outperforming benchmark risk-adjusted metrics.

The approach transforms traditional RSI interpretations by using a methodical, counter-intuitive framework that turns market volatility from a threat into an opportunity. Rather than relying on complex algorithms or high-frequency trading, the strategy demonstrates how systematic application of a well-tested RSI variant can capture meaningful crypto upside while maintaining remarkably lower risk metrics.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-contrarian-rsi-strategy-602-returns>`__.

Applying Faber's Relative Strength Framework to Cryptocurrency Markets
-----------------------------------------------------------------------

Research Article #57 from Trading Research Hub. Applies the relative strength investing framework from Mebane Faber's 2010 paper "Relative Strength Strategies for Investing" to cryptocurrency markets. The study tests whether the momentum-based ranking and allocation rules that have worked in traditional markets translate to the unique dynamics of crypto assets.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/relative-strength-in-cryptocurrencies>`__.

Harvesting Risk Premia Through Dual Momentum: Reviewing Antonacci's Framework
------------------------------------------------------------------------------

Research Article #23 from Trading Research Hub. An in-depth review of Gary Antonacci's 2012 paper on dual momentum, which combines relative momentum (comparing assets against each other) with absolute momentum (an asset's own past performance) to harvest risk premia across asset classes.

The article explains how momentum has been documented across equities, currencies, bonds, and other asset classes, while acknowledging that the reasons for its persistence remain debated between rational (risk premia) and behavioral (herding, anchoring) explanations. The dual momentum framework is analyzed for its applicability to cryptocurrency portfolio construction and systematic trading strategies.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-23-risk-premia-harvesting>`__.

A Simple Monthly Momentum Strategy for US Stocks
-------------------------------------------------

A beginner-friendly systematic trading strategy using monthly momentum on Nasdaq 100 stocks. The approach focuses on robustness over complexity, framing the strategy as premium harvesting of beta rather than alpha mining — fewer moving parts mean fewer things that can break compared to overoptimized, datamined strategies.

The exact rules: trade only when NDX is in an uptrend (Close > MA200), filter the Nasdaq 100 universe for stocks also in uptrend with positive 6-month returns, rank by 6-month return once a month, buy the top 5 equally weighted at 20% each, hold for one month, then repeat. No stop loss, no profit target. The author positions this as a solid core sleeve for a systematic portfolio that can be improved by combining it with uncorrelated strategies like long mean reversion or by adding better filters and ranking criteria.

By Petr Podhajsky.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_not-sure-where-to-start-with-systematic-trading-share-7426649340364046336-3mSb>`__.

Gold Momentum Strategy
-----------------------

A simple dual-momentum approach for timing gold investments. The strategy combines 12-month total return signals from both gold (GLD) and 10-year U.S. Treasuries (IEF) to filter out weak periods and reduce drawdowns.

The trading rules are straightforward: when both gold and Treasury returns are positive at month-end, go long gold; if either is negative, stay in cash. This deliberate simplicity—with minimal parameters—reduces the risk of overfitting. Based on research from Allocate Smartly's "Gold Cross-Asset Momentum," historical backtesting over 50 years shows the strategy has generally reduced exposure during losing phases and outperformed a basic gold-only momentum approach.

By QuantifiedStrategies.com.

`Read the post <https://x.com/QuantifiedStrat/status/2020152068422648277>`__

Backtesting a Community-Sourced Momentum Strategy
--------------------------------------------------

Strategy Backtest #14 from Trading Research Hub. Tests a momentum-based trading strategy through systematic backtesting. Part of an ongoing series designed to make strategy research accessible by collecting backtests of different approaches in one place, saving readers hours of independent research time.

The article tests specific strategy rules from the community, providing honest performance analysis including both the promising and concerning aspects of the results. It emphasizes the importance of working with practitioners who have proven live track records, and the distinction between historical backtest performance and actual trading outcomes.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/strategy-backtest-14>`__.

Systematic Regime Detection for Momentum Strategy Timing
---------------------------------------------------------

An article on the systematic approach to regime targeting for momentum trading strategies. The article argues that trading against the general market direction is one of the most common causes of losses, and presents a framework for identifying favorable market regimes.

The article covers how to define and detect market regimes, how to adjust strategy exposure based on the current regime, and how to avoid trading during unfavorable conditions. The practical framework helps momentum traders align their positions with the broader market trend while knowing when to reduce exposure or "go fishing."

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/optimizing-trading-strategies-mastering>`__.

NDX Momentum
------------

A momentum-based rotational strategy focused on Nasdaq-listed stocks. The system ranks stocks by their momentum scores and rotates into the strongest performers while applying a market regime filter to reduce exposure during unfavorable conditions. The post details the ranking methodology, rebalancing frequency, and historical performance characteristics of this systematic approach to capturing momentum in technology-heavy equities.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/ndx-momentum/>`__.

US Stock Momentum Trading System for Retail Traders
----------------------------------------------------

A comprehensive deep research report on building a US stock momentum trading system suitable for retail traders. The post was generated using ChatGPT Pro's Deep Research functionality and covers extensive academic and practical sources on momentum strategies. It addresses universe selection, momentum measurement, portfolio construction, rebalancing schedules, and risk management, providing a thorough starting point for retail traders looking to implement systematic momentum strategies.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/us-stock-momentum-trading-system-for-retail-traders-deep-research/>`__.

RealTest Code for SPX Momentum Rotational System
-------------------------------------------------

Complete RealTest code for an SPX momentum rotational system, backtested using Norgate Data with commissions and delisted stocks included. The system checks a market regime filter based on the balance between stocks with positive and negative longer-term momentum, then opens up to 10 positions ranked by momentum. The post provides the full implementation code for site supporters.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/realtest-code-for-spx-momentum-rotational-system/>`__.

Dynamic Asset Allocation for Practitioners, Part 3: Risk-Adjusted Momentum
---------------------------------------------------------------------------

A comprehensive study testing 13 different risk-adjusted momentum indicators across 16,116 simulation variations to determine whether accounting for volatility and drawdowns improves momentum-based asset allocation. The metrics tested include Sharpe ratio, Omega ratio, Sortino ratio, Calmar ratio, DVR (Sharpe x R-squared of equity curve), VaR, CVaR, max loss ratio, average drawdown ratio, high-low differential, Ulcer Performance Index, gain-to-pain ratio, and fractal efficiency.

The key finding is that all 13 methods delivered virtually identical median results with an average pairwise correlation of 0.945, suggesting investors inherently exhibit risk awareness when expressing momentum preferences. However, risk-adjusted approaches showed much smaller dispersion than pure price momentum, and aggregating all approaches into a combined index delivered superior risk-adjusted performance with a Sharpe ratio of 1.29 — outperforming any single metric alone. The research demonstrates that diversifying across multiple highly correlated risk-adjusted momentum indicators provides measurable risk-reduction benefits without sacrificing returns.

By ReSolve Asset Management.

`Read the blog post <https://investresolve.com/dynamic-asset-allocation-for-practitioners-part-3-risk-adjusted-momentum/>`__

Dynamic Asset Allocation for Practitioners Part 2: Risk-Adjusted Momentum
--------------------------------------------------------------------------

The second installment in a series on dynamic asset allocation, investigating how 13 risk-adjusted momentum metrics compare to raw momentum for portfolio construction. The research tests across a 10-asset universe spanning commodities, gold, US/European/Japanese/emerging market stocks, international REITs, and treasuries from 1995 onward, using multiple portfolio concentrations (2–5 holdings) and systematic asset removal to minimise selection bias.

The DVR and return-to-max-loss ratio delivered the highest Sharpe ratios, while the Ulcer Performance Index achieved the best return-to-maximum-drawdown performance. A counterintuitive finding: risk-adjusted momentum portfolios exhibited lower Sharpe ratios than raw momentum systems from Part 1, suggesting that disaggregating risk management from momentum signals may produce better results. The gain-to-pain ratio demonstrated the greatest consistency across different asset universes and concentrations.

By Adam Butler, GestaltU.

`Read the blog post <https://www.gestaltu.com/2013/06/dynamic-asset-allocation-for-practitioners-part-2-risk-adjusted-momentum.html/>`__

Risk-Adjusted Momentum Oscillator (RAMO)
-----------------------------------------

An open-source TradingView indicator that combines traditional momentum calculation with real-time risk assessment, addressing a gap in conventional momentum indicators by incorporating drawdown metrics into momentum calculations. The core innovation is a self-regulating system that automatically adjusts signal sensitivity based on current risk conditions using the formula: Risk_Factor = 1 - (Current_Drawdown / Maximum_Drawdown × Scaling_Factor), with a floor of 0.05 to prevent complete signal suppression.

The indicator supports three momentum calculation modes (rate of change, price momentum, log returns) and employs adaptive EMA smoothing where the alpha parameter adjusts based on volatility percentile — faster response during volatile periods, stability during calm markets. Z-score normalisation clamps values to [-3.5, 3.5] for outlier handling. Additional features include momentum acceleration (second derivative) for early trend change detection, linear regression prediction for leading signals, and volume-based exhaustion detection for identifying potential reversals on declining volume. The risk environment classification (low/medium/high based on drawdown depth) filters long signals during high-risk conditions.

By EdgeTools.

`Read the blog post <https://www.tradingview.com/script/EdEL00bP-Risk-Adjusted-Momentum-Oscillator/>`__

Systematic Allocation in International Equity Regimes
------------------------------------------------------

A research article examining systematic tactical allocation between US equities and international markets (EAFE and Emerging Markets) using momentum-based signals. The study uses a 56-year dataset (1969–2025) to test whether a signals-based framework can systematically time exposure to EAFE equities amid changing macroeconomic conditions.

Two strategies are tested: a pure spread momentum approach using rate-of-change signals across 6, 12, 24, and 36-month lookback periods, and a trend-conditioned approach applying simple moving average filters for allocation signals. The research finds intermediate-term windows (12–36 months) generate optimal risk-adjusted returns by balancing signal responsiveness against noise, and that systematic overlays can generate alpha orthogonal to equity-market betas — particularly during major secular market transitions.

By Cyril Dujava, Quantpedia. Mentioned by Radovan Vojtko in `this discussion <https://x.com/quantpedia/status/2026951652809244711>`__.

`Read the article <https://quantpedia.com/systematic-allocation-in-international-equity-regimes/>`__

A 46-Year Backtest on a Carhart Momentum Strategy: Why Tiny Edges Compound
--------------------------------------------------------------------------

A LinkedIn post reporting a 46-year (1980–2026) backtest of a cross-sectional Carhart momentum strategy run on a 100-stock S&P 500 universe with monthly rebalancing. The strategy produces a 24.7% CAGR versus the S&P 500's 9.6%, an information ratio of 0.81, and positive returns in 55% of 389 monthly rebalances. The central argument is that a statistically tiny edge — a mean information coefficient (IC) of just 0.013, effectively noise in isolation — compounds into meaningful alpha when applied across many independent bets. Invoking Grinold's Fundamental Law of Active Management (IR ≈ IC × √Breadth), the author shows that 0.013 × √389 ≈ 0.26 per period scales into a strong information ratio, framing systematic investing as a contest won by breadth and discipline rather than by heroic single forecasts.

The momentum factor that this strategy harvests is the same one Mark Carhart added to the Fama-French three-factor model in 1997, building on the cross-sectional winners-minus-losers anomaly documented by Jegadeesh and Titman (1993). Its strengths are well established: momentum is one of the most robust and pervasive anomalies in finance, persisting across asset classes, geographies, and over a century of data, and — as the post illustrates — it offers high breadth, making it well suited to systematic, diversified implementation. Its weaknesses are equally well documented. The factor lacks a clean theoretical foundation (Carhart treated it as an empirical, atheoretical add-on); it suffers rare but catastrophic crashes (e.g. roughly -73% over three months in 2009) that occur during sharp market rebounds and make returns highly non-normal; it carries high turnover, so transaction costs can erode or even eliminate paper profits; and its premium has decayed sharply, averaging only ~2% annually over 2014–2024 versus ~10% in the 1990s, with crowding via factor ETFs frequently blamed. Practitioner remedies include residual/idiosyncratic momentum, volatility scaling, and dynamic crash-risk management.

The post's own discussion surfaces the key caveats. The Grinold framework assumes bets are independent, frictionless, and have constant IC — assumptions that rarely hold. One commenter (Alexander Hübbert) notes that consecutive 12-month momentum signals overlap by eleven months, so the 389 monthly rebalances are far from 389 independent bets, which inflates the effective breadth and overstates the implied information ratio; the 100 S&P 500 names are also highly correlated rather than orthogonal. Other commenters question multi-factor strategies' recent real-world performance and raise survivorship-bias concerns about a backtest restricted to current/historical large-cap constituents. Together these points are a useful reminder that a backtested IR of 0.81 on overlapping, correlated, frictionless bets is an optimistic upper bound rather than a deliverable live result.

By Gilberto Pellerano. Shared in `this LinkedIn discussion <https://www.linkedin.com/posts/gilberto-pellerano-46b4b0174_ran-a-46-year-backtest-on-a-carhart-momentum-share-7464530180594757632-JKGY/>`__.

`Read the post <https://www.linkedin.com/posts/gilberto-pellerano-46b4b0174_ran-a-46-year-backtest-on-a-carhart-momentum-share-7464530180594757632-JKGY/>`__.
