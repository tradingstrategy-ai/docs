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
  but can be constructed from the backtest with copy-paste.

- Strategy name, short description, long description.

- Strategy logo image URL. The image must be 1:1 aspect ratio.

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

.. code-block::

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

- It is automatically downloaded by Docker command

- Always pin down the Docker image version to a known good version for yourself

-  There shouldn't be need to build your own Docker image

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

More examples can be found in proxy-server repository.

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

Setting up the web frontend
---------------------------

`See frontend Github repository <https://github.com/tradingstrategy-ai/frontend/>`_.