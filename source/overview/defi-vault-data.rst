Vault data
==========

This document describes `the format of DeFi vault data <https://tradingstrategy.ai/trading-view/vaults>`__.

- Available data includes real time summaries of the vaults and historical performance data
- The summary data is available as JSON blob
- Separate API endpoints are available for stablecoin vaults only (500+) and all vaults (25,000+)
- See the `DeFi dataset page <https://tradingstrategy.ai/trading-view/backtesting>`__ on how to get an API key and the download link for the data
- See `risk levels and categories here <https://tradingstrategy.ai/blog/announcing-vault-technical-risk-framework-beta>`__

Currently over twenty `EVM chains <https://tradingstrategy.ai/glossary/evm-compatible>`__ are covered.

Summary data description
------------------------

Here is the description of the summary JSON data for all vaults.

See also

- `CAGR <https://tradingstrategy.ai/glossary/cagr>`__
- `Sharpe Ratio <https://tradingstrategy.ai/glossary/sharpe>`__
- `TVL <https://tradingstrategy.ai/glossary/total-value-locked-tvl>`__

The field descriptions:

+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Key                         | Label                     | Description                                                                                                                        |
|                             |                           |                                                                                                                                    |
+=============================+===========================+====================================================================================================================================+
| ``name``                    | Name                      | Human‑readable vault name. May include chain information to ensure uniqueness.                                                     |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lifetime_return``         | Lifetime Return (Gross)   | All‑time gross return from first to last price as a decimal fraction (e.g., 0.10 = 10%).                                           |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lifetime_return_net``     | Lifetime Return (Net)     | All‑time net return after fees as a decimal fraction. Present only when fee data is available.                                     |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cagr``                    | CAGR (Gross)              | Annualized gross return (Compound Annual Growth Rate) over the full history.                                                       |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cagr_net``                | CAGR (Net)                | Annualized net return after fees over the full history.                                                                            |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_returns``    | 3M Return (Gross)         | Absolute gross return over the last \~90 days as a decimal fraction.                                                               |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_returns_net``| 3M Return (Net)           | Absolute net return over the last \~90 days after fees as a decimal fraction.                                                      |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_cagr``       | 3M CAGR (Gross)           | Annualized gross return computed from the last \~90 days window.                                                                   |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_cagr_net``   | 3M CAGR (Net)             | Annualized net return after fees computed from the last \~90 days window.                                                          |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_sharpe``     | 3M Sharpe Ratio (Gross)   | Sharpe ratio over the last \~90 days using daily returns annualized to 365. Higher indicates better risk‑adjusted performance.     |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_sharpe_net`` | 3M Sharpe Ratio (Net)     | Net Sharpe ratio over the last \~90 days. Currently calculated from the same daily series as gross and may be identical.           |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_volatility`` | 3M Volatility (Ann.)      | Annualized volatility over the last \~90 days: daily standard deviation scaled by sqrt(365).                                       |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_returns``       | 1M Return (Gross)         | Absolute gross return over the last \~30 days as a decimal fraction.                                                               |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_returns_net``   | 1M Return (Net)           | Absolute net return over the last \~30 days after fees as a decimal fraction.                                                      |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_cagr``          | 1M CAGR (Gross)           | Annualized gross return computed from the last \~30 days window.                                                                   |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_cagr_net``      | 1M CAGR (Net)             | Annualized net return after fees computed from the last \~30 days window.                                                          |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``denomination``            | Denomination              | Underlying denomination token (e.g., USDC). Indicates the unit of account for share price and TVL.                                 |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``share_token``             | Share Token               | The vault’s share token identifier (symbol or address), representing depositor shares.                                             |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``chain``                   | Chain                     | Human‑readable blockchain name (e.g., Ethereum, Arbitrum).                                                                         |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``peak_nav``                | Peak TVL/NAV              | All‑time high TVL by the vault. Reported in the denomination currency.                                                             |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``current_nav``             | Current TVL/NAV           | Latest TVL by the vault. Reported in the denomination currency.                                                                    |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``years``                   | Age (Years)               | Vault observation window length in years from first to last data point.                                                            |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``mgmt_fee``                | Management Fee            | Annual management fee as a decimal (e.g., 0.02 = 2%). May be missing if not detected.                                              |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``perf_fee``                | Performance Fee           | Performance fee as a decimal (e.g., 0.20 = 20% of profits). May be missing if not detected.                                        |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``deposit_fee``             | Deposit Fee               | Fee applied on deposits as a decimal (e.g., 0.01 = 1%). May be null if no fee.                                                     |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``withdraw_fee``            | Withdrawal Fee            | Fee applied on withdrawals as a decimal (e.g., 0.01 = 1%). May be null if no fee.                                                  |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``fee_label``               | Fee Label                 | Human‑readable fee summary, e.g., ``2% / 20%`` or including deposit/withdrawal fees if present.                                    |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lockup``                  | Lock‑up (Estimated)       | Estimated lock‑up period before funds can be withdrawn. May be zero or missing.                                                    |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``event_count``             | Deposit/Withdraw Events   | Total number of observed deposit and redeem events for the vault.                                                                  |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``protocol``                | Protocol                  | Name of the protocol implementing the vault (e.g., Yearn, Beefy).                                                                  |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``risk``                    | Risk (Category)           | Technical risk classification object; renderable to a human label via its API.                                                     |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``risk_numeric``            | Risk (Numeric)            | Numeric representation of the technical risk category for sorting or filtering.                                                    |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``id``                      | Vault ID                  | Unique identifier combining chain and address (``<chainId>-<address>``). Can be used as a stable primary key.                      |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``start_date``              | Start Date                | Timestamp of the first available price observation used in metrics.                                                                |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``end_date``                | End Date                  | Timestamp of the last available price observation used in metrics.                                                                 |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``address``                 | Address                   | Vault contract address on the blockchain.                                                                                          |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``chain_id``                | Chain ID                  | Numeric EVM chain identifier (e.g., 1 for Ethereum).                                                                               |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``stablecoinish``           | Stablecoin‑Like           | Boolean indicating whether the the vault is denominated in a stablecoin-like token (could be yield bearing)                        |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``last_updated_at``         | Last Updated At           | Timestamp of the latest recorded on‑chain observation for this vault.                                                              |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``last_updated_block``      | Last Updated Block        | Block number corresponding to the latest recorded observation.                                                                     |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``features``                | Detected Features         | List of detected vault features (e.g., ERC‑4626/7540 capabilities) as feature names.                                               |
+-----------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+

For `any questions join Discord <https://tradingstrategy.ai/community>`__.

Stablecoin vs. non-stablecoin
-----------------------------

For vault data coversing all vaults

- There are thousands of entries
- Most of the vaults are denoinated in non-stablecoin assets (e.g., ETH, BTC, altcoins)
- Most of the vaults are stale - they never had any meaningful TVL

For non-stablecoin vaults, any return data (CAGR, Sharpe, etc.) is incorrect.

- These numbers reflect more of the performance of the underlying asset
- Small cap asset denominated vaults do not have reliable exchange rate for their denomination asset

