---
name: convert-to-grid-search
description: Convert a backtesting notebook to a grid search (parameter optimisation) notebook
---

# Convert backtest to grid search

Convert a single backtesting notebook into a grid search notebook that optimises strategy parameters using scikit-optimize's Gaussian Process.

## Input

- Path to a backtesting notebook (.ipynb)

## Reference files

- Reference grid search notebook: `getting-started/scratchpad/bnb-ath-2/10-bnb-ath-optimise-sharpe.ipynb`
- Reference backtest notebook: `getting-started/scratchpad/bnb-ath-2/11-bnb-ath-2h-rerun.ipynb`
- Transformation mapping: Read `backtest-to-gridsearch.md` next to this skill file for the full mapping details

## Steps

1. **Read the input backtest notebook** and the transformation mapping file (`backtest-to-gridsearch.md` in the same directory as this skill).

2. **Read the reference grid search notebook** (`getting-started/scratchpad/bnb-ath-2/10-bnb-ath-optimise-sharpe.ipynb`) — you will copy output cells from this.

3. **Identify tuneable parameters**: Look at the `Parameters` class in the backtest notebook. Identify strategy-specific parameters that could be searched (signal/indicator params, portfolio sizing, risk params). Exclude structural parameters like `chain_id`, `exchanges`, `candle_time_bucket`, `cycle_duration`, `routing`, `backtest_start/end`, `initial_cash`, `min_volume`, `min_tvl`, rolling window calculations, and yield settings.

4. **Ask the user** which parameters to make searchable and what value ranges to use. Suggest ranges centred on the current fixed values. The original value must be included in every range.

5. **Create the grid search notebook** with these cells in order:

   a. **Title cell** (markdown): Change title to `# {Strategy name} parameter search`

   b. **Setup cell** (code): Copy as-is from backtest

   c. **Chain config cell** (code): Copy as-is from backtest

   d. **Parameters cell** (code): Transform from the backtest version:
      - Add `from skopt.space import Categorical` to imports
      - Replace chosen tuneable parameters with `Categorical([...])` ranges
      - Set `use_managed_yield = False`
      - Add at the end:
        ```python
        from tradeexecutor.strategy.parameters import display_parameters
        display_parameters(parameters)
        ```

   e. **Trading universe cell** (code): Copy as-is from backtest (the `create_trading_universe()` function)

   f. **Token map cell** (code): Copy as-is from backtest

   g. **Indicators cell** (code): Copy as-is from backtest — keep all indicator function names and parameter names unchanged

   h. **Backtest time range cell** (markdown + code): Copy as-is from backtest

   i. **Strategy cell** (code): Copy `decide_trades()` (and `create_yield_rules()` if present) from the backtest. **Important**: If `run_backtest_inline()` is in the same cell as `decide_trades()`, remove the `run_backtest_inline()` call and everything after it. The strategy function must be in its own cell without the backtest execution.

   j. **Optimiser and output cells**: Copy cells 18-48 from the reference grid search notebook (`10-bnb-ath-optimise-sharpe.ipynb`). These are heading + code cell pairs:

      | Heading | Cells |
      |---------|-------|
      | `# Optimiser` | markdown + code |
      | `# Results` | markdown + code |
      | `# Parameter analysis` | markdown only |
      | `## Decision tree visualisation` | markdown + code |
      | `## Feature importance analysis` | markdown + code |
      | `## Heatmaps for parameter pairs` | markdown + code |
      | `## Cluster analysis` | markdown + code |
      | `## Parallel coordinates plot` | markdown + code |
      | `# The best candidate equity curve` | markdown + code |
      | `# Portfolio performance (best pick)` | markdown + code |
      | `# Trade summary (best pick)` | markdown + code |
      | `# Trading pair performance breakdown` | markdown + code |
      | `# Best positions` | markdown + code |
      | `# Rolling sharpe` | markdown + code |
      | `# Data diagnostics` | markdown + 3 code cells |

   **Do not** copy any cells from the backtest that are not listed above (no chart registry, no pre-backtest visualisations, no single-backtest output cells like equity curves, weight charts, positions, trading metrics, vault performance).

6. **Write the output notebook** as `{original-notebook-name}-grid-search.ipynb` in the same directory as the input notebook.

7. **Verify** the notebook structure:
   - Parameters class has `Categorical` values for the chosen searchable params
   - `create_trading_universe()` and `decide_trades()` are unchanged from the backtest
   - Optimiser cell uses `perform_optimisation` with `prepare_optimiser_parameters(Parameters)`
   - All output cells match the reference grid search structure
   - Test run: `poetry run ipython {output-notebook}.ipynb`
