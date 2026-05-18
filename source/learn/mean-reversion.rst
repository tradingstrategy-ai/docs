.. meta::
   :description: Research papers and blog posts on mean reversion strategies in equities and cryptocurrency markets.

Mean Reversion
~~~~~~~~~~~~~~

Mean reversion strategies exploit the tendency for asset prices to return toward their historical average after periods of extreme deviation. Unlike momentum, which bets on continuation, mean reversion bets on correction. The strategy is particularly effective in markets with high short-term volatility and strong fundamental anchors, such as individual equity stocks where fundamental value acts as a gravitational center. Mean reversion is distinct from pairs trading — which exploits the spread between two correlated assets — in that it focuses on single-asset reversion dynamics.

The research collected here covers both the theoretical foundations of mean reversion as a power-law decay process in equity market dynamics, and practical implementation: buying dips in uptrending stocks, exploiting implied volatility extremes, and systematic strategies that enter when prices deviate significantly from moving averages. Key challenges include distinguishing temporary overshoots from genuine trend changes and avoiding "value traps" where prices fall for fundamental rather than technical reasons.

Related topics include :doc:`Statistical Arbitrage <./statistical-arbitrage>` for pairs-based mean reversion, :doc:`Technical Indicators <./technical-indicators>` for the oscillators commonly used in mean-reversion signal generation, and :doc:`Market Microstructure <./market-microstructure>` for the microstructure dynamics that create mean-reverting patterns at short horizons.

Scale Dependent Dynamics in Equity Market Phase Space
------------------------------------------------------

This paper models mean reversion in equity markets as a scale-dependent power-law decay process, documenting that mean-reversion strength varies with both the magnitude of deviation and the time horizon. The framework provides a rigorous theoretical foundation for understanding why some mean-reversion strategies are profitable in certain regimes but not others.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3456789>`__

Advanced Signal Filtering for Mean Reversion Trading
-----------------------------------------------------

This paper develops a regime-aware neural signal filter for mean-reversion trading that achieves a Sharpe ratio of 11.05 in backtesting. The approach uses machine learning to identify when mean-reversion signals are likely to succeed versus when trending dynamics will overwhelm reversion attempts, significantly improving the timing of mean-reversion entries.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4150721>`__

Buy the Dip
-----------

A systematic approach to buying short-term dips in the stock market. The strategy identifies when stocks have pulled back from recent highs and enters positions mechanically based on predefined rules. The post covers the logic behind mean reversion in equities, entry and exit criteria, and the importance of market regime filtering to avoid catching falling knives during bear markets.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buy-the-dip/>`__.

Buy the Dip Weekly
------------------

A weekly-frequency version of the buy-the-dip mean reversion strategy for stocks. This variant adapts the daily dip-buying approach to a weekly timeframe, making it suitable for traders who prefer less frequent portfolio adjustments. The post walks through the modified rules for weekly signals, position sizing considerations, and how performance compares to the daily version.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buy-the-dip-weekly/>`__.

Buying Short-Term Dips in Stocks
---------------------------------

An interactive backtester for exploring short-term dip-buying strategies in stocks. The tool allows users to adjust parameters like the dip threshold, holding period, and market regime filter to see how different configurations affect historical performance. The backtester demonstrates the core concept that buying temporary pullbacks in uptrending stocks can produce consistent returns when combined with proper market timing and position sizing.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buying-short-term-dips-in-stocks/>`__.

Buying Short-Term Dips in Stocks - RealTest Code
-------------------------------------------------

The RealTest implementation code for the short-term dip buying strategy. This companion post provides the complete RealTest script for the mean reversion strategy that buys temporary pullbacks in uptrending stocks. The code handles position sizing, market regime filtering, and portfolio-level risk management, allowing traders to reproduce and extend the strategy using the RealTest backtesting platform.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/buying-short-term-dips-in-stocks-realtest-code/>`__.

Deep Dip - Innovative Short-Term Mean Reversion
------------------------------------------------

A live trading model implementing a short-term mean reversion strategy called Deep Dip. The system targets stocks that have experienced unusually large short-term drawdowns and enters positions expecting a snap-back rally. The post describes the signal construction, filters used to avoid value traps, position sizing methodology, and real-time tracking of the model's performance as a live trading system.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/deep-dip-innovative-short-term-mean-reversion/>`__.

IV Mean Reversion
-----------------

A trading strategy based on implied volatility mean reversion. The approach identifies when implied volatility for individual stocks has moved significantly away from its historical average and takes positions expecting a reversion to the mean. The post covers how to measure IV deviation, set entry and exit thresholds, and combine the IV signal with directional filters for a complete trading system.

By Peter, CrackingMarkets.

`Read the blog post <https://www.crackingmarkets.com/iv-mean-reversion/>`__.

The Low-Volatility Anomaly Applied to Cryptocurrency Markets
-------------------------------------------------------------

Research Article #43 from Trading Research Hub. Examines the low volatility anomaly applied to cryptocurrency markets. The well-documented volatility effect in equities suggests that lower-risk assets tend to outperform higher-risk counterparts on a risk-adjusted basis, defying the Capital Asset Pricing Model's prediction that higher risk should correlate with higher returns.

The article tests whether this anomaly persists in crypto markets, developing a strategy that targets lower-volatility assets with the aim of achieving competitive returns with significantly less risk. The study explores why the volatility effect exists and its implications for crypto portfolio construction and asset selection.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-43-the-volatility>`__.

Buying Crypto All-Time Highs: A Simple Strategy Beating Bitcoin 2x
-------------------------------------------------------------------

Research Article #42 from Trading Research Hub. Tests a simple momentum strategy based on buying cryptocurrencies at their all-time highs, delivering more than 2x the annualized returns of Bitcoin. The author shares how this counter-intuitive finding emerged from moving away from overly complex models toward simpler, more robust approaches.

The article demonstrates through backtesting that buying assets making new highs, rather than waiting for pullbacks, captures strong trending behavior in crypto markets. The simplicity of the rule makes it less susceptible to overfitting, and the results challenge the common retail trader instinct to avoid buying assets at their most expensive levels.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/research-article-42-buying-cryptocurrency>`__.

Broadening Portfolio Exposure to Detect Strategy Edge Decay Faster
------------------------------------------------------------------

An article describing the process of broadening portfolio exposure for efficient detection of strategy edge decay and failure. The author's portfolio combines momentum and mean reversion strategies, with the goal of reducing outcome correlation across the portfolio.

The article explains the rationale for running multiple strategy types simultaneously: it enables faster identification of when individual systems lose their edge or fail due to overfitting. By maintaining diversified exposure, the trader can detect problems earlier and reduce dependence on any single strategy, creating a more resilient overall trading operation.

By Pedma.

`Read the blog post <https://www.tradingresearchub.com/p/navigating-the-market-a-dynamic-approach>`__.

Short-Term Reversal Persists Globally — If Properly Measured
-------------------------------------------------------------

This paper by Stosik and Zaremba investigates why the classic short-term reversal anomaly appears to have weakened globally and shows that the signal remains alive once properly measured. The authors study 64 countries and find that the standard short-term reversal signal — based on raw past returns — earns just +0.05% per month, effectively dead. However, when the reversal signal is measured relative to industry peers rather than raw price moves, the picture changes dramatically.

The key insight is that mean reversion did not disappear — it moved inside industries. By stripping out the industry component and focusing on stock-specific reversals within sectors, the authors recover a strong and economically significant signal. The industry-adjusted reversal strategy delivers +0.53% per month with a Sharpe ratio of 0.74. This suggests that much of the raw reversal signal was being contaminated by industry momentum, which moves in the opposite direction and masks the underlying mean-reversion dynamics at the individual stock level.

The paper serves as a practical reminder for anyone running factor work: when a known anomaly appears dead, the first place to check is whether the measurement still aligns with the original economic logic. In this case, decomposing returns into industry and stock-specific components reveals that the short-term reversal premium remains robust and tradeable.

Key metrics: standard reversal +0.05% monthly return, industry-adjusted reversal +0.53% monthly return, Sharpe ratio 0.74. Data covers 64 countries.

Mentioned by Ivan Blanco Sanchez in `this discussion <https://www.linkedin.com/posts/ivanblancosanchez_new-research-ideas-finding-short-term-share-7457319174034436096-ocSC>`__.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6630998>`__

Revisiting Trend-Following and Mean-Reversion Strategies in Bitcoin
--------------------------------------------------------------------

This paper by Matúš Padyšák and Radovan Vojtko (Quantpedia) examines whether Bitcoin exhibits trend-following or mean-reversion patterns by analyzing price behavior relative to local maxima and minima over 10-50 day lookback periods. Using Gemini exchange data from November 2015 to August 2024, the authors find that both effects coexist: Bitcoin tends to continue trending upwards when at local highs (momentum) and to bounce back when at local lows (mean reversion).

Our summary: the paper's practical value lies in showing that trend-following and mean-reversion are not mutually exclusive in crypto — they operate at different parts of the price cycle. The combined strategy that buys at both local maxima (riding momentum) and local minima (catching reversals) dramatically reduces drawdowns compared to passive holding while maintaining strong risk-adjusted returns. The 10-day lookback consistently outperforms longer windows, suggesting Bitcoin's dynamics favor shorter timeframes.

Data: Bitcoin prices from Gemini exchange, November 2015 to August 2024. No code provided.

Key metrics: combined strategy annualized return 98.43%, volatility 47.75%, maximum drawdown -37.67%, return/volatility ratio 2.06. Compare to Bitcoin buy-and-hold: volatility 74.35%, maximum drawdown -83.65%.

`Read the paper <https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4955617>`__

Asymmetric Mean Reversion of Bitcoin Price Returns
---------------------------------------------------

This paper by Shaen Corbet (DCU Business School) and Paraskevi Katsiampa (Sheffield Hallam University) is the first study to examine mean reversion in cryptocurrency markets. Using Bitcoin data from July 2010 to February 2018 across minutely, hourly, daily, and weekly frequencies (3,994,142 minutely observations at the highest frequency), the authors apply Asymmetric Nonlinear Autoregressive (ANAR) models to test whether Bitcoin price returns exhibit asymmetric reverting patterns similar to those documented in equity markets.

Our summary: the key finding is that negative Bitcoin returns revert faster and more strongly than positive returns — a pattern consistent with the overreaction hypothesis. The asymmetry is more pronounced in the post-$1,000 sub-period and at higher data frequencies (minutely), becoming more symmetrical at lower frequencies (weekly). Positive returns show positive serial correlation (momentum persistence), while serial correlation with prior negative returns decreases and can turn negative — confirming that downside moves snap back while upside moves tend to continue. Higher-order ANAR models reveal that positive returns have higher persistence than negative returns, further supporting asymmetric reverting behavior.

Data: Bitcoin prices from July 2010 to February 2018 at minutely, hourly, daily, and weekly frequencies. Published in International Review of Financial Analysis (2019). No code provided.

Key metrics: this is a statistical study documenting asymmetric mean reversion patterns rather than a trading strategy, so no trading performance metrics are reported. The paper establishes the empirical foundation that negative crypto returns revert faster than positive returns.

`Read the paper <https://doi.org/10.1016/j.irfa.2018.10.004>`__

Trading Multiple Mean Reversion
---------------------------------

This paper by Elena Boguslavskaya, Mikhail Boguslavsky, and Dmitry Muravey addresses the portfolio construction problem for multiple mean-reverting assets. The authors formulate an optimal control problem for an agent trading several Ornstein-Uhlenbeck mean-reverting assets simultaneously, assuming power utility preferences. They derive a semi-explicit solution that enables analysis of parameter specification errors and optimal portfolio properties.

Our summary: the paper's key theoretical contribution is answering whether zero mean-reversion assets should be included in a portfolio alongside mean-reverting ones, and how to optimally allocate across multiple mean-reverting processes with different speeds and volatilities. The semi-explicit solution form makes the framework practical for real portfolio construction in pairs trading and stat-arb contexts. The analysis of parameter misspecification is particularly relevant for practitioners, as mean-reversion speed estimates are notoriously noisy in practice.

Data: theoretical framework with analytical solutions. No empirical backtesting data. No code provided.

Key metrics: this is a theoretical paper providing closed-form solutions rather than empirical trading results. The framework enables optimal position sizing across multiple mean-reverting spreads under power utility.

`Read the paper <https://arxiv.org/abs/2009.09816>`__

Optimal Mean Reversion Trading with Transaction Costs and Stop-Loss Exit
-------------------------------------------------------------------------

This paper by Tim Leung and Xin Li studies optimal timing strategies for trading a mean-reverting price spread modeled as an Ornstein-Uhlenbeck process. The authors formulate the problem as an optimal double stopping problem to determine when to enter and exit positions while accounting for transaction costs. They extend the analysis to incorporate stop-loss constraints, deriving the optimal price intervals for market entry and exit.

Our summary: the paper provides the mathematical foundation for optimal entry and exit timing in mean-reversion strategies. The key practical insight is that the optimal entry region is a bounded price interval that lies strictly above the stop-loss level, and higher stop-loss levels correlate with lower optimal take-profit thresholds. This creates a direct trade-off between drawdown control and profit targets that mean-reversion traders must navigate. The framework is widely applicable to pairs trading, stat-arb, and any strategy trading OU-modeled spreads.

Data: analytical framework with numerical solutions. Published in International Journal of Theoretical and Applied Finance, Vol. 18, No. 3 (2015). No code provided.

Key metrics: this is a theoretical paper providing optimal stopping rules rather than empirical trading results. The framework derives closed-form entry/exit boundaries as functions of OU parameters, transaction costs, and stop-loss levels.

`Read the paper <https://arxiv.org/abs/1411.5062>`__

Testing for Mean Reversion in Bitcoin Returns with Gibbs-Sampling-Augmented Randomization
------------------------------------------------------------------------------------------

This paper by Douglas Eduardo Turatti, Fernando Henrique P.S. Mendes, and João Frois Caldeira tests whether Bitcoin log-returns exhibit mean reversion using the autoregression test based on Gibbs-sampling-augmented randomization. The methodology employs Markov-switching models to handle heteroskedastic disturbances with a mixture distribution, addressing a key gap in the literature since Bitcoin had not previously been tested for mean reversion using robust methods that account for time-varying volatility.

Our summary: the paper's key finding is that Bitcoin is mean *averting* — not mean reverting — for different return horizons, model specifications, and sub-sample periods from 2010 to 2019. This is an important counter-finding to the common assumption that crypto prices revert to a mean. The explosive characteristic of Bitcoin in the sample period suggests that momentum or trend-following may dominate over mean reversion at the horizons tested. This result complements Corbet and Katsiampa's asymmetric mean reversion finding by suggesting that while short-term negative returns may revert, the overall price process is not mean-reverting.

Data: Bitcoin returns from 2010 to 2019. Published in Finance Research Letters, Vol. 34 (2020). No code provided.

Key metrics: this is a statistical testing paper rather than a trading strategy. The main result is the rejection of the mean reversion hypothesis in favor of mean aversion across multiple specifications.

`Read the paper <https://doi.org/10.1016/j.frl.2019.07.025>`__
