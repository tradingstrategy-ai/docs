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

Fixing frozen positions
-----------------------

Currently the frozen positions can be fixed manually on the server where the trade executor is running.

First clear any obstacles that might be blocking the frozen position trades, like
topping up the gas wallet.

Go to the server and `docker-compose.yml` folder where the trade executor is running.

Choose the trade executor Docker image version (you can peak the current version using `docker ps` command):

.. code-block:: shell

    export TRADE_EXECUTOR_VERSION=v106

Check running strategies

.. code-block:: shell

    docker-compose ps

For any strategy to be repaired, its trade executor must be stopped first.

.. code-block:: shell

    docker-compose stop quickswap-matic-usd-ema

Now you can start the repair:

.. code-block:: shell

    docker-compose run quickswap-matic-usd-ema repair

This will attempt to re-execute all trades that failed prioer.

Restarting the executor
-----------------------

For any strategy to be repaired, its trade executor must be stopped first.

.. code-block:: shell

    docker-compose up -d quickswap-matic-usd-ema



