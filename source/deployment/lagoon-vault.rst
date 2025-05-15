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

Safe multisignature wallet cosigners
------------------------------------

Each Lagoon vault has an underlying Safe multisignature wallet with cosigners.

These cosigners are given to the development script, but you need to manually remove the deployer key
from the Safe cosigner list. This operation has to be done by other cosigners.

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

