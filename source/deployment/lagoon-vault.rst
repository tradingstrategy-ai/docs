Lagoon vault deployment
=======================

Here are specific instructions to deploy a vault with :term:`Lagoon`.
The instructions have only Lagoon specific bits. For full guide see :ref:`vault deployment`.

Preface
-------

An automated trading Lagoon vault consists of

- Safe multisig wallet
- Lagoon vault smart contract: manages deposit and redemption calls
- Lagoon silo smart contract: stores deposit queue assets before they are settled in the vault
- Gnosis Safe multisig: main contract storing the assets
- `Trading Strategy Module <https://github.com/tradingstrategy-ai/web3-ethereum-defi/tree/master/contracts/safe-integration>`__:
   A Zodiac-module to enable automated asset management with safeguard

Lagoon example deploy script
----------------------------

This example deploy script used with Docker Compose setup for creating a vault on Base.

The deployment creates contracts
- Safe
- Vault
- TradingStrategyModuleV0

To deploy
- You need Ethescan-compatible API key to verify deployed contracts onchain
- Do Anvil-based simulation first
- Then do live deployment
- You need to give a bunch of multisig cosigners who will be owners of the created Safe

The deployer creates several transactions to configure ``TradingStrategyModuleV0``.

Secrets needed, give to the script via Docker compose environment variable files:

.. code-block:: text

    PRIVATE_KEY=
    ETHERSCAN_API_KEY=

An example deployment script:

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

Performing a test deposit and a test trade
------------------------------------------

When Lagoon vault is deployed, you need to make a test deposit to have some funds for performing the test trade.

- Assume your deployer key has some denomination token like USDC/USDT to deposit
- We will perform a test deposit of 10 USD to the vault
- Then we will sync the vault

.. code-block:: shell

    # Perform a test deposit
    docker compose run bnb-local-high console

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

And then we can perform a test trade to see if the vault works as expected.:

.. code-block:: shell

    # List all pairs
    docker compose run bnb-local-high check-universe

    # Pancakeswap test trade
    docker compose run \
        bnb-local-high \
        perform-test-trade \
        --pair "(binance, pancakeswap-v2, WBNB, USDT, 0.0025)" \
        --simulate

    # ERC-4626 vault test trade
    docker compose run \
        bnb-local-high \
        perform-test-trade \
        --pair "(binance, euler-vault-kit, eUSDT-4, USDT)" \
        --simulate

Safe multisignature wallet cosigners
------------------------------------

Each Lagoon vault has an underlying Safe multisignature wallet with cosigners.

These cosigners are given to the development script, but you need to manually remove the deployer key
from the Safe cosigner list. This operation has to be done by other cosigners.

_ ..safe-manual-action:

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
----------------------------------

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

The transaction builder should have a batch transaction of

1. ``disableModule()`` Disable the old guard module, reset the list with 0x1 special address
2. ``enableModule()`` Enable the new guard module

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

