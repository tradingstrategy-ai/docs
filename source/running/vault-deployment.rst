.. vault-deployment:

Vault deployment
================

For vault based strategies, before you progress to :ref:`strategy deployment`, you need to
deploy the underlying vault that is controlled by an oracle.

Preface
-------

This example shows how to deploy a vault for :ref:`Enzyme protocol`

- Multiple investors

- Vault owner and asset manager is set to be a single private key

- Vault does not have any safety features and can trade any assets;
  use only for trusted setups

- Any strategy can only trade Enzyme whitelisted addresses;
  see :py:mod:`tradeexecutor.ethereum.cli.commands.enzyme_asset_list`

Prerequisites
-------------

To get started you need to have a

- JSON-RPC node

- A private key

- Native token loaded up for :term:`gas fee`

`To generate a private key, you can see the instructions here <https://ethereum.stackexchange.com/questions/82926/how-to-generate-a-new-ethereum-address-and-private-key-from-a-command-line>`__.

Creating a vault
----------------

You can create a vault by running `trade-executor` and giving it the configuration by environment variables.

.. note ::

    See :ref:`strategy deployment` on how to install and run `trade-executor` Docker image.

Example shell script:

.. code-block:: shell

    # Pin down the Docker image version we are going to use
    # See versions here https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor
    export TRADE_EXECUTOR_VERSION=
    export TRADE_EXECUTOR_IMAGE=ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}

    # Run the command, pass private key and JSON-RPC node from environment variables
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
        --fund-name="Degen Fault I" \
        --fund-symbol="DEGE1" \
        --json-rpc-polygon=$JSON_RPC_POLYGON

This will give you the log output for the deployment:

.. code-block:: text

    2023-04-26 19:20:13 tradeexecutor.ethereum.web3config                  INFO     Chain polygon connects using alien-black-thunder.matic.quiknode.pro
    2023-04-26 19:20:14 tradeexecutor.ethereum.web3config                  TRADE    Connected to chain: polygon, node provider: alien-black-thunder.matic.quiknode.pro, gas pricing method: london
    2023-04-26 19:20:14 tradeexecutor.ethereum.web3config                  INFO     Using proof-of-authority web3 middleware for chain 137
    2023-04-26 19:20:14 root                                               INFO     Connected to chain polygon
    2023-04-26 19:20:14 root                                               INFO       Chain id is 137
    2023-04-26 19:20:14 root                                               INFO       Latest block is 41,991,567
    2023-04-26 19:20:14 root                                               INFO     Balance details
    2023-04-26 19:20:14 root                                               INFO       Hot wallet is 0x40d8368C6D1FfC90fe705B74C6F0F56E1d11092E
    2023-04-26 19:20:14 root                                               INFO       We have 103.618645 tokens for gas left
    2023-04-26 19:20:14 root                                               INFO     Enzyme details
    2023-04-26 19:20:14 root                                               INFO       Integration manager deployed at 0x92fCdE09790671cf085864182B9670c77da0884B
    2023-04-26 19:20:14 root                                               INFO       USDC is 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174
    2023-04-26 19:20:14 root                                               INFO     Deploying vault
    2023-04-26 19:20:19 root                                               INFO     Deploying VaultSpecificGenericAdapter
    2023-04-26 19:20:23 root                                               INFO     Vault details
    2023-04-26 19:20:23 root                                               INFO       Vault at 0x6E321256BE0ABd2726A234E8dBFc4d3caf255AE0
    2023-04-26 19:20:23 root                                               INFO       Comptroller at 0x0fC476e8050a9eDe4D24E2f01d8775249bDf310e
    2023-04-26 19:20:23 root                                               INFO       GenericAdapter at 0x07f7eB451DfeeA0367965646660E85680800E352
    2023-04-26 19:20:23 root                                               INFO       Deployment block number is 41991571


.. note ::

    It is very important that you keep the contents of the JSON file around,
    as otherwise you cannot interact with your vault later.

Registering the vault with Enzyme's website
-------------------------------------------

After the vault has been deployed, you can visit `enzyme.finance <https://enzyme.finance>` and
register your vault there, to make it publicly accessible.

- Import your private key to a secure wallet e.g. TrustWallet on mobile

- Sign in to Enzyme

- Switch to correct network

- The vault should automatically appear in left under "My vault"

- Go to Vault Settings, choose Claim vault

- Sign a message from your wallet for claiming the ownership

- Now you can fill in the vault description on Enzyme's website database
