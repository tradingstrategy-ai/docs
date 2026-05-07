# Recategorisation Plan for learn/ Section

## Proposed Categories (19 total)

One RST file per category. Papers and posts merged — no distinction by content type.

### Core Strategy Categories
1. **Momentum** — Cross-sectional and time-series momentum strategies
2. **Trend Following** — Systematic trend following, managed futures, CTA-style
3. **Mean Reversion** — Mean-reversion strategies, oscillators, pairs fundamentals
4. **Statistical Arbitrage** — Pairs trading, cointegration, arbitrage
5. **Carry Trade** — FX carry, funding rate strategies, basis trading, risk premia
6. **Technical Indicators** — RSI, SMA/EMA crossovers, Donchian, breakouts, seasonality

### Market-Specific
7. **Cryptocurrency** — Crypto asset properties, market dynamics, crypto-specific research
8. **DeFi & AMMs** — Uniswap, automated market makers, perpetuals, DeFi protocols
9. **Equity Factors** — Value, quality, size, profitability factors; asset pricing anomalies

### Infrastructure / Methods
10. **Order Flow** — OFI, VPIN, order imbalance, market impact, LOB alpha
11. **Market Microstructure** — Market making, price formation, bid-ask spread, LOB structure
12. **Volatility Modeling** — GARCH/ARCH family, HAR, realized vol, stochastic vol, vol targeting
13. **Time Series Forecasting** — ARIMA, cointegration, ECM, time series fundamentals
14. **Machine Learning** — ML/DL methods applied to trading, feature engineering, labeling

### Systems
15. **Portfolio Construction** — Optimization, HRP, risk parity, allocation, diversification
16. **Risk Management** — Kelly criterion, position sizing, stop losses, drawdown control
17. **Market Regimes** — Regime detection, HMM, Markov switching, regime-adaptive systems
18. **Algorithmic Trading** — Execution, strategy development, live deployment, operational aspects
19. **Backtesting & Research Methodology** — Overfitting, Sharpe tests, validation, research design

---

## Notes on Additional Categories

Beyond the user's initial list, the following were clearly needed:
- **Volatility Modeling** — Large cluster of GARCH/HAR/realized vol papers distinct from forecasting
- **Market Microstructure** — LOB structure, market making inventory models, price formation theory
- **DeFi & AMMs** — 10+ Uniswap papers; too specialized to fold into Cryptocurrency
- **Equity Factors** — Value, quality, R&D alpha, factor timing — distinct from momentum
- **Risk Management** — Kelly, stop losses, position sizing: practical portfolio management
- **Market Regimes** — Regime detection is a major standalone topic across many papers
- **Backtesting & Research Methodology** — Multiple papers/posts on overfitting, Sharpe, validation

---

## Complete Paper/Post Catalog with Proposed Categories

Duplicates noted where same paper appears in both papers.rst and papers-stat-arb.rst.
Source: P = papers.rst, B = blog-posts.rst, SA = papers-stat-arb.rst

### Algorithmic Trading

| Title | Source | Notes |
|-------|--------|-------|
| Can Day Trading Really Be Profitable? | P | Opening Range Breakout profitability 2016-2023 |
| 151 Trading Strategies | P | Reference: 150+ strategies across all asset classes |
| The CoinAlg Bind: Profitability-Fairness Tradeoffs in Collective Investment Algorithms | P | |
| A Quantitative Trading Strategy Based on A Position Management Model | P | ARIMA + position management for gold/bitcoin |
| Dynamic Trading with Predictable Returns and Transaction Costs | P | Optimal portfolio strategy with alpha decay |
| Incorporating Signals into Optimal Trading | P | Markovian signal integration into execution |
| On the Effect of Alpha Decay and Transaction Costs on Multi-period Optimal Trading | P | Dynamic programming for optimal execution |
| Saving $200/Day in Execution Costs by Solving Market Capacity Constraints | B | Practical execution cost case study |
| Why Trading is the Wrong Term for Systematic Portfolio Management | B | Reframes systematic trading |
| Building Systematic Trading Infrastructure: From Backtests to Live Deployment | B | |
| The Realities and Operational Challenges of Running Algorithmic Trading Systems | B | |
| From Market Observation to Testable Hypothesis: Starting Steps of a Trading Model | B | |
| Setting Up Automated Email Alerts for Trading Scanners with SMTP | B | Python/SMTP tutorial |
| Multi-Model Diversification: Balancing Strategy Variety Against Over-Diversification | B | |
| Understanding Directional Edge Decay and System Robustness in Trading | B | |
| Building Regime-Robust Trading Systems Through Market Cycle Analysis | B | |
| Broadening Portfolio Exposure to Detect Strategy Edge Decay Faster | B | |
| Building Uncorrelated Strategy Portfolios and Detecting Edge Decay | B | |
| A Survival-First Approach to Trading System Development | B | |
| What Constitutes Genuine Edge in Financial Markets | B | |
| Building a Crypto Market Scanner in Python with Binance API | B | |
| Key Lessons from The Robot James on Quantitative Trading | B | |
| The Signal Types Needed for Trading | B | Binary, Ensemble, Continuous signal types |
| Multi-Model Diversification: Balancing Strategy Variety Against Over-Diversification | B | |

### Backtesting & Research Methodology

| Title | Source | Notes |
|-------|--------|-------|
| How to avoid overfitting trading strategies | P/B | Duplicate in both files |
| AlgoXpert Alpha Research Framework: A Rigorous IS WFA OOS Protocol | P | Three-stage evaluation protocol |
| The Sharpe Stability Ratio: Temporal Consistency of Risk-Adjusted Performance | P | |
| The 10 Reasons Most Machine Learning Funds Fail | P | Canonical reference on ML fund failures |
| The Deflated Sharpe Ratio: Correcting for Selection Bias, Backtest Overfitting and Non-Normality | P | |
| The Probability of Backtest Overfitting | P | CSCV framework |
| Parameter Diversification: Running Multiple Variations to Reduce Overfitting | B | |
| Backtests Are Sanity Checks, Not Predictions: Rethinking Historical Testing | B | |
| A Single Robust Validation Method Worth More Than 100 Backtests | B | |
| Vs Random Benchmarking: Detecting Lucky Backtests | B | |
| Distinguishing Genuine Trading Signals from Random Noise | B | |
| A Framework for Separating Market Signal from Noise in Trading | B | |
| Data Mining for Trading Alphas: Navigating Overfitting Risks | B | |

### Carry Trade

| Title | Source | Notes |
|-------|--------|-------|
| Dissecting Investment Strategies in the Cross Section and Time Series | P | Carry, momentum, value in TS vs XS |
| Model-Free RL Framework for Portfolio Allocation with Carry Trade Signals | P | RL vs MVO for FX carry |
| Geopolitical Risk in Currency Markets | P | GHML factor, geopolitical carry |
| Anatomy of Cryptocurrency Perpetual Futures Returns | P | Decomposes perp returns into funding components |
| An Empirical Investigation on Risk Factors in Cryptocurrency Futures | P | Basis, momentum, basis-momentum factors |
| The Risk and Return of Cryptocurrency Carry Trade | P | Long high-funding-rate, short low |
| The Crypto Carry Trade | P | Long spot, short perp cash-and-carry |
| Perpetual Futures and Basis Risk: Evidence from Cryptocurrency | P | Perps vs quarterly futures in crises |
| Predictability of Funding Rates | P | Double-autoregressive models for funding |
| Exploring Risk and Return Profiles of Funding Rate Arbitrage on CEX and DEX | P | Delta-neutral funding rate arb |
| Harvesting Funding Rates with a Delta-Neutral Crypto Strategy | B | |
| Forecasting Market Regimes with the sUSDe Term Structure | B | sUSDe/Pendle term structure as regime signal |

### Cryptocurrency

| Title | Source | Notes |
|-------|--------|-------|
| An Investor's Guide to Crypto | P | Broad overview for institutional investors |
| Low-volatility strategies for highly liquid cryptocurrencies | P | Low-vol + stop-loss in crypto |
| Cryptocurrencies: Stylized Facts and Risk Based Momentum Investing | P | Distributional characteristics of crypto |
| Cryptocurrency trading: A systematic mapping study | P | Literature survey |
| Optimal Allocation to Cryptocurrencies in Diversified Portfolios | P | Quantitative BTC/ETH allocation ~2.7% |
| Risks and Returns of Cryptocurrency | P | Foundational crypto asset pricing |
| Common Risk Factors in Cryptocurrency | P | Three-factor model: market, size, momentum |
| Cryptocurrencies and Momentum | P | Tests classic momentum on 143 coins |
| A Factor Model for Cryptocurrency Returns | P | Latent IPCA factor model |
| ASRI: An Aggregated Systemic Risk Index for Cryptocurrency Markets | P | Systemic risk framework with regime ID |
| Crypto Contagion | P | ETF introduction inverted diversification |
| An Investor's Guide to Crypto | P | |
| The Low-Volatility Factor in Cryptocurrency Asset Selection | B | |
| Perpetual Contracts Without Spot Markets: A Hidden Delisting Risk | B | Cautionary: delisting risk for perp-only tokens |

### DeFi & AMMs

| Title | Source | Notes |
|-------|--------|-------|
| An Efficient Algorithm for Optimal Routing Through Constant Function Market Makers | P | Optimal trade routing across CFMMs |
| Automated Market Making and Arbitrage Profits in the Presence of Fees | P | LVR fee model |
| Optimizing Liquidity Provision on Uniswap v3: A Comparative Analysis of Adaptive Strategies | P | |
| How Demeter Improves the Calculation of Liquidity Fees in Uniswap V3 | P | Boundary crossing fee accuracy |
| Pricing Uniswap V3 with Stochastic Process, Part 4 | P | Optimal stopping / Chapman-Kolmogorov |
| Delta Neutral Strategy and Optimization of Uniswap V3 | P | Hedging via AAVE borrowing |
| Pricing Uniswap V3 with Stochastic Process, Part 5 | P | European/American-style valuation |
| An LVR Approach Proof of Guillaume Lambert's Uniswap V3 Implied Volatility | P | LVR equivalence proof |
| Implied Volatility from Uniswap V3 Liquidity Positions | P | IV from LP behavior |
| Uniswap v4: Insights on Performance | P | v4 vs v3 comparative analysis |
| Stochastic Processes and the Pricing of Uniswap V2 | P | Impermanent loss, LVR |
| Vault Allocation Strategies | P | Crypto vault strategy limitations |
| Yield as a Risk Signal: Part II | B | Market making vaults on perp DEXs |
| Arbitrage Opportunities and Efficiency Tests in Crypto Derivatives | P | Fiat-free put-call parity tests |

### Equity Factors

| Title | Source | Notes |
|-------|--------|-------|
| Quality Minus Junk | P | QMJ factor |
| Episodic Factor Pricing | P | Time-varying factor activity |
| A Unified Framework for Anomalies based on Daily Returns | P | DRIF factor |
| R&D Alpha: Investment Intensity and Long-Term Stock Returns | P | R&D as return predictor |
| Magnificent, but Not Extraordinary: Market Concentration in the US and Beyond | P | Index concentration patterns |
| Credit Spread News and Financial Market Risk | P | Credit spread as risk predictor |
| Value Premium: Where Does It Really Come From? | P | Style migrants drive value premium |
| Multiples for Valuation: Go High, Go Low, Ignore the Middle | P | Valuation multiples at extremes |
| Covariance Implied Risk Factors | P | Heteroskedastic PCA factor extraction |
| Anomaly Premiums with Dynamic Exits | P | ML-optimized exits for anomaly portfolios |
| Optimal Factor Timing in a High-Dimensional Setting | P | Factor timing with disciplined shrinkage |
| Cross-Sectional Skewness | P | Power-law idiosyncratic shocks |
| Expected Returns with Cash Flow Trends and Cycles | P | Cash flow trend decomposition |
| Dynamic Factor Allocation via Momentum-Based Regime Switching | P | Factor allocation with momentum switching |
| Don't Mix What Should Be Separated: Why Combining Value and Momentum Signals Destroys Alpha | P | Separate sleeves vs combined ranking |

### Machine Learning

| Title | Source | Notes |
|-------|--------|-------|
| On technical trading and social media indicators for cryptocurrency price classification through deep learning | P | MLP/CNN/LSTM/ALSTM comparison |
| Multi-source aggregated classification for stock price movement prediction | P | GCN + sentiment |
| Clustering Market Regimes Using the Wasserstein Distance | P | Wasserstein k-means |
| Asset Allocation: From Markowitz to Deep Reinforcement Learning | P | Benchmark of 9 allocation strategies |
| Clustered Feature Importance | P | Correlated feature importance via clustering |
| Does Meta-Labeling Add to Signal Efficacy? | P | Empirical evaluation of meta-labeling |
| Algorithmic Crypto Trading Using Information-Driven Bars, Triple-Barrier Labeling and Deep Learning | P | López de Prado pipeline on crypto |
| Stock Price Prediction Using Triple-Barrier Labeling and Raw OHLCV Data | P | Triple-barrier on OHLCV |
| Nonlinear Time Series Momentum | P | ML for nonlinear momentum signal |
| Beyond delta neutrality: Confidence-scaled hedging with machine learning forecasts | P | ML hedge ratio for options |
| Regularised jump models for regime identification and feature selection | P | Joint regime ID and feature selection |
| Dynamic Asset Allocation with Asset-Specific Regime Forecasts | P | Hybrid regime + supervised learning |

### Market Microstructure

| Title | Source | Notes |
|-------|--------|-------|
| The Market Maker's Dilemma: Navigating the Fill Probability vs. Post-Fill Returns Trade-Off | P | Fill probability vs adverse selection |
| Optimal Make-Take Fees in a Multi Market Maker Environment | P | Optimal exchange fee design |
| Where Is the Price of Bitcoin Determined? Price Discovery in a Fragmented Market | P | Binance dominates BTC price discovery |
| The Two-Tiered Structure of Cryptocurrency Funding Rate Markets | P | CEX vs DEX price discovery for funding |
| Market Microstructure Foundations | B | Foundational overview |
| Strategic Trading Models | B | Execution models for large orders |
| Information-Based Models in Market Microstructure | B | Kyle, Glosten-Milgrom models |
| Inventory Models in Market Microstructure | B | Market maker inventory models |
| Bid-Ask Spread Decomposition | B | Components of the spread |
| Market Liquidity | B | Measures of market liquidity |
| Limit Order Book Structure | B | LOB components and mechanics |
| Understanding Order Types | B | Order type taxonomy |

### Market Regimes

| Title | Source | Notes |
|-------|--------|-------|
| Regularised jump models for regime identification and feature selection | P | Also in Machine Learning |
| Dynamic Asset Allocation with Asset-Specific Regime Forecasts | P | Also in Machine Learning |
| Dynamic Factor Allocation via Momentum-Based Regime Switching | P | Also in Equity Factors |
| Clustering Market Regimes Using the Wasserstein Distance | P | Wasserstein k-means |
| Rethinking Trend Following: Optimal Regime-Dependent Allocation | P | Regime-dependent TSMOM |
| Dynamic Mean-Variance Portfolio Allocation under Regime-Switching Jump-Diffusions with Absorbing Barriers | P | |
| Forecasting Market Regimes with the sUSDe Term Structure | B | Crypto regime via funding term structure |
| Testing the January Barometer as a Regime Filter for Crypto Trend Models | B | |
| Adjusting Bitcoin Strategy Exposure Based on Volatility Regimes | B | |
| Systematic Regime Detection for Momentum Strategy Timing | B | |
| Detecting VIX Term Structure Regimes | B | PCA + HMM on VIX term structure |
| Building Regime-Robust Trading Systems Through Market Cycle Analysis | B | |

### Mean Reversion

| Title | Source | Notes |
|-------|--------|-------|
| Scale Dependent Dynamics in Equity Market Phase Space | P | Mean-reversion as power law decay |
| Advanced Signal Filtering for Mean Reversion Trading | P | Regime-aware neural signal filter, Sharpe 11.05 |

*(Note: Statistical Arbitrage covers pairs trading; Mean Reversion covers single-asset reversion strategies)*

### Momentum

| Title | Source | Notes |
|-------|--------|-------|
| Momentum and trend following trading strategies for currencies and bitcoin | P | EMA-based, TS and XS |
| Momentum trading in cryptocurrencies: short-term returns and diversification benefits | P | J/K momentum, DCC correlations |
| Pure Momentum in Cryptocurrency Markets | P | Behavioral anomaly in 24/7 markets |
| Optimizing the Persistence of Price Momentum: Which Trends Are Your Friends? | P | Style and industry momentum persistence |
| All Days Are Not Created Equal: Understanding Momentum by Learning to Weight Past Returns | P | Flexible past-return weighting |
| Beat the Market: An Effective Intraday Momentum Strategy for S&P500 ETF (SPY) | P | Intraday SPY momentum, 1,985% return |
| Risk-adjusted Momentum Strategy Construction and Industry Heterogeneity Analysis Based on STARR Indicator | P | STARR-based downside-controlled momentum |
| A Tale of Two Anomalies: The Implications of Investor Attention for Price and Earnings Momentum | P | Investor attention amplifies price momentum |
| Don't Mix What Should Be Separated: Why Combining Value and Momentum Signals Destroys Alpha | P | Separate sleeves methodology |
| Time Series Momentum | P | Moskowitz, Ooi, Pedersen — 58 futures |
| Time Series Momentum and Volatility Scaling | P | Vol-scaling as source of TSMOM alpha |
| Is Momentum Really Momentum? | P | 12-7 month lookback most profitable |
| Time Series Momentum: Is It There? | P | Skeptical reexamination |
| Bitcoin Intraday Time-Series Momentum | P | First half-hour predicts last half-hour |
| Value and Momentum Everywhere | P | 8 markets, negative correlation |
| Cryptocurrencies and Momentum | P | 143 coins, momentum not convincing broadly |
| Dynamic Time Series Momentum of Cryptocurrencies | P | 20 coins, stronger/longer than equities |
| A Trend Factor for the Cross Section of Cryptocurrency Returns | P | CTREND factor |
| Nonlinear Time Series Momentum | P | ML for nonlinear momentum |
| Simple Crypto Momentum Strategy: Buying Corrections | B | Buying dips in strong-trending assets |
| A Delta-Neutral Cross-Sectional Momentum Strategy in Crypto | B | Market-neutral XS momentum |
| Systematic Momentum in Crypto: 249% Returns with 82% Less Volatility | B | |
| A Counter-Intuitive RSI Strategy Delivering 602% Returns at Half the Drawdown | B | Overbought = continued momentum |
| Applying Faber's Relative Strength Framework to Cryptocurrency Markets | B | |
| Harvesting Risk Premia Through Dual Momentum: Reviewing Antonacci's Framework | B | Relative + absolute momentum |
| A Simple Monthly Momentum Strategy for US Stocks | B | Nasdaq 100 monthly momentum |
| Gold Momentum Strategy | B | Dual-momentum timing for gold |
| Backtesting a Community-Sourced Momentum Strategy | B | |
| Systematic Regime Detection for Momentum Strategy Timing | B | Also in Market Regimes |

### Order Flow

| Title | Source | Notes |
|-------|--------|-------|
| Order Flow and Exchange Rate Dynamics | P | FX order flow, R² >50% |
| Order Flow and Cryptocurrency Returns | P | World order flow → 11% daily crypto returns |
| Flow Toxicity and Liquidity in a High Frequency World | P | VPIN metric |
| The Price Impact of Order Book Events | P | OFI linearly predicts price changes |
| Queue Imbalance as a One-Tick-Ahead Price Predictor in a Limit Order Book | P | One-tick-ahead predictive power |
| The Micro-Price: A High-Frequency Estimator of Future Prices | P | Martingale micro-price |
| Deep Order Flow Imbalance: Extracting Alpha at Multiple Horizons from the Limit Order Book | P | Deep learning on multi-level OFI |
| Cross-Impact of Order Flow Imbalance in Equity Markets | P | Cross-asset OFI effects (also in SA section) |
| Bitcoin Wild Moves: Evidence from Order Flow Toxicity and Price Jumps | P | VPIN Granger-causes Bitcoin jumps |
| High-Frequency Jump Analysis of the Bitcoin Market | P | Jumps, elevated OFI as precursor |
| Good and Bad Self-Excitation in Bitcoin: Asymmetric Self-Exciting Jumps | P | Hawkes process, asymmetric jump clustering |
| Nowcasting Bitcoin's Crash Risk with Order Imbalance | P | GEV crash prediction, 30% pseudo-R² |
| Multi-Level Order-Flow Imbalance in a Limit Order Book | P | Monotonic improvement with deeper levels |
| Deep Limit Order Book Forecasting | P | Deep learning LOB, P&L-aligned metrics |

*(Note: entries 106-112 are duplicates from papers-stat-arb.rst — deduplicate when restructuring)*

### Portfolio Construction

| Title | Source | Notes |
|-------|--------|-------|
| Clustering in Cardinality-Constrained Portfolio Optimization | P | Spectral clustering + MVO |
| Building Diversified Portfolios that Outperform Out-of-Sample | P | Hierarchical Risk Parity |
| Optimal Allocation to Cryptocurrencies in Diversified Portfolios | P | |
| Efficient Portfolio Estimation in Large Risky Asset Universes | P | Constrained sparse regression |
| Covariance Implied Risk Factors | P | Heteroskedastic PCA |
| Asset Allocation: From Markowitz to Deep Reinforcement Learning | P | Benchmark: 9 strategies |
| Optimizing Portfolio Performance through Clustering and Sharpe Ratio-Based Optimization | P | K-means + Sharpe optimization |
| Dynamic Black-Litterman | P | Continuous-time dynamic BL |
| Dynamic Mean-Variance Portfolio Allocation under Regime-Switching Jump-Diffusions | P | |
| Why Mean-Variance Optimization Breaks Down | B | Regularization and constraint survey |
| Fixing Position Sizing by Accounting for Inter-Asset Correlations | B | Correlation fix for vol targeting |
| How Binary Signals Create Inefficient Capital Allocation in Multi-Asset Frameworks | B | |
| Strategic Drag: Accepting Lower Returns for Better Risk-Adjusted Performance | B | |
| Building Uncorrelated Strategy Portfolios and Detecting Edge Decay | B | |
| Using Rolling Correlation to Hit Volatility Targets in Crypto Trend Following | B | |

### Risk Management

| Title | Source | Notes |
|-------|--------|-------|
| Risk Beyond Volatility: A Conditional Framework for Downside Harm and Capital Loss | P | Conditional downside exposure |
| The Kelly Criterion and the Stock Market | P | Practitioner Kelly introduction |
| Portfolio Choice and the Bayesian Kelly Criterion | P | Bayesian Kelly, conservative leverage |
| Leverage and Uncertainty | P | Fractional Kelly for fat tails |
| Wasserstein-Kelly Portfolios | P | Distributionally robust Kelly |
| Credit Spread News and Financial Market Risk | P | Credit spread as systemic risk signal |
| Debugging a Volatility Target Miss: Realizing 20% When Targeting 40% | B | |
| Implementing Dynamic Stop Losses in a Multi-Signal Trading Strategy | B | |
| A Framework for Deliberate Position Sizing and Exposure Control | B | |
| Optimal Bet Sizing: From the Kelly Criterion to Trading Position Management | B | |
| The Hidden Costs and Return Erosion of Stop Losses in Systematic Trading | B | |
| Vol-Based Stops: Stop Leaving Money on the Table | B | |
| Degrossing: Systematic Exposure Reduction to Tame Crypto Volatility | B | |
| Adjusting Bitcoin Strategy Exposure Based on Volatility Regimes | B | Also in Market Regimes |

### Statistical Arbitrage

| Title | Source | Notes |
|-------|--------|-------|
| Trading and Arbitrage in Cryptocurrency Markets | P | Cross-exchange arbitrage |
| Pricing Efficiency and Arbitrage in the Bitcoin Spot and Futures Markets | P | Spot-futures basis efficiency |
| The Relationship Between Arbitrage in Futures and Spot Markets and Bitcoin Price Movements | P | Cash-and-carry capital constraints |
| Arbitrage Opportunities and Efficiency Tests in Crypto Derivatives | P | Put-call parity tests on crypto |
| Short Scamtrash / Long Distinguished Crypto | B | Long/short quality factor in crypto |
| Pairs Trading and Statistical Arbitrage Across Top Cryptocurrencies | B | 23 crypto pairs |
| BTC-ETH Pairs Trading: Correlation Analysis and Statistical Arbitrage | B | BTC-ETH cointegration |
| Cointegration and Error Correction Models | B | Theory: cointegration and ECM |

*(papers-stat-arb.rst contains additional entries — see duplicate note above)*

### Technical Indicators

| Title | Source | Notes |
|-------|--------|-------|
| Are Simple Technical Trading Rules Profitable in Bitcoin Markets? | P | Simple TA rules in Bitcoin |
| Why Overbought RSI Readings Signal Continued Momentum in Crypto | B | Contrarian RSI interpretation |
| SMA Crossovers in Crypto: Why Simpler Trend Signals Outperform Complex Models | B | |
| EMA Rate-of-Change as a Trend Signal: 3,906% Returns with Controlled Drawdowns | B | |
| A Counter-Intuitive RSI Strategy Delivering 602% Returns at Half the Drawdown | B | Also in Momentum |
| Turn-of-the-Month Seasonality Effect in Cryptocurrency Returns | B | Seasonality pattern |
| Testing the Sell-in-May Seasonal Pattern in Bitcoin | B | |
| Evaluating RSI as a Momentum Signal for Bitcoin and Altcoins | B | |
| A Short-Term Breakout Trading Strategy for Cryptocurrencies | B | |
| Seasonality in Bitcoin Intraday Trend Trading | B | Day-of-week patterns |

### Time Series Forecasting

| Title | Source | Notes |
|-------|--------|-------|
| On covariance estimation of non-synchronously observed diffusion processes | P | Covariance without synchronization bias |
| Time Series Fundamentals | B | Foundational overview for finance |
| ARMA and ARIMA Models | B | ARIMA for time series forecasting |
| Cointegration and Error Correction Models | B | Also in Statistical Arbitrage |

### Trend Following

| Title | Source | Notes |
|-------|--------|-------|
| Catching Crypto Trends; A Tactical Approach for Bitcoin and Altcoins | P | Donchian + vol-based sizing |
| Does Trend-Following Still Work on Stocks? | P | US stocks trend profitability |
| Following a Trend with an Exponential Moving Average: Analytical Results for a Gaussian Model | P | EMA P&L distribution theory |
| Trend Following in Strategic Asset Allocation: A Long-Horizon Analysis | P | Trend as structural SAA component |
| A Century of Evidence on Trend-Following Investing | P | 1880–present, consistent results |
| Two Centuries of Trend Following | P | 1800–present, t-stat of 10 |
| Demystifying Managed Futures | P | Trend explains managed futures returns |
| Rethinking Trend Following: Optimal Regime-Dependent Allocation | P | Regime-dependent TSMOM |
| Quantitative Evaluation of Volatility-Adaptive Trend-Following Models in Cryptocurrency Markets | P | Multi-horizon MA + ATR |
| A Trend Following Framework for Gold, Bitcoin, and Nasdaq | B | Donchian + Chandelier Stop |
| Testing the Low-of-Day Stop Loss Rule in Crypto Trend-Following | B | |
| How Relaxing Signal Selection Constraints Doubled Strategy Returns | B | |
| A Filtering Method that Increased Crypto Trend-Following Win Rate to 60% | B | |
| Applying Traditional Managed Futures Trend-Following to Crypto Markets | B | |
| The EWMAC Crypto Strategy: Continuous Trend Signals for Better Position Sizing | B | Continuous EWM signals |
| Combining Trend Signals with Volatility Targeting for 1,127% Return at 67% Less Risk | B | |
| SMA Crossovers in Crypto: Why Simpler Trend Signals Outperform Complex Models | B | Also in Technical Indicators |
| 2024 Performance Review of a Live Systematic Crypto Trend-Following Portfolio | B | |
| Using Volume and Market Cap Rankings to Improve Crypto Trend Signal Selection | B | |
| Diagnosing and Fixing an Underperforming Trend Model | B | |
| Finding the Most Effective Single-Rule Trend Signal for Crypto | B | |
| Using Lower-Timeframe Exits to Improve Trend-Following Risk Management | B | |
| Basic Trend Following | B | Comprehensive primer |

### Volatility Modeling

| Title | Source | Notes |
|-------|--------|-------|
| Volatility-Managed Portfolios | P | Vol-scaling overlay generates alpha |
| Early Birds Get the Vol: Morning Volatility Uncertainty and Variance Risk Premium | P | Morning VVIX predicts next-day variance |
| Realized Volatility Forecasting with Neural Networks | P | LSTM/NARX vs econometric baselines |
| A Machine Learning Approach to Volatility Forecasting | P | ML vs HAR on realized variance |
| Volatility Forecasting with Machine Learning and Intraday Commonality | P | Cross-sectional intraday vol |
| HARNet: A Convolutional Neural Network for Realized Volatility Forecasting | P | CNN extension of HAR |
| Realized Volatility and HAR Models: A New Paradigm for Volatility Forecasting | B | Comprehensive HAR guide |
| Using Log Returns and Volatility to Normalize Strike Distances | B | Log returns and strike normalization |
| The Volatility Paradox: How Lower Risk Produces Superior Returns in Crypto | B | |
| Stochastic Volatility Models | B | Heston and related models |
| Understanding Multivariate GARCH Models | B | MGARCH for multi-asset vol |
| Volatility Modeling: A Deep Dive into the ARCH Family | B | ARCH/GARCH survey |
| Detecting VIX Term Structure Regimes | B | Also in Market Regimes |

---

## Potential Issues / Decisions Needed

1. **Duplicates**: Several papers appear in both `papers.rst` and `papers-stat-arb.rst`:
   - Cross-Impact of Order Flow Imbalance in Equity Markets
   - Bitcoin Wild Moves: Evidence from Order Flow Toxicity and Price Jumps
   - High-Frequency Jump Analysis of the Bitcoin Market
   - Good and Bad Self-Excitation in Bitcoin: Asymmetric Self-Exciting Jumps
   - Nowcasting Bitcoin's Crash Risk with Order Imbalance
   - Where Is the Price of Bitcoin Determined?
   - Pricing Efficiency and Arbitrage in the Bitcoin Spot and Futures Markets
   → **Recommendation**: Keep one copy per entry in the merged categories

2. **"How to avoid overfitting"** appears in both papers.rst and blog-posts.rst — keep once

3. **Borderline assignments**:
   - "Volatility-Managed Portfolios" → Volatility Modeling (not Portfolio Construction)
   - "Cointegration and Error Correction Models" → Time Series Forecasting (not Stat Arb)
   - "Dynamic Factor Allocation via Momentum-Based Regime Switching" → Market Regimes (not Equity Factors)
   - "Building Regime-Robust Trading Systems" → Algorithmic Trading (not Market Regimes)
   - "Seasonality in Bitcoin Intraday Trend Trading" → Technical Indicators (not Trend Following)

4. **Papers-stat-arb.rst** contains a dedicated stat-arb collection — when merging, all its content should go to Statistical Arbitrage and Order Flow categories.
