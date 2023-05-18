.. _ohlcv:

OHLCV Candle format
===================

Trading Strategy has a specific OHLCV (open-high-low-close) :term:`candle` format
that is more tailored for decentralised markets. Trading Strategy uses (first trade, last trade)
style candle pricing over traditional cryptocurrency open/close price where open is the last close.

- The opening price `open` is **the price of the first trade** during the candle period.

- `high` / `low` / `close` fields are the same as for normal candles.

- OHLV data **sparse**: if there are no trades, no zero volume candle is generated.
  If your strategy needs to have zero volume candles, you can :term:`forward fill`
  the data when you are constructing the trading universe.

This is because we believe this formats fit better for DeFi market data feeds

- There is no information lost, it is only presented differently.
  More information is retained in this format.

- Candles are snapped to underlying blockchain block ranges:
  trades can only happen within a block and are physically represented by
  (block number, log index) tuples.

- On AMM markets, the price can only move if there is a trade event.

- There are no gaps between close and open because markets are 24h.
  Furthermore there are no opening and closing auctions as one might have
  at stock markets.

Converting to traditional OHCLV format
--------------------------------------

Transforming Trading Strategy candle format to the traditional open/close definitions can be done as the following:

- For strategies that read a candle open price,
  just choose to use previous candle close price instead.

- For strategies, be mindful that there might not be a candle,
  because there are no trades. Many of the DeFi markets are low volume,
  and might not see any trades for minutes and sometimes hours.
  Thus the timestamp of the last candle might not be necessarily
  the previous tick.

- Replace the open price
  with the close price of the previous candle.

- For any missing sparse timestamps, generate a candle where open/high/low
  close are set the the volume to zero

Distinction between buys and sells
----------------------------------

We include logic to determine if a trade was "buy" or "sell"

- On AMM markets there are no true sides: everything is a swap.
  Sell is a swap with reverse token order compared to buy.

- We consider anything to be buy if the amount of quote token
  decreases after the trade (your USD goes down, ETH balance increases).

- See additional rules regarding the :ref:`token order`.

Large differences between close and open
----------------------------------------

Sometimes for exotic and illiquid pairs there might be a great different
between the last close and open price. Some potential explanations incluse

- Mint / burn mechanisms of tokens

- Backdoored / scam tokens

Extra price feed columns
------------------------

The following extra fields may be avaiable depending on the payload

- `start_block`

- `end_block`

- `buys`

- `sells`

- Volume might be split to separate `buy_volume` and `sell_volume` columns

For the details of the candle fields see :py:class:`tradingstrategy.candle.Candle`.