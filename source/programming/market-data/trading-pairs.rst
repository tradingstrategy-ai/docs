.. _trading pair:

Trading pair naming conventions
===============================

In Trading Strategy data, trading pairs use the following naming convention:


.. code-block:: text

    base token -  quote token

where

* Base token refers to the token that is being bought/sold

* Quote token refers to the token that is used as the currency to be traded

* Trading pair tokens are ordered in a way that is suitable for reasoning
  about the trading pair as a trader

An example trading pairs could be:

- BNB/BUSD

- MATIC/USDC

- ETH/USDC

- AAVE/ETH

Because in cryptocurrency both tokens can be seen as "currencies" it is
just a human construct in which order pairs are named. Generally:

- Higher liquidity tokens are used as a quote token (as they are more stable)

- USD stablecoins triumps BTC

- BTC triumps ETH

- BNB/MATIC/AVAX and other native tokens triumps everything else

This order is also relevant for :ref:`price conversion` to have
all trades converted to US Dollar, so that relative gains can be compared.

Base token and quote token vs. token0 and token1
------------------------------------------------

:ref:`decentralised exchanges <decentralised exchange>` like Uniswap
use the concept of `token0` and `token1` naming instead of human friendly base token
and quote token.

* Uniswap orders trading pair tokens based on their smart contract address sorting,
  which is random.

* Each token has its Ethereum ERC-20 smart contract address as 160 bit integer,
  presented as hex

For example, Uniswap pair could be

- `USDC (token0 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48) / WETH (token1 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 ) <https://etherscan.io/address/0xb4e16d0168e52d35cacd2c6185b44281ec28c9dc#readContract>`_

... which is inverse what a human would want to trade.

However, because Uniswap does *swaps*, Uniswap internal programming does
not care what tokens present. Sell is a buy with reserve token order
on Uniswap's routing *path*.

- Buy ETH with USDC path: [USDC, WETH]

- Buy USDC with ETH path: [WETH, USDC], or sell USDC for WETH

Any Uniswap token0 and token1 style pairs are converted to natural base token
and quote token for Trading Strategy data, so that trades are easier to reason about.

Swaps with several input amounts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Uniswap also supports complex swaps with two tokens in, two tokens out. E.g.
60% USDC in (amount0_in), 40% ETH in (amount1_in), 70% USDC out (amount0_out),
30% ETH out (amount1_out). These kind of complex swaps are usually dealt by
arbitrage bots or smart order routing (SOR), as you might get a better
liquidity and thus better price when routing your order through multiple
pools.

What is price and how price is calculated
------------------------------------------

Price is expressed as how many quote tokens one base token gets.
E.g. ETH/USDC at $1700 means that you get 1700 USDC for 1 ETH.

The price is:

.. code-block:: text

    how many quote tokens you get for 1 base token

This is the spot market price.

Price can be expressed as

- :term:`Mid price` that is theoretical price between the best ask and the best bid
  no one can buy, because there is always fees

- In Uniswap v2 and v3 style pricing, the price you are quoted and you pay
  includes liquidity provider fees baked in the price. For Uniswap v2
  the price of ETH/USDC at $1700 buy for 1 ETH there is 0.30% LP fee you need to
  account for. Thus, the smart contract swap execution gives you
  either 0.997 ETH for $1700 or 1 ETH for $1705.12. LP fees are
  accounted in the quote token.

- Most centralised exchanges separate fees from the actual trade and price.

- The price also may include :term:`price impact` based on the
  liquidity available for the trade.

- Outside the theoretical price you are going to get, there is
  :term:`slippage` because of imperfect execution and latencies -
  in this case the price you are executed at may be higher or lower
  than the price you had when you created the order.

- In accounting and trade profit calculations, it is important to pay
  attention when fees are baked in the price and when they are not.

See :py:class:`tradeexecutor.strategy.pricing_model.TradePricing` for more information
about price calculation logic.


What is buy and what is sell
----------------------------

In a buy, you swap quote token to base token e.g. USD to ETH to take a position
in ETH.

In a sell you unwind this position by selling ETH and hopefully now having
more USD as you started with for profit.

What is ask and what is bid
---------------------------

In an order book, buy limit orders are called bids, sell limit orders are called asks.

These terms are not usually used in :term:`AMMs <AMM>`, unless
they are auction based.

What are enter and exit position
--------------------------------

Buy and sell are spot market concepts and do not apply for shorting.

When talking about futures markets, it is easier to talk about about entering
and exiting position.

For example when one enters a short ETH position, you are effectively
selling ETH which you do not have.

* You do this by taking a loan: deposit USD and borrow ETH against it,
  then sell ETH to get the USD back. The loan is nominated in ETH and you pay
  interest % in ETH. This is called entering the position,
  or opening the position.

* To close the position, or to exit the position, you then buy ETH back
  from the spot market and pay back the loaned ETH. If ETH price has fallen,
  now you can buy back more ETH for the same USD than you originally borrowed,
  thus making profit.

* For a leveraged position, you repeat entering the position trades multiple
  times.

* On contract for difference markets and perpertual markets, you are effectively
  gambling against other market participants: longs pay shorts, shorts pay long.
  There is never any value transferred or created, except the collateral (usually USD).

Multitoken pairs
----------------

Curve and Balancer can have pools with three or more tokens. These arenot covered yet.