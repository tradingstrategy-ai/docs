.. _trade-executor:

Trade-executor command
======================

The live trading is handled by `trade-executor` daemon that
is deployed as a :term:`Docker` container.

This command

- Runs as a daemon for live trade execution.

- Offers various command line helper commands to diagnose
  live strategies like
  `backtest`, `console`, `show-accounts`. On these,
  see more in :ref:`troubleshooting live trading`.

Running trade-executor
----------------------

You need to

- Know UNIX command line basics

- Have enabled docker login to Github - see
  `how to set up Github access token to download Docker images from GHCR <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>`_

To get started, `check the latest version from trade-executor release <https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor>`__.

Run the command to see the command line help:

.. code-block:: shell

    # Replace with the latest version
    export TRADE_EXECUTOR_VERSION=v163

    # Read command line help
    docker run ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION} --help

Further information
-------------------

See :ref:`managing docker images` for more information on running Docker images.
