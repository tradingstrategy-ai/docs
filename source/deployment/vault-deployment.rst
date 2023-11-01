.. _vault deployment:

Vault deployment
================

This chapter discussed how to deploy a `trade-executor` binary to
manage a trading strategy deployed for multiple users using a :term:`vault`.

If you are looking for a single user deployment, :ref:`hot wallet deployment`
is an easier option.

Preface
-------

This example shows how to deploy a vault for :ref:`Enzyme protocol`

- Multiple investors,

- Vault owner and asset manager is set to be a single private key.

- Any strategy can trade assets whitelisted by Enzyme governance.
  See :py:mod:`tradeexecutor.cli.commands.enzyme_asset_list` for details
  how to view the list of currently active assets.

.. note::

    In the beta mode, the vauklt does not have any safety features and can trade any assets.
    Use only for trusted oracle setups.


Prerequisites
-------------

To get started you need to have a

- :term:`JSON-RPC` node

- A private key

- Native token loaded up for :term:`gas fee`

- `To generate a private key securely offline, you can follow the instructions here <https://ethereum.stackexchange.com/questions/82926/how-to-generate-a-new-ethereum-address-and-private-key-from-a-command-line>`__.

.. note ::

    Private keys or hot wallets cannot be shared across different `trade-executor` instances.
    Because this will mess up accounting.

Managing Docker images
----------------------

- You need to be able to run a Docker image on your server in order to run `trade-executor`

- See :ref:`managing Docker images` to learn how to get started with Docker

Strategy name and id
--------------------

See ref:`strategy metadata` for details.

Create an Enzyme vault
----------------------

You can create a vault by running `trade-executor enzyme-deploy-vault` command
and giving it the configuration by environment variables.

You need to

* Decide your vault name and token symbol

* Have `PRIVATE_KEY` set up with some gas money

Here is an example shell command how to put together a Docker command to run `enzyme-deploy-vault`.
`See also the explanation how a local workign directory is mounted <https://stackoverflow.com/a/76434724/315168>`__.
Remember to replace `--fund-name` and `--fund-symbol` with your own strings.

.. code-block:: shell

    # Use $TRADE_EXECUTOR_IMAGE from the previous step

    # You need to provider these
    export JSON_RPC_POLYGON=
    export PRIVATE_KEY=
    export TRADE_EXECUTOR_IMAGE=ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}

    # Run the command
    # - Pass private key and JSON-RPC node from environment variables
    # - Set vault-info.json to be written to a local file system
    docker run \
        --interactive \
        --tty \
        -v `pwd`:`pwd` \
        -w `pwd` \
        $TRADE_EXECUTOR_IMAGE \
        -- \
        enzyme-deploy-vault \
        --private-key=$PRIVATE_KEY \
        --vault-record-file="vault-info.json" \
        --fund-name="Your Vault Name" \
        --fund-symbol="YOURTOKENSYMBOL" \
        --json-rpc-polygon=$JSON_RPC_POLYGON

This will give you the log output for the deployment:

.. code-block:: text

    INFO     Chain polygon connects using alien-black-thunder.matic.quiknode.pro
    TRADE    Connected to chain: polygon, node provider: alien-black-thunder.matic.quiknode.pro, gas pricing method: london
    INFO     Using proof-of-authority web3 middleware for chain 137
    INFO     Connected to chain polygon
    INFO       Chain id is 137
    INFO       Latest block is 41,991,567
    INFO     Balance details
    INFO       Hot wallet is 0x40d8368C6D1FfC90fe705B74C6F0F56E1d11092E
    INFO       We have 103.618645 tokens for gas left
    INFO     Enzyme details
    INFO       Integration manager deployed at 0x92fCdE09790671cf085864182B9670c77da0884B
    INFO       USDC is 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174
    INFO     Deploying vault
    INFO     Deploying VaultSpecificGenericAdapter
    INFO     Vault details
    INFO       Vault at 0x6E321256BE0ABd2726A234E8dBFc4d3caf255AE0
    INFO       Comptroller at 0x0fC476e8050a9eDe4D24E2f01d8775249bDf310e
    INFO       GenericAdapter at 0x07f7eB451DfeeA0367965646660E85680800E352
    INFO       VaultUSDCPaymentForwarder at 0xE244CEcd9Ee1e2eeAda81Da12650F1fd5d866713
    INFO       Deployment block number is 41991571

You can also see the deploy data in JSON file:

.. code-block:: shell

    cat vault-info.json

This gives:

.. code-block:: json

    {
        "vault": "0x77feceCeE6E8aC1baD6207cFb36B26D22D8b2C59",
        "comptroller": "0x54848b581c61baAdE1BbdA3134AEd48Bca1e4944",
        "generic_adapter": "0x6b56Ee3C9e6751E94181226057d9589295d15c66",
        "block_number": 43688398,
        "usdc_payment_forwarder": "0xE244CEcd9Ee1e2eeAda81Da12650F1fd5d866713"
    }
.. note ::

    It is important that you keep the contents of the vault smart contract addresses and/or the JSON file around,
    as otherwise you cannot interact with your vault later.

Registering the vault with Enzyme's website
-------------------------------------------

After the vault has been deployed, you can visit `enzyme.finance <https://enzyme.finance>` and
register your vault there, to make it publicly accessible.

- Import the private key to a secure wallet e.g. TrustWallet on mobile
  or Rabby on desktop

- Sign in to Enzyme

- Switch to correct network

- The vault should automatically appear in left under "My vault"

- Go to Vault Settings, choose Claim vault

- Sign a message from your wallet for claiming the ownership

- Now you can fill in the vault description on Enzyme's website database

Initial vault deposit
~~~~~~~~~~~~~~~~~~~~~

- After vault is registered it needs the initial deposit

- You need deposit some USDC in the vault needed later in the test trade,
  using Enzyme website and your wallet

- Enzyme can automatically convert MATIC to USDC and so on

Set up live execution environment
---------------------------------

Create a `trade-executor` :term:`Docker` instanace using `docker-compose` that will run the live trading.

- You have set up an :term:`environment file` for the vault live trading

- You have set up a `docker-compose` configuration entry for your live trade executor,
  see :ref:`strategy deploment` for details

You will need to create

- The final strategy module file

- Public environment variables file

- Secret environment variables file

- Final environment variables file

- `docker-compose.yml` entry

Example public environment variables entry:

.. code-block:: shell

    #
    # This is the public environment variables file for a trade executor.
    # This is only partial configuration.
    #
    # For more information see the documentation https://tradingstrategy.ai/docs/
    #

    # This is a vault based strategy
    ASSET_MANAGEMENT_MODE="enzyme"

    #
    # Strategy assets and metadata
    #

    STRATEGY_FILE=strategies/enzyme-polygon-eth-usdc.py
    NAME="ETH-USD breakout on Uniswap v3"
    DOMAIN_NAME="enzyme-polygon-eth-usdc.tradingstrategy.ai"
    SHORT_DESCRIPTION="ETH/USDC breakout strategy"
    LONG_DESCRIPTION="Take long only positions in ETH based on RSI and Bollinger bands indicators"
    ICON_URL="https://user-images.githubusercontent.com/74208897/215499207-8d661ee9-cc75-4df6-84df-690e14c3d93c.png"

    # Port 3456 is mapped to the public IP on the host using Caddy
    HTTP_ENABLED=true

    # The trigger mode for the decide_trades()
    STRATEGY_CYCLE_TRIGGER="trading_pair_data_availability"

    # Set parameters from Enzyme vault deployment.
    # Get output from trade-executor enzyme-deploy-vault command
    VAULT_ADDRESS=0x6E321256BE0ABd2726A234E8dBFc4d3caf255AE0
    VAULT_ADAPTER_ADDRESS=0x07f7eB451DfeeA0367965646660E85680800E352
    VAULT_PAYMENT_FORWARDER_ADDRESS=...
    VAULT_DEPLOYMENT_BLOCK_NUMBER=...

Remember to slice files together:

.. code-block:: shell

    cat ~/strategies/env/enzyme-polygon-eth-usdc.env ~/secrets/enzyme-polygon-eth-usdc-secrets.env > ~/secrets/enzyme-polygon-eth-usdc-final.env

Setting up docker-compose entry
-------------------------------

See :ref:`docker compose example`.

Test docker-compose entry
-------------------------

You can check the trade executor with:

.. code-block:: shell

    docker-compose run enzyme-polygon-eth-usdc --help

This gives:

.. code-block:: text

    Usage: trade-executor [OPTIONS] COMMAND [ARGS]...

    Options:
      --install-completion [bash|zsh|fish|powershell|pwsh]
                                      Install completion for the specified shell.
      --show-completion [bash|zsh|fish|powershell|pwsh]
                                      Show completion for the specified shell, to copy it or customize the installation.
      --help                          Show this message and exit.

    Commands:
      check-universe       Checks that the trading universe is helthy for a given strategy.
      check-wallet         Print out the token balances of the hot wallet.
      console              Open interactive IPython console to explore state.
      enzyme-asset-list    Print out JSON list of supported Enzyme assets on a chain.
      enzyme-deploy-vault  Deploy a new Enzyme vault.
      hello                Check that the application loads without doing anything.
      init                 Initialise a strategy.
      perform-test-trade   Perform a small test swap.
      repair               Repair broken state.
      start                Launch Trade Executor instance.
      version              Print out the version information.

Run a backtest on the strategy module
-------------------------------------

After the strategy module and Docker instance have been deployed,
you can run the backtest on the live trade executor with:

.. code-block:: shell

    docker-compose run enzyme-polygon-eth-usdc backtest

- This will use the final configuration (strategy module, environment files) to run the backtest
  and see that the strategy module functions properly.

- This will generate backtest reports (HTML, notebook, state) for the web frontend

- The backtest result is saved on the local file system. The result of this backtest
  run is used to show some of the key metrics (sharpe, sortino, max drawdown)
  in the web frontend UI via :ref:`webhook`.

- The default generated state file will be `state/{id}-backtest.json`.

Following variables need to be set in the strategy module:

.. code-block:: python

    # Version >= 0.2
    TRADING_STRATEGY_ENGINE_VERSION = "0.2"
    BACKTEST_START=
    BACKTEST_END=
    INITIAL_CASH=

    # Optional, depends on the strategy create_trading_universe() function
    STOP_LOSS_TIME_BUCKET=

Example:

.. code-block: shell

    docker-compose run enzyme-polygon-matic-usdc backtest

And you will get a report like:

.. code-block:: text

    Trading period length                      359 days
    Return %                                     57.96%
    Annualised return %                          58.87%
    Cash at start                            $10,000.00
    Value at end                             $15,796.42
    Trade volume                            $948,224.62
    Position win percent                         48.48%
    Total positions                                  66
    Won positions                                    32
    ...
    Avg realised risk                            -0.96%
    Max pullback of total capital                -6.47%
    Max loss risk at opening of position          1.02%

Check wallet
------------

Check that your vault has deposits for test trade.

.. code-block:: shell

    docker-compose run enzyme-polygon-eth-usdc check-wallet

The output should look like:

.. code-block:: text

    2023-05-11 17:27:11 root                                               INFO     Reading strategy strategy/enzyme-polygon-eth-usdc.py
    2023-05-11 17:27:11 root                                               INFO     Strategy module strategy/enzyme-polygon-eth-usdc.py, engine version 0.1
    2023-05-11 17:27:11 tradeexecutor.cli.bootstrap                        INFO     Dataset cache is /usr/src/trade-executor/cache
    2023-05-11 17:27:11 tradeexecutor.ethereum.web3config                  INFO     Chain polygon connects using mihailo2.tradingstrategy.ai
    2023-05-11 17:27:11 tradeexecutor.ethereum.web3config                  TRADE    Connected to chain: polygon, node provider: mihailo2.tradingstrategy.ai, gas pricing method: london
    2023-05-11 17:27:11 tradeexecutor.ethereum.web3config                  INFO     Using proof-of-authority web3 middleware for chain 137
    2023-05-11 17:27:11 tradeexecutor.utils.timer                          INFO     Starting task create_trading_universe at 2023-05-11 17:27:11.395569, context is {}
    2023-05-11 17:27:11 tradeexecutor.utils.timer                          INFO     Starting task load_pair_data_for_single_exchange at 2023-05-11 17:27:11.395682, context is {'time_bucket': '1h'}
    2023-05-11 17:27:11 tradeexecutor.strategy.trading_strategy_universe   INFO     Using cached data if available
    2023-05-11 17:27:13 tradingstrategy.reader                             INFO     Reading Parquet /usr/src/trade-executor/cache/pair-universe.parquet
    2023-05-11 17:27:13 tradeexecutor.utils.timer                          INFO     Ended task load_pair_data_for_single_exchange, took 0:00:01.938099
    2023-05-11 17:27:13 tradeexecutor.utils.timer                          INFO     Ended task create_trading_universe, took 0:00:01.944877
    2023-05-11 17:27:13 root                                               INFO     RPC details
    2023-05-11 17:27:13 root                                               INFO       Chain id is 137
    2023-05-11 17:27:13 root                                               INFO       Latest block is 42,582,328
    2023-05-11 17:27:13 root                                               INFO     Balance details
    2023-05-11 17:27:13 root                                               INFO       Hot wallet is <eth_defi.hotwallet.HotWallet object at 0x7f5ba143f9d0>
    2023-05-11 17:27:13 root                                               INFO       Vault address is 0x6E321256BE0ABd2726A234E8dBFc4d3caf255AE0
    2023-05-11 17:27:13 root                                               INFO       We have 101.844157 tokens for gas left
    2023-05-11 17:27:13 root                                               INFO       The gas error limit is 0.100000 tokens
    2023-05-11 17:27:13 root                                               INFO       Reserve asset: USDC (0x2791bca1f2de4661ed88a30c99a7a9449aa84174)
    2023-05-11 17:27:13 root                                               INFO       Balance of USD Coin (PoS) (0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174): 4.950005 USDC
    2023-05-11 17:27:13 tradeexecutor.strategy.runner                      INFO     Setting up routing. Routing model is <tradeexecutor.ethereum.uniswap_v3.uniswap_v3_routing.UniswapV3SimpleRoutingModel object at 0x7f5ba04b0820>, details are {'tx_builder': <tradeexecutor.ethereum.enzyme.tx.EnzymeTransactionBuilder object at 0x7f5ba11c0790>}, universe is <TradingStrategyUniverse for WETH-USDC>
    2023-05-11 17:27:13 root                                               INFO     Execution details
    2023-05-11 17:27:13 root                                               INFO       Execution model is tradeexecutor.ethereum.uniswap_v3.uniswap_v3_execution.UniswapV3ExecutionModel
    2023-05-11 17:27:13 root                                               INFO       Routing model is tradeexecutor.ethereum.uniswap_v3.uniswap_v3_routing.UniswapV3SimpleRoutingModel
    2023-05-11 17:27:13 root                                               INFO       Token pricing model is tradeexecutor.ethereum.uniswap_v3.uniswap_v3_live_pricing.UniswapV3LivePricing
    2023-05-11 17:27:13 root                                               INFO       Position valuation model is tradeexecutor.ethereum.uniswap_v3.uniswap_v3_valuation.UniswapV3PoolRevaluator
    2023-05-11 17:27:13 root                                               INFO       Sync model is tradeexecutor.ethereum.enzyme.vault.EnzymeVaultSyncModel
    2023-05-11 17:27:13 tradeexecutor.ethereum.uniswap_v3.uniswap_v3_routing INFO     Routing details
    2023-05-11 17:27:13 tradeexecutor.ethereum.uniswap_v3.uniswap_v3_routing INFO       Factory: 0x1F98431c8aD98523631AE4a59f267346ea31F984
    2023-05-11 17:27:13 tradeexecutor.ethereum.uniswap_v3.uniswap_v3_routing INFO       Router: 0xE592427A0AEce92De3Edee1F18E0157C05861564
    2023-05-11 17:27:13 tradeexecutor.ethereum.uniswap_v3.uniswap_v3_routing INFO       Position Manager: 0xC36442b4a4522E871399CD717aBDD847Ab11FE88
    2023-05-11 17:27:13 tradeexecutor.ethereum.uniswap_v3.uniswap_v3_routing INFO       Quoter: 0xb27308f9F90D607463bb33eA1BeBb41C27CE5AB6
    2023-05-11 17:27:13 tradeexecutor.ethereum.routing_model               INFO       Routed reserve asset is <USDC at 0x2791bca1f2de4661ed88a30c99a7a9449aa84174>
    2023-05-11 17:27:13 root                                               INFO     All ok

Initialise the vault
--------------------

This will initialise the state file for the strategy executor.

- Create a new state file for the strategy

- Read and sync on-chain information to the state file (smart contract addresses, etc.)

- Start tracking deposit and redemption information

.. code-block:: shell

    # Use the deployment block number earlier
    docker-compose run enzyme-polygon-eth-usdc init

Performing a test trade
-----------------------

Performing a test trade is the final step before starting live trading.

First make sure

- Your vault has deposits

- Your hot wallet has native gas token for transaction fees

You can perform a test trade that checks that the trade routing works, opening and closing positions is possible.
This command will buy and sell a single trading pair from the strategy, worth of 1 USD.

.. code-block:: shell

    docker-compose run enzyme-polygon-eth-usdc perform-test-trade

The output looks something like:

.. code-block:: text

    2023-05-11 21:29:08 tradeexecutor.ethereum.execution                   INFO     Waiting 1 trades to confirm, confirm block count 2, timeout 0:01:00
    2023-05-11 21:29:08 eth_defi.confirmation                              INFO     Waiting 2 transactions to confirm in 2 blocks, timeout is 0:01:00
    2023-05-11 21:29:21 tradeexecutor.ethereum.execution                   INFO     Resolved trade <Sell #2 0.000556383506855833 WETH at 1795.5241082637904, broadcasted>
    2023-05-11 21:29:21 tradeexecutor.cli.testtrade                        INFO     Final report
    2023-05-11 21:29:21 tradeexecutor.cli.testtrade                        INFO       Gas spent: 0.111114647238662268
    2023-05-11 21:29:21 tradeexecutor.cli.testtrade                        INFO       Trades done currently: 2
    2023-05-11 21:29:21 tradeexecutor.cli.testtrade                        INFO       Reserves currently: 4.949005 USDC
    2023-05-11 21:29:21 tradeexecutor.cli.testtrade                        INFO       Reserve currency spent: 0.001000000000000334 USDC
    2023-05-11 21:29:21 tradeexecutor.state.store                          INFO     Saved state to state/enzyme-polygon-eth-usdc.json, total 41620 chars
    2023-05-11 21:29:21 root                                               INFO     All ok

Launch live trading
-------------------

Launch the trade executor in daemon mode:

.. code-block:: shell

    docker-compose up -d enzyme-polygon-eth-usdc

Checking logs
-------------

Logs are available through the web frontend.

You can also check the latest logs from Docker:

.. code-block:: shell

    docker-compose logs --tail=200 enzyme-polygon-eth-usdc

Backup trade-executor configuration
-----------------------------------

After finishing with the vault setup, make sure your configuration files are stored properly.

- Add edits and new files to Git commit

- Push changes to Github

Set up web frontend and monitoring
----------------------------------

See the next steps in :ref:`strategy monitoring`.