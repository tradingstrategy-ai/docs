Live trading
============

Different live trading models are supported

- Single owner Ethereum hot wallet and private strategies

- Multiple shareholders using :term:`Enzyme protocol` :term:`vault`,
  single :ref:`oracle` and public strategies (coming soon)

- Multiple strategy shareholders using :term:`Enzyme protocol`,
  decentralised :ref:`oracle` network and public strategies (coming soon)

Running modes
-------------

Single oracle
~~~~~~~~~~~~~

In a single oracle mode, there are

- Single Trading Strategy oracle providing market data feeds through
  :ref:`client`

- There is one :py:mod:`tradeeexecutor.cli` command line process running
  the execution engine, usually executed using :term:`Docker`

- The strategy can be private or public, though
  because of a single oracle mode the oracle must be trusted

- The execution engine can log to log files, Discord and LogStash

- The execution engine can execute against a single owner Ethereum hot wallet
  (see :py:mod:`tradeexecutor.ethereum.wallet` or a vault

- The execution engine detects incoming deposits and withdrawals
  (see :py:mod:`tradeexecutor.ethereum.hot_wallet_sync`)