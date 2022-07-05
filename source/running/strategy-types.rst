.. _strategy-types:

Strategy types
==============

:py:mod:`tradeexecutor` supports different strategy types.

* Internal

* QSTrader inspired

"Pandas trades" - Internal strategy type
----------------------------------------

The internal strategy type is called "Pandas strategy type"
and based on :py:mod:`tradeexecutor.strategy.pandas_trader` module.

The core features of this strategy type are

* The name comes from the fact that the strategy operates
  on Python Pandas library data format for candles and liquidity

* Receiving :term:`trading universe` as :py:mod:`tradingstrategy` client data:
  exchange, pairs, candles and liquidity

* Strategies are self-contained Python modules

* The same strategy definition can be used for backtesting and live trading

* Strategy module contains two core functions: *decide_trades* and *create_trading_universe*

.. _decide_trades:

decide_trades
~~~~~~~~~~~~~

See :py:class:`tradeexecutor.strategy.strategy_module.DecideTradesProtocol`

Example `decide_trades` function:

.. code-block:: python

    def decide_trades(
            timestamp: pd.Timestamp,
            universe: Universe,
            state: State,
            pricing_model: PricingModel,
            cycle_debug_data: Dict) -> List[TradeExecution]:

        assert timestamp.minute == 0
        assert timestamp.second == 0
        assert timestamp.hour == 0

        # Create a position manager helper class that allows us easily to create
        # opening/closing trades for different positions
        position_manager = PositionManager(timestamp, universe, state, pricing_model)

        pair = universe.pairs.get_single()

        cash = state.portfolio.get_current_cash()

        # 30 days EMA
        candles: pd.DataFrame = universe.candles.get_single_pair_data(sample_count=30)
        close = candles["close"]

        slow_ema = close.ewm(span=30).mean().iloc[-1]
        fast_ema = close.ewm(span=10).mean().iloc[-1]

        # https://stackoverflow.com/a/623312/315168
        day_number = timestamp.to_pydatetime().timetuple().tm_yday

        trades = []

        if day_number % 2 == 0:
            # buy on even days
            if not position_manager.is_any_open():
                buy_amount = cash * position_size
                trades += position_manager.open_1x_long(pair, buy_amount)
        else:
            # sell on odd days
            if position_manager.is_any_open():
                trades += position_manager.close_all()

        visualisation = state.visualisation
        visualisation.plot_indicator(timestamp, "Slow EMA", PlotKind.technical_indicator_on_price, slow_ema, colour="forestgreen")
        visualisation.plot_indicator(timestamp, "Fast EMA", PlotKind.technical_indicator_on_price, fast_ema, colour="limegreen")

        return trades

create_trading_universe
~~~~~~~~~~~~~~~~~~~~~~~

See :py:class:`tradeexecutor.strategy.strategy_module.CreateTradingUniverseProtocol`

Example `create_trading_universe` function:

.. code-block:: python


    # Time bucket for our candles
    candle_time_bucket = TimeBucket.h4

    # Which chain we are trading
    chain_id = ChainId.bsc

    # Which exchange we are trading on.
    exchange_slug = "pancakeswap-v2"

    # Which trading pair we are trading
    trading_pair = ("WBNB", "BUSD")

    def create_trading_universe(
            ts: datetime.datetime,
            client: Client,
            execution_context: ExecutionContext,
            **kwargs,
    ) -> TradingStrategyUniverse:
        """Creates the trading universe where the strategy trades.

        If `execution_context.live_trading` is true then this function is called for
        every execution cycle. If we are backtesting, then this function is
        called only once at the start of backtesting and the `decide_trades`
        need to deal with new and deprecated trading pairs.

        As we are only trading a single pair, load data for the single pair only.

        :param ts:
            The timestamp of the trading cycle. For live trading,
            `create_trading_universe` is called on every cycle.
            For backtesting, it is only called at the start

        :param client:
            Trading Strategy Python client instance.

        :param execution_context:
            Information how the strategy is executed. E.g.
            if we are live trading or not.

        :param candle_timeframe_override:
            Allow the backtest framework override what candle size is used to backtest the strategy
            without editing the strategy Python source code file.

        :return:
            This function must return :py:class:`TradingStrategyUniverse` instance
            filled with the data for exchanges, pairs and candles needed to decide trades.
            The trading universe also contains information about the reserve asset,
            usually stablecoin, we use for the strategy.
        """

        # Load all datas we can get for our candle time bucket
        dataset = load_all_data(client, candle_time_bucket, execution_context)

        # Filter down to the single pair we are interested in
        universe = TradingStrategyUniverse.create_single_pair_universe(
            dataset,
            chain_id,
            exchange_slug,
            trading_pair[0],
            trading_pair[1],
        )

        return universe

Other strategy module members
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Strategy module contains other parameters like
    * Strategy version
    * :term:`cycle duration`
    * Used routing model
    * Used reserve currency
    * See :py:class:`tradeexecutor.strategy.strategy_module.StrategyModuleInformation` for more info

QSTrader strategy type
----------------------

:py:mod:`tradeexecutor` supports :term:`QSTrader` style strategies
and are based on portfolio construction model theory.

However this strategy type was an early attempt and is now
superset by internal Pandas and PositionManager based strategy
runner :py:mod:`tradeexecutor.strategy.pandas_trader.