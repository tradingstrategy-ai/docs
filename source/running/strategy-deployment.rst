.. _strategy-deployment:

.. _strategy deployment:

Live strategy deployment
========================

In this chapter, we explain how to take a backtested strategy and make it to a live running trading strategy instance.

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

- Ability to set DNS entries and domain names for your web services

- A stash of blockchain native cryptocurrency for gas fees (ETH, BNB, MATIC)

- Initial cash deposit in stablecoin (USDC, BUSD)

- `A Github access token to download Docker images from GHCR <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>`_

Strategy assets
---------------

For each live executed strategy you need to have

- **Python module**: A strategy module as Python source code file. This is slightly different from backtesting notebook,
  but can be constructed from the backtest with copy-paste. *The filename of this module
  is the same as the strategy id.** In this documentation, we use `pancake-eth-usd-sma` as an example.

- **Metadata**: Strategy name, short description, long description.

- **Logo**: Strategy logo image URL. The image must be 1:1 aspect ratio.
  If you do not have images, you can use `placeholder.com <https://placeholder.com>`__.

- **Domain**: A URL and a domain name for `trade-executor` webhook server.

- **Configuration files**: The strategy execution configuration that include the hot wallet private key,
  API keys for oracle market data feeds, blockchain nodes, Discord webhook notifications
  and such. Setting up the configuration files are described below.

- **Server**: A server where you run the `trade-executor` Docker container and any related infrastructure,
  like a reverse proxy web server.

Turning a backtest to a strategy module
---------------------------------------

Backtests are Jupyter notebooks, but live strategies need to be deployed as Python applications.

Each strategy runs as a single Python application in a Docker container.

To create a Python strategy module from a backtest

- `Looks up examples in trade-executor module <https://github.com/tradingstrategy-ai/trade-executor/tree/master/strategies>`__

- Extract the following to a new Python .py module

    - Strategy header with parameter definitions

    - `decide_trade()` function

    - `create_trading_universe()` function (must be with this name, even as backtests allow other names)

    - Make sure the strategy module has `TRADING_STRATEGY_ENGINE_VERSION` as this defines how the module is parsed and loaded

You can store the Python module anywhere, as it is referred by its path in the future.

Managing Docker images
----------------------

`trade-executor` is distributed as a Docker image.
`Trade executor Docker images are avaible in Github Container Registry <https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor>`_.

.. image:: docker-image.drawio.svg

- The image name is `ghcr.io/tradingstrategy-ai/trade-executor`

- The Docker image packages Python interpreter and `trade-executor` command

- It is automatically downloaded when you run `docker` or `docker-compose` command

- Always pin down the Docker image version to a known good version for yourself

- There shouldn't be need to build your own Docker image, though we provide instructions
  for this for developers later on

- The image is distributed using Github's Container Registry (ghcr.io) -
  you need to `docker login` to this registry to download the image

If you need to locally pull the image:

.. code-block:: shell

    export TRADE_EXECUTOR_VERSION=v11
    docker pull ghcr.io/tradingstrategy-ai/trade-executor:$TRADE_EXECUTOR_VERSION

Check that the image is working for you:

.. code-block:: shell

    docker run ghcr.io/tradingstrategy-ai/trade-executor:$TRADE_EXECUTOR_VERSION hello

This should print:

.. code-block:: text

    Hello blockchain

Local Docker image builds
~~~~~~~~~~~~~~~~~~~~~~~~~

If needed you can build the image locally from `trade-executor repo <https://github.com/tradingstrategy-ai/trade-executor/>`__:

.. code-block:: shell

     docker build -t ghcr.io/tradingstrategy-ai/trade-executor:latest .

Python application execution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can also run `trade-executor` :ref:`directly from Python source code <trade-executor-command-line>`,
without Docker, if needed.

.. _command-line-backtest:

Testing the strategy module
---------------------------

You can run backtests using `trade-executor` command locally on your development module to check the strategy module
looks intact.

We can do backtests in two phases

- Quick inconsistent backtest with less time frames and OHLCV samples for the smoke test

- Actual backtest to see we still get the same results as in the notebook

An example how to run quick backtests. We override some timeframes. This gives incorrect results but quickly shows if
the code is broken:

.. code-block:: shell

    # Set your API key for your shell environment
    export TRADING_STRATEGY_API_KEY=...

    # Run the backtest of this module using local trade-executor command
    # Tick size and stop loss check frequencies are less from what the strategy
    # is expected (1h -> 1d). We call decide_trades less often,
    # allowing us to complete the test faster, albeit with incorrect
    # results.
    docker run \
        --interactive \
        --tty \
        --volume=strategies:/usr/src/trade-executor/strategies \
        --volume=cache:/usr/src/trade-executor/cache \
        ghcr.io/tradingstrategy-ai/trade-executor:$TRADE_EXECUTOR_VERSION \
        start \
        --strategy-file=strategies/pancake-eth-usd-sma.py \
        --execution-type=backtest \
        --trading-strategy-api-key=$TRADING_STRATEGY_API_KEY \
        --backtest-candle-time-frame-override=1d \
        --backtest-stop-loss-time-frame-override=1d \
        --backtest-start=2021-06-01 \
        --backtest-end=2022-09-01

The backtest summary results are printed to the console.

.. note ::

    The summary numbers obtained this way are rubbish -
    the backtest smoke test with sped up sampling is only useful to find out
    if your Python code works. It does not tell about the strategy profitability.

.. code-block:: text

    Trading period length                     440 days
    Return %                                   -32.68%
    Annualised return %                        -27.11%
    Cash at start                           $10,000.00
    Value at end                             $6,732.17
    Trade win percent                           22.86%
    Total trades done                               35
    Won trades                                       8
    Lost trades                                     27
    Stop losses triggered                           27
    Stop loss % of all                          77.14%
    Stop loss % of lost                        100.00%
    Zero profit trades                               0
    Positions open at the end                        0
    Realised profit and loss                $-3,267.83
    Portfolio unrealised value                   $0.00
    Extra returns on lending pool interest       $0.00
    Cash left at the end                     $6,732.17
    Average winning trade profit %               6.96%
    Average losing trade loss %                 -4.00%
    Biggest winning trade %                     13.90%
    Biggest losing trade %                     -12.28%
    Average duration of winning trades          2 days
    Average duration of losing trades           1 days

Here is also an example to run the backtest using Python and `trade-executor` command directly:

.. code-block:: shell

    trade-executor start \
        --strategy-file=strategies/pancake-eth-usd-sma.py \
        --execution-type=backtest \
        --trading-strategy-api-key=$TRADING_STRATEGY_API_KEY \
        --backtest-candle-time-frame-override=1d \
        --backtest-stop-loss-time-frame-override=1d \
        --backtest-start=2021-06-01 \
        --backtest-end=2022-09-01

Creating a hot wallet
---------------------

To create a hot wallet for a strategy do the following:

.. code-block:: shell

    python -c "from web3 import Web3; w3 = Web3(); acc = w3.eth.account.create(); print(f'private key={w3.toHex(acc.privateKey)}, account={acc.address}')"

This will give you private key and account pair:

.. code-block:: text

    private key=0xd67b9015bfa8d6da2e30a7bb232e2d8b2899e610b08a11afb6de48c693226845, account=0x5DC2837bac174efD17aC294A2573F52DED5E5e1D

Then

- Store the private key safely in your backup storage (paper, password manager, etc.)

- Private key will be needed in the trade execution configuration file

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

Preparing the final configuration file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Docker does not support multiple .env files <https://github.com/docker/compose/issues/7326>`_.
We need to splice one composed `.env` combining both public and secret variables
for our trade executor instance.

.. code-block:: shell

    cat ~/pancake-eth-usd-sma-secrets.env env/pancake-eth-usd-sma.env > ~/pancake-eth-usd-sma-final.env

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

After Docker runs from the command line, you can create a `docker-compose.yml` entry for your strategy.

You need to pass in local file system folders, or create a Docker volumes for

- `strategy/`, or any path where your strategy module is

- `state/` where your strategy persistent state is stored

- `cache/` where downloaded datasets are stored

- For webhook port we use `19003` in the example below.
  This needs to be any open ane unoccupied localhost port on your server.

Example of a `docker-compose.yml can be found in trade-executor repository <https://github.com/tradingstrategy-ai/trade-executor/blob/master/docker-compose.yml>`__.


.. code-block:: yaml

    version: "3.9"
    services:
      pancake-eth-usd-sma:
        container_name: pancake-eth-usd-sma
        image: ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}
        ports:
          # We map the default webhook server port 3456 to our localhost IP address
          # where it can be then exposed to HTTPS by Caddy or any
          # other web server that can manage TLS certificates
          - "127.0.0.1:19003:3456"
        volumes:
          # Map the path from where we load the strategy Python modules
          - ./strategy:/usr/src/trade-executor/strategy
          # Save the strategy execution state in the local filesystem
          - ./state:/usr/src/trade-executor/state
          # Cache the dataset downloads in the local filesystem
          - ./cache:/usr/src/trade-executor/cache
        env_file:
          # Generated by configurations/quickswap-momentum.sh
          - ~/pancake-eth-usd-sma-final.env

        # This is the default trade-executor command to
        # launch as a daemon mode.
        # There are several subcommands.
        command: start

We pin down our `trade-executor` version using `TRADE_EXECUTOR_VERSION` environment variable.
`See the repo for stable versions <https://github.com/tradingstrategy-ai/trade-executor/>`__.
**Do not use latest tag as it is unstable, unless you build the Docker image yourself**.

.. code-block:: shell

    export TRADE_EXECUTOR_VERSION=v13

Now we can try this out. We invoke `hello` subcommand
to see that the application launches correctly.

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma hello

.. code-block:: text

    Hello blockchain

.. note ::

    If you have several services in the same `docker-compose.yml` and `docker-compose` complains about missing `.env`
    files you can simply create empty files. E.g. `touch ~/pancake-eth-usd-sma-final.env`.

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

Example:

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma perform-test-trade

This will give a long output with details to the trade execution for diagnosing any issue.
The important parts are highlighted:

.. code-block:: text

    ...
    Making a test trade on pair: <Pair ETH-USDC at 0xea26b78255df2bbc31c1ebf60010d78670185bd0 on exchange 0xca143ce32fe78f1f7019d7d551a6402fc5350c73>, for 1.000000 USDC price is 1217.334094 ETH/USDC
    ...
    Position <Open position #2 <Pair ETH-USDC at 0xea26b78255df2bbc31c1ebf60010d78670185bd0 on exchange 0xca143ce32fe78f1f7019d7d551a6402fc5350c73> $1.000501504460405> open. Now closing the position.
    ...
    All ok

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

After your `docker-compose` instance is running you can check that its webhook port is replying using `curl`.

.. code-block:: shell

    curl http://localhost:19003/ping

This should give you the JSON result:

.. code-block:: text

    {"ping": "pong"}

`View the trade-executor webhook API <https://github.com/tradingstrategy-ai/trade-executor/blob/master/tradeexecutor/webhook/api.py>`__.

Setting up related infrastructure
---------------------------------

Setting up HTTPS reverse proxy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now when the webhook is functionality, we need to map HTTPS reverse proxy
that exposes `trade-executor` webhook to the world.

* We need to have a DNS name which points to our trade executor

* We need to map this DNS name to our server and our
  server needs to have a web server at ports 80 and 443
  to proxy the traffic.

Here is an example how to configure `Caddyfile` subdomain for the trade executor webhook.
We do not cover how to run Caddy in these instructions,
more examples can be found in `proxy-server repository <https://github.com/tradingstrategy-ai/proxy-server/blob/master/Caddyfile>`__.

.. code-block:: text

    #
    # pancake-eth-usd-sma trade executor
    #
    # See https://tradingstrategy.ai/docs for details.
    # Internal 19003 port is set in docker-compose.yml
    #
    http://pancake-eth-usd-sma.example.com {
        reverse_proxy 127.0.0.1:19003
    }

.. note ::

    http:// or https:// in Caddy depends on how your server traffic is configured.
    For details see Caddy documentation.

Point your DNS service to have `A` and `AAAA` subdomains for `pancake-eth-usd-sma`.

After restaring Caddy with the new configutaion, you can do the same ping test as
we did using the localhost interface earlier. This time, we are using the
world exposed URL.

Perform the command your your local computer:

.. code-block:: shell

    curl https://pancake-eth-usd-sma.example.com/ping

This should give you the JSON result:

.. code-block:: text

    {"ping": "pong"}

Setting up Discord notifications
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A strategy can report its status to Discord.

- `trade-executor` takes this setting in `DISCORD_WEBHOOK_URL` configuration variable

- Create a Discord channel

- Choose Channel settings > *Integrations* > *Create Webhook*

- Name your webhook the same as your strategy

- Store the Discord webhook URL as `DISCORD_WEBHOOK_URL` in the secrets configuration file

Setting up Logstash logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Logstash provides centralised logging server where multiple applications can send their logs.

- Better security and auditability as logs are centrally managed and secured

- Good search functionality over logs, allowing to diagnose issues faster

- Logstash is using unauthenticated UDP for log streams: you need to authenticate
  any logger using firewall IP address based whitelisting

A `trade-executor` can send its Python logs to LogStash using `LogStash adapter <https://github.com/tradingstrategy-ai/python-logstash>`__.

For further configuration about LogStash logging, see `python-logstash` documentation.

Setting up the web frontend
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Trading Strategy SvelteKit based web frontend provides user interface for the strategy execution.

- The frontend runs as its independent web server using SvelteKit's built-in Vite
  web server, plus any number of reverse proxies like Cloudflare

- The frontend pulls the data from the trade executor over the webhook interface

Available strategies displayed on the website are configured in `TS_PUBLIC_STRATEGIES`
environment variable passed to the frontend when it is launched. This is usually done
when the Docker instance of the frontend is restarted.

- To test the frontend updates, you can run the frontend locally, you just need Node and NPM.
  The instructions are in `README <https://github.com/tradingstrategy-ai/frontend/>`_.

- Edit the `.env file <https://github.com/tradingstrategy-ai/frontend/blob/master/.env>`__
  on tbe production server to include the new strategy information

- `TS_PUBLIC_STRATEGIES` is a JSON encoded list of JavaScript objects

- For each strategy you need `id`, `name`, and webhook `url`

- Restart Docker instance

- Visit on `/strategies` landing page to see your new strategy is now showing up

`For more information, see frontend Github repository <https://github.com/tradingstrategy-ai/frontend/>`_.

Monitoring the Docker container
-------------------------------

The Docker container is set up in such a way that it won't crash
in the case `trade-execution` fails with a Python exception

- The instance and its webhook service stay up despite `trade-executor` stopping

- You can read the status of the `trade-executor` is running back from `/status` endpoint

- `See /status documentation here <https://github.com/tradingstrategy-ai/spec/blob/main/trade-executor-api.yaml>`_.

Thus, the normal `docker-compose` restart policies are not working. Any trade execution restart
should be done only manually.

You can check the status if `trade-executor` is running by:

.. code-block:: shell

    curl http://localhost:19003/status | jq

.. code-block:: text

    {
      "last_refreshed_at": 1669801614.073565,
      "executor_running": true,
      "completed_cycle": null,
      "exception": null
    }


For any uptime monitoring you can check the status of `executor_running` field
to confirm the trade executor is properly running.

Troubleshooting
---------------

.. _console:

Interactive Python console
~~~~~~~~~~~~~~~~~~~~~~~~~~

There is a `console` command that allows you to launch `trade-executor` with a Python prompt open.

- Manually inspect state and connections in an interactive Python prompt

- Repair damaged data

- Close any live `trade-executor` before opening the interactive shell,
  as both can write to the state at the same time

To start the console you can do:

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma -- console

.. code-block:: text

    Following classes and objects are available:
    web3                          : <web3.main.Web3 object at 0x7fe04912d120>
    client                        : <tradingstrategy.client.Client object at 0x7fe049e2c370>
    state                         : <State for None>
    universe                      : TradingStrategyUniverse(reserve_assets=[AssetIdentifier(chain_id=137, address='0x2791bca1f2de4661ed88a30c99a7a9449aa84174', token_symbol='USDC', decimals=6, internal_id=None, info_url=None)], universe=Universe(time_bucket=<TimeBucket.h1: '1h'>, chains={<ChainId.polygon: 137>}, exchanges={<Exchange Quickswap at 0x5757371414417b8c6caad45baef941abc7d3ab32 on Polygon>}, pairs=<tradingstrategy.pair.PandasPairUniverse object at 0x7fe048f64610>, candles=<tradingstrategy.candle.GroupedCandleUniverse object at 0x7fdf897e0700>, liquidity=None), backtest_stop_loss_time_bucket=<TimeBucket.m15: '15m'>, backtest_stop_loss_candles=<tradingstrategy.candle.GroupedCandleUniverse object at 0x7fdf897e2b60>)
    store                         : <tradeexecutor.state.store.JSONFileStore object at 0x7fe04912fc10>
    routing_state                 : <UniswapV2RoutingState Tx builder: <tradeexecutor.ethereum.tx.TransactionBuilder object at 0x7fe048730a60> web3: <web3.main.Web3 object at 0x7fe04912d120>>
    pricing_model                 : <tradeexecutor.ethereum.uniswap_v2_live_pricing.UniswapV2LivePricing object at 0x7fe0487304f0>
    valuation_method              : <tradeexecutor.ethereum.uniswap_v2_valuation.UniswapV2PoolRevaluator object at 0x7fe048730490>
    datetime                      : <module 'datetime' from '/usr/local/lib/python3.10/datetime.py'>
    pd                            : <module 'pandas' from '/usr/local/lib/python3.10/site-packages/pandas/__init__.py'>
    cache_path                    : cache
    Decimal                       : <class 'decimal.Decimal'>

    Python 3.10.8 (main, Dec  6 2022, 14:13:21) [GCC 10.2.1 20210110]
    Type 'copyright', 'credits' or 'license' for more information
    IPython 8.7.0 -- An enhanced Interactive Python. Type '?' for help.

    In [1]:

Then you can use `%cpaste` command to paste Python snippets into the console.



Further info
------------

.. _trade-executor-command-line:

Running trade-executor without Docker
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`trade-executor` can be run without Docker.

- You need set up a Python environment using Poetry

Then you can run `trade-executor` as Python application:


.. code-block:: shell

    trade-executor hello

.. code-block:: text

    Hello blockchain

Using shdotenv helper
~~~~~~~~~~~~~~~~~~~~~

Poetry / Typer environment does not support reading `.env` files directly.
You first need to `load any .env file to your shell using shdotenv <https://stackoverflow.com/a/67357762/315168>`__
before calling `trade-executor`.

`shdotenv` is especially needed to translate Docker style `.env` files to a format
UNIX shell can understand.

.. code-block:: shell

    wget https://github.com/ko1nksm/shdotenv/releases/latest/download/shdotenv -O ~/.local/bin/shdotenv
    chmod +x ~/.local/bin/shdotenv

Then you can run with `.env` file:

.. code-block:: shell

    eval "$(shdotenv --dialect docker --env ~/pancake-eth-usd-sma-final.env)"
    echo "Strategy file is: $STRATEGY_FILE"

And now you can run `trade-executor` commands that take complex configuration
that would be hard to type otherwise:

.. code-block:: shell

    trade-executor check-wallet