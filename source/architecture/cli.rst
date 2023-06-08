.. _cli:

Command line application
========================

The trade executor comes with a command line application interface,
shortly referred as *CLI*.

- The application is defined by :py:mod:`tradeeexecutor.cli` module

- The application can run as a standalone Python application or
  as a :term:`Docker`

- The application can do live trading or backtesting

Running trade executor CLI
--------------------------

Docker
~~~~~~

See the example `docker-compose.yml` in trade-executor repository.

Python
~~~~~~

Assuming you have `tradeexecutor` package installed through Poetry:

.. code-block:: shell

    poetry run trade-executor

This should output:

::

    poetry run trade-executor --help
    Usage: trade-executor [OPTIONS] COMMAND [ARGS]...

    Options:
      --install-completion [bash|zsh|fish|powershell|pwsh]
                                      Install completion for the specified shell.
      --show-completion [bash|zsh|fish|powershell|pwsh]
                                      Show completion for the specified shell, to
                                      copy it or customize the installation.
      --help                          Show this message and exit.

    Commands:
      check-universe  Checks that the trading universe is helthy for a given...
      check-wallet    Prints out the token balances of the hot wallet.
      start           Launch Trade Executor instance.
