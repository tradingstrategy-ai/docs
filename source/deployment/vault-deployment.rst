.. _vault deployment:

Vault deployment
================

This chapter discussed how to deploy a `trade-executor` binary to
manage a trading strategy deployed for multiple users using a :term:`vault`.

If you are looking for a single user deployment, :ref:`hot wallet deployment`
is an easier option.

Preface
-------

An automated trading Lagoon vault consists of

- Safe multisig wallet
- Lagoon vault smart contract: manages deposit and redemption calls
- Lagoon silo smart contract: stores deposit queue assets before they are settled in the vault
- Gnosis Safe multisig: main contract storing the assets
- `Trading Strategy Module <https://github.com/tradingstrategy-ai/web3-ethereum-defi/tree/master/contracts/safe-integration>`__:
   A Zodiac-module to enable automated asset management with safeguard

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

Create a Lagoon vault
---------------------

You can create a vault by running `trade-executor lagoon-deploy-vault` command
and giving it the configuration by environment variables.

You need to

- Be familiar with UNIX shell

- Decide your vault name and token symbol

- Have `PRIVATE_KEY` set up with some gas money for the trade executor hot wallet.
  See how to :ref:`creating hot wallet` for more info.

- Have Etherscan-compatible API key for the verification of the deployed contracts

- Get `TRADE_EXECUTOR_VERSION` Docker version from the Github container registry

- Give a list of multisig cosigners who will be owners of the created Safe

.. note ::

    Never share the hot wallet (private key) across different executors on the same blockchain.

The deployment creates contracts

- Safe

- Vault

- TradingStrategyModuleV0

The deployer creates several transactions to configure ``TradingStrategyModuleV0``.

- Do Anvil-based simulation first

- Then do live deployment

Secrets needed, give to the script via Docker compose environment variable files:

.. code-block:: text

    PRIVATE_KEY=
    ETHERSCAN_API_KEY=

Here is an example deployment script for creating a vault on Base.
Remember to replace `--fund-name` and `--fund-symbol` with your own strings.

We are deploying multiple contracts. First test with `--simulate` flag to see the deployment finish all the way to end.

An example `deploy/deploy-base-ath.sh` script

.. code-block:: shell

    #!/bin/bash
    #
    # Deploy Lagoon vault for a strategy defined in docker-compose.yml
    #
    # Set up
    # - Gnosis Safe
    # - Vault smart contract
    # - TradingStrategyModuleV0 guard with allowed assets
    # - trade executor hot wallet as the asset manager role
    #
    # To run:
    #
    #   SIMULATE=true deploy/deploy-base-ath.sh
    #


    set -e

    if [ "$SIMULATE" = "" ]; then
        echo "Set SIMULATE=true or SIMULATE=false"
        exit 1
    fi

    if [ "$TRADE_EXECUTOR_VERSION" = "" ]; then
        echo "TRADE_EXECUTOR_VERSION missing"
        exit 1
    fi

    set -u

    # docker composer entry name
    ID="base-ath"

    # ERC-20 share token symbol
    export FUND_SYMBOL="ATH1"

    # ERC-20 share toke  name
    export FUND_NAME="All-time high (Base)"

    # The vault is nominated in USDC on Base
    export DENOMINATION_ASSET="0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913"

    # 0%
    export MANAGEMENT_FEE=0

    #: 20%
    export PERFORMANCE_FEE=2000

    # Set as the initial owners or deployed Safe + deployer will be threre
    # Safe signing threshold is number of cosigners minus one.
    export MULTISIG_OWNERS="0xa7208b5c92d4862b3f11c0047b57a00Dc304c0f8, 0xbD35322AA7c7842bfE36a8CF49d0F063bf83a100, 0x05835597cAf9e04331dfe1f62C2Ec0C2aDc0d4a2, 0x5C46ab9e42824c51b55DcD3Cf5876f1132F9FbA9"

    # Terms of service manager smart contract address.
    # This one is deployed on Polygon.
    # export TERMS_OF_SERVICE_ADDRESS="0xDCD7C644a6AA72eb2f86781175b18ADc30Aa4f4d"

    # Run the command
    # - Pass private key and JSON-RPC node from environment variables
    # - Set vault-info.json to be written to a local file system

    export TRADE_EXECUTOR_IMAGE=ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}
    echo "Using $TRADE_EXECUTOR_IMAGE"
    docker compose run \
        -e SIMULATE \
        $ID \
        lagoon-deploy-vault \
        --vault-record-file="deploy/$ID-vault-info.json" \
        --fund-name="$FUND_NAME" \
        --fund-symbol="$FUND_SYMBOL" \
        --denomination-asset="$DENOMINATION_ASSET" \
        --any-asset \
        --uniswap-v2 \
        --uniswap-v3 \
        --multisig-owners="$MULTISIG_OWNERS" \
        --performance-fee="$PERFORMANCE_FEE" \
        --management-fee="$MANAGEMENT_FEE"



Example output:

.. code-block:: text

    Key                            Label
    Deployer                       0x5BbB9768f878a2eDe9A4317878606fd1BA9e7879
    Safe                           0x04a7cBA3f913eC9aD3f9A26E604F3e75d4E6b530
    Vault                          0x6E20dA351c36eb30241E9D62961681288FD34397
    Trading strategy module        0x4ef44a6835F98D4Eac7D74aE3c196a832B19B939
    Asset manager                  0x5BbB9768f878a2eDe9A4317878606fd1BA9e7879
    Underlying token               0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913
    Underlying symbol              USDC
    Share token                    0x6E20dA351c36eb30241E9D62961681288FD34397
    Share token symbol             MEMEX
    Multisig owners                0xa7208b5c92d4862b3f11c0047b57a00Dc304c0f8, 0xbD35322AA7c7842bfE36a8CF49d0F063bf83a100, 0x05835597cAf9e04331dfe1f62C2Ec0C2aDc0d4a2, 0x5C46ab9e42824c51b55DcD3Cf5876f1132F9FbA9
    Block number                   24,773,588

.. note ::

    It is important that you keep the contents of the vault smart contract addresses and/or the JSON file around,
    as otherwise you cannot interact with your vault later.

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
    ASSET_MANAGEMENT_MODE="lagoon"

    #
    # Strategy assets and metadata
    #

    STRATEGY_FILE=strategies/base-ath.py

    # Port 3456 is mapped to the public IP on the host using Caddy
    HTTP_ENABLED=true

    # Set parameters from Lagoon vault deployment.
    # Get output from trade-executor lagoon-deploy-vault command
    VAULT_ADDRESS=0x6E20dA351c36eb30241E9D62961681288FD34397
    VAULT_DEPLOYMENT_BLOCK_NUMBER=...

Remember to slice files together:

.. code-block:: shell

    cat ~/strategies/env/base-ath.env ~/secrets/base-ath-secrets.env > ~/secrets/base-ath-final.env

Setting up docker-compose entry
-------------------------------

See :ref:`docker compose example`.

Test docker-compose entry
-------------------------

You can check the trade executor with:

.. code-block:: shell

    docker-compose run base-ath --help

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
      check-universe        Checks that the trading universe is helthy for a given strategy.
      check-wallet          Print out the token balances of the hot wallet.
      console               Open interactive IPython console to explore state.
      lagoon-deploy-vault   Deploy a new Lagoon vault.
      hello                 Check that the application loads without doing anything.
      init                  Initialise a strategy.
      perform-test-trade    Perform a small test swap.
      repair                Repair broken state.
      start                 Launch Trade Executor instance.
      version               Print out the version information.

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

    docker-compose run base-ath backtest

Check wallet
------------

Check that your vault has deposits for test trade.

.. code-block:: shell

    docker-compose run base-ath check-wallet

Initialise the vault
--------------------

This will initialise the state file for the strategy executor.

- Create a new state file for the strategy

- Read and sync on-chain information to the state file (smart contract addresses, etc.)

- Start tracking deposit and redemption information

.. code-block:: shell

    # Use the deployment block number earlier
    docker-compose run base-ath init

First vault deposit
-------------------

When the Lagoon vault is deployed, you need to make a test deposit to have some funds for performing the test trade.

- Assume your deployer key has some denomination token like USDC/USDT to deposit
- We will perform a test deposit of 10 USD to the vault
- Then we will sync the vault

.. code-block:: shell

    # Perform a test deposit
    docker compose run base-ath console

Then with `%cpaste`:

.. code-block:: python

        from decimal import Decimal

        from eth_defi.trace import assert_transaction_success_with_explanation
        from eth_defi.etherscan.config import get_etherscan_tx_link

        deposit_amount = Decimal(10.0)  # USD

        vault = sync_model.vault
        deposit_token = vault.denomination_token
        wallet = hot_wallet

        balance = deposit_token.fetch_balance_of(wallet.address)
        print(f"Hot wallet balance: {balance} {deposit_token.symbol}")
        assert balance > deposit_amount, "Asset manager has no balance to deposit"

        # 1. Approve
        tx_hash = wallet.transact_and_broadcast_with_contract(deposit_token.approve(vault.address, deposit_amount))
        print(f"Approving with : {get_etherscan_tx_link(web3.eth.chain_id, tx_hash.hex())}")
        assert_transaction_success_with_explanation(web3, tx_hash)

        # 2. Put to deposit queue
        raw_amount = deposit_token.convert_to_raw(deposit_amount)
        deposit_func = vault.request_deposit(hot_wallet.address, raw_amount)
        tx_hash = wallet.transact_and_broadcast_with_contract(deposit_func)
        print(f"requestDeposit() with : {get_etherscan_tx_link(web3.eth.chain_id, tx_hash.hex())}")
        assert_transaction_success_with_explanation(web3, tx_hash)

        # 3. Add reserve currency
        reserve_asset = strategy_universe.get_asset_by_address(deposit_token.address)
        state.portfolio.initialise_reserves(reserve_asset, reserve_token_price=1.0)

        # 4. Sync deposits as the asset manager
        end_block = execution_model.get_safe_latest_block()
        timestamp = datetime.datetime.utcnow()
        sync_model.hot_wallet.sync_nonce(web3)
        sync_model.sync_treasury(
            strategy_cycle_ts=timestamp,
            state=state,
            end_block=end_block,
            post_valuation=True,
        )

        # 5. Store results
        store.sync(state)

Performing a test trade
-----------------------

Performing a test trade is the final step before starting live trading.

First make sure

- Your vault has deposits

- Your hot wallet has native gas token for transaction fees

- Use `--simulate` switch to do the first stab: this will fork the mainnet and simulate the transaction
  in Anvil, so you do not spend gas if there are bugs in your `decide_trades()`

You can perform a test trade that checks that the trade routing works, opening and closing positions is possible.
This command will buy and sell a single trading pair from the strategy, worth of 1 USD.

.. code-block:: shell

    # List all pairs
    docker compose run base-ath check-universe

    # DEX test trade
    docker compose run \
        base-ath \
        perform-test-trade \
        --pair "(base, uniswap-v3, WETH, USDC, 0.0005)" \
        --simulate

    # ERC-4626 vault test trade
    docker compose run \
        base-ath \
        perform-test-trade \
        --pair "(base, euler-vault-kit, eUSDT-4, USDT)" \
        --simulate

For a multipair strategy with all pairs:

.. code-block:: shell

    docker compose run \
        base-ath \
        perform-test-trade \
        --all-pairs \
        --simulate

Running one test strategy decision cycle
----------------------------------------

You can now manually execute the first strategy cycle. This will be executed off-timestamp,
but will still demostrate the `decide_trades()` Python function is not broken.

First simulated:

.. code-block:: shell

    docker compose run \
        base-ath \
        start \
        --run-single-cycle

Then for real:

.. code-block:: shell

    docker compose run \
        base-ath \
        start \
        --run-single-cycle

.. note::

    If you are doing this multiple times, make sure the `trade-executor` Docker is not running on the background,
    as otherwise you have two instances accessing the same state file at the same time resulting to the corruption.

Launch live trading
-------------------

Launch the trade executor in daemon mode:

.. code-block:: shell

    docker-compose up -d base-ath

Checking logs
-------------

Logs are available through the web frontend.

You can also check the latest logs from Docker:

.. code-block:: shell

    docker-compose logs --tail=200 base-ath

Backup trade-executor configuration
-----------------------------------

After finishing with the vault setup, make sure your configuration files are stored properly.

- Add edits and new files to Git commit

- Push changes to Github

Set up web frontend and monitoring
----------------------------------

See the next steps in :ref:`strategy monitoring`.

Safe multisignature wallet cosigners
------------------------------------

Each Lagoon vault has an underlying Safe multisignature wallet with cosigners.

These cosigners are given to the development script, but you need to manually remove the deployer key
from the Safe cosigner list. This operation has to be done by other cosigners.

.. _safe-manual-action:

Executing Safe actions manually
-------------------------------

Multisig cosigners may need to do manual actions on behalf of the vault owners. Such actions include

- Trading away broken ERC-20 tokens (can't swap)
- Liquidating any airdrops

To do that

- You need to access the underlying Safe multisignature wallet of the vault through Safe URL
- Open any service where you wish to do transactions through Safe app menu, e.g. 1inch
- Initiate a transaction
- Confirm the transaction

Safe multisignature URL is format of: https://app.safe.global/home?safe=base:0x6ad1A91Ca59Cf12D58c5F81dd737E8081c7C6e64

.. note ::

    The vault address (Lagoon Silo smart contract) is different from the underlying Safe address.

Upgrading the guard smart contract
-----------------------------------

When a strategy is updated to trade new assets and vaults, also its guard smart contract needs to be updated.
For this, a new guard smart contract, a Zodiac module `TradingStrategyModuleV0 <https://github.com/tradingstrategy-ai/web3-ethereum-defi/tree/master/contracts/safe-integration>`__, is deployed.

The upgrade process is as follows:

1. Stop `trade-executor` Docker
2. Prepare a new strategy module Python file and backtest it with new assets
3. Create a new version of the guard smart contract using `lagoon-deloy-vault` script
4. :ref:`safe-manual-action` to remove the old guard smart contract from the Safe multisignature wallet
5. :ref:`safe-manual-action` to add the new guard smart contract to the Safe multisignature wallet
6. Perform `trade-executor peform-test-trade` for newly added assets to see the guard works
7. Restart `trade-executor` Docker

Deploy new guard module smart contract
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is an example script:

.. code-block:: shell

    #!/bin/bash
    #
    # Redeploy Base ATH strategy guard with Harvest Finance IPOR vault whitelisted
    #
    # Uses --guard-only, --existing-vault-address and --existing-safe-address options.
    #
    # To run: SIMULATE=false scripts/base-ath/redeploy-guard-base-ath-v3.sh
    #

    set -e
    set -u

    ID="base-ath"

    # Existing Lagoon deployment for which we want to deploy a new guard
    EXISTING_VAULT_ADDRESS="0x7d8Fab3E65e6C81ea2a940c050A7c70195d1504f"

    # Existing Safe address (old Lagoon versions do not support reflecting this back from the smart contract)
    EXISTING_SAFE_ADDRESS="0x6ad1A91Ca59Cf12D58c5F81dd737E8081c7C6e64"

    # Whitelist Harvest Finance IPOR vault, Spark USDC on Base
    WHITELISTED_VAULTS="0x0d877Dc7C8Fa3aD980DfDb18B48eC9F8768359C4, 0x7bfa7c4f149e7415b73bdedfe609237e29cbf34a"

    # Mark new deployment files with this suffix
    SUFFIX="v3-new-guard"

    if [ "$SIMULATE" = "" ]; then
        echo "Set SIMULATE=true or SIMULATE=false"
        exit 1
    fi

    if [ "$SIMULATE" = "false" ]; then
        if [ "$ETHERSCAN_API_KEY" = "" ]; then
            echo "Set ETHERSCAN_API_KEY=... to make sure the deployment is verified on Etherscan"
            exit 1
        fi
    fi

    export TRADE_EXECUTOR_IMAGE=ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}
    echo "Using $TRADE_EXECUTOR_IMAGE"
    docker compose run \
        -e SIMULATE \
        $ID \
        lagoon-deploy-vault \
        --guard-only \
        --etherscan-api-key="$ETHERSCAN_API_KEY" \
        --erc-4626-vaults="$WHITELISTED_VAULTS" \
        --existing-vault-address="$EXISTING_VAULT_ADDRESS" \
        --existing-safe-address="$EXISTING_SAFE_ADDRESS" \
        --vault-record-file="deploy/$ID-$SUFFIX-vault-info.txt" \
        --any-asset \
        --uniswap-v2 \
        --uniswap-v3 \
        --aave

When run the script will at the end tell you what Gnosis Safe transactions are needed to upgrade the guard module.

Example output:

.. code-block:: none

    New guard deployed: 0x6DCCA7f34EB8F1a519ae690E9A3101f705bB0393
    Old guard address: 0x3275Af9ce73665A1Cd665E5Fa0b48c25249219ac
    Safe address: 0x6ad1A91Ca59Cf12D58c5F81dd737E8081c7C6e64
    Vault address: 0x7d8Fab3E65e6C81ea2a940c050A7c70195d1504f

    Safe transactions needed:
    1. 0x6ad1A91Ca59Cf12D58c5F81dd737E8081c7C6e64.disableModule(0x0000000000000000000000000000000000000001, 0x3275Af9ce73665A1Cd665E5Fa0b48c25249219ac)
    2. 0x6ad1A91Ca59Cf12D58c5F81dd737E8081c7C6e64.enabledModule(0x6DCCA7f34EB8F1a519ae690E9A3101f705bB0393)

Crafting enableModule() transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to Gnosis Safe transaction builder.

You need to create a batch of two transactions.

Get `Gnosis Safe ABI JSON files here <https://app.unpkg.com/@safe-global/safe-contracts@1.4.1-2/files/build/artifacts/contracts>`__
- `SafeL2 ABI <https://unpkg.com/@safe-global/safe-contracts@1.4.1-2/build/artifacts/contracts/SafeL2.sol/SafeL2.json>`__

For ``enableModule`` / ``disableModule`` the ABI snippet is:

.. code-block:: json

    [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "module",
          "type": "address"
        }
      ],
      "name": "enableModule",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "prevModule",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "module",
          "type": "address"
        }
      ],
      "name": "disableModule",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
    ]

The script above should give you the information for the Gnosis SAfe Transaction builder to craft a batch transaction of:

1. ``disableModule(0x0000000000000000000000000000000000000001, old guard address)`` Disable the old guard module, reset the list with 0x1 special address
2. ``enableModule(new guard aaddess)`` Enable the new guard module

Finishing the transition
~~~~~~~~~~~~~~~~~~~~~~~~

Upgrade the strategy source code, have new assets enabled in ``create_trading_universe()`` Python function.

Run ``perform-test-trade --simulate`` to make sure the new guard works with the new assets.

.. code-block:: shell

    docker compose run \
        base-ath \
        perform-test-trade \
        --all-vaults  \
        --simulate \
        --amount=1.0


Then restart the `trade-executor` Docker container with the new strategy code.
