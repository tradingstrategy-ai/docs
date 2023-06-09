Troubleshooting strategy deployments
====================================

.. _console:

Interactive Python console
~~~~~~~~~~~~~~~~~~~~~~~~~~

There is a `console` command that allows you to launch `trade-executor` with a Python prompt open.

- Manually inspect state and connections in an interactive Python prompt

- Repair damaged data

- Close any live `trade-executor` before opening the interactive shell,
  as both can write to the state at the same time

To start the console you can do:

.. code-block:: shell

    docker-compose run pancake-eth-usd-sma -- console

.. code-block:: text

    Following classes and objects are available:
    web3                          : <web3.main.Web3 object at 0x7fe04912d120>
    client                        : <tradingstrategy.client.Client object at 0x7fe049e2c370>
    state                         : <State for None>
    universe                      : TradingStrategyUniverse(reserve_assets=[AssetIdentifier(chain_id=137, address='0x2791bca1f2de4661ed88a30c99a7a9449aa84174', token_symbol='USDC', decimals=6, internal_id=None, info_url=None)], universe=Universe(time_bucket=<TimeBucket.h1: '1h'>, chains={<ChainId.polygon: 137>}, exchanges={<Exchange Quickswap at 0x5757371414417b8c6caad45baef941abc7d3ab32 on Polygon>}, pairs=<tradingstrategy.pair.PandasPairUniverse object at 0x7fe048f64610>, candles=<tradingstrategy.candle.GroupedCandleUniverse object at 0x7fdf897e0700>, liquidity=None), backtest_stop_loss_time_bucket=<TimeBucket.m15: '15m'>, backtest_stop_loss_candles=<tradingstrategy.candle.GroupedCandleUniverse object at 0x7fdf897e2b60>)
    store                         : <tradeexecutor.state.store.JSONFileStore object at 0x7fe04912fc10>
    routing_state                 : <UniswapV2RoutingState Tx builder: <tradeexecutor.ethereum.tx.TransactionBuilder object at 0x7fe048730a60> web3: <web3.main.Web3 object at 0x7fe04912d120>>
    pricing_model                 : <tradeexecutor.ethereum.uniswap_v2_live_pricing.UniswapV2LivePricing object at 0x7fe0487304f0>
    valuation_method              : <tradeexecutor.ethereum.uniswap_v2_valuation.UniswapV2PoolRevaluator object at 0x7fe048730490>
    datetime                      : <module 'datetime' from '/usr/local/lib/python3.10/datetime.py'>
    pd                            : <module 'pandas' from '/usr/local/lib/python3.10/site-packages/pandas/__init__.py'>
    cache_path                    : cache
    Decimal                       : <class 'decimal.Decimal'>

    Python 3.10.8 (main, Dec  6 2022, 14:13:21) [GCC 10.2.1 20210110]
    Type 'copyright', 'credits' or 'license' for more information
    IPython 8.7.0 -- An enhanced Interactive Python. Type '?' for help.

    In [1]:

Then you can use `%cpaste` command to paste Python snippets into the console.
