# BTC/ETH regime filter with Statistical Jump Models (`jumpmodels`) — agent brief (v2)

**Audience:** a coding agent with shell + Python.
**Goal:** build an **online regime filter** for BTC and ETH that classifies the market into **bull / sideways / bear**, using Statistical Jump Models (`jumpmodels`). The filter is a **sidecar**: it does not trade by itself — it emits a daily regime label + probabilities that *other* strategies consume to scale exposure, switch parameters, or de-risk.

**Repo root:** `/home/mikko/code/docs` (all relative paths below are from there). The key papers are **already downloaded to `articles/`** — read them locally, do not re-download.

---

## 0. Why jump models (and why not what we tried before)

The previous attempt (TenSeg) was an *offline* change-point detector — it tells you where structure broke in hindsight, not what state you're in today. A sidecar filter needs the opposite: a **causal, persistent, low-whipsaw** state signal updated each day.

Statistical Jump Models (JM) are the right tool:
- They keep the latent-state idea of an HMM (Markov/HMM lineage) but **penalize state switches** (the "jump penalty" λ), so regimes are **persistent** instead of flickering — the #1 failure mode of plain Gaussian-HMM filters.
- They're **unsupervised clustering on temporal features**, robust and fast, with a **scikit-learn-style API** and **online inference**.
- There is direct **crypto precedent** (sparse JM on cryptocurrency returns — see §7).

**Non-negotiable design rule:** this is a *filter*, so everything must be **causal**. Use **filtered** (online) state inference, never full-sample smoothed labels. No look-ahead in scaling, feature windows, or state→regime labeling.

---

## 1. Reference files already on disk — READ THESE FIRST

All paths relative to repo root `/home/mikko/code/docs`.

### Method (the algorithm you must reproduce)
- `articles/learning-hidden-markov-models-with-persistent-states-by-penalizing-jumps.pdf` — **Nystrup, Lindström & Madsen (2020)**, *Learning HMMs with persistent states by penalizing jumps* (ESwA 150:113307). **The foundational jump model.** Read the algorithm (jump penalty, coordinate-descent fit) and the trading/transaction-cost result.
- `articles/feature-selection-in-jump-models.pdf` — **Nystrup, Kolm & Lindström (2021)**, *Feature selection in jump models* (ESwA 184:115558). Basis of the **Sparse JM (SJM)**; use when the feature set is large/noisy.
- `articles/identifying-patterns-in-financial-markets-extending-the-statistical-jump-model-for-regime-identification.pdf` — **Aydınhan, Kolm, Mulvey & Shu (2024)**, *Extending the statistical jump model for regime identification* (Annals of OR). **Continuous JM** (soft state probabilities) + regime-based allocation — the basis for soft exposure scaling in the sidecar.

### Crypto-specific precedent
- `articles/what-drives-cryptocurrency-returns-a-sparse-statistical-jump-model-approach.pdf` — *What drives cryptocurrency returns? A sparse statistical jump model approach* (Digital Finance, 2023). **Closest prior work** — mirror its feature set and state interpretation for crypto.
- `articles/regime-switching-forecasting-for-cryptocurrencies.pdf` — *Regime Switching Forecasting for Cryptocurrencies* (2025). On-topic crypto regime study; use for feature ideas and event sanity-checks.

### Package / code (the implementation)
- `articles/jumpmodels-readme.md` — README of the maintained `jumpmodels` library (discrete JM, continuous JM, sparse JM; sklearn-style API; preprocessing + online inference helpers).
- `articles/jumpmodels-nasdaq-example.py` — **worked example** (NASDAQ regime identification). This is your code template — adapt it to BTC/ETH.
- `articles/jumpmodels-references.md` — citation pack + links.

### Benchmarks / cross-checks already on disk
- `articles/regime-changes-in-bitcoin-garch-volatility-dynamics.pdf` — **Ardia, Bluteau & Rüede (2019)**, MS-GARCH Bitcoin volatility regimes. Reproducible risk-on/off cross-check for your bear/bull split.
- `articles/rethinking-trend-following-optimal-regime-dependent-allocation.pdf` — regime-dependent allocation overlay design (sidecar usage pattern).
- `articles/dynamic-factor-allocation-via-momentum-based-regime-switching.pdf` — momentum/regime allocation reference.
- `articles/forecasting-realised-volatility-using-regime-switching-models.pdf` (2025) — vol-regime modeling.
- `articles/autoregressive-conditional-heteroskedasticity-and-changes-in-regime.pdf` — **Hamilton & Susmel (1994)**, the SWARCH ancestor (context for regime-switching volatility).

### Catalogue (annotated, with critical reviews)
- `source/learn/market-regimes.rst` — our annotated regime-paper list incl. Koki et al. Bayesian HMM (the **HMM benchmark to beat on whipsaw/turnover**) and the items above.

> Still missing (in `articles/index.json` with `download_failure_reason`, fetch later with a browser): *Regularised jump models for regime identification and feature selection* (SSRN), *Adjusting Bitcoin Strategy Exposure Based on Volatility Regimes* (browser). Not blockers.

---

## 2. Deliverables (Definition of Done)

1. `data/` — real Binance daily klines for BTCUSDT, ETHUSDT (acquisition recipe in `experiments/tenseg-binance-btc-eth-reproduction.md` §4: **bulk dumps at `data.binance.vision`**, REST `klines` fallback). Range `2019-01-01 → present`, interval `1d`.
2. `features.py` — causal feature engineering (§4).
3. `regime_filter.py` — fits/serves the JM filter with **walk-forward, online** inference (§5). Outputs per-day `{date, asset, state ∈ {bull,sideways,bear}, proba_bull, proba_sideways, proba_bear, regime_since}`.
4. `sidecar.py` — the **consumption contract** (§6): a function/class other strategies call to get the current regime + a suggested exposure multiplier; plus a written-out `regimes.parquet`/`regimes.csv`.
5. `validate.py` — event alignment + turnover/persistence + **overlay backtest** (§8).
6. `report.md` — regime timeline chart over BTC/ETH price, hyperparameters, turnover, overlay results, and an honesty section (§9).
7. `RESULTS.json` — `{n_states, jump_penalty, avg_regime_duration_days, n_switches_per_year, event_alignment:[...], overlay:{baseline_sharpe, filtered_sharpe, baseline_maxdd, filtered_maxdd, turnover}}`.

---

## 3. Environment

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install jumpmodels scikit-learn pandas numpy matplotlib pyarrow requests hmmlearn
# Reference implementation + examples (README + example are also at articles/jumpmodels-*.{md,py}):
git clone https://github.com/Yizhan-Oliver-Shu/jump-models.git external/jump-models
```

`jumpmodels` provides (sklearn-style): discrete **JumpModel**, **Continuous Jump Model (CJM)** (soft probabilities — preferred for a filter), **Sparse Jump Model (SJM)** (feature selection), plus preprocessing + online-inference helpers. **Confirm exact class/method names from `articles/jumpmodels-readme.md` and `external/jump-models/examples/` before wiring code** — treat snippets below as structural, not verbatim API.

---

## 4. Features (causal only)

Cluster on standardized temporal features computed **only from past data** (cross-reference the feature choices in the two crypto PDFs in §1):

- Log-return over horizons `r_1, r_5, r_21` (1d, 1w, ~1m).
- **EWMA volatility** of daily returns (halflife 10 and 21).
- **Downside deviation** (EWMA of squared negative returns) — separates bear from sideways.
- **Drawdown** from a trailing rolling max (e.g. 60d) — strong bear marker.
- Optional: trend slope (sign/strength of EWMA log-price), and taker-buy ratio from klines as a flow proxy.

Standardize. **Critical:** fit the scaler (mean/std, robust ±3σ clip) on the **training slice only** and apply forward; refit each walk-forward step. Use the `jumpmodels` preprocessing helpers, not a global `StandardScaler.fit(all_data)`.

```python
# features.py — sketch
import numpy as np, pandas as pd
def make_features(df):  # df indexed by UTC date; cols: close, volume, taker_buy_base
    p = np.log(df["close"]); r = p.diff()
    f = pd.DataFrame(index=df.index)
    f["r1"], f["r5"], f["r21"] = r, r.rolling(5).sum(), r.rolling(21).sum()
    f["vol10"] = r.ewm(halflife=10).std(); f["vol21"] = r.ewm(halflife=21).std()
    f["dd"]   = p - p.rolling(60, min_periods=20).max()
    f["down"] = (r.clip(upper=0)**2).ewm(halflife=21).mean()**0.5
    f["flow"] = (df["taker_buy_base"]/df["volume"]).rolling(7).mean() - 0.5
    return f.dropna()
```

---

## 5. The filter: walk-forward + online inference

```python
# regime_filter.py — STRUCTURAL sketch (verify API against articles/jumpmodels-readme.md)
from jumpmodels.jump import JumpModel              # or ContinuousJumpModel

def label_states_by_return(model, X_train, r_train):
    """Map cluster ids -> bull/sideways/bear using TRAIN data only (avoids label-switch)."""
    states = model.predict(X_train)
    mean_r = {s: r_train[states==s].mean() for s in set(states)}
    order  = sorted(mean_r, key=mean_r.get)         # lowest->highest mean return
    return {order[0]:"bear", order[1]:"sideways", order[2]:"bull"}

# Walk-forward: refit periodically, infer the LATEST day online (filtered, NOT smoothed).
records = []
for t in walk_forward_steps(dates, min_train=500, refit_every=21):
    X_tr = scale_on_train(features.loc[:t_train_end])     # scaler fit on train only
    model = JumpModel(n_components=3, jump_penalty=LAMBDA).fit(X_tr)
    id2reg = label_states_by_return(model, X_tr, returns.loc[X_tr.index])
    s_now, proba_now = model.online_predict(scale_with_train_params(features.loc[new_day]))
    records.append({"date": new_day, "state": id2reg[s_now], **proba_now})
```

- **Refit periodically** (e.g. every 21 days) on an expanding/long-rolling window; between refits run **online inference** for new days.
- Use **Continuous JM** for smooth probabilities (soft exposure scaling); discrete JM for hard labels.
- **Anchor labels by training-period mean return** each refit so bull/sideways/bear stay consistent.

### Hyperparameters
- **`jump_penalty` λ** is the key knob: higher λ → more persistent, fewer whipsaws, more entry/exit lag. Tune by **time-series CV** to a target switch rate (≈4–10/yr) and/or best overlay Sharpe — **never on the test slice**.
- `n_components = 3` (bull/sideways/bear); sanity-check vs 2 (risk-on/off).
- Many features ⇒ switch to **Sparse JM**; report selected features.

---

## 6. Sidecar contract (how other strategies consume it)

```python
# sidecar.py
EXPOSURE = {"bull": 1.0, "sideways": 0.5, "bear": 0.0}   # example policy; make configurable
class RegimeSidecar:
    def latest(self, asset: str) -> dict:
        # {"date","state","proba":{...},"exposure_mult": EXPOSURE[state],"regime_since"}
        ...
    def asof(self, asset: str, date) -> dict:   # point-in-time, no look-ahead
        ...
```

- Persist a point-in-time `regimes.parquet` (`date, asset, state, proba_*, regime_since`) so backtests join **as-of** without leakage.
- Consumers: scale size by `exposure_mult`, gate entries (e.g. trend strategy only longs in bull/sideways), widen stops in bear, or switch parameter sets. The sidecar **must not** restate history — yesterday's label is frozen.

---

## 7. Literature (all PDFs are local — see §1 for paths)

- **Nystrup, Lindström & Madsen (2020)** — foundational jump model. `articles/learning-hidden-markov-models-with-persistent-states-by-penalizing-jumps.pdf`
- **Nystrup, Kolm & Lindström (2021)** — sparse JM / feature selection. `articles/feature-selection-in-jump-models.pdf`
- **Aydınhan, Kolm, Mulvey & Shu (2024)** — continuous JM + allocation. `articles/identifying-patterns-in-financial-markets-extending-the-statistical-jump-model-for-regime-identification.pdf`
- **Sparse JM on crypto (2023)** — closest precedent. `articles/what-drives-cryptocurrency-returns-a-sparse-statistical-jump-model-approach.pdf`
- **Regime Switching Forecasting for Cryptocurrencies (2025)** — `articles/regime-switching-forecasting-for-cryptocurrencies.pdf`
- **Benchmarks:** MS-GARCH BTC vol (`articles/regime-changes-in-bitcoin-garch-volatility-dynamics.pdf`); Hamilton & Susmel SWARCH (`articles/autoregressive-conditional-heteroskedasticity-and-changes-in-regime.pdf`); plus `source/learn/market-regimes.rst` (Koki et al. Bayesian HMM = the HMM filter to beat on whipsaw/turnover).
- Package: `articles/jumpmodels-readme.md`, `articles/jumpmodels-nasdaq-example.py`; upstream https://github.com/Yizhan-Oliver-Shu/jump-models · https://pypi.org/project/jumpmodels/

Build a **Gaussian HMM** baseline (`hmmlearn.GaussianHMM`) on identical features — the jump model must beat it on whipsaw/turnover for similar state quality.

---

## 8. Validation

1. **Event alignment** — map regime *transitions* to dates; check they line up (±7d) with major events (reuse the table in `experiments/tenseg-binance-btc-eth-reproduction.md` §6: COVID 2020-03, LUNA 2022-05, FTX 2022-11, ETF 2024-01, halvings…). Report hits/lags. Alignment ≠ ground truth (none exists) — report as corroboration.
2. **Filter quality** — avg regime duration, switches/year, **whipsaw vs. the HMM baseline** on identical features (JM should switch far less for similar state quality).
3. **Sidecar overlay backtest (the real test)** — apply the filter's `exposure_mult` **as-of** to a baseline (buy-&-hold, and a daily trend/momentum rule). Measure **out-of-sample, walk-forward**: Sharpe, max drawdown, turnover/cost. Success = materially lower drawdown and turnover-adjusted improvement, not just higher raw return.

---

## 9. Pitfalls / honesty checklist

- [ ] **Filtered, not smoothed.** Online label for live use; never let smoothed (full-sample) labels leak into the overlay.
- [ ] **No look-ahead** in scaling or state→regime labeling (train window only, refit forward).
- [ ] **Label switching** — anchor bull/sideways/bear by training-period mean return at every refit.
- [ ] **λ trades whipsaw for lag** — show the sensitivity curve; don't tune λ on test.
- [ ] **Regime imbalance / short history** — crypto's tradable history is short and bull-heavy pre-2022; few bear samples. Check stability across refits and across BTC vs ETH.
- [ ] **Costs** — the whole point vs. HMM is fewer switches → report turnover and apply realistic fees/slippage in the overlay.
- [ ] **This is a sidecar** — it conditions other strategies, not standalone alpha. Frame results that way.

---

## 10. Acceptance criteria

Acceptable if it: (1) uses **real Binance BTC/ETH data**; (2) uses `jumpmodels` with **walk-forward online** inference (no smoothed leakage); (3) produces a persistent 3-state bull/sideways/bear signal whose **transitions align with known regime events** and whose **turnover is clearly lower than a Gaussian-HMM baseline** on identical features; (4) shows the **sidecar overlay** reducing drawdown on ≥1 baseline strategy out-of-sample; (5) ships point-in-time `regimes.parquet` + `sidecar.py` + the honesty section; (6) cites the local PDFs in §1 it actually used.
```
