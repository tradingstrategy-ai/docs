.. _strategy metadata:

Strategy metadata
=================

Live trade execution has metadata that lives outside the strategy module.
Metadata includes on-chain connector data, human description mostly to display and route
the trade executor data on the web frontend.
Metadata lives outside the core strategy module, in :ref:`environment file`
given to the `trade-executor`.

Configured metadata
-------------------

- **Python module**: A strategy module as Python source code file. This is slightly different from backtesting notebook,
  but can be constructed from the backtest with copy-paste. *The filename of this module
  is the same as the strategy id.** In this documentation, we use `pancake-eth-usd-sma` as an example.

- **Logo**: Strategy logo image URL. The image must be 1:1 aspect ratio.
  If you do not have images, you can use `placeholder.com <https://placeholder.com>`__.

- **Machine readable id** e.g. `enzyme-polygon-eth-usdc`. This is automatically set: If this is not
  explicitly set then this is the same as the strategy module filename.

- **Domain**: A URL and a domain name for `trade-executor` webhook server.
  For the sake of convenience, use the same as machine readable id.

- **Configuration files**: The strategy execution configuration that include the hot wallet private key,
  API keys for oracle market data feeds, blockchain nodes, Discord webhook notifications
  and such. Setting up the configuration files are described below.

- **Server**: A server where you run the `trade-executor` Docker container and any related infrastructure,
  like a reverse proxy web server.

- **Private key** needed for the hot wallet that executes the transactions.

- **Initial test funds**: native blockchain token and USDC for gas fees.

- **Backtest results**: this will be generated during the strategy deployment process

Enzyme vault-based trading configuration
----------------------------------------

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

- DNS name e.g. `mystrategy.example.com`. The best practice is to use the `id` from metadata
  as the subdomain name.

- An internal localhost port to map to the Docker container.

- A reverse proxy web server configuration e.g. via :term:`Caddy`
  so that the webhook is securely exposed to the world.


