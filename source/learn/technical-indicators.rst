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

100 Trading Indicators Tested Across 4,100+ Strategies
------------------------------------------------------

Tomas Nesnidal tests 100 indicator conditions across 4,115 breakout strategies: 3,500 NASDAQ strategies and 615 Bitcoin strategies, both using 60-minute data and in-sample/out-of-sample splits. The study is designed to avoid the usual "one indicator, one hand-picked strategy" trap by applying each filter across many baseline breakout systems and scoring whether it improves net profit, return ratio, win percentage, average trade, and maximum drawdown.

The main result is that simple volatility and participation measures dominate. Bar range relative to ATR is the best overall individual filter, reducing NASDAQ maximum drawdown by 40%, improving net profit by 60%, and carrying the strongest robustness score into unseen data. Volume indicators work especially well on NASDAQ, where volume data is cleaner, while Bitcoin is led by volatility filters such as standard deviation; crypto volume filters are weaker out-of-sample, likely because exchange fragmentation and wash trading make the data noisier. The sharp negative result is on oscillators: RSI, stochastics, and related overbought/oversold tools consistently rank near the bottom for breakout trading because they are built for mean-reversion logic, not continuation after range expansion.

By Tomas Nesnidal.

Mentioned by `Breakout Trading Academy (@onlybreakouts) in this X discussion <https://x.com/onlybreakouts/status/2062596797936075062>`__, where the thread summarizes the article as evidence that bar range relative to ATR, volume, and other simple volatility/participation filters beat more complex indicator conditions across thousands of breakout strategies.

`Read the blog post <https://breakoutos.com/blog/research-indicator-study>`__

The Volume Momentum Deviation Factor
-------------------------------------

A short, self-contained write-up of a volume-based factor the author calls the Volume Momentum Deviation Factor. The construction is a MACD histogram computed on volume rather than price: take a fast smoothed moving average of volume, subtract a slow one, then subtract that difference's own smoothing, leaving the second-order deviation. The published formula is ``sma(volume,13,2) - sma(volume,27,2) - sma(sma(volume,13,2) - sma(volume,27,2),10,2)`` — a 13/27 volume MACD with a 10-period signal line, expressed in the two-argument SMA convention used by Chinese quant platforms (period, weight).

The economic story is a lead-lag one. When short-horizon volume strengthens sharply against its longer-horizon baseline, participation and trading heat are rising; when that pickup in volume structure is not yet matched by a corresponding price move, the author reads the gap between fund behaviour and price performance as evidence of an incipient trend or a mispricing. The factor is meant to capture that "volume leading, price not yet reflecting" state and the continuation or correction that follows it. The post shows a backtest equity curve and notes that the whole thing is two lines of source code, inviting readers to test it themselves.

By 套利豪仔 (@pritipatelfgoo).

`Read the X post <https://x.com/pritipatelfgoo/status/2091750955582980218>`__.

Replicating and Improving the Saty Phase Oscillator Opening-Window Strategy
----------------------------------------------------------------------------

An X quote-chain in which a published intraday index-futures strategy is independently rebuilt, validated against beta and against randomised entries, and then improved. The Milk Man (@MrMilkTrading) posted the rules and a backtest; the Dutch Warren (@etbent1) reimplemented it from the Pine source in two independent codebases and reported both the replication and several modifications, which the original author acknowledged. It is a useful entry less for the specific system than as a worked example of what a serious replication of a social-media strategy post looks like: same-endpoint reproduction on a different instrument and window, an explicit beta control, a random-entry null, train/test splits, a parameter sweep to check whether the published threshold is a fitted peak, and an MAE study to answer the "where's your stop" objection with measurement rather than assertion.

**The strategy.** The signal is the Saty Phase Oscillator — a free, widely distributed TradingView indicator that plots price displacement from the 21-period EMA normalised by ATR(14) — read on a 10-minute NQ chart using extended-hours data. When the oscillator *closes* above +100 the system goes long; when it closes below −100 it goes short. Per the replicator, the ±100 boundary corresponds to roughly 3 ATR of displacement from the moving average, so this is a continuation trade that buys extension rather than fading it. Entries are permitted only in the 9:30–11:00 ET window; a position is exited on the opposite cross of the oscillator, or flattened at the close if that cross never comes. There is no stop and no profit target. On NQ from 2019, one contract with friction included, the original author reported 392 trades, a 59% win rate, a 1.86 profit factor, +$259,883 and a −$29,707 maximum drawdown. The replication ran on USTEC from 2020 (where its data begins) via both an MQL5 expert advisor and a Python twin, neither tuned toward the published figures, and finished at 13,038 points against the original's 12,994 — about 2% apart on a different index over a different window. Two controls back up the result: mechanically buying every open in the same 9:30–11:00 window returns +6.5 points per trade over 1,716 trades against the signal's +35.0 over 373, so the result is not simply long exposure to a rising index, and the strategy beat all 1,000 of 1,000 random-entry variants.

**The improvements.** Two changes held on both the 2020–23 train split and the 2024–26 test split. First, ending the entry window at 10:00 rather than 11:00 lifts the profit factor from 1.97 to 2.34 and roughly doubles return over drawdown; the effect is monotone, with every widening of the window making results worse. The replicator ties this to the indicator's construction — ATR(14) on a 10-minute chart spans 140 minutes, so at 9:30 the normaliser is computed almost entirely from premarket bars while by 11:00 it is full of regular-hours bars, meaning the nominal 3-ATR threshold is no longer measuring the same quantity as the session progresses. Second, exiting at the 61.8 level rather than waiting for the full traverse to −100 raises the profit factor from 1.97 to 2.16, and Saty's indicator already plots that level. A third refinement, posted separately, skips any entry sitting more than 2.5 ATR from session VWAP: this ends in the same place on 258 trades instead of 373 while cutting equity drawdown from 1,797 points to 759. Two negative results are as informative as the positive ones. Sweeping the entry threshold from 80 to 120 shows 100 to be a clean peak on both halves of the sample rather than a fitted artefact, so the published parameter needed no adjustment. And on the missing stop, measured maximum adverse excursion shows winners at a median of 35 points (95th percentile 137) against losers at a median of 117 — the distributions overlap so heavily that any stop tighter than 150 points destroys returns, giving up 53% of total profit at 60 points and 21% at 100 points, while a 200-point stop costs only 1%. There is room for a catastrophe stop, but not for a working one.

**Our reading of why it works.** This paragraph is inference from the mechanics, not a claim made in the source posts. The construction quirk the replicator identifies as a nuisance is more plausibly the edge itself. Because ATR(14) on 10-minute bars looks back 140 minutes, a signal firing at 9:30–10:00 normalises the opening move against overnight bars, which are thin and low-range; a displacement that reads as 3 ATR on that scale is a far smaller bar than 3 ATR of regular-hours volatility would be. In practice the trigger therefore fires on days when the opening auction has repriced the index decisively beyond its overnight range — that is, on genuine information events and large order imbalances rather than on noise. Institutional flow of that kind is not a single print: parent orders discovered at the open are worked through the morning on scheduled algorithms, so the initial displacement is followed by continued same-direction pressure, which is the standard microstructural explanation for opening-range and intraday momentum effects. That framing predicts each of the improvements. The 10:00 cutoff works because the imbalance is largest and least worked-off early, and because by late morning the normaliser has become regular-hours-scaled, so a +100 print requires a much larger and later move that is more likely to mark the end of the repricing than its start. Exiting at 61.8 works because the edge decays as the imbalance is absorbed, so the last leg of the traverse gives back more than it captures. And the VWAP-distance filter works because an entry far from session VWAP means chasing a move that is largely complete — the same exit reached from a worse price, which is precisely the trade whose adverse excursion is worst. On this reading the strategy is a liquidity-provision-avoiding momentum trade on opening imbalance, and the oscillator is a convenient, if accidental, detector of it.

Caveats the exercise itself surfaces. The sample is small in the way all intraday index systems are — roughly 380 trades over six to seven years — and it spans a period of sustained Nasdaq appreciation, though the beta control partly addresses that. Robustness across instruments is uneven: US500 reaches the same conclusion but only in the second half of the sample, with a 2020–23 profit factor of 1.14 against USTEC's 1.60, which is weak enough to suggest the effect is concentrated in the higher-beta, more retail-driven index. Neither post reports the long/short breakdown, slippage assumptions beyond "friction included", or how the results survive the 2020 volatility regime specifically. And the entire system runs without a working stop, which the MAE study justifies statistically but which remains a live tail-risk decision rather than a solved problem.

By The Milk Man (@MrMilkTrading), with the replication and extensions by the Dutch Warren (@etbent1).

The chain runs `original rules and backtest <https://x.com/MrMilkTrading/status/2092599219521507760>`__ → `independent replication and two improvements <https://x.com/etbent1/status/2092707152251191659>`__ → `the author's acknowledgement <https://x.com/MrMilkTrading/status/2092710877845655590>`__ → `the VWAP-distance filter <https://x.com/etbent1/status/2092860879712801203>`__.

`Read the X post <https://x.com/etbent1/status/2092860879712801203>`__
