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

Multichain gas distribution
---------------------------

A multichain Lagoon vault follows a hub and spoke model.

- The hub vault is deployed on the primary chain. The hub has Lagoon vault, Gnosis safe, TradingStrategyModuleV0 and related smart contracts.

- A spoke is deployed on each satellite chain in the strategy universe. Each spoke has only Gnosis Safe and TradingStrategyModuleV0 smart contracts.

- The deployer hot wallet needs native gas token on every chain where a spoke is created.

Before deploying a multichain vault, distribute gas funds to all chains used by the strategy.
The ``distribute-gas-funds`` command reads the strategy universe, checks which chains need
native gas token, and bridges gas to the hot wallet on those chains.

First do a dry run:

.. code-block:: shell

    docker compose run \
        -e DRY_RUN=true \
        -e MIN_GAS_USD=5 \
        -e TOP_UP_GAS_USD=20 \
        base-ath \
        distribute-gas-funds

Then perform the gas distribution:

.. code-block:: shell

    docker compose run \
        -e MIN_GAS_USD=5 \
        -e TOP_UP_GAS_USD=20 \
        base-ath \
        distribute-gas-funds

The Docker Compose entry must have ``STRATEGY_FILE``, ``PRIVATE_KEY``,
``TRADING_STRATEGY_API_KEY`` and ``JSON_RPC_*`` environment variables configured
for all chains used by the multichain strategy.

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
    # Deploy Lagoon vault for a strategy defined in docker compose.yml
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

Create a `trade-executor` :term:`Docker` instance using `docker compose` that will run the live trading.

- You have set up an :term:`environment file` for the vault live trading

- You have set up a `docker compose` configuration entry for your live trade executor,
  see :ref:`strategy deploment` for details

You will need to create

- The final strategy module file

- Public environment variables file

- Secret environment variables file

- Final environment variables file

- `docker compose.yml` entry

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

Setting up docker compose entry
-------------------------------

See :ref:`docker compose example`.

Test docker compose entry
-------------------------

You can check the trade executor with:

.. code-block:: shell

    docker compose run base-ath --help

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

    docker compose run base-ath backtest

Check wallet
------------

Check that your vault has deposits for test trade.

.. code-block:: shell

    docker compose run base-ath check-wallet

Initialise the vault
--------------------

This will initialise the state file for the strategy executor.

- Create a new state file for the strategy

- Read and sync on-chain information to the state file (smart contract addresses, etc.)

- Start tracking deposit and redemption information

.. code-block:: shell

    # Use the deployment block number earlier
    docker compose run base-ath init

First vault deposit
-------------------

When the Lagoon vault is deployed, you need to make a test deposit to have some funds for performing the test trade.

- Assume your deployer key has some denomination token like USDC/USDT to deposit
- We will perform a test deposit of 10 USD to the vault
- The command will approve, deposit, settle the vault on-chain, and update the state file

You need to set ``VAULT_ADAPTER_ADDRESS`` to the trading strategy module address from the vault deployment output.

First simulate the deposit:

.. code-block:: shell

    docker compose run base-ath lagoon-first-deposit --deposit-amount=10 --simulate

Then perform the actual deposit:

.. code-block:: shell

    docker compose run base-ath lagoon-first-deposit --deposit-amount=10

Performing a test trade
-----------------------

Performing a test trade is the final step before starting live trading.

First make sure

- Your vault has deposits

- Your hot wallet has native gas token for transaction fees

- Use ``--simulate`` switch to do the first stab: this will fork the mainnet and simulate the transaction
  in Anvil, so you do not spend gas if there are bugs in your ``decide_trades()``

Using trade-ui (recommended)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``trade-ui`` command provides an interactive terminal interface for selecting a trading pair
and performing a test trade. It displays all pairs in the strategy universe with prices,
and lets you choose the trade direction (buy and sell, buy only, sell only) and amount.

.. code-block:: shell

    docker compose run \
        base-ath \
        trade-ui \
        --simulate

The TUI shows a navigable table of all pairs. Use arrow keys to select a pair, press Enter,
then choose the trade mode and amount in the dialog. The command handles universe loading,
routing setup, and trade execution automatically.

Using perform-test-trade
~~~~~~~~~~~~~~~~~~~~~~~~

Alternatively, you can use the ``perform-test-trade`` command for non-interactive, scriptable test trades.
This is useful for CI pipelines or when you know the exact pair you want to test.

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

    docker compose up -d base-ath

Checking logs
-------------

Logs are available through the web frontend.

You can also check the latest logs from Docker:

.. code-block:: shell

    docker compose logs --tail=200 base-ath

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

When a strategy is updated to trade new assets or vaults, its guard contract may
also need new permissions. Redeploy the ``TradingStrategyModuleV0`` Zodiac
module for the existing Safe. The command proposes the Safe module replacement
automatically; Safe owners must still review and execute it.

Automatic proposals require the deployer's ``PRIVATE_KEY`` to belong to a
current Safe owner, a supported Safe Transaction Service chain, and a deployed
MultiSendCallOnly contract. The command checks these before deploying a guard.
If the deployer was removed from the Safe owner list after the original vault
deployment, use the explicit manual option described below. A Transaction
Service API key is optional and can be supplied through
``SAFE_TRANSACTION_SERVICE_API_KEY``.

The upgrade process is as follows:

1. Stop the ``trade-executor`` Docker service.
2. Prepare the updated strategy module and backtest it with the new assets.
3. Run ``lagoon-deploy-vault --guard-only`` with ``SIMULATE=true``, then run it
   against the live chain. Simulation does not submit a Safe proposal.
4. Open the Safe transaction URL in the deployment record. Verify that one
   batch disables the old module and enables the new one, then have the Safe
   owners execute it. The command only proposes the transaction.
5. Set ``VAULT_ADAPTER_ADDRESS`` to the new module address in the executor
   configuration. Update configured satellite module addresses too, if any.
6. Run ``perform-test-trade`` for the newly permitted assets.
7. Restart the ``trade-executor`` Docker service after the Safe migration has
   executed.

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

Safe proposal and recovery
~~~~~~~~~~~~~~~~~~~~~~~~~~

The live command saves a text record and a paired JSON record. For a
single-chain deployment, ``Guard migration`` in the JSON contains the old and
new module addresses, the Safe address, the two ordered calls, and
``safe_proposal``. Multichain records store these under
``deployments[chain].guard_migration``. Each chain has its own proposal and
status. The text record includes the Safe transaction URL when submission
succeeds.

``safe_proposal.status`` is ``pending`` until the Safe Transaction Service
accepts the proposal, then ``submitted``. This reports submission, not Safe
execution. The saved ``enabled_modules_at_deployment`` is a historical
snapshot. After execution, the executor reads the Safe's enabled modules and
records the live ``guard_migration.status`` in strategy state. Only a live
module check confirms that the new guard is enabled and the old one disabled.

If submission fails after deployment, the command exits with an error but
keeps the deployed guard and pending migration in the record. Retry through
the same command without deploying another guard:

.. code-block:: shell

    docker compose run \
        base-ath \
        lagoon-deploy-vault \
        --retry-guard-proposal \
        --vault-record-file="deploy/base-ath-v3-new-guard-vault-info.txt" \
        --chain-name=base

The retry uses ``PRIVATE_KEY`` and the configured ``JSON_RPC_*`` connection.
``--chain-name`` selects one chain and is useful when several RPC connections
are configured; omit it to retry all pending chains in a multichain record.
For a single-chain record, configure exactly one connection or select it with
``--chain-name``. The command skips already submitted proposals. It checks
the Safe's old module, the saved nonce and batch data when present, and any
other pending proposal at that nonce before submitting. If the Safe changed,
inspect it before retrying. A multichain deployment that stops partway keeps
the record for each chain already deployed.

Manual Safe migration
~~~~~~~~~~~~~~~~~~~~~

For a chain without a hosted Safe Transaction Service, or when the deployer
is no longer a Safe owner, pass ``--manual-safe-migration`` together with
``--guard-only``. The command deploys the new guard and saves the ordered
Safe calls without posting a proposal. In Safe Transaction Builder or
equivalent owner tooling, create one atomic batch containing two calls to the
Safe itself:

1. ``disableModule(0x0000000000000000000000000000000000000001, old_guard)``
2. ``enableModule(new_guard)``

Use the addresses and ABI from the saved deployment record. Each call has
zero value and uses the Call operation. Safe owners must review and execute
the batch. The manual option applies to every chain in a multichain run.
``--generate-lighter-api-key`` cannot be combined with ``--guard-only``.

Finishing the transition
~~~~~~~~~~~~~~~~~~~~~~~~

Upgrade the strategy source code, have new assets enabled in ``create_trading_universe()`` Python function.

Run ``trade-ui --simulate`` to interactively test that the new guard works with the new assets:

.. code-block:: shell

    docker compose run \
        base-ath \
        trade-ui \
        --simulate

Or use ``perform-test-trade`` for non-interactive testing of all vault pairs:

.. code-block:: shell

    docker compose run \
        base-ath \
        perform-test-trade \
        --all-vaults  \
        --simulate \
        --amount=1.0


Then restart the `trade-executor` Docker container with the new strategy code.
