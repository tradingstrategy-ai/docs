.. _local python:

Local Python installation
=========================

This is the recommended method for advanced strategy development.
You can checkout the example code and run it on your local computer.

This method uses Git checkout and :term:`Poetry` package manager for Python.

This is a good option if you are using any of popular IDEs such as

* PyCharm

* Visual Studio Code with  `Jupyter Visual Studio Code extension <https://code.visualstudio.com/docs/datascience/jupyter-notebooks>`_. Choosing a black-on-white theme recommended, because the default charts assume white background.

We give instructions to Visual Studio Code, but PyCharm installation is very similar.

Before starting
---------------

.. note::

    The installation method described here is for advanced Python developers.
    If you are new to Python we recommend using Visual Studio Dev Container
    installation method instead. To set up your own local environment from the scratch, you need to be
    able to resolve Python version and package compatibility issues, or other issues which
    may occur.

.. note::

    Before getting started, double check that you are using a compatible
    Python version. Because of complex data analysis libraries
    used, the Python version compatibility is picky.

    `The current supported Python versions are listed in pyproject.toml <https://github.com/tradingstrategy-ai/trade-executor/blob/master/pyproject.toml>`__.

Installation steps
------------------

Git clone the `Trading Executor repository from Github <git@github.com:tradingstrategy-ai/trade-executor.git>`_.

Install the client and its dependencies using `Poetry <https://python-poetry.org/>`_:

.. code-block:: shell

    # Assumes you have SSH key set up with your Github account
    git clone git@github.com:tradingstrategy-ai/trade-executor.git
    cd trade-executor
    git submodule update --init --recursive

    # Extra dependencies
    # - execution: infrastructure to run live strategies
    # - web-server: support webhook server of live strategy executors
    # - qstrader: still needed to run legacy unit tests
    poetry install --all-extras

Configure Visual Studio Code to use Python interpreter from Poetry installation.

First in Poetry shell figure where Poetry installed the Python interpreter:

.. code-block:: shell

    which python

This gives you the full path of `python` command like:

.. code-block:: text

    /Users/moo/Library/Caches/pypoetry/virtualenvs/tradingstrategy-lMEetNwg-py3.8/bin/python

Then use Visual Studio Code *Python: Select Interpreter* command from *Command palette* to configure this interpreter by choosing *Enter interpreter path* option for the interpreter.

Now you can run `Getting started <https://tradingstrategy.ai/docs/programming/examples/getting-started.html>`_ and other example notebooks. Open `ipynb` file in Visual Studio Code. Then choose *Run All* on the open notebook.

.. image:: ./vscode.png
    :alt: Visual Studio Code example how to run a Jupyter Notebook

Local Python environment with git checkout
------------------------------------------

This is the recommended method for advanced strategy development.
You can checkout the example code and run it on your local computer,
using Visual Studio Code, PyCharm or other local Python editor.

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

.. code-block:: text

    /Users/moo/Library/Caches/pypoetry/virtualenvs/tradingstrategy-lMEetNwg-py3.8/bin/python

Then use Visual Studio Code *Python: Select Interpreter* command from *Command palette* to configure this interpreter by choosing *Enter interpreter path* option for the interpreter.

Now you can run `Getting started <https://tradingstrategy.ai/docs/programming/examples/getting-started.html>`_ and other example notebooks. Open `ipynb` file in Visual Studio Code. Then choose *Run All* on the open notebook.

.. image:: ./vscode.png
    :alt: Visual Studio Code example how to run a Jupyter Notebook

Local Jupyter installation
--------------------------

You can also run notebooks by installing a local `Jupyter notebook installation <https://jupyter.org/>`_.

Take a git checkout.

Install using poetry:

.. code-block:: shell

    poetry install

Then start Jupyter server at the root folder:

.. code-block:: shell

    ipython notebook

Navigate to a file you want to edit in your web browser.


