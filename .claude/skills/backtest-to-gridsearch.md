# Backtest to grid search notebook mapping

Reference notebooks (in `getting-started/scratchpad/bnb-ath-2/`):
- Backtest: `11-bnb-ath-2h-rerun.ipynb`
- Grid search: `10-bnb-ath-optimise-sharpe.ipynb`

## What stays the same

These cells are copied verbatim from the backtest notebook:

- **Setup cell**: `Client.create_jupyter_client()` + `setup_charting_and_output()`
- **Chain config cell**: Exchange/pair/vault configuration
- **Trading universe cell**: `create_trading_universe()` function
- **Token map cell**: `token_map`, `benchmark_pair_ids`, `category_pair_ids`
- **Indicators cell**: All indicator functions (`local_high`, `full_history_ath`, `volatility`, `signal`, etc.)
- **Backtest time range cell**: Start/end date calculation
- **`decide_trades()` function**: Core strategy logic (but separated from `run_backtest_inline` call)

## What changes

### 1. Title cell

- Backtest: `# BNB local high strategy` with description
- Grid search: `# {Strategy name} parameter search`

### 2. Parameters cell

Add import:
```python
from skopt.space import Categorical
```

Wrap tuneable strategy parameters in `Categorical([...])`. The original value must be included in the list. Example:

```python
# Backtest (fixed)
local_high_delay_bars = 12
local_high_window_bars = 2160

# Grid search (searchable)
local_high_delay_bars = Categorical([12, 60, 144, 200, 360, 500])
local_high_window_bars = Categorical([10, 25, 50, 100, 150, 360, 800, 720, 2160, 4320])
```

Other changes:
- Set `use_managed_yield = False`
- Add at end: `display_parameters(parameters)` (with import `from tradeexecutor.strategy.parameters import display_parameters`)

Parameters that are **not searchable** (structural):
- `id`, `candle_time_bucket`, `cycle_duration`, `chain_id`, `exchanges`
- `rolling_volume_bars`, `rolling_volatility_bars`, `tvl_ewm_span`
- `min_volume`, `min_tvl`, `min_tvl_prefilter`, `min_token_sniffer_score`
- `routing`, `required_history_period`, `slippage_tolerance`
- `backtest_start`, `backtest_end`, `initial_cash`
- `yield_flow_dust_threshold`, `directional_trade_yield_buffer_pct`
- `assummed_liquidity_when_data_missings`

Parameters typically made searchable:
- Signal/indicator parameters (delay, window, threshold, span)
- Portfolio sizing parameters (max_assets, allocation, max_concentration)
- Risk parameters (stop_loss, per_position_cap)
- Filter thresholds (min_from_full_history_ath)

### 3. Remove charts cell and pre-backtest visualisations

The backtest notebook has:
- Charts cell: `ChartRegistry` setup with 20+ chart registrations
- Pre-backtest visualisation cells: available pairs, inclusion criteria, signals, volatility, price vs signal, local high

All of these are **removed** from the grid search notebook.

### 4. Replace `run_backtest_inline` with `perform_optimisation`

The backtest runs a single backtest:
```python
result = run_backtest_inline(
    name=parameters.id,
    engine_version="0.5",
    decide_trades=decide_trades,
    ...
)
state = result.state
```

Grid search replaces this with the optimiser:
```python
from tradeexecutor.backtest.optimiser import perform_optimisation, prepare_optimiser_parameters, MinTradeCountFilter
from tradeexecutor.backtest.optimiser_functions import optimise_sharpe

iterations = 16
search_func = optimise_sharpe

optimiser_result = perform_optimisation(
    iterations=iterations,
    search_func=search_func,
    decide_trades=decide_trades,
    strategy_universe=strategy_universe,
    parameters=prepare_optimiser_parameters(Parameters),
    create_indicators=indicators.create_indicators,
    result_filter=MinTradeCountFilter(50),
    timeout=70*60,
    batch_size=5,
    ignore_wallet_errors=True,
)
```

### 5. Replace backtest output cells with grid search analysis cells

All backtest output cells (performance metrics, equity curves, weights, positions, trading metrics, vault performance) are **removed**.

Replaced with these heading + code cell pairs (copied from reference grid search notebook cells 18-48):

| # | Heading | Description |
|---|---------|-------------|
| 1 | `# Optimiser` | `perform_optimisation()` call |
| 2 | `# Results` | `analyse_optimiser_result()` + `render_grid_search_result_table()` |
| 3 | `# Parameter analysis` | Section heading only |
| 4 | `## Decision tree visualisation` | sklearn `DecisionTreeRegressor` on parameter combinations |
| 5 | `## Feature importance analysis` | sklearn `RandomForestRegressor` feature importances |
| 6 | `## Heatmaps for parameter pairs` | plotly `go.Heatmap` for parameter pair interactions |
| 7 | `## Cluster analysis` | sklearn `KMeans` + PCA 3D scatter |
| 8 | `## Parallel coordinates plot` | plotly `px.parallel_coordinates` |
| 9 | `# The best candidate equity curve` | `visualise_single_grid_search_result_benchmark()` |
| 10 | `# Portfolio performance (best pick)` | `compare_strategy_backtest_to_multiple_assets()` |
| 11 | `# Trade summary (best pick)` | `best_pick.summary.to_dataframe()` |
| 12 | `# Trading pair performance breakdown` | `analyse_multipair()` |
| 13 | `# Best positions` | Top 5 positions sorted by profit |
| 14 | `# Rolling sharpe` | `calculate_rolling_sharpe()` with 180-day window |
| 15 | `# Data diagnostics` | Commented-out debug cells |
