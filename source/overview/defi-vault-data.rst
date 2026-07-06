Vault data
==========

This document describes `the vault data format <https://tradingstrategy.ai/trading-view/vaults>`__ available over Trading Strategy API.

Vault datasets are

1. Vault metadata and real-time summaries
2. Historical returns data

Access plans and files
----------------------

See the `Trading Strategy vault data pricing page <https://tradingstrategy.ai/pricing>`__
for the current Free and Pro plan terms.

The downloadable dataset files are listed on the
`Vault datasets page <https://tradingstrategy.ai/trading-view/vaults/datasets>`__.

+--------------------------------------+-------------------------------+-----------------------+------------------------------------------------------------------------------------------------------------------------------------+
| File                                 | Plan                          | Format                | Description                                                                                                                        |
+======================================+===============================+=======================+====================================================================================================================================+
| ``vault-metadata.sample.json``       | Free                          | JSON                  | Limited sample of vault metadata covering only Ethereum vaults. Uses the same vault metadata schema as the Pro file.               |
+--------------------------------------+-------------------------------+-----------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``vault-historical.sample.parquet``  | Free                          | Parquet               | Limited sample of historical price/TVL data covering only Ethereum vaults. Uses the same historical schema as the Pro file.        |
+--------------------------------------+-------------------------------+-----------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``vault-metadata.json``              | Professional / Pro            | JSON                  | Full tracked vault metadata and metric summary file for paid subscribers.                                                          |
+--------------------------------------+-------------------------------+-----------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``vault-historical.parquet``         | Professional / Pro            | Parquet               | Full tracked vault historical share price, TVL and state file for paid subscribers.                                                |
+--------------------------------------+-------------------------------+-----------------------+------------------------------------------------------------------------------------------------------------------------------------+

The schema descriptions below apply to both Free sample files and Professional / Pro full files.
The difference is dataset coverage and access control, not the column or field meaning.

How to download
---------------

Download links and ``curl`` examples are available on the
`Vault datasets download page <https://tradingstrategy.ai/trading-view/vaults/datasets#download-with-curl>`__.

Professional / Pro downloads require an API key. Free sample files can be downloaded
from the same dataset catalogue.

Example data analysis
---------------------

This section is intended for LLMs and automation agents as a set of concrete examples
for extracting vault data from the downloaded files. The examples assume only basic
Python packages are installed: Pandas with Parquet reading support, plus Python's
standard library.

Use ``vault-metadata.json`` and ``vault-historical.parquet`` for Professional / Pro
analysis. For the Free plan, use ``vault-metadata.sample.json`` and
``vault-historical.sample.parquet``; the code is the same, but the sample files only
cover Ethereum vaults.

Load the files
~~~~~~~~~~~~~~

.. code-block:: python

    import json
    from pathlib import Path

    import pandas as pd

    data_dir = Path(".")

    metadata_path = data_dir / "vault-metadata.json"
    historical_path = data_dir / "vault-historical.parquet"

    with metadata_path.open("r", encoding="utf-8") as f:
        metadata = json.load(f)

    vaults = pd.DataFrame(metadata["vaults"])
    prices = pd.read_parquet(historical_path)

    if "timestamp" in prices.columns:
        prices["timestamp"] = pd.to_datetime(prices["timestamp"])

Get all USDC-denominated vaults
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use ``normalised_denomination`` for token-symbol filtering, because wrapped or
bridged token symbols may be normalised to a canonical symbol.

.. code-block:: python

    usdc_vaults = vaults[
        vaults["normalised_denomination"].str.upper().eq("USDC")
    ].copy()

    cols = [
        "name",
        "chain",
        "protocol",
        "curator_name",
        "current_nav",
        "three_months_cagr",
        "trading_strategy_link",
    ]

    usdc_vaults = usdc_vaults.sort_values("current_nav", ascending=False)
    print(usdc_vaults[cols].head(25).to_string(index=False))

Chart historical returns for a Spark vault
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example finds the largest Spark vault by current TVL, loads its historical
share price series, converts it to cumulative returns, and displays it as a chart.

.. code-block:: python

    spark_vaults = vaults[
        vaults["protocol"].str.contains("Spark", case=False, na=False)
        | vaults["name"].str.contains("Spark", case=False, na=False)
    ].copy()

    spark_vaults = spark_vaults.sort_values("current_nav", ascending=False)
    spark = spark_vaults.iloc[0]

    spark_prices = prices[prices["id"].eq(spark["id"])].copy()
    spark_prices = spark_prices.sort_values("timestamp")

    spark_prices["returns"] = (
        spark_prices["share_price"] / spark_prices["share_price"].iloc[0] - 1.0
    )

    ax = spark_prices.plot(
        x="timestamp",
        y="returns",
        title=f"{spark['name']} cumulative return",
        grid=True,
    )
    ax.set_ylabel("Return")

Get all Gauntlet-curated vaults
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example lists vaults curated by Gauntlet, sorted by 3-month annualised return.
``trading_strategy_link`` is the Trading Strategy vault page URL.

.. code-block:: python

    gauntlet = vaults[
        vaults["curator_slug"].eq("gauntlet")
        | vaults["curator_name"].str.contains("Gauntlet", case=False, na=False)
    ].copy()

    table = gauntlet[
        [
            "name",
            "chain",
            "trading_strategy_link",
            "current_nav",
            "three_months_cagr",
        ]
    ].rename(
        columns={
            "trading_strategy_link": "link",
            "current_nav": "current_tvl",
            "three_months_cagr": "three_months_annualised_return",
        }
    )

    table = table.sort_values(
        "three_months_annualised_return",
        ascending=False,
        na_position="last",
    )

    print(table.to_string(index=False))

30-day return correlation for top Hyperliquid Hypercore vaults
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This example selects the top 10 Hypercore vaults by TVL, with a minimum TVL of
2,000,000 USD, then calculates a 30-day correlation matrix from daily returns.
Hypercore native vaults use synthetic chain id ``9999``.

.. code-block:: python

    hypercore = vaults[
        vaults["chain_id"].eq(9999)
        & vaults["current_nav"].ge(2_000_000)
    ].copy()

    top_hypercore = hypercore.sort_values(
        "current_nav",
        ascending=False,
    ).head(10)

    top_ids = top_hypercore["id"].tolist()

    hp = prices[prices["id"].isin(top_ids)].copy()
    hp = hp.sort_values(["id", "timestamp"])

    daily_share_price = (
        hp.pivot_table(
            index="timestamp",
            columns="id",
            values="share_price",
            aggfunc="last",
        )
        .resample("D")
        .last()
        .ffill()
    )

    daily_returns = daily_share_price.pct_change().tail(30)
    corr = daily_returns.corr()

    id_to_name = top_hypercore.set_index("id")["name"].to_dict()
    corr = corr.rename(index=id_to_name, columns=id_to_name)

    print(corr.round(3).to_string())

Vault metadata format
---------------------

The vault metadata schema applies to both ``vault-metadata.sample.json`` and
``vault-metadata.json``. The sample file has limited Ethereum-only coverage; the
Professional / Pro file contains the full tracked dataset.

The vault metadata contains descriptions of all vaults.

The vault metadata is served as a JSON file.

The top-level JSON object has the following shape:

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Key                                  | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``generated_at``                     | ISO 8601 UTC timestamp when the export was generated.                                                                              |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``metadata``                         | Export provenance metadata. Currently contains ``version`` with ``tag``, ``commit_message`` and ``commit_hash`` of the exporter.   |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``core3_protocols``                  | Core3 protocol risk intelligence keyed by protocol slug. Only protocols present in exported vaults are included.                   |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``curators``                         | Curator metadata keyed by curator slug. Includes identity fields, logo URLs and recent feed entries when available.                |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``vaults``                           | List of per-vault metric records documented below.                                                                                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

The ``metadata.version`` fields may be ``null`` when the exporter runs outside a Docker image
that was stamped with git version information.

Per-vault field descriptions:

+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Key                                  | Label                     | Description                                                                                                                        |
|                                      |                           |                                                                                                                                    |
+======================================+===========================+====================================================================================================================================+
| ``name``                             | Name                      | Human‑readable vault name. May include chain information to ensure uniqueness.                                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``vault_slug``                       | Vault Slug                | URL‑safe slug for the vault name, used in links and identifiers.                                                                   |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``protocol_slug``                    | Protocol Slug             | URL‑safe slug for the protocol name (e.g., ``morpho``, ``yearn``).                                                                 |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``curator_slug``                     | Curator Slug              | Slug identifying the vault curator, or ``null`` if unknown.                                                                        |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``curator_name``                     | Curator Name              | Human‑readable curator name, or ``null`` if unknown.                                                                               |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``protocol_curator``                 | Protocol Curator          | Boolean indicating whether the curator is the protocol itself (not a third party).                                                 |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``share_token_address``              | Share Token Address       | On‑chain address of the vault’s ERC‑20 share token. Usually the vault contract address itself.                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``share_token_decimals``             | Share Token Decimals      | ERC‑20 decimals of the vault share token. Do not default a missing value to 18.                                                    |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``denomination_token_address``       | Denomination Token Addr.  | On‑chain address of the denomination (underlying) token.                                                                           |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``denomination_decimals``            | Denomination Decimals     | ERC‑20 decimals of the denomination token. Needed for converting human token amounts to raw integer amounts.                       |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lifetime_return``                  | Lifetime Return (Gross)   | All‑time gross return from first to last price as a decimal fraction (e.g., 0.10 = 10%).                                           |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lifetime_return_net``              | Lifetime Return (Net)     | All‑time net return after fees as a decimal fraction. Present only when fee data is available.                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cagr``                             | CAGR (Gross)              | Annualised gross return (Compound Annual Growth Rate) over the full history.                                                       |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cagr_net``                         | CAGR (Net)                | Annualised net return after fees over the full history.                                                                            |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_returns``             | 3M Return (Gross)         | Absolute gross return over the last \~90 days as a decimal fraction.                                                               |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_returns_net``         | 3M Return (Net)           | Absolute net return over the last \~90 days after fees as a decimal fraction.                                                      |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_cagr``                | 3M CAGR (Gross)           | Annualised gross return computed from the last \~90 days window.                                                                   |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_cagr_net``            | 3M CAGR (Net)             | Annualised net return after fees computed from the last \~90 days window.                                                          |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_sharpe``              | 3M Sharpe Ratio (Gross)   | Sharpe ratio over the last \~90 days using daily returns annualised to 365. Higher indicates better risk‑adjusted performance.     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_sharpe_net``          | 3M Sharpe Ratio (Net)     | Net Sharpe ratio over the last \~90 days. Currently calculated from the same daily series as gross and may be identical.           |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_volatility``          | 3M Volatility (Ann.)      | Annualised volatility over the last \~90 days: daily standard deviation scaled by sqrt(365).                                       |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_returns``                | 1M Return (Gross)         | Absolute gross return over the last \~30 days as a decimal fraction.                                                               |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_returns_net``            | 1M Return (Net)           | Absolute net return over the last \~30 days after fees as a decimal fraction.                                                      |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_cagr``                   | 1M CAGR (Gross)           | Annualised gross return computed from the last \~30 days window.                                                                   |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_cagr_net``               | 1M CAGR (Net)             | Annualised net return after fees computed from the last \~30 days window.                                                          |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``denomination``                     | Denomination              | Underlying denomination token (e.g., USDC). Indicates the unit of account for share price and TVL.                                 |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``normalised_denomination``          | Normalised Denomination   | Canonical token symbol after normalisation (e.g., ``USDC.e`` → ``USDC``).                                                          |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``denomination_slug``                | Denomination Slug         | Lower‑case slug of the normalised denomination, used for filtering.                                                                |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``share_token``                      | Share Token               | The vault’s share token identifier (symbol or address), representing depositor shares.                                             |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``chain``                            | Chain                     | Human‑readable blockchain name (e.g., Ethereum, Arbitrum).                                                                         |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``peak_nav``                         | Peak TVL/NAV              | All‑time high TVL by the vault. Reported in the denomination currency.                                                             |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``current_nav``                      | Current TVL/NAV           | Latest TVL by the vault. Reported in the denomination currency.                                                                    |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``years``                            | Age (Years)               | Vault observation window length in years from first to last data point.                                                            |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``mgmt_fee``                         | Management Fee            | Annual management fee as a decimal (e.g., 0.02 = 2%). May be missing if not detected.                                              |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``management_fee``                   | Management Fee Alias      | JSON compatibility alias for ``mgmt_fee``.                                                                                         |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``perf_fee``                         | Performance Fee           | Performance fee as a decimal (e.g., 0.20 = 20% of profits). May be missing if not detected.                                        |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``performance_fee``                  | Performance Fee Alias     | JSON compatibility alias for ``perf_fee``.                                                                                         |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``deposit_fee``                      | Deposit Fee               | Fee applied on deposits as a decimal (e.g., 0.01 = 1%). May be null if no fee.                                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``withdraw_fee``                     | Withdrawal Fee            | Fee applied on withdrawals as a decimal (e.g., 0.01 = 1%). May be null if no fee.                                                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``fee_mode``                         | Fee Mode                  | How fees are applied: ``externalised`` (charged at deposit/withdraw) or ``internalised`` (deducted from NAV).                      |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``fee_internalised``                 | Fee Internalised          | Boolean shorthand: ``true`` if fees are deducted from NAV (share price already reflects fees).                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``gross_fees``                       | Gross Fee Structure       | Fee object before protocol-specific net-fee adjustments. Contains management, performance, deposit and withdrawal fee fields.      |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``net_fees``                         | Net Fee Structure         | Investor-visible fee object after protocol-specific adjustments.                                                                   |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``fee_label``                        | Fee Label                 | Human‑readable fee summary, e.g., ``2% / 20%`` or including deposit/withdrawal fees if present.                                    |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lockup``                           | Lock‑up (Estimated)       | Estimated lock‑up period before funds can be withdrawn. May be zero or missing.                                                    |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``event_count``                      | Deposit/Withdraw Events   | Total number of observed deposit and redeem events for the vault.                                                                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``protocol``                         | Protocol                  | Name of the protocol implementing the vault (e.g., Yearn, Beefy).                                                                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``risk``                             | Risk (Category)           | Technical risk classification object; renderable to a human label via its API.                                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``risk_numeric``                     | Risk (Numeric)            | Numeric representation of the technical risk category for sorting or filtering.                                                    |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``vault_poll_frequency``             | Poll Frequency            | Latest adaptive vault scan cycle or poll frequency, e.g. ``large_tvl``, ``peaked``, ``1h``, ``4h`` or ``24h``.                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``id``                               | Vault ID                  | Unique identifier combining chain and address (``<chainId>-<address>``). Can be used as a stable primary key.                      |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``start_date``                       | Start Date                | Timestamp of the first available price observation used in metrics.                                                                |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``end_date``                         | End Date                  | Timestamp of the last available price observation used in metrics.                                                                 |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``address``                          | Address                   | Vault contract address on the blockchain.                                                                                          |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``chain_id``                         | Chain ID                  | Numeric EVM chain identifier (e.g., 1 for Ethereum).                                                                               |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``stablecoinish``                    | Stablecoin‑Like           | Boolean indicating whether the vault is denominated in a stablecoin-like token (could be yield bearing).                           |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``first_updated_at``                 | First Updated At          | Timestamp of the earliest recorded on‑chain observation for this vault.                                                            |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``first_updated_block``              | First Updated Block       | Block number corresponding to the earliest recorded observation.                                                                   |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``last_updated_at``                  | Last Updated At           | Timestamp of the latest recorded on‑chain observation for this vault.                                                              |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``last_updated_block``               | Last Updated Block        | Block number corresponding to the latest recorded observation.                                                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``last_share_price``                 | Last Share Price          | Most recent share price observation in the denomination currency.                                                                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_start``                  | 1M Sample Start           | Actual timestamp of the first sample used for the legacy one-month metrics. ``null`` if unavailable.                               |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_end``                    | 1M Sample End             | Actual timestamp of the last sample used for the legacy one-month metrics. ``null`` if unavailable.                                |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``one_month_samples``                | 1M Samples                | Number of raw samples used for the legacy one-month metrics.                                                                       |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_start``               | 3M Sample Start           | Actual timestamp of the first sample used for the legacy three-month metrics. ``null`` if unavailable.                             |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_end``                 | 3M Sample End             | Actual timestamp of the last sample used for the legacy three-month metrics. ``null`` if unavailable.                              |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``three_months_samples``             | 3M Samples                | Number of raw samples used for the legacy three-month metrics.                                                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lifetime_start``                   | Lifetime Sample Start     | Actual timestamp of the first sample used for lifetime metrics.                                                                    |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lifetime_end``                     | Lifetime Sample End       | Actual timestamp of the last sample used for lifetime metrics.                                                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``lifetime_samples``                 | Lifetime Samples          | Number of raw samples used for lifetime metrics.                                                                                   |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``features``                         | Detected Features         | List of detected vault features (e.g., ERC‑4626/7540 capabilities) as feature names.                                               |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``flags``                            | Vault Flags               | Set of `VaultFlag <https://web3-ethereum-defi.tradingstrategy.ai/api/vault/_autosummary_vault/                                     |
|                                      |                           | eth_defi.vault.flag.VaultFlag.html>`__ values indicating vault status (e.g., ``deposit``, ``redeem``, ``paused``,                  |
|                                      |                           | ``morpho_issues``).                                                                                                                |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``notes``                            | Notes                     | Human‑readable note text for the vault (e.g., risk warnings, Morpho flag summaries). May be ``null``.                              |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``link``                             | Link                      | URL to the vault on the protocol’s website. May be ``null``.                                                                       |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``trading_strategy_link``            | Trading Strategy Link     | URL to the vault page on tradingstrategy.ai. May be ``null``.                                                                      |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``deposit_closed_reason``            | Deposit Closed Reason     | Reason why deposits are closed (e.g., ``"paused"``). Empty string if deposits are open.                                            |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``redemption_closed_reason``         | Redemption Closed Reason  | Reason why redemptions are closed. Empty string if redemptions are open.                                                           |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``deposit_next_open``                | Deposit Next Open         | Estimated timestamp when deposits will next open. ``null`` if unknown or already open.                                             |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``redemption_next_open``             | Redemption Next Open      | Estimated timestamp when redemptions will next open. ``null`` if unknown or already open.                                          |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``available_liquidity``              | Available Liquidity       | Available liquidity for withdrawals in the denomination currency (lending vaults). ``null`` if not applicable.                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``utilisation``                      | Utilisation               | Current utilisation ratio (0.0–1.0) for lending vaults. ``null`` if not applicable.                                                |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``leader_fraction``                  | Leader Fraction           | Fraction of vault assets controlled by the leader (Hypercore vaults). ``null`` for other protocols.                                |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``leader_commission``                | Leader Commission         | Commission rate charged by the vault leader (Hypercore). ``null`` for other protocols.                                             |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``follower_count``                   | Follower Count            | Number of followers in a Hypercore leader vault. ``null`` for other protocols.                                                     |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``account_pnl``                      | Account PnL               | Cumulative PnL of the vault leader account (Hypercore). ``null`` for other protocols.                                              |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cumulative_volume``                | Cumulative Volume         | Cumulative trading volume of the vault (Hypercore). ``null`` for other protocols.                                                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``netflow``                          | Netflow Metrics           | List of `NetflowMetrics <https://web3-ethereum-defi.tradingstrategy.ai/api/research/_autosummary_research/                         |
|                                      |                           | eth_defi.research.vault_metrics.html>`__ objects for 1d, 7d, 30d deposit/withdrawal flows. ``null`` if not available.              |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``description``                      | Description               | Long‑form vault description from offchain metadata (Euler, Lagoon, etc.). ``null`` if not available.                               |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``short_description``                | Short Description         | Brief vault description from offchain metadata. ``null`` if not available.                                                         |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``manual_review_status``             | Manual Review Status      | Manual review decision (e.g., ``"ok"``, ``"avoid"``). Currently used for Hyperliquid vaults. ``null`` if not reviewed.             |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``core3``                            | Core3 Risk Summary        | Compact per-vault Core3 risk summary for the vault protocol, or ``null`` when no Core3 data is available.                          |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``denomination_token_rate``          | Denomination Rate         | Stablecoin rate and depeg metadata for the denomination token. Includes USD rate fields and native/source currency cross-rates.    |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``other_data``                       | Protocol Extension Data   | Protocol‑specific extension dict. See `other_data and Morpho flags`_ below.                                                        |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``period_results``                   | Period Results            | List of `PeriodMetrics <https://web3-ethereum-defi.tradingstrategy.ai/api/research/_autosummary_research/                          |
|                                      |                           | eth_defi.research.vault_metrics.PeriodMetrics.html>`__ objects for 1W, 1M, 3M, 6M, 1Y, and lifetime windows.                       |
|                                      |                           | See `Structured period metrics`_ below.                                                                                            |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``first_qualified_at``               | First Qualified At        | Sticky export annotation: first time this vault passed the export filter. Only present on sticky-processed rows.                   |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``last_qualified_at``                | Last Qualified At         | Sticky export annotation: latest time this vault passed the export filter. Only present on sticky-processed rows.                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``sticky_export``                    | Sticky Export             | ``true`` when a vault is exported because it previously passed the filter; ``false`` on stale current-row warnings.                |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``stale_export``                     | Stale Export              | ``true`` when a previous successful record is replayed because the current row is missing or structurally unsafe.                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``sticky_reason``                    | Sticky Reason             | Reason for sticky inclusion, currently ``previously_passed_filter``. Only present for sticky exports.                              |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``stale_current_row``                | Stale Current Row         | ``true`` when the current row is older than the freshness warning window.                                                          |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``risk_possibly_stale``              | Risk Possibly Stale       | ``true`` when stale source data means risk fields may lag current on-chain state.                                                  |
+--------------------------------------+---------------------------+------------------------------------------------------------------------------------------------------------------------------------+

Structured period metrics
~~~~~~~~~~~~~~~~~~~~~~~~~

In addition to the legacy flat fields (``three_months_cagr``, ``one_month_returns``, etc.), each vault record
includes a ``period_results`` list containing
`PeriodMetrics <https://web3-ethereum-defi.tradingstrategy.ai/api/research/_autosummary_research/eth_defi.research.vault_metrics.PeriodMetrics.html>`__
objects for six standard lookback windows: **1W**, **1M**, **3M**, **6M**, **1Y**, and **lifetime**.

Each ``PeriodMetrics`` object contains:

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Field                                | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``period``                           | Period label (``"1W"``, ``"1M"``, ``"3M"``, ``"6M"``, ``"1Y"``, ``"lifetime"``).                                                   |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``error_reason``                     | Error string if metrics could not be calculated (e.g., insufficient data), otherwise ``null``.                                     |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``period_start_at``                  | Timestamp when the period’s start share price was sampled.                                                                         |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``period_end_at``                    | Timestamp when the period’s end share price was sampled.                                                                           |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``samples_start_at``                 | Actual first raw sample timestamp used for the period. May differ from ``period_start_at`` because samples are sparse.             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``samples_end_at``                   | Actual last raw sample timestamp used for the period.                                                                              |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``share_price_start``                | Share price at the beginning of the period.                                                                                        |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``share_price_end``                  | Share price at the end of the period.                                                                                              |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``returns_gross``                    | Absolute gross return over the period as a decimal fraction.                                                                       |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``returns_net``                      | Absolute net return after fees over the period as a decimal fraction.                                                              |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cagr_gross``                       | Annualised gross CAGR over the period.                                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cagr_net``                         | Annualised net CAGR after fees over the period.                                                                                    |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``volatility``                       | Annualised volatility based on daily returns.                                                                                      |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``sharpe``                           | Sharpe ratio for the period.                                                                                                       |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``max_drawdown``                     | Maximum drawdown during the period as a decimal fraction.                                                                          |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``tvl_start``                        | TVL at the start of the period in denomination currency.                                                                           |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``tvl_end``                          | TVL at the end of the period in denomination currency.                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``tvl_low``                          | Minimum TVL observed during the period.                                                                                            |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``tvl_high``                         | Maximum TVL observed during the period.                                                                                            |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``ranking_overall``                  | Rank among all vaults (1 = best), based on CAGR. Requires minimum $50,000 TVL.                                                     |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``ranking_chain``                    | Rank among vaults on the same chain (1 = best). Requires minimum $10,000 TVL.                                                      |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``ranking_protocol``                 | Rank among vaults in the same protocol (1 = best). Requires minimum $10,000 TVL.                                                   |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``avg_utilisation``                  | Average utilisation over the period (lending vaults only, 0.0–1.0).                                                                |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``raw_samples``                      | Number of raw (hourly) data points used.                                                                                           |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``daily_samples``                    | Number of daily data points used for volatility/Sharpe calculation.                                                                |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

Rankings are calculated by
`calculate_vault_rankings() <https://web3-ethereum-defi.tradingstrategy.ai/api/research/_autosummary_research/eth_defi.research.vault_metrics.calculate_vault_rankings.html>`__
and use net CAGR (falling back to gross when net is unavailable). Vaults are excluded from rankings if they are
blacklisted, have zero/NaN CAGR, or fall below the TVL thresholds.

.. _other_data and Morpho flags:

``other_data`` field for vault-protocol specific metadata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``other_data`` field is a protocol‑specific extension dict included in every vault record.
It contains generic display warning hints and protocol-specific details. Future protocols should
add their own keys here rather than adding top‑level fields.

Generic keys:

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Key                                  | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``vault_display_flags``              | UI-friendly warning entries with ``severity``, ``type`` and ``source``. Empty list when no display warnings apply.                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

The Morpho‑specific keys are sourced from the Morpho Blue API via
`analyze_morpho_flags() <https://web3-ethereum-defi.tradingstrategy.ai/api/erc_4626/vault_protocol/morpho/_autosummary_morpho/eth_defi.erc_4626.vault_protocol.morpho.flag_analytics.analyze_morpho_flags.html>`__
and the
`MorphoFlagAnalytics <https://web3-ethereum-defi.tradingstrategy.ai/api/erc_4626/vault_protocol/morpho/_autosummary_morpho/eth_defi.erc_4626.vault_protocol.morpho.flag_analytics.MorphoFlagAnalytics.html>`__
dataclass:

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Key                                  | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``morpho_vault_flags``               | List of vault‑level governance warning type strings from the Morpho Blue API. Example: ``["not_whitelisted", "short_timelock"]``.  |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``morpho_market_flags``              | List of market‑level risk warning type strings from the vault’s underlying Morpho market allocations.                              |
|                                      | Example: ``["bad_debt_unrealized"]``.                                                                                              |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``morpho_red_flags``                 | Combined RED‑level warning types across vault and market warnings. Non‑empty when ``morpho_issues`` is in ``flags``.               |
|                                      | Example: ``["bad_debt_unrealized", "short_timelock"]``.                                                                            |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``morpho_yellow_flags``              | Combined YELLOW‑level warning types. YELLOW flags do not trigger ``morpho_issues``.                                                |
|                                      | Example: ``["bad_debt_realized", "not_whitelisted"]``.                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

When any RED‑level flags are present, the vault is automatically blacklisted
(``risk`` set to ``blacklisted``) and the
`VaultFlag.morpho_issues <https://web3-ethereum-defi.tradingstrategy.ai/api/vault/_autosummary_vault/eth_defi.vault.flag.VaultFlag.html>`__
flag is added to the ``flags`` set.

Historical vault data
---------------------

The historical vault data schema applies to both ``vault-historical.sample.parquet``
and ``vault-historical.parquet``. The sample file has limited Ethereum-only coverage;
the Professional / Pro file contains the full tracked dataset.

Historical vault data is the past performance metrics of a vault.

- TVL
- Total supply (as in the share token count)
- Returns (also known as :term:`CAGR`, :term:`APY`)

Historical data is served as a compressed Parquet file. The pipeline has two related schemas:

- Raw scanner rows are written to ``vault-prices-1h.parquet`` using the canonical
  ``VaultHistoricalRead.to_pyarrow_schema()`` columns.
- The published historical dataset is the cleaned/enriched Parquet output. It keeps the
  raw scanner columns, preserves native protocol extension columns, adds metadata columns
  such as ``id`` and ``protocol``, and computes return columns such as ``returns_1h``.

When both ``share_price`` and ``raw_share_price`` are present, use ``share_price`` for
analytics. ``raw_share_price`` preserves the original scanner/API value before cleaning
and outlier fixes.

General columns (all protocols)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These columns are present for every vault in the published cleaned dataset. Some columns
(``id``, ``name``, ``event_count``, ``protocol``, ``returns_1h``, ``deposit_closed_reason``
and ``raw_share_price``) are added by the cleaning pipeline and are not part of the raw
EVM scanner writer schema.

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Column                               | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``chain``                            | EVM chain id. Native protocols use synthetic ids: ``9999`` (Hypercore), ``9998`` (Lighter), ``9997`` (Hibachi), ``325`` (GRVT).    |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``address``                          | Vault address, lowercase. Format varies: ``0x…`` (EVM, Hypercore), ``vlt:…`` (GRVT), ``lighter-pool-…`` (Lighter),                 |
|                                      | ``hibachi-vault-…`` (Hibachi).                                                                                                     |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``block_number``                     | Block number of the on-chain read. Synthetic sequence number for native protocols.                                                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``timestamp``                        | Naive UTC timestamp (also the DatetimeIndex).                                                                                      |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``share_price``                      | Share price in denomination token units. Read from contract for ERC-4626; from API for GRVT, Lighter, Hibachi;                     |
|                                      | internally calculated for Hypercore (see note below).                                                                              |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``raw_share_price``                  | Original share price before cleaning/outlier adjustments. Use ``share_price`` for analytics.                                       |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``total_assets``                     | Total assets under management (TVL) in denomination token units.                                                                   |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``total_supply``                     | Total supply of vault share tokens.                                                                                                |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``performance_fee``                  | Performance fee at time of read (e.g. 0.20 = 20%). NaN if unknown.                                                                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``management_fee``                   | Management fee at time of read (e.g. 0.02 = 2%). NaN if unknown.                                                                   |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``errors``                           | Comma-separated RPC error messages (e.g. ``"total_supply call failed"``), or empty string. Always empty for native protocols.      |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``vault_poll_frequency``             | Dynamic poll frequency (e.g. ``"1h"``, ``"4h"``, ``"24h"``). Low-TVL vaults may be polled less frequently.                         |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``id``                               | Vault identifier: ``"<chain_id>-<address>"``.                                                                                      |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``name``                             | Human-readable vault name (unique within the dataset).                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``event_count``                      | Total deposit + redeem events observed for this vault.                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``protocol``                         | Protocol name (e.g. ``"Morpho"``, ``"Yearn"``, ``"Hyperliquid"``).                                                                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``returns_1h``                       | Return as ``pct_change()`` of ``share_price`` within each vault. Despite the name, the interval may be daily for native protocols. |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``deposit_closed_reason``            | Why deposits are closed (e.g. ``"Vault deposits disabled"``). Empty string when open.                                              |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``written_at``                       | When this row was written/fetched (naive UTC). NaT for old data.                                                                   |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

ERC-4626 only columns
~~~~~~~~~~~~~~~~~~~~~

These columns come from on-chain ERC-4626 contract calls and are NaN or empty for native protocols.

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Column                               | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``max_deposit``                      | Maximum deposit amount allowed (``maxDeposit``), in denomination token units.                                                      |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``max_redeem``                       | Maximum redeem amount allowed (``maxRedeem``), in share token units.                                                               |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``deposits_open``                    | Whether deposits were open: ``"true"``, ``"false"``, or ``""``.                                                                    |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``redemption_open``                  | Whether redemptions were open: ``"true"``, ``"false"``, or ``""``.                                                                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``trading``                          | Whether the vault was actively trading. Currently only D2 Finance.                                                                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

Lending protocol only columns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These columns are populated for lending protocol vaults (IPOR, Euler, Morpho, Gearbox, Silo, etc.)
and NaN for other protocols.

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Column                               | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``available_liquidity``              | Available liquidity for immediate withdrawal in denomination token units.                                                          |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``utilisation``                      | Utilisation ratio (0.0–1.0). **Caution:** this measures capital deployment, not redeemable liquidity. Multi-market                 |
|                                      | aggregators (Morpho, Euler Earn, IPOR) can show high utilisation yet have substantial instantly redeemable liquidity               |
|                                      | in underlying markets.                                                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

Hypercore only columns
~~~~~~~~~~~~~~~~~~~~~~

These columns are populated for native Hyperliquid vaults (chain ``9999``) and NaN for all others.

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Column                               | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``leader_fraction``                  | Fraction of vault assets controlled by the leader (0.0–1.0).                                                                       |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``leader_commission``                | Commission rate charged by the vault leader (0.0–1.0).                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``follower_count``                   | Number of followers in the vault.                                                                                                  |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``account_pnl``                      | Cumulative PnL of the vault leader account in USD.                                                                                 |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``cumulative_volume``                | Cumulative trading volume of the vault in USD.                                                                                     |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

Native protocol flow columns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These columns are populated for native protocols with daily deposit/withdrawal data
(Hypercore, GRVT, Lighter, Hibachi) and NaN for ERC-4626 vaults.

+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| Column                               | Description                                                                                                                        |
+======================================+====================================================================================================================================+
| ``daily_deposit_count``              | Number of deposit events in the latest day.                                                                                        |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``daily_withdrawal_count``           | Number of withdrawal events in the latest day.                                                                                     |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``daily_deposit_usd``                | Total USD deposited in the latest day.                                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+
| ``daily_withdrawal_usd``             | Total USD withdrawn in the latest day.                                                                                             |
+--------------------------------------+------------------------------------------------------------------------------------------------------------------------------------+

Hypercore share price
~~~~~~~~~~~~~~~~~~~~~

Most native protocols (GRVT, Lighter, Hibachi) provide share prices directly from their APIs.
Hypercore (native Hyperliquid vaults) is the exception — it does not expose a share price.
Instead, the share price is **internally calculated** as ``total_assets / total_supply``
from reconstructed equity curves and deposit/withdrawal histories. The process involves:

- Tracking deposits and withdrawals to maintain a virtual share ledger
- Computing ``total_assets`` from the vault's account value (NAV) at each point in time
- Minting/burning shares at the current share price when deposits/withdrawals occur
- Chain-linked epoch resets when all shares are redeemed but equity remains

See `eth_defi.hyperliquid.combined_analysis <https://web3-ethereum-defi.tradingstrategy.ai/api/hyperliquid/_autosummary_hyperliquid/eth_defi.hyperliquid.combined_analysis.html>`__
for the Hypercore share price derivation.

Vault technical risk
--------------------

The data contains vault technical risk labels. These are based on the beta vault technical risk framework.

See `this blog post for details <https://tradingstrategy.ai/blog/announcing-vault-technical-risk-framework-beta>`__.

Stablecoin vs. crypto-denominated vaults
----------------------------------------

Currently only stablecoin-denominated vault data is available.

Raw data for BTC-nominated and ETH-nominated vault is collected, but not published yet. Ask if needed.
