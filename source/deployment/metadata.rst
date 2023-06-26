Strategy metadata
=================

Live trading strategy has metadata that lives outside the strategy module.
Metadata includes on-chain connector data, human description mostly to display and route
the trade executor data on the web frontend.
Metadata lives outside the core strategy module, in :ref:`environment file`
given to the `trade-executor`.

- Private key needed for the hot wallet that executes the transactions.

- Machine readable id e.g. `enzyme-polygon-eth-usdc`. If this is not
  explicitly set then this is the same as the strategy module filename.

- Human readable name and description.
  These need to be configured in the `trade-executor` :ref:`environment file`.

- Icons. These need to be configured in the `trade-executor` :ref:`environment file`.
  Icons point to externally hosted image URLs.

- Backtested result (on the top of the live execution results).

Enzyme vault-based trading
--------------------------

For vault-based strategies, you will also need the various smart contracts
given by `trade-executor enzyme-vault-deploy` command.

* Vault deployment block number (because Ethereum nodes have broken
  model for reading events)

* Vault smart contract address

* USDC payment forwarder address

* `trade-executor` adapter address


