# Reproducing TenSeg change-point detection on real Binance BTC/ETH data

**Audience:** a coding agent with shell + Python + R access.
**Goal:** reproduce the *method and results* of Anastasiou & Cribben (2025), *"Tensor time series change-point detection in cryptocurrency network data"* (TenSeg, arXiv 2510.06211), but driven by **real Binance market data** for BTC and ETH (plus a supporting basket), and validate the detected change-points against known crypto regime events.

---

## 0. Read this first — what you can and cannot reproduce

TenSeg detects **change-points in the second-order (cross-covariance / network) structure** of a time-evolving **tensor**. The paper's tensor was `6 tokens × 100 investors × 100 investors × 300 days` built from **Ethereum investor-to-investor transaction networks** (who traded with whom, per token).

**Public Binance data has no counterparty/investor identities.** You get OHLCV klines and anonymous trades — not a "who-traded-with-whom" network. Therefore:

- ❌ You **cannot** reproduce the investor-network / market-manipulation angle.
- ✅ You **can** reproduce the core contribution: detecting change-points in the **joint second-order structure of a multi-asset, multi-feature tensor** over time, and checking those change-points line up with real market regime shifts.

Do **not** claim you reproduced "fraud detection." Claim you reproduced "TenSeg change-point detection in the cross-covariance structure of a crypto market tensor." Be explicit about this in the final report.

The authors' R code is the ground truth for the algorithm. **Reuse it. Only swap the data-loading and tensor-construction.** Do not reimplement CP decomposition / CCID / Isolate-Detect from scratch unless the repo cannot be made to run.

---

## 1. Original results you are targeting (for comparison)

From the paper, so you know what "success" looks like methodologically:

- **Simulation:** across 18 multiple-change-point settings, TenSeg had the best `N̂=N` frequency in 16/18 and lowest Hausdorff distance in 16/18; typically `N̂=N` in >450/500 runs; runtime in seconds; robust to decomposition choice (CP vs HOSVD), autocorrelation, and small-magnitude changes.
- **Ethereum (300 days, Jul 2017–May 2018):** NORMO selected rank 4; **7 change-points** at t = 31, 66, 98, 115, 160, 209, 258, each coinciding with a macro Ethereum event (China ICO ban, Byzantium fork, Parity hack, ETH crossing $1,000, etc.).

Your crypto target is the analog of the Ethereum result: **a handful of change-points that align with major BTC/ETH regime events** (see §6), shown to be stable and to beat baselines.

---

## 2. Deliverables (Definition of Done)

1. `data/` — raw Binance klines (and optionally aggTrades) for the chosen universe and date range, downloaded from real Binance sources.
2. `build_tensor.py` — reproducible script that turns raw data into the tensor `X` (saved as `.npy` + a flat CSV the R code can read).
3. `run_tenseg.R` — runs the authors' TenSeg on `X`, prints detected change-point indices, the chosen rank/components, and runtime.
4. `validate.py` — maps detected change-point indices → dates → known events table; computes hit/miss vs the event list with a tolerance window.
5. `baselines.R` (or `.py`) — at least 2 competing detectors on the same decomposed series (e.g., `hdbinseg` SBS, plus a univariate PELT/BCP on BTC vol).
6. `report.md` — change-points + dates + matched events, a price chart with regime segments shaded, a robustness check (vary #components and decomposition), and a baseline comparison table. **Include the §0 honesty caveat.**
7. `RESULTS.json` — machine-readable: `{change_points:[{t, date, matched_event, lag_days}], rank, n_components, runtime_s, robustness:{...}}`.

---

## 3. Environment setup

```bash
# Python
python3 -m venv .venv && source .venv/bin/activate
pip install requests pandas numpy matplotlib python-dateutil tqdm

# R (>= 4.2)
# In R:
install.packages(c("rTensor", "hdbinseg", "IDetect", "changepoint", "bcp"))
```

Get the authors' code (this is the algorithm you must use, not re-derive):

```bash
git clone https://github.com/Anastasiou-Andreas/TenSeg.git external/TenSeg
```

Open `external/TenSeg`’s README and scripts. Identify the functions for: (a) CP decomposition (uses `rTensor::cp`), (b) **NORMO** rank selection, (c) **CCID** (cross-covariance isolate detect) with the `L∞` mean-dominant norm + model-selection stopping rule. If CCID/NORMO are vendored in the repo, `source()` them. If a step is missing, note it and fall back: CP via `rTensor::cp`, Isolate-Detect via the `IDetect` package, NORMO rank by scanning ranks and picking the one minimizing redundant-component correlation > 0.7 (the paper's default δ).

---

## 4. Data acquisition — REAL Binance data

**Primary source (no API key, bulk, fast): `https://data.binance.vision/`.**
Monthly spot kline dumps live at:

```
https://data.binance.vision/data/spot/monthly/klines/{SYMBOL}/{INTERVAL}/{SYMBOL}-{INTERVAL}-{YYYY-MM}.zip
# e.g. .../klines/BTCUSDT/1d/BTCUSDT-1d-2021-05.zip
```

Each kline CSV row (no header) is:
`open_time, open, high, low, close, volume, close_time, quote_volume, num_trades, taker_buy_base, taker_buy_quote, ignore`
(`taker_buy_base/quote` give order-flow imbalance — keep them.)

**Fallback (REST, paginated, 1000 rows/call, weight-limited ~1200/min):**

```
GET https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1d&startTime={ms}&limit=1000
```

### Universe and range

- **Interval:** `1d` (daily) for the main run → ~2000 points over the range below, comparable to the paper's T=300 but longer. (Optionally repeat at `1h` for a higher-resolution pass.)
- **Date range:** `2019-01-01` → `2024-12-31` (covers COVID, DeFi summer, the 2021 bull, LUNA, FTX, the 2023 recovery, ETF approval, the 2024 halving — rich in regime shifts for validation).
- **Focal assets:** `BTCUSDT`, `ETHUSDT` (required).
- **Supporting basket (STRONGLY recommended — see §5):** the top ~40–60 USDT spot pairs by cumulative quote volume that have data for (most of) the range. Always include BTC and ETH. **Match the overlap window across symbols** (drop pairs that don't cover the range, or trim the range to maximize overlap — the paper did exactly this with its tokens). Record which symbols/dates were dropped.

Save raw concatenated klines to `data/{SYMBOL}_{INTERVAL}.csv`. Forward-fill at most 1–2 missing daily rows; drop a symbol if it has large gaps. Convert `open_time` (ms) → UTC date.

---

## 5. Tensor construction — two options

> The method needs a **network/second-order structure that evolves in time**. BTC+ETH alone (2 nodes) is too thin to be a "network." Prefer Option A. Use Option B only if explicitly restricted to two assets.

### Option A — RECOMMENDED: cross-asset correlation "network of networks"

This is the closest faithful analog to the Ethereum tensor.

- **Nodes:** the `N` basket assets (incl. BTC, ETH).
- **Layers (`K`):** feature types that play the role the 6 "tokens" played — e.g. `K=3`: log-returns, absolute returns (volatility proxy), and signed/taker-flow. (You may add quote-volume z-score for `K=4`.)
- For each day `t` and each layer `k`, compute an `N×N` rolling **cross-covariance (or correlation) matrix** over a trailing window `w` (e.g. `w = 30` days) of that layer's per-asset series, ending at `t`.
- **Tensor:** `X` with shape `(K, N, N, T)` — directly analogous to the paper's `(6, 100, 100, 300)`. Entry `X[k, i, j, t]` = windowed covariance between asset `i` and `j` in layer `k` at time `t`.
- Standardize each layer. TenSeg then finds when this evolving network's second-order structure shifts ⇒ market regime change-points. BTC and ETH are two focal nodes within `N`.

> ⚠️ The rolling window `w` injects smoothing/lag: a change at day `t` becomes detectable only once it fills the window. Document `w` and treat detected dates as "regime shift around t" (± `w`). Try `w ∈ {20, 30, 60}` as robustness.

### Option B — MINIMAL: strictly BTC/ETH feature tensor

- **Nodes/features per asset (`F`):** e.g. `F=6` — log-return, realized vol (e.g. rolling std of returns), high–low range, quote-volume z-score, taker-buy ratio (`taker_buy_base/volume`), and the BTC–ETH return spread.
- **Tensor:** `X` shape `(2, F, T)` (assets × features × time), a valid 3-mode tensor. TenSeg detects changes in the joint cross-(asset,feature) covariance = regime shifts of the BTC–ETH system.
- Honest but limited: the "network" is only the BTC↔ETH coupling plus feature cross-structure. State this limitation.

**Output of this step:** `X.npy` plus a flat CSV (`tensor_long.csv` with columns `mode1,mode2,mode3,[mode4],t,value`) so the R script can rebuild the tensor with `rTensor::as.tensor`.

```python
# build_tensor.py — sketch for Option A
import numpy as np, pandas as pd, glob, os

INTERVAL="1d"; W=30
syms = [os.path.basename(p).split(f"_{INTERVAL}")[0] for p in glob.glob(f"data/*_{INTERVAL}.csv")]
# load closes & volumes, align on common date index
closes, vols, takerbuy = {}, {}, {}
for s in syms:
    df = pd.read_csv(f"data/{s}_{INTERVAL}.csv", parse_dates=["date"]).set_index("date")
    closes[s]=df["close"]; vols[s]=df["quote_volume"]; takerbuy[s]=df["taker_buy_base"]/df["volume"]
C = pd.DataFrame(closes).dropna(how="any")          # align overlap (record drops!)
ret = np.log(C).diff().dropna()
absret = ret.abs()
flow = pd.DataFrame(takerbuy).reindex(ret.index).fillna(0.5)
layers = {"ret":ret, "absret":absret, "flow":flow}
dates = ret.index[W:]
N, T, K = ret.shape[1], len(dates), len(layers)
X = np.zeros((K, N, N, T))
for ki,(name,L) in enumerate(layers.items()):
    Lv = (L - L.mean())/L.std()
    for ti,d in enumerate(dates):
        win = Lv.loc[:d].iloc[-W:]
        X[ki,:,:,ti] = np.cov(win.values.T)         # N x N covariance network at t
np.save("X.npy", X)
pd.Series([str(d.date()) for d in dates]).to_csv("tensor_dates.csv", index=False, header=["date"])
# also dump tensor_long.csv for R
```

---

## 6. Validation event list (map change-points → these)

After detection, convert each change-point index `t` → date via `tensor_dates.csv`, then match to the nearest event within a tolerance of **±7 days (daily)** / **±48h (hourly)**. Report matched event and lag.

| Date | Event |
|------|-------|
| 2020-03-12 | COVID "Black Thursday" crash |
| 2020-05-11 | BTC 3rd halving |
| 2021-02-08 | Tesla buys $1.5B BTC |
| 2021-04-14 | Coinbase IPO; BTC local top ~$64k |
| 2021-05-19 | China mining crackdown crash |
| 2021-09-07 | El Salvador legal tender; sharp sell-off |
| 2021-11-10 | BTC ATH ~$69k |
| 2022-05-09 → 13 | Terra/LUNA + UST collapse |
| 2022-06-13 | Celsius freeze / 3AC contagion |
| 2022-11-08 → 11 | FTX collapse |
| 2023-03-10 → 11 | SVB / USDC depeg |
| 2023-06-15 | BlackRock spot-BTC-ETF filing |
| 2024-01-10 | Spot BTC ETF approval |
| 2024-03-14 | BTC new ATH (~$73k) |
| 2024-04-20 | BTC 4th halving |
| 2024-08-05 | Yen carry-trade unwind crash |

A successful run will land several change-points within tolerance of these (especially the LUNA, FTX, COVID, and ETF dates, which are large second-order shifts).

---

## 7. Run detection (R), robustness, baselines

```r
# run_tenseg.R — sketch
library(rTensor); source("external/TenSeg/R/normo.R"); source("external/TenSeg/R/ccid.R") # adjust paths
X <- # rebuild tensor from tensor_long.csv into an rTensor::as.tensor(array(...))
rank <- normo(X, delta=0.7)                 # NORMO rank selection (paper default δ=0.7)
dec  <- cp(X, num_components=rank)           # CP decomposition (ALS)
# CCID with L-infinity mean-dominant norm + model-selection stopping rule (paper's choice)
cps  <- ccid_Linf(decomposed_series(dec))    # -> integer change-point indices
cat("rank:", rank, " change-points:", cps, "\n")
```

- **Robustness (mirror the paper):** rerun with `#components ∈ {rank, 10, 5}`, with **HOSVD instead of CP**, and with windows `w ∈ {20,30,60}`. Report stability of the change-point set.
- **Baselines on the same decomposed series:** `hdbinseg::sbs.alg` (SBS), and a univariate `changepoint::cpt.var`/PELT or `bcp` on BTC realized vol. Produce a small comparison table (count detected, agreement with event list, runtime) in the paper's style.

---

## 8. Pitfalls / correctness checklist

- [ ] **No look-ahead beyond the declared window.** Rolling covariance uses only data up to `t`. Standardization that uses full-sample mean/std is acceptable for an *offline* change-point study (the paper is offline) but state it; for any "could-be-tradable" claim you'd need the online/pseudo-sequential variant.
- [ ] **Overlap matching.** Different pairs list at different times; align to a common date index and log dropped symbols/dates (the paper trimmed to maximize overlap).
- [ ] **Survivorship.** A "top-N by volume" basket selected today is forward-looking; prefer selecting by volume *as of the start* of the range, or note the bias.
- [ ] **Stationarity of inputs.** Use returns/standardized features, not raw prices.
- [ ] **CP/ALS is seed-dependent** (no global optimum). Run a few inits; the paper shows robustness to component count — verify yours.
- [ ] **Don't over-interpret.** Coinciding with an event ≠ causation, and there is **no ground truth** for crypto change-points (the paper says this explicitly). Report alignment, not "detection accuracy," on real data.
- [ ] **Honesty caveat from §0 must appear in `report.md`.**

---

## 9. Acceptance criteria

A run is acceptable if:
1. It uses **real Binance data** (downloaded, not synthetic) for BTC, ETH (+ basket for Option A).
2. It runs the **authors' TenSeg algorithm** (CP/NORMO/CCID), not an ad-hoc substitute, OR documents exactly which step was substituted and why.
3. It outputs a small set of dated change-points, **several of which fall within tolerance of the §6 events** (LUNA / FTX / COVID / ETF are the strongest expected hits).
4. It includes the robustness sweep (components × decomposition × window) and a baseline comparison.
5. `report.md` states the §0 limitation plainly.

---

## 10. Optional extension

If you want the "manipulation/micro" flavor the paper had: build **per-asset trade-flow networks from `aggTrades`** (nodes = price-level or time buckets) — still not investor-level, but a richer tensor. Treat as exploratory only; it does not recover counterparty identities.
