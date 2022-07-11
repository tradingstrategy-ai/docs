.. _oracle:

Oracles
=======

In the core of :ref:`Trading Strategy protocol <protocol>` is the concept of an oracle.

- Oracles read blockchain and converts raw blockchain events to :doc:`market data feeds <./market-data-feeds>`
- Oracles :ref:`execute <running-strategies>` trading strategies based on these market data feeds
- Oracles will eventually form the :ref:`decentralised network <protocol>`
- Oracles are similar to other oracles in other decentralised networks, like ones provided by Chainlink.
  In the case of Trading Strategy, oracles deal with trading signals and trading instructions,
  instead of price data.

Operating oracles
-----------------

You can

- Use Trading Strategy public oracle network for public trading strategies,
  in this case you do not need to run your own oracle
- Run your own private oracle if you want to trade with private algorithms

Oracle software
---------------

The oracle is written in Python and can be deployed as :term:`Docker` containers.

Development status
------------------

The oracle development is still ongoing and in beta.
The full oracle source code is not fully available yet.

- See :ref:`tradingstrategy` market data client source code
- See :ref:`tradeexecutor` strategy executor source code