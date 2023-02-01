.. _running-code-examples:

Running the examples
====================

Preface
-------

This page covers how to run Trading Strategy code examples and notebooks

* How to use Trading Strategy API

* How to develop your own automated trading strategies

Prerequisites
-------------

Code examples are available able :term:`Jupyter notebooks <Jupyter notebook>` in this documentation.

You to be able work with the examples you need to have

* Python 3.10 installed

* Basic Python programming language understanding

* Basic Jupyter notebook understanding

To get started, you do not need to install any applications on your computer.

Setting up development environment
----------------------------------0

Visual Studio Code with Dev Container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note ::

    This is the recommended method for advanced strategy development.


Install `Jupyter Visual Studio Code extension <https://code.visualstudio.com/docs/datascience/jupyter-notebooks>`_. Choosing a black-on-white theme recommended, because the default charts assume white background.

Git clone the `Trading Strategy client repository from Github <https://github.com/tradingstrategy-ai/trading-strategy/>`_.

Install the client and its dependencies using `Poetry <https://python-poetry.org/>`_:

.. code-block:: shell

    cd client
    poetry shell
    poetry install

Configure Visual Studio Code to use Python interpreter from Poetry installation.

First in Poetry shell figure where Poetry installed the Python interpreter:

.. code-block:: shell

    which python

This gives you the full path of `python` command.

::

    /Users/moo/Library/Caches/pypoetry/virtualenvs/tradingstrategy-lMEetNwg-py3.8/bin/python

Then use Visual Studio Code *Python: Select Interpreter* command from *Command palette* to configure this interpreter by choosing *Enter interpreter path* option for the interpreter.

Now you can run `Getting started <https://tradingstrategy.ai/docs/programming/examples/getting-started.html>`_ and other example notebooks. Open `ipynb` file in Visual Studio Code. Then choose *Run All* on the open notebook.

.. image:: ./vscode.png
    :alt: Visual Studio Code example how to run a Jupyter Notebook




