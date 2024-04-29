.. _running-code-examples:

.. _Setting up development environment:

Setting up development environment
==================================

Preface
-------

This documentation section covers how to run Trading Strategy code examples and notebooks:

* How to set up a Python-based Trading Strategy development environment on your local computer
  or a cloud server

.. note ::

    If you want to get started fast, you can directly jump to `Getting started Github repository and Codespaces <https://github.com/tradingstrategy-ai/getting-started>`__.

Prerequisites
-------------

Code examples are available able :term:`Jupyter notebooks <Jupyter notebook>` in this documentation.

You to be able work with the examples you need to have

* Python programming basics

* Data sciense basics: Jupyter notebook and Pandas

* :ref:`Price action and technical indicator basics <learning>`

Recommended set up
------------------

- We recommend trying out with :ref:`Github Codespaces <codespaces>` cloud-based tutorial first
- The next easiest option is with Visual Studio Code :ref:`Dev Container`
- If you are experienced Python developer you can use any Python editor you wish,
  and install the source code from Github checkout

Development environment options
-------------------------------

We offer different strategy development environments for different level of developers:

.. toctree::
   :maxdepth: 1

   codespaces/index
   dev-container/visual-studio-code-docker-dev-container-for-jupyter-notebooks
   docker-development-image/docker-development-image
   binder/binder-development
   local-python
   google-colab

Next steps
----------

After setting up your development environment,
go to :ref:`tutorials <tutorial>` section of the documentation.

You find tutorials for:

* How to develop and backtest your own automated trading strategies

* How to analyse DeFi market data

* How to use Trading Strategy API

.. _get an API key:

Getting an API key
------------------

To get a Trading Strategy API key needed to access some of the datasets,
`please visit here <https://tradingstrategy.ai/trading-view/api>`__.

- Any notebook will prompt you to get and enter the API key if you do not have
  one yet

- Some binaries like `trade-executor` docker will read the API key from
  `TRADING_STRATEGY_API_KEY` environment variable.

- API key is free

Example:

.. code-block:: shell

    export TRADING_STRATEGY_API_KEY="secret-token:tradingstrategy-d534e28..."



