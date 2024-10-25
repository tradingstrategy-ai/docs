.. _repairing positions

Repairing frozen trading positions
==================================

Automatically managed positions may end up to a "frozen" state in the case the trade execution logic encounters and error and
a safety trips.

- Trading position is marked as frozen if a trade executor attempts to trade a position,
  but the trade fails for a reason or another

- Positions are shown on Frozen positions list

- Frozen positions are not included in the total equity of a strategy

- Frozen positions need manual intervention

The reasons why a trade executor may mark a position as a frozen

- The gas fee needed to complete the trade was higher than the allowed limit

- A blockchain node was down

- The blockchain itself was halted (see `BNB Chain incident <https://cointelegraph.com/news/bnb-chain-confirms-bsc-halt-due-to-potential-exploit>`__)

- Internal error that needs to be patched

- Out of gas money

Checking positions
------------------

You can check open/frozen/closed positions from the command line:

.. code-block:: shell

    docker compose run ethereum-memecoin-swing show-positions

Fixing frozen positions
-----------------------

Currently the frozen positions can be fixed manually on the server where the trade executor is running.

First clear any obstacles that might be blocking the frozen position trades, like
topping up the gas wallet.

Go to the server and `docker-compose.yml` folder where the trade executor is running.

Choose the trade executor Docker image version (you can peak the current version using `docker ps` command):

.. code-block:: shell

    # Sets TRADE_EXECUTOR_VERSION environment variable needed for docker-compose.yml file
    source scripts/set-latest-tag.sh

Check running strategies

.. code-block:: shell

    docker compose ps

For any strategy to be repaired, its trade executor must be stopped first.

.. code-block:: shell

    $EXECUTOR_ID=ethereum-memecoin-swing
    docker compose stop $EXECUTOR_ID

Now you can start the repair:

.. code-block:: shell

    docker-compose run $EXECUTOR_ID repair

This will attempt to re-execute all trades that failed prior.

.. note ::

    The process is interactive and will prompt you the trades
    before attempting to fix them, so it is safe to run.

After the repair command is run you get a report:

.. code-block:: text

    Saved state to state/quickswap-matic-usd-ema.json, total 1623881 chars

Restarting the executor
-----------------------

For any strategy to be repaired, its trade executor must be stopped first.

.. code-block:: shell

    docker-compose up -d $EXECUTOR_ID



