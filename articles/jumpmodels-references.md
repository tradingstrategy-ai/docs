# Jump Models / regime filtering — reference pack

Companion to `experiments/jumpmodels-btc-eth-regime-filter.md`.
Local copies of the related literature and package files for the BTC/ETH jump-model regime filter.

## Saved locally in this folder

- **`what-drives-cryptocurrency-returns-sparse-statistical-jump-model.pdf`**
  *What drives cryptocurrency returns? A sparse statistical jump model approach.* Digital Finance (2023). DOI: 10.1007/s42521-023-00085-x. Open access — full PDF saved. **Most directly relevant crypto precedent.**
- **`jumpmodels-readme.md`** — README of the maintained `jumpmodels` Python library (discrete JM, continuous JM, sparse JM; scikit-learn-style API). Source: https://github.com/Yizhan-Oliver-Shu/jump-models
- **`jumpmodels-nasdaq-example.py`** — worked example from the package (NASDAQ regime identification). Use as the template to adapt for BTC/ETH.

## Could not be saved as PDF here (paywalled; Sci-Hub/SSRN/DTU-Orbit blocked in this environment)

Get these through institutional access, the DTU Orbit "accepted manuscript" links (open in a real browser — they 403 to scripts), or SSRN.

1. **Nystrup, P., Lindström, E., & Madsen, H. (2020).** *Learning hidden Markov models with persistent states by penalizing jumps.* Expert Systems with Applications, 150, 113307. DOI: 10.1016/j.eswa.2020.113307
   - **The foundational jump model.** Estimates the hidden state sequence and parameters jointly by clustering temporal features while penalizing state jumps; recovers the *true* persistence of the state process and, in a simple trading strategy, sharply lowers transaction costs vs. plain HMM. Less sensitive to initialization; degrades more gracefully as the number of states grows.
   - Open manuscript (browser): https://orbit.dtu.dk/en/publications/learning-hidden-markov-models-with-persistent-states-by-penalizin · CORE: https://core.ac.uk/display/287842994

2. **Nystrup, P., Kolm, P. N., & Lindström, E. (2021).** *Feature selection in jump models.* Expert Systems with Applications, 184, 115558. DOI: 10.1016/j.eswa.2021.115558
   - Adds joint **feature selection** + parameter + state estimation via coordinate descent that scales to many noisy features — the basis of the **Sparse Jump Model (SJM)**. Use when the BTC/ETH feature set grows.
   - SSRN: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3805831 · Orbit: https://orbit.dtu.dk/en/publications/feature-selection-in-jump-models

3. **Aydınhan, A. O., Kolm, P. N., Mulvey, J. M., & Shu, Y. (2024).** *Identifying patterns in financial markets: extending the statistical jump model for regime identification.* Annals of Operations Research. DOI: 10.1007/s10479-024-06035-z
   - Continuous Jump Model (soft state probabilities) and regime-based asset allocation — the extension behind the `jumpmodels` CJM and the natural basis for soft exposure scaling in the sidecar.
   - https://link.springer.com/article/10.1007/s10479-024-06035-z

## Benchmarks already catalogued in `source/learn/market-regimes.rst`

- **Koki, Leonardos & Piliouras** — Bayesian (non-homogeneous) HMM on BTC/ETH/XRP (bull/bear/calm) — the HMM benchmark the jump filter should beat on whipsaw/turnover.
- **Ardia, Bluteau & Rüede (2019)** — MS-GARCH Bitcoin volatility regimes (`MSGARCH` R package) — reproducible risk-on/off cross-check.

## Package / code

- PyPI: https://pypi.org/project/jumpmodels/
- GitHub (clone for examples): https://github.com/Yizhan-Oliver-Shu/jump-models
