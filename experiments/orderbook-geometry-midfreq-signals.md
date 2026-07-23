# Order-book geometry → mid-frequency cross-sectional signals — agent brief (v1)

**Audience:** a research agent that designs and backtests trading experiments (shell + Python, its own backtest codebase).
**Goal:** turn a family of **order-book / order-flow / factor-geometry** ideas into **mid-frequency (1-minute to 1-hour) cross-sectional signals** tradeable on **Binance** and **Hyperliquid** perpetual-swap universes of **150+ assets**.
**Repo root:** `/home/mikko/code/docs` — all paths below are relative to it.

**How to use this brief:** this is *context and a reading map*, not a spec to implement literally. Read the linked **posts and papers** (most are already on disk in `articles/`, annotated in `source/learn/*.rst`) and form your own experiment designs. Do **not** assume any particular backtest API — the strategies will be backtested in a separate codebase. Capture the *ideas*, the *math*, the *parameters that matter*, and the *failure modes*.

**One-sentence thesis:** every technique here is a different way of separating **the common-factor part of returns/flow (which you hedge out)** from **the residual / circulating part (which mean-reverts and is what you trade)** — PCA does it with eigenvectors, Hodge decomposition does it with graph calculus, gauge theory names the residual "curvature/holonomy," and order-flow imbalance is the high-frequency observable that drives the residual. They are four lenses on one strategy.

---

## 0. Why this, why mid-frequency, why these two venues

- The **provoking artifact** is a LinkedIn manifesto — *"Stop Calculating Correlations, Start Calculating Market Curvature"* (Nathaniel Brodetsky) — claiming sub-millisecond GPU order-book "curvature" arbitrage. Its **latency/HFT claims are unverified and irrelevant to us**. But its **conceptual core has a real, decades-old academic lineage** (gauge theory of arbitrage, Hodge decomposition of flows) and that core is **timeframe-agnostic** — it works on a graph of *instruments* sampled at 1m-1h just as well as on a graph of *price levels* sampled at the tick.
- **Mid-frequency (1m-1h) is the sweet spot for us:** cross-asset relative mispricings in crypto (perp-basis dislocations, lead-lag between correlated alts, cross-venue gaps) persist for **minutes to an hour** because liquidity is fragmented and capital mobility has frictions (funding, bridging, margin). You capture these **without co-location or microsecond infra**.
- **Binance + Hyperliquid** give two deep, 150+ asset perp universes with **public historical data**, **overlapping but not identical** asset sets, and **different microstructure** (CEX matching engine vs on-chain order book). That overlap is itself a tradeable cross-venue signal (see §5E).

---

## 1. The techniques, explained

Four families, ordered from most-proven to most-speculative. Each has: the idea, the math intuition, the key parameters, what's documented to work, and where to read.

### Family A — PCA / factor-residual statistical arbitrage (the proven backbone)

**Idea.** Decompose each asset's return into a **systematic part** (common factors) and an **idiosyncratic residual**. Model the residual as **mean-reverting (Ornstein-Uhlenbeck)**. Trade against residual deviations: short the rich, long the cheap, in a portfolio that is **neutral to the common factors by construction**.

**Math intuition (Avellaneda-Lee).**
- Build the return correlation matrix over a lookback; take its top **eigenportfolios** (PCA factors). The number of factors needed to explain ~50% of variance drifts with the volatility regime (10-30 in equities; inversely related to VIX).
- Regress each asset's returns on the factors → residual process. Fit OU on a fixed window (~"one earnings cycle"; equities use 60 days — **you must re-scale this for crypto and for 1m-1h bars**).
- Convert to a dimensionless **s-score** = (residual − equilibrium mean) / (residual std). **Open** when |s| exceeds a band (Avellaneda-Lee: open at 1.25σ), **close** near 0 (0.5σ).

**Key parameters that matter:** lookback for the correlation matrix; number of PCA factors (and whether it adapts to the vol regime); whether you **remove PC1 (the market/BTC mode)** explicitly; OU window length and half-life bounds; entry/exit bands; rebalance frequency; turnover/cost model.

**What's documented:**
- Avellaneda-Lee report **net Sharpe ~1.44 (1997-2007), decaying to ~0.9 (2003-07)** as the trade crowded — honest decay reporting. Equities. → `source/learn/statistical-arbitrage.rst:24`, SSRN https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1153505
- **Crypto warning (read this first):** a direct Avellaneda-Lee transfer to crypto found the **PCA eigenportfolio approach is *not* robust in crypto** — a dominant BTC factor with rapidly shifting altcoin correlations does not produce stable mean-reverting residuals. **This is the single most important caveat for our universe.** → `articles/statistical-arbitrage-crypto-markets-pca.pdf`; `source/learn/statistical-arbitrage.rst:397`
- **The fix that works:** **remove the first principal component (market mode)** before forming spreads, then cluster and trade residuals. The cluster-based pairs study found **"PC1-removed" specifications gave the best risk-adjusted performance** (best spec Sharpe ~2.49, max DD -8.7% on ETFs). This is the practical bridge: *PC1 removal = hedging out the common factor = exactly the "gradient" component in Family C.* → `articles/cluster-based-pairs-trading-combining-unsupervised-learning-with-cointegration-filtering.pdf`; `source/learn/statistical-arbitrage.rst:423`
- **Rank-space variant** (index assets by capitalization rank, not identity) substantially outperformed name-space — relevant because crypto's cross-section is dominated by a few names. → `articles/statistical-arbitrage-in-rank-space.pdf`; `source/learn/statistical-arbitrage.rst:156`
- Other on-disk variants: conditional factor model (`articles/on-statistical-arbitrage-under-a-conditional-factor-model-of-equity-returns.pdf`), autoencoder factors (`articles/end-to-end-policy-learning-of-a-statistical-arbitrage-autoencoder-architecture.pdf`), Polish-equities eigenportfolio/LSTM (`articles/statistical-arbitrage-in-polish-equities-market-using-deep-learning-techniques.pdf`).

### Family B — Order-flow imbalance (OFI) features (the high-frequency observable)

**Idea.** Over short horizons, **signed order flow** — not news — is the dominant driver of price change. OFI is the net buy-vs-sell pressure, and it **linearly predicts contemporaneous and short-horizon price moves**. These are the *features* that make the residual in Families A/C/D move; aggregated to 1m-1h bars they become mid-frequency predictors.

**Math intuition / the ladder of OFI:**
1. **Top-of-book OFI (Cont-Kukanov-Stoikov):** a linear combination of additions, cancellations, and executions at the **best** bid/ask. The canonical OFI; linearly predicts price change. → `articles/cont-kukanov-stoikov-price-impact-of-order-book-events.pdf`; `source/learn/order-flow.rst:34`, arXiv https://arxiv.org/abs/1011.6402
2. **Queue imbalance:** bid-size vs ask-size at the best level → one-tick-ahead price-direction predictor. → `articles/gould-bonart-queue-imbalance-one-tick-ahead-price-predictor.pdf`; `source/learn/order-flow.rst:41`
3. **Micro-price (Stoikov):** queue-imbalance-weighted mid; a better fair-value estimator than the mid for labeling and for execution. → `articles/stoikov-the-micro-price.pdf`; `source/learn/order-flow.rst:48`
4. **Multi-Level OFI (MLOFI):** OFI as a **vector across book depth**, not just the touch. Out-of-sample R² improves **monotonically with each added level** — deep liquidity carries information. → `articles/xu-gould-howison-multi-level-order-flow-imbalance.pdf`; `source/learn/order-flow.rst:115`, arXiv https://arxiv.org/abs/1907.06230
5. **Integrated / cross-impact OFI (Cont-Cucuringu-Zhang) — the PCA bridge:** combine multi-level OFIs into a **single integrated OFI via PCA across levels**; then study **cross-asset** OFI. Findings: once own-asset multi-level OFI is integrated, contemporaneous cross-impact mostly vanishes (sparse own-asset models suffice), **but lagged cross-asset OFI adds short-horizon forecasting power that decays rapidly**. This is *the* paper linking OFI, PCA, and cross-sectional prediction. → `articles/cont-cucuringu-zhang-cross-impact-of-order-flow-imbalance.pdf`; `source/learn/order-flow.rst:62`, arXiv https://arxiv.org/abs/2112.13213
6. **Deep multi-horizon OFI (Kolm-Turiel-Westray):** extract alpha from full book depth at **multiple horizons** — the canonical "mid-frequency signal from HF book" framing. → `articles/kolm-turiel-westray-deep-order-flow-imbalance.pdf`; `source/learn/order-flow.rst:55`

**Crypto-specific OFI evidence (important for data choices):**
- In crypto, books are **noisy (spoofing, fast cancels)**, so **trade-flow imbalance (TFI, from executed trades)** is often more reliable than book-based OFI. One BitMEX study found **TFI explains ~75% of price change at hourly horizons** — directly relevant to our 1h target and to using **aggTrades** (which have long public history) instead of full L2. → `articles/order-flow-analysis-cryptocurrency-markets.pdf`; `articles/order-flow-imbalance-high-frequency-trading-signal.pdf`; `source/learn/order-flow.rst:138`
- Signed order flow and Bitcoin returns / price formation: `articles/bitcoin-price-formation-signed-order-flow.pdf`, `articles/order-flow-and-cryptocurrency-returns.pdf`.
- Crypto LOB microstructure & whether deep models beat simple ones (preprocessing > architecture): `articles/wang-crypto-lob-microstructural-dynamics.pdf`; `articles/briola-bartolucci-aste-deep-limit-order-book-forecasting.pdf` (cautionary: *high forecasting accuracy ≠ tradeable*).

**Key parameters:** which flow proxy (full L2 OFI vs aggTrades TFI vs depth-weighted MLOFI); number of book levels; bar aggregation (1m/5m/15m/1h); normalization (by rolling volume / by spread); contemporaneous vs lagged use; decay half-life of the lagged cross-asset signal.

### Family C — Hodge / Helmholtz decomposition on a cross-asset graph (the geometric generalization)

**Idea.** Put the 150 assets on a **graph** (nodes = instruments, edges = pairs). Define an **edge flow** = a pairwise "pressure" (return differential, or signed-flow differential, or basis change) over each bar. **Helmholtz-Hodge decomposition** splits any edge flow **orthogonally** into three pieces:
- **Gradient (exact) component** — flow explained by a single global scalar "price potential." This is the **common factor / market mode** (≈ PC1 in Family A). **Not tradeable** — already priced.
- **Curl (co-exact) component** — **divergence-free, loop-like circulation**: "A cheap vs B, B cheap vs C, C cheap vs A" around closed loops. This is the **relative-value inconsistency you trade.** A basket sized by the loop circulation is **common-factor-neutral by construction.**
- **Harmonic component** — global loops on non-trivial graph topology; usually small, can be folded into curl.

**Why it's the same strategy as Family A, generalized:** PCA-residual stat-arb removes the top eigenvector(s) and trades what's left; Hodge removes the gradient (potential) flow and trades the curl. **Gradient ≈ PC1 ≈ common factor; curl/harmonic ≈ idiosyncratic residual.** Hodge's advantage: it captures **non-pairwise, multi-asset cyclic** inconsistencies that pairwise cointegration/PCA can miss, and it is **"pure linear algebra" (a sparse graph-Laplacian least-squares solve), no ML, no look-ahead** — the one true claim in the manifesto.

**Math intuition:** build the graph incidence/Laplacian; solve a least-squares projection of the edge-flow vector onto the gradient subspace (image of the incidence operator); the residual is curl+harmonic. The **curl around each triangle** is the directly tradeable circulation. (Canonical discrete reference = HodgeRank.)

**Key parameters:** graph construction (fully connected within a correlation cluster, or k-NN by correlation, or thresholded); edge-flow definition (return diff vs flow diff vs basis); cluster formation (HDBSCAN/OPTICS, as in the cluster-pairs paper); whether the curl **mean-reverts or trends** in your universe (test both — if it trends, flip sign and trade lead-lag momentum); loop-closure exit vs time stop.

**Read:**
- The manifesto + a **full glossary mapping its vocabulary to the literature**: `source/learn/market-microstructure.rst:215` (entry) and `:224-240` (glossary with links). PDF: `articles/stop-calculating-correlations-start-calculating-market-curvature.pdf`
- HodgeRank (discrete Helmholtz-Hodge on graphs): Jiang, Lim, Yao & Ye, *Statistical ranking and combinatorial Hodge theory*, arXiv https://arxiv.org/abs/0811.1067
- Cross-impact (why instruments are coupled, the off-diagonal structure the curl lives in): Benzaquen, Mastromatteo, Eisler & Bouchaud, arXiv https://arxiv.org/abs/1609.02395

### Family D — Gauge theory of arbitrage / holonomy (the unifying lens)

**Idea.** Treat capital moving through a sequence of instruments as **parallel transport** on a fibre bundle over the market. If you transport capital **around a closed loop** (e.g. triangular FX, ETF vs constituents, perp↔spot↔futures basis, cross-venue) and **don't return to your starting value**, that gap is a **non-zero holonomy** — and a non-zero holonomy **is exactly an arbitrage profit**. So *"arbitrage = curvature of the market's connection"* is a precise statement, not a metaphor. This is the same object as Family C's curl, expressed in gauge language.

**Why it matters for design:** it tells you **where to look for loops** — any set of instruments related by a no-arbitrage identity (triangular conversions, basis relations, index/constituent, cross-venue same-asset) defines a loop whose holonomy you can monitor at 1m-1h.

**Read:** Ilinski, *Gauge Theory of Arbitrage*, arXiv https://arxiv.org/abs/hep-th/9710148 ; Farinelli, *Geometric Arbitrage Theory and Market Dynamics*, arXiv https://arxiv.org/abs/0910.1671 . (Both summarized with context in `source/learn/market-microstructure.rst:236`.)

### The unification (keep this table in mind)

| Lens | "Common factor" (hedge out) | "Residual" (trade) | Tools |
|---|---|---|---|
| **A. PCA stat-arb** | top eigenportfolios / PC1 (BTC mode) | OU mean-reverting residual, s-score | corr matrix, eigdecomp, OU |
| **B. Order flow** | (the drift the flow is pushing) | short-horizon predictable component of return | OFI / MLOFI / integrated-OFI / TFI |
| **C. Hodge** | gradient (potential) flow | curl (loop circulation) | graph Laplacian, least-squares projection |
| **D. Gauge** | flat connection | holonomy / curvature around loops | parallel transport on loops |

A practical strategy can **combine** them: use Family B (OFI/TFI) as the **edge-flow input** to Family C's graph, remove the gradient (= Family A's PC1), and read the curl as the holonomy (Family D). That composite is the richest experiment.

---

## 2. Reference map (local files first — read these)

**Annotated catalogues (start here, they have critical reviews + links):**
- `source/learn/order-flow.rst` — OFI / MLOFI / integrated-OFI / micro-price / queue imbalance / crypto TFI.
- `source/learn/market-microstructure.rst` — market-curvature manifesto + full gauge/Hodge glossary; LOB structure; price discovery.
- `source/learn/statistical-arbitrage.rst` — Avellaneda-Lee + crypto-PCA negative result + cluster/PC1-removal + rank-space + many crypto stat-arb variants.

**Primary PDFs on disk (`articles/`):**
- Order flow / book: `cont-kukanov-stoikov-price-impact-of-order-book-events.pdf`, `xu-gould-howison-multi-level-order-flow-imbalance.pdf`, `cont-cucuringu-zhang-cross-impact-of-order-flow-imbalance.pdf`, `kolm-turiel-westray-deep-order-flow-imbalance.pdf`, `gould-bonart-queue-imbalance-one-tick-ahead-price-predictor.pdf`, `stoikov-the-micro-price.pdf`, `briola-bartolucci-aste-deep-limit-order-book-forecasting.pdf`.
- Crypto flow: `order-flow-analysis-cryptocurrency-markets.pdf`, `order-flow-imbalance-high-frequency-trading-signal.pdf`, `order-flow-and-cryptocurrency-returns.pdf`, `bitcoin-price-formation-signed-order-flow.pdf`, `wang-crypto-lob-microstructural-dynamics.pdf`, `aperiodic-democratizing-crypto-order-flow.pdf`.
- PCA / factor stat-arb: `statistical-arbitrage-crypto-markets-pca.pdf` (negative result — read!), `cluster-based-pairs-trading-combining-unsupervised-learning-with-cointegration-filtering.pdf` (PC1 removal), `statistical-arbitrage-in-rank-space.pdf`, `on-statistical-arbitrage-under-a-conditional-factor-model-of-equity-returns.pdf`, `end-to-end-policy-learning-of-a-statistical-arbitrage-autoencoder-architecture.pdf`, `statistical-arbitrage-in-polish-equities-market-using-deep-learning-techniques.pdf`.
- Geometry/manifesto: `stop-calculating-correlations-start-calculating-market-curvature.pdf`.

**External links (when not on disk):** Avellaneda-Lee SSRN 1153505; MLOFI arXiv 1907.06230; cross-impact OFI arXiv 2112.13213; HodgeRank arXiv 0811.1067; Ilinski hep-th/9710148; Farinelli arXiv 0910.1671; Benzaquen et al. arXiv 1609.02395; Cont-Kukanov-Stoikov arXiv 1011.6402.

---

## 3. Trading universe: Binance + Hyperliquid, 150+ perps

- **Binance USDⓂ perpetual futures:** ~200+ USDT-margined perps; deep, long history. Use the **liquid subset** (filter by rolling dollar volume) to ~150 names.
- **Hyperliquid perpetuals:** on-chain order book, ~150+ perps. Fetch the live universe from the API meta (so the list stays current).
- **Overlap:** the majors + most large alts exist on both → the **same-asset cross-venue pair** is a natural loop (Family D) and a clean basis/lead-lag signal (§5E). Cross-asset relative value (Families A/C) is computed **within each venue** to avoid mixing microstructures, then optionally compared across venues.

**Universe hygiene (critical for cross-sectional work):**
- **Point-in-time membership** — include a perp only from its listing date; never backfill a 2026 universe onto 2023. Listing/delisting churn is high in crypto.
- **Liquidity filter at the bar's start** (rolling dollar volume), not a present-day snapshot → avoids survivorship/look-ahead.
- **Funding & contract specs** differ per venue and per asset — capture them (funding intervals, tick size, min notional) because they drive both the basis loops and the cost model.

---

## 4. Data acquisition (documented sources; verify endpoints before bulk pulls)

**Binance (no API key, bulk):** `https://data.binance.vision/`
- USDⓂ futures klines: `.../data/futures/um/monthly/klines/{SYMBOL}/{INTERVAL}/{SYMBOL}-{INTERVAL}-{YYYY-MM}.zip` (intervals `1m,5m,15m,1h,...`).
- Signed trade flow (for TFI, the recommended crypto flow proxy): **aggTrades** dumps `.../futures/um/monthly/aggTrades/{SYMBOL}/...` — sign by the `isBuyerMaker` flag.
- Funding & mark/index: available via REST `fapi`. Full L2 depth history is limited — **prefer aggTrades-derived TFI for mid-frequency**; treat full-book MLOFI as a live-only or limited-window enhancement.
- REST fallback: `GET https://fapi.binance.com/fapi/v1/klines?symbol=...&interval=...&limit=1500`.

**Hyperliquid (public info API + archive):** base `https://api.hyperliquid.xyz/info` (POST JSON).
- Universe: `{"type":"meta"}` (perp universe + specs); `{"type":"metaAndAssetCtxs"}` (adds funding, open interest, mark). Use this to build the **point-in-time 150+ list**.
- Candles: `{"type":"candleSnapshot","req":{"coin":"BTC","interval":"1m","startTime":<ms>,"endTime":<ms>}}`.
- Historical L2 book / trades: Hyperliquid publishes an **S3 archive (requester-pays)** — verify the current bucket/path from their docs before bulk download. Use for true book-based OFI if you want it; otherwise derive signed flow from trades.
- **Caveat:** Hyperliquid funding is hourly (vs Binance 8h) — this materially affects basis loops and holding costs; capture it explicitly.

**Bar grid:** build aligned UTC bars at **1m, 5m, 15m, 1h**. Start experiments at **5m or 15m** (1m is cost-hostile; see §6), confirm edge, then test 1m on the tightest names and 1h for the slower relative-value loops.

---

## 5. Signal-construction recipes at 1m-1h (concrete starting points)

These are *starting hypotheses*, not prescriptions. Each yields a **cross-sectional, market-neutral** book.

**5A. PCA-residual reversion (Family A, the baseline to beat).**
Per venue, rolling window of bar returns over the 150-universe → correlation matrix → remove **PC1 (BTC/market mode)** (and optionally PC2-PCk) → residual returns → cumulative residual → OU fit → s-score. Long bottom-decile s, short top-decile s, equal dollar, PC1-neutral. **Sweep:** window length, #factors (fixed vs vol-adaptive), OU half-life bounds, entry/exit bands, bar size. **Watch:** the crypto-PCA negative result (`statistical-arbitrage-crypto-markets-pca.pdf`) — expect instability unless PC1 is removed and clusters are used.

**5B. Cluster + PC1-removed spreads (Family A robustified).**
Standardize returns cross-sectionally, remove PC1, cluster (HDBSCAN/OPTICS) → within-cluster spreads filtered by half-life/Hurst → z-score reversion. Mirrors the best-performing documented spec (`cluster-based-pairs-trading-...pdf`). **This is likely the most robust baseline for crypto.**

**5C. OFI/TFI short-horizon predictor (Family B).**
Aggregate **signed trade-flow imbalance** per asset per bar (from aggTrades / HL trades), normalize by rolling volume. Test (i) **contemporaneous** TFI→return impact (sizing/execution), and (ii) **lagged** TFI→next-bar return (alpha) — expect **rapid decay** (Cont-Cucuringu-Zhang). Cross-sectional: long high-positive-TFI, short high-negative-TFI, market-neutral, very short hold (1-5 bars). **Sweep:** flow proxy (TFI vs depth-weighted), normalization, horizon, decay half-life.

**5D. Hodge curl reversion (Family C, the headline experiment).**
Within a correlation cluster: build the instrument graph; edge flow = pairwise return differential (or TFI differential) per bar; Helmholtz-Hodge decompose; **discard gradient, trade curl.** Long cheap legs / short rich legs sized by loop circulation → common-factor-neutral basket. Exit on loop closure or time stop at horizon. **Sweep:** graph construction, edge-flow definition, cluster size, **mean-revert vs trend** test on the curl. **Compare directly to 5B** — does the multi-asset loop structure beat pairwise spreads?

**5E. Cross-venue basis / holonomy (Family D).**
For each asset on **both** Binance and Hyperliquid: monitor the **price/basis loop** (and funding-adjusted carry). Non-zero, mean-reverting holonomy = cross-venue dislocation → long cheap venue / short rich venue. Also exploit **funding-interval mismatch** (HL hourly vs Binance 8h). **Sweep:** dislocation threshold vs cost, funding inclusion, hold horizon. This is the cleanest, lowest-dimensional loop and a good early win.

**Composite (the richest):** TFI edge-flow (B) → cross-asset graph → remove gradient/PC1 (A) → trade curl/holonomy (C/D). Build this only after the single-family baselines are understood.

---

## 6. Execution, costs, frictions (make-or-break at this frequency)

- **Costs dominate at 1m.** A loop/cluster basket touches many legs; each pays half-spread + fee + slippage. The dislocation must clear **total round-trip cost**. Use realistic per-venue fees (approximate — **verify current schedules**): Binance USDⓂ taker ~4-5 bps / maker ~1.8-2 bps; Hyperliquid taker ~2.5-3.5 bps / maker ~1 bp or rebate. **Model maker vs taker explicitly** — these strategies often only survive as **maker/passive**.
- **Funding carry** is a real P&L term for multi-bar holds and the *whole point* of basis loops — include it (and the HL-hourly vs Binance-8h mismatch).
- **Turnover budget:** report gross vs net at several cost levels; a signal with high gross Sharpe and 0.05 net Sharpe is the default failure mode here (cf. `briola-bartolucci-aste-deep-limit-order-book-forecasting.pdf`: accuracy ≠ tradeability).
- **Capacity / impact:** sizing must respect each leg's depth; the liquidity filter (§3) caps the universe.
- **Latency realism:** 1m-1h does **not** need HFT infra, but **do not use same-bar look-ahead** — signal computed on bar `t` trades at `t+1` open (or with an explicit fill model).

---

## 7. Experiment menu (suggested Definition-of-Done for the research agent)

1. **Baseline:** 5B (cluster + PC1-removed reversion) on Binance-150 at 15m → net Sharpe vs cost curve. Establishes the number to beat.
2. **Crypto-PCA stability check:** reproduce the documented **negative** result (5A without PC1 removal) and confirm PC1 removal fixes it — quantify the gap.
3. **OFI/TFI decay curve:** 5C — measure lagged-TFI predictive R² vs horizon (1m…1h); locate the half-life. Decide whether TFI is alpha or just execution.
4. **Hodge vs pairwise:** 5D vs 5B head-to-head on the same clusters/horizon — does multi-asset loop structure add net Sharpe?
5. **Cross-venue holonomy:** 5E — basis/funding dislocation between Binance & Hyperliquid; the cleanest loop.
6. **Composite:** B→C→A/D stack; only if 3-5 show signal.
7. **Robustness for every survivor:** walk-forward (no global refit), point-in-time universe, gross/net at multiple cost levels, turnover, max DD, regime split (trend vs chop; pre/post a major BTC move), and a **curl mean-revert-vs-trend** diagnostic.

---

## 8. Pitfalls & validation gotchas

- **Survivorship / look-ahead in the universe** — point-in-time membership + liquidity filter at bar start. The #1 way these backtests lie.
- **Crypto factor instability** — BTC dominates; altcoin correlations whip. PC1 removal and clustering are not optional. Re-estimate factors rolling.
- **Noisy books** — prefer **trade-flow (TFI)** over book-OFI in crypto; full L2 history is scarce anyway.
- **Curl may trend, not revert** — always test both signs; lead-lag momentum is a legitimate fallback (Cont-Cucuringu-Zhang lagged cross-asset signal).
- **Cost blindness** — always report net; separate maker/taker; include funding.
- **Estimation of the graph** — shrinkage on the correlation matrix; thresholded/cluster graphs, or you Hodge-decompose noise and trade phantom loops.
- **Manifesto claims** — ignore the <1ms / GPU / "no one else sees it" framing entirely; keep only the gradient-vs-curl decomposition.

---

## 9. Open questions for the research agent to resolve empirically

- At what bar size does each family go **net-positive** after realistic costs? (hypothesis: 5E earliest, 5C latest.)
- Does the **Hodge curl** beat pairwise PCA-residual spreads enough to justify its complexity?
- What is the **decay half-life** of the lagged cross-asset OFI/TFI signal in crypto perps, and is it stable across regimes?
- Is **Hyperliquid's on-chain book** microstructure different enough that book-OFI works there where it fails on Binance?
- Does removing **more than PC1** (PC1-PCk, k vol-adaptive) help or overfit?

---

**Provenance:** ideas and parameters above are drawn from the annotated catalogue in `source/learn/{order-flow,market-microstructure,statistical-arbitrage}.rst` and the PDFs in `articles/` cited inline. Read the sources before designing — this brief is a map, not a substitute.
