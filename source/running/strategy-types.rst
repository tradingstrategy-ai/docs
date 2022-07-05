.. _strategy-types:

Strategy types
==============

:py:mod:`tradeexecutor` supports different strategy types.

* Internal

* QSTrader inspired

.. _decide_trades:

Internal strategy type
----------------------

The internal strategy type is called "Pandas strategy type"
and based on :py:mod:`tradeexecutor.strategy.pandas_trader` module.

The core features of this strategy type are

* Receiving :term:`trading universe` as :py:mod:`tradingstrategy` client data:
  exchange, pairs, candles and liquidity

* Strategies are self-contained Python modules

* Strategy module contains two core functions:
    * `decide_trades` - see :py:class:`tradeexecutor.strategy.strategy_module.DecideTradesProtocol`
    * `create_trading_universe` - see :py:class:`tradeexecutor.strategy.strategy_module.CreateTradingUniverseProtocol`

* Strategy module contains other parameters like
    * Strategy version
    * :term:`cycle duration`
    * Used routing model
    * Used reserve currency
    * See :py:class:`tradeexecutor.strategy.strategy_module.StrategyModuleInformation` for more info

* The same strategy definition can be used for backtesting and live trading

QSTrader type strategies
------------------------

:py:mod:`tradeexecutor` supports :term:`QSTrader` style strategies
and are based on portfolio construction model theory.

However this strategy type was an early attempt and is now
superset by internal Pandas and PositionManager based strategy
runner :py:mod:`tradeexecutor.strategy.pandas_trader.