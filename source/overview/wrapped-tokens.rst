.. _wrapped token:

Wrapped tokens
==============

Due to legacy design issues with :term:`EVM compatible` blockchains,
any :term:`native token` must be "wrapped" in order it to be used with
:term:`decentralised exchanges <decentralised exchange>`.

To distinguish wrapped tokens from their native token counterparts,
a letter `W` is added at the front of the token. E.g.

.. code-block:: text

    BNB -> WBNB

Even though tokens always need to be wrapped to trading,
sometimes they are still referred as "BNB" in the user interface,
when though on the smart contract level you are usinb WBNB token.

Wrapped token list
------------------

Here are some common wrapped tokens.

WETH
~~~~

Ethereum mainnet: from ETH to WETH.

WMATIC
~~~~~~

Polygon: from MATIC to WMATIC.

WAVAX
~~~~~

Avanlanche C-chain: from AVAX to WAVAX.

WBNB
~~~~

Binance smart chain: from BNB to WBNB.

Bridged tokens
--------------

Besides wrapped tokens, there are bridged tokens.
Bridges tokens have their primary implementation living on one blockchain,
but then throuhg a locking mechanism make token liquidity available on
other chains.

Bridges tokens do not have 'W' prefix.

An example of bridged token is `ETH on Binance Smart Chain <https://tradingstrategy.ai/trading-view/binance/tokens/0x2170ed0880ac9a755fd29b2688956bd959f933f8>`_.
This token is bridged through Binance custody. Because the native
token of Binance Smart Chain is BNB, not ETH, ETH on Binance Smart Chain
does not need to be wrapped.

