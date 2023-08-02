.. _running-code-examples:

.. _Setting up development environment:

Setting up development environment
==================================

Preface
-------

This documentation section covers how to run Trading Strategy code examples and notebooks:

* How to set up libraries and development environment on your local computer
  or a cloud server

Prerequisites
-------------

Code examples are available able :term:`Jupyter notebooks <Jupyter notebook>` in this documentation.

You to be able work with the examples you need to have

* Basic Python programming language understanding

* Basic Jupyter notebook understanding

To get started, you do not need to install any applications on your computer.

Recommended set up
------------------

If you are not an advanced Python developer, and you do not have a preferred toolchain,
we recommend you to start with Visual Studio Code :ref:`Dev Container`.

Development environment options
-------------------------------

Check :doc:`how to run examples <./running>` and from the available code snippets:

.. toctree::
   :maxdepth: 1

   dev-container/visual-studio-code-docker-dev-container-for-jupyter-notebooks
   docker-development-image/docker-development-image
   binder/binder-development
   local-python
   google-colab

How to get started
------------------

After setting up your development environment,
go to :ref:`tutorials <tutorial>` section of the documentation.

* How to use Trading Strategy API

* How to analyse DeFi market data

* How to develop and backtest your own automated trading strategies


.. _get an API key

Getting an API key
------------------

To get a Trading Strategy API key needed to access some of the datasets,
`please visit here <https://tradingstrategy.ai/trading-view/api>`__.

- Any notebook will prompt you to get and enter the API key if you do not have
  one yet

- Some binaries like `trade-executor` docker will read the API key from
  `TRADING_STRATEGY_API_KEY` environment variable.

Example:

.. code-block:: shell

    export TRADING_STRATEGY_API_KEY="secret-token:tradingstrategy-d534e28..."



