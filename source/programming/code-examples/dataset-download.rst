.. _dataset download:

Dataset download
================

This is a generic example how to access Trading Strategy datasets by hand.

If you are a Python user, you should use the `trading-strategy` package to access the data (see :ref:`tutorial`).
In thes examples, we give Python pseudocode other programming languages can adapt.

Downloading datasets programmatically
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All endpoints need your API key in the ``Authorisation`` header.

Because files are large, you need to stream them, as they are unlikely to fit in the RAM.

Example how to download:

.. code-block:: python

    import os
    import requests

    # Read API key from the process environment
    # should be in format "secret-token:tradingstrategy-48...
    # where the secret-token is the part of the API key itself
    api_key = os.environ["TRADING_STRATEGY_API_KEY"]

    session = requests.Session()
    session.headers.update({'Authorization': api_key})
    server = "https://tradingstrategy.ai/api"
    url = f"{server}/candles-all"
    params= {"bucket": "1d"}
    resp = session.get(url, allow_redirects=True, stream=True, params=params)
    resp.raise_for_status()
    size = 0
    with open('candles.parquet', 'wb') as handle:
        for block in resp.iter_content(64*1024):
            handle.write(block)
            size += len(block)

    print(f"Downloaded {size:,} bytes")

Here is a `curl` example for getting 1d liquidity candles and save the file in the current folder:

.. code-block:: shell

    export TRADING_STRATEGY_API_KEY="secret-token:tradingstrategy-..."
    curl -v -H "Authorization: $TRADING_STRATEGY_API_KEY" "https://tradingstrategy.ai/api/liquidity-all?bucket=1d" --output liquidity-1d.parquet

Reading datasets
~~~~~~~~~~~~~~~~

Datasets are distributed as compressed :term:`Parquet` files, using Parquet version 2.0.

You can read the files using PyArrow:

.. code-block:: python

    import pyarrow as pa
    from pyarrow import parquet as pq

    table: pa.Table = pq.read_table("candles.parquet")

Then, you can directly import the table into your database or convert the table to a Pandas DataFrame for further manipulation.
