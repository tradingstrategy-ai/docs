.. _vault deployment:

Vault deployment
================

This chapter discussed how to deploy a `trade-executor` binary to
manage a trading strategy deployed for multiple users using a :term:`vault`.

If you are looking for a single user deployment, :ref:`hot wallet deployment`
is an easier option.

- This chapter is for a specific kind of Enzyme vault deployment to be used with :term:`Trading Strategy Protocol`

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

- Deployed `Terms of Service manager smart contract <https://github.com/tradingstrategy-ai/terms-of-service/tree/main>`__

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

- Be familiar with UNIX shell

- Decide your vault name and token symbol

- Have `PRIVATE_KEY` set up with some gas money for the trade executor hot wallet.
  See how to :ref:`creating hot wallet` for more info.

- Have Polygonscan, etc. API key for the verification of the deployed contracts

- Get `TRADE_EXECUTOR_VERSION` Docker version from the Github container registry

.. note ::

    Never share the hot wallet (private key) across different executors on the same blockchain.

This will

- Deploy the Enzyme vault

- `Set up a guard contract with given parameters to increase security and limit the role what trade-executor can do <https://github.com/tradingstrategy-ai/web3-ethereum-defi/tree/master/contracts/guard>`__

- Set up a `deposit forwarder smart contract for USDC <https://github.com/tradingstrategy-ai/web3-ethereum-defi/blob/master/contracts/in-house/src/TermedVaultUSDCPaymentForwarder.sol>`__

Here is an example shell command how to put together a Docker command to run `enzyme-deploy-vault`.
`See also the explanation how a local working directory is mounted <https://stackoverflow.com/a/76434724/315168>`__.
Remember to replace `--fund-name` and `--fund-symbol` with your own strings.

We are deploying multiple contracts. First test with `--simulate` flag to see the deployment finish all the way to end.

An example `deploy/deploy-enzyme-ethereum-btc-eth-stoch-rsi.sh` script

.. code-block:: shell

    #!/bin/bash
    #
    # Deploy Enzyme vault for a strategy defined in docker-compose.yml
    #
    # Set up
    # - name
    # - guard with allowed assets
    # - trade executor hot wallet as the asset manager role
    #

    set -e
    set -u

    if [ "$SIMULATE" = "" ]; then
        echo "Set SIMULATE=true or SIMULATE=false"
        exit 1
    fi

    if [ "$TRADE_EXECUTOR_VERSION" = "" ]; then
        echo "TRADE_EXECUTOR_VERSION missing"
        exit 1
    fi

    # The address DAO/proto DAO multisig that will own this vault.
    # This address is Trading Strategy Protocol's ProtoDAO address.
    export OWNER_ADDRESS=0x238B0435F69355e623d99363d58F7ba49C408491

    # ERC-20 token symbol
    export FUND_SYMBOL="STOCH-RSI"

    # Enzyme vault name
    export FUND_NAME="ETC/BTC Stochastic RSI crossover"

    # Space-separated list of tokens the vault allows the trade-executor to trade.
    # WETH WBTC
    export WHITELISTED_ASSETS="0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599"

    # The vault is nominated in USDC *ethereum
    export DENOMINATION_ASSET="0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48"

    # Terms of service manager smart contract address.
    # This one is deployed on ethereum.
    export TERMS_OF_SERVICE_ADDRESS="0xd63c1bE9D8B56CCcD6fd2Dd9F9c030c6a9916f5F"

    # Run the command
    # - Pass private key and JSON-RPC node from environment variables
    # - Set vault-info.json to be written to a local file system
    #poetry run trade-executor \
    export TRADE_EXECUTOR_IMAGE=ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}
    echo "Using $TRADE_EXECUTOR_IMAGE"
    docker compose run \
        -e SIMULATE \
        enzyme-ethereum-btc-eth-stoch-rsi \
        enzyme-deploy-vault \
        --vault-record-file="deploy/$FUND_SYMBOL-vault-info.json" \
        --fund-name="$FUND_NAME" \
        --fund-symbol="$FUND_SYMBOL" \
        --etherscan-api-key=$ETHERSCAN_API_KEY \
        --whitelisted-assets="$WHITELISTED_ASSETS" \
        --denomination-asset="$DENOMINATION_ASSET" \
        --terms-of-service-address="$TERMS_OF_SERVICE_ADDRESS" \
        --owner-address="$OWNER_ADDRESS"



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
        "fund_name": "MATIC-ETH-USDC momentum algorithm",
        "fund_symbol": "MATIC-ETH-USDC-ALGO",
        "vault": "0xA2488118e33b2a72DC11e2c97eF0f5788700B2C2",
        "comptroller": "0x5Cf97C5084fa1220Ac1465f4Fa7402F962C638d8",
        "generic_adapter": "0x103DAa155fe94c6E53719E3f1d52bbACC4c15f8D",
        "block_number": 54883433,
        "usdc_payment_forwarder": "0xffaA2134DEf71180Db9e831c1765333645F0EC18",
        "guard": "0xD03a5D1AD2391A6009Ab0d6c519967790461b282",
        "deployer": "0x69960a0E963Ba6800A87980D4239A60fF7EC5e6e",
        "denomination_token": "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174",
        "terms_of_service": "0xbe1418df0bAd87577de1A41385F19c6e77312780",
        "whitelisted_assets": "0x7ceb23fd6bc0add59e62ac25578270cff1b9f619 0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270",
        "asset_manager_address": "0x69960a0E963Ba6800A87980D4239A60fF7EC5e6e",
        "owner_address": "0x238B0435F69355e623d99363d58F7ba49C408491"
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

Set up live execution environment
---------------------------------

Create a `trade-executor` :term:`Docker` instance using `docker-compose` that will run the live trading.

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

    # Port 3456 is mapped to the public IP on the host using Caddy
    HTTP_ENABLED=true

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

After the strategy module and Docker instance have been deployed.
For more details on how to do a final backtest see :ref:`docker-backtest`,
here are the quick instructions.

- This will use the final configuration (strategy module, environment files, docker compose) to run the backtest
  and see that the strategy module functions properly.

- This will generate backtest reports (HTML, notebook, state) for the web frontend

- The backtest result is saved on the local file system. The result of this backtest
  run is used to show some of the key metrics (sharpe, sortino, max drawdown)
  in the web frontend UI via :ref:`webhook`.

- The default generated state file will be `state/{id}-backtest.json` with other files like HTML report
  to be shown in the frontend.

You can run the backtest on the live trade executor with:

.. code-block:: shell

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

First vault deposit
-------------------

- After vault is registered it needs the initial deposit e.g. 1 USDC,
  for a test trade

- You can do the initial deposit on Enzyme website,
  or the Python console script below

- You need deposit some USDC in the vault needed later in the test trade,
  using Enzyme website and your wallet

- Enzyme can automatically convert MATIC to USDC and so on

To do the deposit using the console:

.. code-block:: shell

    docker compose run enzyme-polygon-matic-eth-usdc console

Then with `%cpaste`:

.. code-block:: python

    from decimal import Decimal
    from eth_defi.token import fetch_erc20_details
    from eth_defi.trace import assert_transaction_success_with_explanation
    from eth_defi.enzyme.vault import Vault

    print("Using RPC provider", web3.provider)

    deposit_amount = Decimal(1.5)
    # We need to manual specify gas, because having two
    # subsequent txs may hit different RPC endpoints
    # when transact() calls eth_estimateGas
    # and then the tx would revert in the gas estimation
    buy_shares_gas = 500_000

    print(f"Depositing USDC from our hot wallet {hot_wallet.address}, amount {deposit_amount} USDC")
    usdc_address = "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174"  # USDC.e on Polygon
    # usdc_address = "0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48"  # USDC on Ethereum
    usdc = fetch_erc20_details(web3, usdc_address)
    vault_address = state.sync.deployment.address  # init command saves vault address here
    assert vault_address, "Vault address not in trade-executor state, run trade-executor init first"

    out_gas_balance = web3.eth.get_balance(hot_wallet.address) / (10**18)
    our_usdc_balance = usdc.fetch_balance_of(hot_wallet.address)
    assert our_usdc_balance > deposit_amount, f"We have only {our_usdc_balance} USDC at {hot_wallet.address}, we need {deposit_amount} USDC"

    print(f"Depositing, we have {out_gas_balance} for gas and {our_usdc_balance} USDC at {hot_wallet.address}")

    # Perform approve + deposit from the trade-executor hot wallet
    vault = Vault.fetch(web3, vault_address)
    tx_hash = usdc.contract.functions.approve(vault.comptroller.address, usdc.convert_to_raw(deposit_amount)).transact({"from": hot_wallet.address})
    print(f"Approving in TX {tx_hash.hex()}")
    assert_transaction_success_with_explanation(web3, tx_hash)
    raw_amount = usdc.convert_to_raw(deposit_amount)
    print(f"Buying shares, raw amount {raw_amount}")
    tx_hash = vault.comptroller.functions.buyShares(raw_amount, 1).transact({"from": hot_wallet.address, "gas": buy_shares_gas})
    print(f"buyShares() in TX {tx_hash.hex()}")
    assert_transaction_success_with_explanation(web3, tx_hash)
    vault_usdc_amount = usdc.fetch_balance_of(vault.address)
    print(f"Deposit done, the vault has now {vault_usdc_amount} USDC, you can do perform-test-trade")


Performing a test trade
-----------------------

Performing a test trade is the final step before starting live trading.

First make sure

- Your vault has deposits

- Your hot wallet has native gas token for transaction fees

You can perform a test trade that checks that the trade routing works, opening and closing positions is possible.
This command will buy and sell a single trading pair from the strategy, worth of 1 USD.

.. code-block:: shell

    docker compose run \
        enzyme-polygon-matic-eth-usdc \
        perform-test-trade \
        --all-pairs

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

Running one test strategy decision cycle
----------------------------------------

You can now manually execute the first strategy cycle. This will be executed off-timestamp,
but will still demostrate the `decide_trades()` Python function is not broken.

.. code-block:: shell

    docker compose run \
        enzyme-polygon-matic-eth-usdc \
        start \
        --run-single-cycle

.. note::

    If you are doing this multiple times, make sure the `trade-executor` Docker is not running on the background,
    as otherwise you have two instances accessing the same state file at the same time resulting to the corruption.

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
