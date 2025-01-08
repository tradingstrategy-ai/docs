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

The deployment creates contracts
- Safe
- Vault
- TradingStrategyModuleV0

To deploy
- Do Anvil-based simulation first
- Then do live deployment
- You need to give a bunch of multisig cosigners who will own

An example deploy script used with Docker Compose setup for creating a vault on Base:

.. code-block:: shell

    #!/bin/bash
    #
    # Deploy Lagoon vault for a strategy defined in docker-compose.yml
    #
    # Set up
    # - name
    # - TradingStrategyModuleV0 guard with allowed assets
    # - trade executor hot wallet as the asset manager role
    #
    # To run:
    #
    #   SIMULATE=true deploy/deploy-base-memex.sh
    #

    set -e
    set -u
    set -x

    if [ "$SIMULATE" = "" ]; then
        echo "Set SIMULATE=true or SIMULATE=false"
        exit 1
    fi

    if [ "$TRADE_EXECUTOR_VERSION" = "" ]; then
        echo "TRADE_EXECUTOR_VERSION missing"
        exit 1
    fi

    # docker composer entry name
    ID="base-memex"

    # ERC-20 share token symbol
    export FUND_SYMBOL="MEMEX"

    # ERC-20 share toke  name
    export FUND_NAME="Memex (Base)"

    # The vault is nominated in USDC on Base
    export DENOMINATION_ASSET="0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913"

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
        --multisig-owners="$MULTISIG_OWNERS"

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