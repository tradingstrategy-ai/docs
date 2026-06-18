.. meta::
   :description: Research papers and posts on technical indicators, RSI, moving average crossovers, breakout strategies, and calendar seasonality in trading.

Technical Indicators
~~~~~~~~~~~~~~~~~~~~

Technical indicators translate raw price and volume data into quantitative signals for entry, exit, and timing decisions. The research here spans the oldest tools in systematic trading — moving averages, RSI, Donchian channels — as well as rigorous empirical tests of whether these signals contain genuine predictive content once data-mining bias and transaction costs are accounted for. A recurring tension is between the simplicity that makes these indicators robust and the difficulty of distinguishing real edge from overfitting in historical tests.

This collection covers profitability tests of simple technical rules in Bitcoin markets, RSI as both an overbought-momentum signal and a counter-intuitive trend continuation signal, SMA and EMA crossover performance in crypto, volatility-normalized MACD, seasonality effects tied to calendar effects and time-of-day, and breakout strategies including opening-range and Donchian channel approaches. Several entries provide practical implementations with backtested equity curves rather than purely academic evaluations.

Related topics include :doc:`Trend Following <./trend-following>` for moving-average-based trend systems, :doc:`Momentum <./momentum>` for return-based momentum signals distinct from indicator-driven approaches, and :doc:`Backtesting & Research Methodology <./backtesting>` for frameworks for validating whether observed indicator edges are genuine.

Are Simple Technical Trading Rules Profitable in Bitcoin Markets?
-----------------------------------------------------------------

This paper empirically evaluates whether simple technical trading rules — moving average crossovers, filter rules, and momentum strategies — generate statistically significant profits in Bitcoin markets. The study applies these classic technical analysis rules to Bitcoin price data and tests their performance against appropriate benchmarks, addressing whether the well-documented technical trading profits in traditional markets extend to the newer cryptocurrency market.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3016808>`__

Why Overbought RSI Readings Signal Continued Momentum in Crypto
---------------------------------------------------------------

Research Article #67 from Trading Research Hub. Challenges the conventional interpretation of the Relative Strength Index (RSI) by testing a contrarian approach where traditional "overbought" readings are used as buy signals rather than sell signals. The study examines whether high RSI values in trending crypto markets actually predict continued momentum rather than reversals.

The backtesting results demonstrate that in strongly trending crypto markets, high RSI readings often signal persistent momentum rather than imminent reversals. This counter-intuitive finding aligns with the broader momentum literature showing that strong assets tend to continue strengthening, challenging the typical retail trader assumption that overbought conditions automatically warrant selling.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/flipping-the-rsi-script-when-overbought>`__.

SMA Crossovers in Crypto: Why Simpler Trend Signals Outperform Complex Models
------------------------------------------------------------------------------

Research Article #66 from Trading Research Hub. Demonstrates the effectiveness of simple moving average (SMA) crossover strategies in cryptocurrency markets. The study makes the case that simplicity in signal design often leads to more robust out-of-sample performance than complex multi-parameter models.

The article tests various SMA crossover configurations on crypto market data, evaluating performance across different lookback periods and market conditions. The results reinforce the principle that simple, well-understood trading rules with few parameters are less likely to be overfit and more likely to maintain their edge in live trading.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-edge-of-simplicity-trend-following>`__.

EMA Rate-of-Change as a Trend Signal: 3,906% Returns with Controlled Drawdowns
--------------------------------------------------------------------------------

Research Article #59 from Trading Research Hub. Presents a data-driven trend-following strategy using EMA derivatives that generated 3,906% total return with a maximum drawdown of just -27.25%, compared to the market's -92.58% drawdown. The strategy achieved an annualized return of 56.96% with a Sharpe Ratio of 1.5002.

The EMA-derivative approach captures crypto trends through the rate of change of exponential moving averages rather than simple crossovers, providing earlier trend detection while filtering out noise. The article demonstrates through rigorous backtesting that consistent profitability in cryptocurrency markets is achievable through disciplined systematic trading that manages volatility as a core feature.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/how-an-ema-derivative-strategy-delivered>`__.

A Counter-Intuitive RSI Strategy Delivering 602% Returns at Half the Drawdown
------------------------------------------------------------------------------

Research Article #60 from Trading Research Hub. Presents a systematic RSI-based trading strategy that achieved 602.91% total return while limiting maximum drawdown to -33.22% compared to the market's -92.58%. The strategy delivered a Sharpe Ratio of 0.9925, significantly outperforming benchmark risk-adjusted metrics.

The approach transforms traditional RSI interpretations by using a methodical, counter-intuitive framework that turns market volatility from a threat into an opportunity. Rather than relying on complex algorithms or high-frequency trading, the strategy demonstrates how systematic application of a well-tested RSI variant can capture meaningful crypto upside while maintaining remarkably lower risk metrics.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/the-contrarian-rsi-strategy-602-returns>`__.

Turn-of-the-Month Seasonality Effect in Cryptocurrency Returns
--------------------------------------------------------------

Research Article #45 from Trading Research Hub. An in-depth exploration of the turn-of-the-month seasonality effect in cryptocurrency returns. Drawing inspiration from well-documented calendar anomalies in traditional equity markets, the study tests whether similar patterns exist in crypto.

The article examines historical crypto price data to determine if returns cluster around specific calendar dates, and whether this effect is statistically significant enough to be exploited by a systematic trading strategy. The practical implications for timing entries and exits based on calendar effects are tested against benchmark buy-and-hold performance.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-45-the-seasonality>`__.

Testing the Sell-in-May Seasonal Pattern in Bitcoin
----------------------------------------------------

Research Article #27 from Trading Research Hub. Tests the "Sell in May and Go Away" seasonal anomaly in Bitcoin. This well-known traditional finance pattern suggests that equity returns are significantly lower during the May-October period compared to November-April, and the article examines whether it holds in cryptocurrency markets.

The article provides a systematic backtesting of seasonal trading rules on Bitcoin data, evaluating whether adjusting exposure based on this calendar effect would improve risk-adjusted returns. The study adds to the body of research exploring which traditional market anomalies transfer to the structurally different cryptocurrency market.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-27-bitcoin-sell>`__.

Evaluating RSI as a Momentum Signal for Bitcoin and Altcoins
-------------------------------------------------------------

An article examining the validity and usefulness of the Relative Strength Index (RSI) as a momentum signal for Bitcoin and altcoin trading models. The article addresses common misconceptions about how RSI should be interpreted and used in systematic trading.

The article measures the actual signal content of RSI through systematic testing, evaluating its effectiveness as a momentum indicator rather than the traditional overbought/oversold interpretation favored by retail traders. By analyzing how RSI values correlate with subsequent returns across crypto assets, the study provides data-driven guidance on whether and how to incorporate RSI into a quantitative crypto trading model.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/measuring-rsi-as-a-momentum-signal>`__.

A Short-Term Breakout Trading Strategy for Cryptocurrencies
------------------------------------------------------------

Research Article #22 from Trading Research Hub. Presents a short-term breakout trading strategy for cryptocurrencies with total returns of $121,950 in backtesting. The strategy focuses on identifying and trading price breakouts from consolidation ranges on shorter timeframes.

The article provides a systematic implementation of breakout detection rules, including entry triggers, position sizing, and exit criteria. The results demonstrate how short-term momentum captured through breakout signals can generate significant returns in crypto markets, though with the important caveat that short-term strategies face higher execution cost challenges.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-21-short-term-breakout-crypto>`__.

Seasonality in Bitcoin Intraday Trend Trading
----------------------------------------------

An investigation into whether Bitcoin exhibits exploitable intraday trend-following dynamics and, critically, whether those dynamics vary by time of week. Concretum Research constructs a high-frequency Bitcoin trend-following benchmark and uncovers a clear intraweek seasonality pattern they call the "Monday Asia Open Effect."

The key finding is that intraday trend-following performance is strongly positive starting Sunday around 7:00 PM New York time, with elevated returns persisting for roughly 24 hours into Monday, aligning with the Monday open of Asian cash equity markets. In contrast, US Sunday morning is associated with negative benchmark performance, consistent with choppier price action and weaker trend persistence. The article demonstrates that incorporating this day-of-week filter can materially improve portfolio performance for intraday crypto trend-following strategies.

By Concretum Research.

Mentioned by Concretum Research in `this discussion <https://x.com/ConcretumR/status/2017289662902272327>`__.

`Read the article <https://concretumgroup.com/seasonality-in-bitcoin-intraday-trend-trading/>`__.

8 Reasons to Stop Using MACD (and Use This Instead) – with Alex Spiroglou
--------------------------------------------------------------------------

MACD is one of the most widely used momentum indicators in technical analysis, but it carries a structural flaw that makes its readings incomparable across markets, securities, and time periods. The traditional MACD measures the gap between two exponential moving averages in absolute price terms, which means a reading of 10 on the S&P 500 tells you something entirely different from a reading of 10 on natural gas or gold. In this post, Alex Spiroglou — who won the 2022 Charles H. Dow Award for his research on MACD-V — walks through eight concrete reasons why the standard MACD misleads traders, and presents MACD-V as a volatility-normalized replacement that solves these problems systematically.

MACD-V divides the traditional MACD reading by the 26-period Average True Range (ATR) and scales by 100: MACD-V = [(12-EMA − 26-EMA) / ATR(26)] × 100. This normalization removes the effect of price level and absolute volatility, making readings genuinely comparable across assets and time. A reading of 1.5 on gold means the same thing as a reading of 1.5 on crude oil or the German Bund — overbought and oversold thresholds become universal across asset classes, timeframes, and decades. The indicator effectively transforms MACD from a price-denominated momentum gauge into a volatility-denominated one, eliminating the market-specific calibration problem that makes standard MACD unsuitable for systematic multi-market trading systems.

By Andrew Swanscott, Better System Trader.

Mentioned by `@bettersystrader <https://x.com/bettersystrader>`__ in `this discussion <https://x.com/bettersystrader/status/2048781012541280395>`__.

`Read the blog post <https://bettersystemtrader.com/8-reasons-to-stop-using-macd-and-use-this-instead-with-alex-spiroglou/>`__.

Time of Day Same Bar Trading
-----------------------------

A straightforward intraday momentum strategy for ES (E-mini S&P 500) futures using 30-minute bars. The approach analyzes absolute price moves (|Close-Open|) for each 30-minute time slot over a 120-day lookback, building historical distributions per slot. A signal triggers when the current bar's movement exceeds the 90th percentile of that slot's history, trading directionally with the impulse: long if Close > Open, short if Close < Open. The position is held for exactly one 30-minute bar, then exited at close.

The strategy deliberately excludes stop losses, profit targets, regime filters, transaction fees, and risk management to focus purely on the "raw tendency." The author emphasizes that this "extreme impulse by time-of-day effect" appears persistent across both long and short sides and multiple markets, positioning it as a foundational building block for systematic trading systems.

By Petr Podhajsky.

`Read the post <https://www.linkedin.com/posts/petr-podhajsky_im-interested-in-systems-built-on-one-simple-share-7427372617675763712-TuwD>`__.

Project Kintoun: A Regime-Filtered ORB Strategy
------------------------------------------------

A regime-filtered opening range breakout (ORB) strategy for NQ (Nasdaq-100) futures on 1-minute timeframes during US equity morning sessions. The strategy builds on classic ORB mechanics — trading price movements beyond the initial 15-minute range — but adds three validation layers to filter false breakouts: microstructure retest confirmation (price must return to the breakout level), VWAP slope regime filtering (trades align with intraday trend direction), and volume confirmation (breakouts require above-average participation).

Backtested from June 2022 through October 2025 across 1,062 trades, the strategy achieved a 1.47 profit factor, 2.28 Sharpe ratio, 57.24% annualized returns, and a maximum drawdown of -8.46% (6.76 Calmar ratio) on a 33.9% win rate. The implementation handles timezone alignment across daylight savings transitions, incorporates dynamic position scaling based on account equity changes, and uses multiple exit mechanisms including profit targets, stop losses, and time-based exits.

By Jeremy Hsu.

Mentioned by `Jeremy Hsu <https://www.linkedin.com/in/jerm04>`__ in `this discussion <https://www.linkedin.com/posts/jerm04_most-trading-strategies-fail-because-they-share-7423958468975407104-pZ7E>`__: "Most trading strategies fail because they assume the wrong probability model."

`Read the blog post <https://mrjerm.github.io/project_kintoun.html>`__.

How Often Do Stocks Hit 7-12+ ATR Above SMA50? A 10-Year Study
--------------------------------------------------------------

Denis Hamel measures how far US stocks extend above their 50-day simple moving average, expressed in ATR units — the standard ``(Close - SMA50) / ATR(14)`` distance — and turns the empirical distribution of those extensions into a profit-taking framework. The study spans roughly 10 years of daily bars (2016–2026) across 5,998 US common stocks and over 10 million stock-days, counting each continuous run above the SMA50 as a single "leg" (recorded at its peak ATR-distance) to avoid the double-counting that per-day tallies produce. A "CLEAN" filter removes artifacts that masquerade as trends: gap events (any single day with a >25% move, catching biotech FDA pops, reverse-merger spikes, penny pumps) and post-event "pinning" (acquisitions or post-bankruptcy names trading flat while the SMA50 catches up).

The headline rule is "trim hard at 7 ATR, hold a small runner above 11." Three of every five tradable US stocks reached at least 7 ATR over the decade, two-fifths hit 8, a quarter hit 9, while 15+ ATR is a ~1.2% tail and 20+ is essentially never (4 names in 10 years). Roughly two-thirds of legs that touch 7 ATR die there, which is the math behind an aggressive first-touch trim. The pattern is remarkably stable across liquidity tiers measured by point-in-time dollar volume (heavy $50M+, medium $10–50M, light $1–10M) — the peak-distance distribution has the same steep drop after 7 and a very thin tail past 11 — except that lightly-traded names carry a genuinely fatter right tail and deserve a slightly larger runner. The scale-out logic is elegant: the histogram of leg peaks *is* the sell distribution, so selling proportionally at each level harvests the expected move without leaving anything undefined. Even the most-watched momentum names rarely break 10 ATR (TSLA 10.21 in the 2020 COVID rally, AAPL 10.11, NFLX 10.02, NVDA 8.94 in the 2023–24 AI leg), reinforcing the case for trimming when a position gets there.

By Denis Hamel.

`Read the X article <https://x.com/denis__hamel/status/2056088634382537028>`__.
