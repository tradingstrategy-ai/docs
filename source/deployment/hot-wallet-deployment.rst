.. _strategy-deployment:

.. _strategy deployment:

.. _hot wallet deployment:

Hot wallet deployment
=====================

In this chapter, we explain how to take a backtested strategy and make it to a live running trading strategy instance.

This section is for a single user hot wallet deployment mode.
If you are looking to deploy a strategy for multiple users see :ref:`vault deployment`.

.. warning::

    These instructions are partially outdated regarding individual
    commands and environment variables due to latest development
    in `trade-executor`. Refer to :ref:`vault deployment`
    for up-to-date commands.

Preface
-------

This example shows a trading strategy deployment in its simplest form

- Single investor

- Uses a private key hot wallet where tokens and strategy reserves are stored

- Runs on a single Docker instance

- Trades on single chain, single exchange

.. image:: deployment-overview.drawio.svg

Prerequisites
-------------

To get started you need to have a

- A strategy with successful backtests

- Basics of Python programming

- Basics of UNIX and Docker system administration, using
  UNIX shell

- A stash of blockchain native cryptocurrency for gas fees (ETH, BNB, MATIC)

- Initial cash deposit in stablecoin (USDC, BUSD)

- Ability to set DNS entries and domain names for your web services

- `A Github access token to download Docker images from GHCR <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>`_
  (Github does not currently allow to downlaod public Docker images without an API key)

Preproduction checklist
-----------------------

First before doing the production deployment, it is a good idea to practice the deployment on a local laptop.

The preproduction set up can be more straightforward than the actual production deployment,
as we are less worried about security like managing the access to the private keys. It will also no
web frontend or diagnostics configured, which is the major share of work of setting up a new automated trade executor.
The only output you can see is in Docker log output of the trade executor process.

- `[ ]` A repository tool where you are going to manage your configuration files (Github, Gitlab, etc.)
    - See the project structure details below
- `[ ]` Linux / macOS laptop (Windows should work, but the command line commmands differ so much, so it is unsupported)
- `[ ]` :ref:`Docker installation with Docker compose <managing docker images>`
- `[ ]` Convert your backtest notebook :ref:`to a Python strategy module <>`

First name your trade executor. This will be used as filename and URL ids. A good name is

.. code-block:: text

    [execution type]-[chain]-[base token]-[quote token]-[strategy type]

E.g.

.. code-block:: text

    hotwallet-ethereum-eth-usdc-mean-reversion


Create a new project with the folder structure

.. code-block:: text

    logs/
    state/
    strategy/
    cache/
    strategy/my-strategy-module.py

Create a `docker-compose.yml` based on the example:

.. code-block:: yaml

    version: "3.9"

    # The base template for trade-executor live trading
    x-trade-executor: &default-trade-executor
      image: ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}
      # All live executors have internal exception recovery mechanism,
      # If trade executor stops it must be manually restarted.
      # However webhook server stays around and can still take commands
      # even if the trade executor loop has stopped.
      restart: "no"
      mem_swappiness: 0
      volumes:
        # Map the path from where we load the strategy Python modules
        - ./strategy:/usr/src/trade-executor/strategy
        # Save the strategy execution state in the local filesystem
        - ./state:/usr/src/trade-executor/state
        # Cache the dataset downloads in the local filesystem
        - ./cache:/usr/src/trade-executor/cache
        # Save the log files to the local file system
        - ./logs:/usr/src/trade-executor/logs

      # This is the default trade-executor command to
      # launch as a daemon mode.
      # There are several subcommands.
      command: start

    services:

      # This is your trade executor name
      hotwallet-ethereum-eth-usdc-mean-reversion:
        <<: *default-trade-executor
        container_name: hotwallet-ethereum-eth-usdc-mean-reversion
        env_file:
          - ~/env/strategy.env



Strategy assets
---------------

For each live executed strategy you need to have

See :ref:`strategy metadata` for the list of resources you need.

Managing Docker images
----------------------

- You need to be able to run a Docker image on your server in order to run `trade-executor`

- See :ref:`managing Docker images` to learn how to get started with Docker

.. _command-line-backtest:

Testing the strategy module
---------------------------

You can run backtests using `trade-executor` command locally on your development module to check the strategy module
looks intact.

See :ref:`standalone module backtest` for more information.


.. _creating hot wallet:

Creating a hot wallet
---------------------

To create a hot wallet for a strategy do the following:

.. code-block:: shell

        python -c "from web3 import Web3; w3 = Web3(); acc = w3.eth.account.create(); print(f'private key={w3.to_hex(acc._private_key)}, account={acc.address}')"

This will give you private key and account pair (not a real private key, do not use):

.. code-block:: text

    private key=0xd67b9015bfa8d6da2e30a7bb232e2d8b2899e610b08a11afb6de48c693226845, account=0x5DC2837bac174efD17aC294A2573F52DED5E5e1D

Then

- Store the private key safely in your backup storage (paper, password manager, etc.)

- Private key will be needed in the trade execution configuration file

.. note ::

    Private keys or hot wallets cannot be shared across different `trade-executor` instances.
    Because this will mess up accounting.

Changes between backtesting and live execution
----------------------------------------------

Compared to backtesting, the live execution environment has several differences

- The live execution needs a hot wallet with real money and native gas token.

- The live execution depends on JSON-RPC node to send transactions.

- The live execution maintains the application state in a state file (JSON) and
  and can resume from crashes.

- You need to give `tick_offset_minutes` command line option to tell how much time we give for the price feed
  to generate candles after the trade cycle is triggered. This has a defaul value.

- There is `max_data_delay` parameter that will cause the trade executor to crash if the price feed data is delayed
  for too long. This is a safety feature to prevent any trades to happen in the case market data is delayed
  or ambitious. This has a defaul value.

- The live execution needs a gas strategy for paying the transaction gas fees.

- The live execution environment has HTTP webhook server.

- The live execution environment may have Discord notifications.

- The live execution environment may send performance statistics through statsd interface.

- The live execution environment may send logs to LogStash server.

Creating configuration file
---------------------------

In this example we lay out a simple best practice to manage your `trade-executor` configuration

- We use Docker `.env` style configuration files

- Public configuration variables can be committed to source code control like Github

- Secret configuration variables are only available locally or on-server using a
  .env style configuration files

- The final env configuration file, as passed to Docker process,
  is created by splicing public and private configuration file together
  and validating it

For this example we assume we have

- Public configuration file `env/pancake-eth-usd-sma.env` (stored in a Github repository)

- Secret configuration file `~/pancake-eth-usd-sma-secret.env` (stored on a server only)

- Final generated configuration file (read by the Docker daemon): `~/pancake-eth-usd-sma-final.env`

.. note ::

    Docker style `.env` files do not have quotes around their values.


.. note ::

    Because configuration files are small, you can copy-paste both public and secret configuration
    files into your pasword manager as a backup.

Example public configuration file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example settings. Refer :ref:`command line options` for full guide.

.. code-block:: ini

    #
    # Strategy assets and metadata
    #

    STRATEGY_FILE=strategies/pancake-eth-usd-sma.py
    NAME="ETH-USD SMA on Pancake"
    DOMAIN_NAME="pancake-eth-usd-sma.tradingstrategy.ai"
    SHORT_DESCRIPTION="Pancake ETH/USDC SMA crossover strategy"
    LONG_DESCRIPTION="Take position on ETH based on simple moving average crossover. Execute trades on PancakeSwap on BNB Chain."
    ICON_URL="https://1397868517-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-MHREX7DHcljbY5IkjgJ%2F-MJfSAPkP4Jn7cikZadQ%2F-MJgOYsqqIJgTs9DVtHu%2Ficon-square-512.png?alt=media&token=5aa29acf-4d4f-4c78-8e8b-39665a0bf8db"

    # Blockchain transaction broadcasting parameters
    EXECUTION_TYPE="uniswap_v2_hot_wallet"

    # The actual webhook HTTP port mapping for the host
    # is done in docker-compose.yml.
    # The default port is 3456.
    HTTP_ENABLED=true

Example secrets configuration file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example settings. Refer :ref:`command line options` for full guide.

Example:

.. code-block:: ini

    JSON_RPC_BINANCE=...
    TRADING_STRATEGY_API_KEY=...
    PRIVATE_KEY=...

Setting up system
-----------------

Setting up the frontend webhook URL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The frontend and any other automation can communicate with `trade-executor` instance using webhook URLs.

- Docker exposes the webhook URL as internal IP:port pair

- You need a DNS name or unique URL for your trade executor instance

- You usually need to run a reverse proxy web server that routes
  any incoming HTTP requests to your server IP address to different
  web services hosted on your server. We use Caddy here, but could
  be anything.

- The reverse proxy server is also responsible for
  managing TLS certificates.

In this point, you only need to know that in `docker-compose.yml`
we allocate a localhost port from the host for each trade executor.
Then the host is responsible to reverse proxy any webhook
traffic to this port.

We will cover this after `docker-compose` is running.

Setting up docker-compose
~~~~~~~~~~~~~~~~~~~~~~~~~

See :ref:`docker compose example`.

Preflight checks
----------------

Before launching the Docker container through `docker-compose`,
we can do prelaunch checks to see our API keys and other secrets look good.

Trading universe check
~~~~~~~~~~~~~~~~~~~~~~

`trade-executor` provides two subcommands, `check-universe`
you can use before launching the live trading strategy instance.

- This confirms your Trading Strategy oracle API keys are correctly set up
  and your strategy can receive data.

- The market data feed is up-to-date

You can run this with configured `docker-compose` as:

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma check-universe

This will print out:

.. code-block:: text

     Latest OHCLV candle is at: 2022-11-24 16:00:00, 1:49:57.985345 ago

Wallet and routing check
~~~~~~~~~~~~~~~~~~~~~~~~

`trade-executor` provides two subcommands, `check-wallet`
you can use before launching the live trading strategy instance.

This checks

- You are connected to the right blockchain

- Your hot wallet private key has been correctly set up

- You have native token for gas fees

- You have trading capital

- The last block number of the blockchain

- We know how to route trades for our strategy, using the current wallet

With `docker-compose`:

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma check-wallet

Output:

.. code-block:: text

     RPC details
       Chain id is 56
       Latest block is 23,387,643
     Balance details
       Hot wallet is ...
       We have 0.370500 gas money left
     Reserve asset: USDC
       Balance of USD Coin: 500 USDC
     Estimated gas fees for chain 56: <Gas pricing method:legacy base:None priority:None max:None legacy:None>
     Execution details
       Execution model is tradeexecutor.ethereum.uniswap_v2_execution.UniswapV2ExecutionModel
       Routing model is tradeexecutor.ethereum.uniswap_v2_routing.UniswapV2SimpleRoutingModel
       Token pricing model is tradeexecutor.ethereum.uniswap_v2_live_pricing.UniswapV2LivePricing
       Position valuation model is tradeexecutor.ethereum.uniswap_v2_valuation.UniswapV2PoolRevaluator
    Routing details
        Factory 0xca143ce32fe78f1f7019d7d551a6402fc5350c73 uses router 0x10ED43C718714eb63d5aA57B78B54704E256024E
        Routed reserve asset is <0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d at 0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d>

You can also run directly without `docker-compose`. In this case, you need to give explicit cache path
and env file, because to do the wallet balance check we need to download and construct the trading universe.

.. code-block:: shell

    docker run \
        --env-file=$HOME/pancake-eth-usd-sma-final.env \
        --volume=cache:/usr/src/trade-executor/cache \
        docker build -t ghcr.io/tradingstrategy-ai/trade-executor:latest \
        check-wallet

Getting initial deposit
~~~~~~~~~~~~~~~~~~~~~~~

Before performing test trade, you need to have both gas token and reserve currency (USDC/USDT) in the hot wallet.

- Swap with a command line script
- Deposit USDC from another wallet

Performing a test trade
~~~~~~~~~~~~~~~~~~~~~~~

After you are sure that trading data and hot wallet are fine,
you can perform a test trade from the command line.

- This will ensure trade routing and execution gas fee methods
  are working by executing a live trade against live blockchain.

- The test trade will buy and sell the "default" asset of the strategy
  worth 1 USD. For a single pair strategies the asset is the default
  base token.

- This will open a position using the strategy's exchange and trade
  pair routing.

- The position and the trade will have notes field filled in that
  this was a test trade.

- Broadcasting a transaction through your JSON-RPC connection
  works.

First test with Anvil simulated transactions:

.. code-block:: shell

    docker compose run ethereum-memecoin-vol-basket \
        perform-test-trade \
        --pair "(ethereum, uniswap-v2, BITCOIN, WETH, 0.003)" \
        --simulate

And then for real:

.. code-block:: shell

    docker compose run pancake-eth-usd-sma perform-test-trade

This will give a long output with details to the trade execution for diagnosing any issue.
The important parts are highlighted:

.. code-block:: text

    ...
    Making a test trade on pair: <Pair ETH-USDC at 0xea26b78255df2bbc31c1ebf60010d78670185bd0 on exchange 0xca143ce32fe78f1f7019d7d551a6402fc5350c73>, for 1.000000 USDC price is 1217.334094 ETH/USDC
    ...
    Position <Open position #2 <Pair ETH-USDC at 0xea26b78255df2bbc31c1ebf60010d78670185bd0 on exchange 0xca143ce32fe78f1f7019d7d551a6402fc5350c73> $1.000501504460405> open. Now closing the position.
    ...
    All ok

Test loggers
------------

Check that Discord and Telegram bots worl:

. code-block:: shell

    docker compose run ethereum-memecoin-vol-basket send-log-message

Perform one off simulated trade cycle
-------------------------------------

This will ensure `decide_trades()` function is not broken.

You can now manually execute the first strategy cycle. This will be executed off-timestamp,
but will still demostrate the `decide_trades()` Python function is not broken.

First simulated:

.. code-block:: shell

    docker compose run \
        ethereum-memecoin-vol-basket \
        start \
        --run-single-cycle \
        --simulate

Then for real:

.. code-block:: shell

    docker compose run \
        enzyme-polygon-matic-eth-usdc \
        start \
        --run-single-cycle


Launching the trade-executor instance
-------------------------------------

Set up the `trade-executor` instance to run in server production mode:

.. code-block:: shell

    docker-compose up -d pancake-eth-usd-sma

This will start trading.

You can check the logs with:

.. code-block:: shell

    docker-compose logs --tail=200 pancake-eth-usd-sma

Checking the webhook health
---------------------------

Seee :ref:`manually checking webhook`.

Setting up related infrastructure
---------------------------------

See the next steps in :ref:`strategy monitoring`.

Further info
------------

.. _trade-executor-command-line:

