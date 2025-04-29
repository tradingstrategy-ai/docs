.. _running-strategies:

.. _running strategies:

.. _strategy deployment:

Deploying live trading strategies
=================================

.. note::

    First check `Getting started with live trade execution example <https://github.com/tradingstrategy-ai/dex-live-algorithmic-trading-example>`__ repository.

In this section, we discuss how to run trading strategies
developed with :ref:`Trading Strategy framework <framework>`.

Live trading is done by :ref:`trade-executor` command
that is deployed as :term:`Docker` container. When
you deploy a live trading strategy, you first need
to choose how you wish to run it, see :ref:`live trading modes`.

.. toctree::
   :maxdepth: 1

   trade-executor
   live-trading
   metadata
   hot-wallet-deployment
   vault-deployment
   lagoon-vault
   velvet-portfolio
   monitoring
   docker-images
   backtest-vs-live-execution
   troubleshooting
   repair
   wallet-operations

