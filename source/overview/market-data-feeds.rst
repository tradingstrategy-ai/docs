.. _market data:

.. _trading data:

Accessing market data
=====================

To efficiently trade, a high quality information about markets is needed.
Trading Strategy provides various :term:`market data feeds <market data feed>`
that trades can use to trade on :term:`DeFi markets <defi>` and :term:`decentralised exchanges <decentralised exchange>`.

Explore data
------------

You can explore `the available data on Trading Strategy market data pages <https://tradingstrategy.ai/trading-view/exchanges>`_.
You will find the lists of decentralised exchanges, trading pairs, price charts and metadata.

Not all trading pairs and tokens are included in the dataset. See :ref:`tracking` for more information about inclusion criteria.

Data flavours
-------------

Real-time API
~~~~~~~~~~~~~

`Real-time API <https://tradingstrategy.ai/api/explorer/>`__ for live trading and price charts.

See `OpenAPI explorer <https://tradingstrategy.ai/api/explorer/>`__ for available APIs.

Backtesting datasets API
~~~~~~~~~~~~~~~~~~~~~~~~

`Backtesting datasets <https://tradingstrategy.ai/trading-view/backtesting>`_ for testing strategies.

Microsoft Excel data files
~~~~~~~~~~~~~~~~~~~~~~~~~~

For some datasets, like the best performing trading pairs, there is direct Microsoft Excel export available.

`See PancakeSwap trading pairs <https://tradingstrategy.ai/trading-view/binance/pancakeswap-v2>`_ as an example.

Accessing data
--------------

You can access market data

- Programmatically using API

- Download datasets by hand

Programmatic access may require an API key

- Real-time API does not require authentication

- Backtesting data requires authentication by an API key due to large size of served files

API key registration
~~~~~~~~~~~~~~~~~~~~

You can get a free `API key with a newsletter subscription <https://tradingstrategy.ai/trading-view/api>`_.

Datasets manual download
~~~~~~~~~~~~~~~~~~~~~~~~

After you have obtained an API key `you can download datasets from the backtesting page <https://tradingstrategy.ai/trading-view/backtesting>`_.

Downloading programmatically
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See :ref:`dataset download` for examples.

API endpoints
-------------

Datasets can be downloaded over authenticated HTTPS API endpoints.

At the moment, all API endpoints are served by a private beta server https://tradingstrategy.ai/api.

APIs are described by Python dataclasses. For more information about the dataset data structure, see the API documentation and the relevant source code.

Parquet endpoints
~~~~~~~~~~~~~~~~~

These take HTTP GET parameter ``bucket``. See available values in :py:class:`tradingstrategy.timebucket.TimeBucket`.
They return a Parquet file download.

.. code-block:: none

    /pair-universe
    /candles-all
    /liquidity-all

JSON endpoints
~~~~~~~~~~~~~~

These do not take parameters. They return a JSON file download.

.. code-block:: none

    /exchanges
