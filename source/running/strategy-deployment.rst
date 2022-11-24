.. _strategy-deployment:

Live strategy deployment
========================

In this chapter, we explain how to take a backtested strategy and make it a live running strategy instance.

Preface
-------

This example shows a trading strategy deployment in its simplest form

- Single investor

- Uses a private key hot wallet where tokens and strategy reserves are stored

- Runs on a single Docker instance

- Trades on a single chain, single exchange

Prerequisites
-------------

To get started you need to have a

- `You need to have a Github access token to download Docker images from GHCR <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>`_

- A strategy with successful backtests

- Basics of Python programming

- Basics of Linux and Docker system administration

- Ability to set DNS entries (needed for the web interface of the strategy)

- A stash of blockchain native cryptocurrency for gas fees (ETH, BNB, MATIC)

- Initial cash deposit in stablecoin (USDC, BUSD)

Strategy assets
---------------

For each live executed strategy you need to have

- A strategy module as Python source code file. This is slightly different from backtesting notebook,
  but can be constructed from the backtest with copy-paste. *The filename of this module
  is the same as the strategy id.** In this documentation, we use `pancake-eth-usd-sma` as an example.

- Strategy name, short description, long description.

- Strategy logo image URL. The image must be 1:1 aspect ratio.
  If you do not have images, you can use `placeholder.com <https://placeholder.com>`__.

- A URL and a domain name where trade executor frontend, which allows you to access the strategy
  live statistics and webhook controls.

- The strategy execution configuration that include the hot wallet private key,
  API keys for oracle market data feeds, blockchain nodes, Discord webhook notifications
  and such.

- A server where you run the `trade-executor` Docker container and any related infrastructure,
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

.. _command-line-backtest:

Testing the strategy module
---------------------------

You can run backtests using `trade-executor` command locally on your development module to check the strategy module
looks intact.

We can do backtests in two phases

- Speeded up backtest with more granular time frames for the smoke test

- Actual backtest to see we still get the same results as in the notebook

An example how to run quick backtests. We override some timeframes. This gives incorrect results but quickly shows if
the code is broken:

.. code-block:: shell

    # Set your API key
    export TRADING_STRATEGY_API_KEY=...

    # Run the backtest of this module using local trade-executor command
    # Tick size and stop loss check frequencies are less from what the strategy
    # is expected (1h -> 1d). We call decide_trades less often,
    # allowing us to complete the test faster, albeit with incorrect
    # results.
    trade-executor start \
        --strategy-file=strategies/pancake-eth-usdc-sma.py \
        --execution-type=backtest \
        --trading-strategy-api-key=$TRADING_STRATEGY_API_KEY \
        --cycle-duration=1d \
        --stop-loss-check-frequency=1d \
        --backtest-start=2021-06-01 \
        --backtest-end=2022-09-01

The backtest summary results are printed to the console. These are garbage,
as we adjusted the trade cycle and stop loss parameters above:

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

- The live execution needs a hot wallet with real money and native gas token

- The live execution depends on JSON-RPC node to send transactions

- You need to give `tick_offset_minutes` command line option to tell how much time we give for the price feed
  to generate candles after the trade cycle is triggered

- There is `max_data_delay` parameter that will cause the trade executor to crash if the price feed data is delayed
  for too long. This is a safety feature to prevent any trades to happen in the case market data is delayed
  or ambitious.

- The live execution needs a gas strategy for paying the transaction gas fees

- The live execution environment has HTTP webhook server

- The live execution environment may have Discord notifications

- The live execution environment may send performance statistics through statsd interface

- The live execution environment may send logs to LogStash server

Downloading trade-executor Docker image
---------------------------------------

`Trade executor Docker images are avaible in Github Container Registry <https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor>`_.

- It is automatically downloaded by `docker-compose` command

- Always pin down the Docker image version to a known good version for yourself

-  There shouldn't be need to build your own Docker image

If you need to locally pull the image:

.. code-block:: shell

     docker pull trading-strategy/trade-executor:v80

If needed you can build the image locally from `trade-executor repo <https://github.com/tradingstrategy-ai/trade-executor/>`__:

.. code-block:: shell

     docker build -t trading-strategy/trade-executor:latest .

Setting up the frontend webhook URL
-----------------------------------

The frontend and any other automation can communicate with `trade-executor` instance using webhook URLs.

- Docker exposes the webhook URL as internal IP:port pair

- You need a DNS name or unique URL for your trade executor instance

- You usually need to run a reverse proxy web server that routes
  any incoming HTTP requests to your server IP address to different
  web services hosted on your server. We use Caddy here, but could
  be anything.

- Any details needed for the HTTP routing

Creating a Caddy routing directive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is an example how to configure `Caddyfile` subdomain for the trade executor webhook.

More examples can be found in `proxy-server repository <https://github.com/tradingstrategy-ai/proxy-server/blob/master/Caddyfile>`__.

Creating configuration file
---------------------------

In this example we lay out a simple best practice to manage your `trade-executor` configuration

- We use .env style configuration files

- Public configuration variables can be committed to source code control like Github

- Secret configuration variables are only available locally or on-server using a
  .env style configuration files

- The final env configuration file, as passed to Docker process,
  is created by splicing public and private configuration file together
  and validating it

For this example we assume we have

- Public configuration file `env/pancake-eth-usd-sma.env`

- Secret configuration file `~/pancake-eth-usd-sma-secret.env`

- Final generated configuration file (read by the Docker daemon): `~/pancake-eth-usd-sma-final.env`

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
    SHORT_DESCRIPTION="One line description of the strategy."
    LONG_DESCRIPTION="Multiparagraph description of the strategy. May contain Markdown formattting."
    ICON_URL="https://via.placeholder.com/512"

    # Blockchain transaction broadcasting parameters
    GAS_PRICE_METHOD="london"
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

To generate the final configuration file `trade-executor` comes with `prepare-docker-env helper command <https://github.com/tradingstrategy-ai/trade-executor/>`__:

.. code-block:: shell

    # Read secrets file to local shell context
    source ~/pancake-eth-usd-sma-secret.en

    # If you want to manually override any environment variables
    # from config files you can do it using export command in this point

    # Use UNIX command line tooling to pass the secrets and
    # and the public configuration file for the validation
    # and splicing
    docker run \
        --interactive \
         --entrypoint=prepare-docker-env \
        $(env | cut -f1 -d= | sed 's/^/-e /') \
         trading-strategy/trade-executor \
        < env/pancake-eth-usd-sma.env \
        > ~/pancake-eth-usd-sma-final.env


(TODO add final link to the command)

Setting up docker-compose
-------------------------

After Docker runs from the command line, you can create a `docker-compose.yml` entry for your strategy.

You need to pass in local file system folders, or create a Docker volumes for

- `strategy/`, or any path where your strategy module is

- `state/` where your strategy persistent state is stored

- `cache/` where downloaded datasets are stored

Example of a `docker-compose.yml can be found in trade-executor repository <https://github.com/tradingstrategy-ai/trade-executor/blob/master/docker-compose.yml>`__.
We set the current version of the image we use with `TRADE_EXECUTOR_VERSION` environment variables.

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

We pin down our `trade-executor` version.
`See the repo for stable versions <https://github.com/tradingstrategy-ai/trade-executor/>`__.
**Do not use latest tag as it is unstable, unless you build the Docker image yourself**.

.. code-block:: shell

    export TRADE_EXECUTOR_VERSION=latest

Now we can try this out. We invoke `hello` subcommand
to see that the application launches correctly.

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma


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



Wallet balance check
~~~~~~~~~~~~~~~~~~~~

`trade-executor` provides two subcommands, `check-wallet`
you can use before launching the live trading strategy instance.

This checks

- Your hot wallet private key has been correctly set up

- You have native token for gas fees

- You have trading capital

- The last block number of the blockchain

Or directly without `docker-compose`. Note that you need to give explicit cache path
because to do the wallet balance check we need to download and construct
the trading universe.

.. code-block:: shell

    docker run \
        --env-file=$HOME/pancake-eth-usd-sma-final.env \
        --volume=cache:/usr/src/trade-executor/cache \
        trading-strategy/trade-executor \
        check-wallet

Output:

.. code-block:: text

    INFO     Latest block is 23,336,055
    INFO     Hot wallet is ...
    INFO     We have 0.370500 gas money left
    INFO     Balance of USD Coin: 500 USDC

Launching the instance
----------------------

Set up the trade executor instance to run in server production mode:

.. code-block:: shell

    docker-compose up -d

Checking the webhook
---------------------

Setting up the web frontend
---------------------------

`See frontend Github repository <https://github.com/tradingstrategy-ai/frontend/>`_.


Further info
------------

Running without Docker
~~~~~~~~~~~~~~~~~~~~~~

`trade-executor` can be run without Docker.

- You need set up a Python environment using Poetry

Then you can run `trade-executor` as:

.. code-block:: shell

    trade-executor hello

.. code-block:: text

    Hello blockchain

Poetry / Typer environment does not support reading `.env` files directly.
You first need to `load any .env file to your shell using shdotenv <https://stackoverflow.com/a/67357762/315168>`__
before calling `trade-executor`.

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