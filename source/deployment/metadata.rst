Strategy metadata
=================

Live trade execution has metadata that lives outside the strategy module.
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

For more details see :ref:`Vault deployment`.

Strategy state
--------------

The persistent state of the strategy lives in a JSON-based file ("flat file database").
For :ref:`Docker` this file is mapped to the host file system `state`
folder.

The frontend can read the whole state file as is and it does not contain any secrets
which could not be deduced from the on-chain activity.

For the state details see :ref:`Serialisation`.

Run-time data
-------------

The live trade executor generates run-time data. This includes things like

- Is the service healthy

- What is the exception message in the case of a crash

- Log output

- Profiling and diagnostics stats

Run-time data is not persistent and is reset every time the `trade-executor` restarts.
See :ref:`Strategy monitoring` for more information.

Webhook routing
---------------

A live trading strategy exposes itself to the world using a :ref:`webhook` over an internal web server.

For this you need

- DNS name e.g. `mystrategy.mydomain.com`. The best practice is to use the `id` from metadata
  as the subdomain name.

- An internal localhost port to map to the Docker container.

- A reverse proxy web server configuration e.g. via :term:`Caddy`
  so that the webhook is securely exposed to the world.


