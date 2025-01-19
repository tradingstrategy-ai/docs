.. _local python:

Local Python installation
=========================

This is the recommended method for advanced strategy development.
You can checkout the example code and run it on your local computer.

This method uses Git checkout and :term:`Poetry` package manager for Python (you can install poetry).

This is a good option if you are using any of popular IDEs such as

* PyCharm

* Visual Studio Code with  `Jupyter Visual Studio Code extension <https://code.visualstudio.com/docs/datascience/jupyter-notebooks>`_. Choosing a black-on-white theme recommended, because the default charts assume white background.

We give instructions to Visual Studio Code, but PyCharm installation is very similar.

Before starting
---------------

.. note::

    The installation method described here is for advanced Python developers.
    If you are new to Python we recommend using :ref:`Visual Studio Dev Container <running-code-examples>`
    installation method instead. If you think you can set up your own local environment from the scratch, you need to be
    able to resolve Python version and package compatibility issues, or other issues which
    may occur.

.. note::

    Before getting started, double check that you are using a compatible
    Python version. Because of complex data analysis libraries
    used, the Python version compatibility is picky.

    `The current supported Python versions are listed in pyproject.toml <https://github.com/tradingstrategy-ai/trade-executor/blob/master/pyproject.toml>`__.

Installation steps
------------------

Git clone the `Trading Executor repository from Github <https://github.com/tradingstrategy-ai/trade-executor>`_.

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

    # Optionally specify Python version
    poetry env use python3.11

    # Activate the virtual environment
    poetry env activate

    # Run commands in the Poetry environment, e.g.:
    poetry run ipython

Configure Visual Studio Code
---------------------------

Install `Jupyter Visual Studio Code extension <https://code.visualstudio.com/docs/datascience/jupyter-notebooks>`_. 
Choosing a black-on-white theme is recommended, because the default charts assume white background.

To configure VS Code to use the Poetry Python interpreter:

.. code-block:: shell

    # Find the interpreter path
    poetry run which python

This gives you the full path of `python` command, for example:

.. code-block:: text

    /Users/moo/Library/Caches/pypoetry/virtualenvs/tradingstrategy-lMEetNwg-py3.8/bin/python

Use Visual Studio Code *Python: Select Interpreter* command from *Command palette* to configure this interpreter by choosing *Enter interpreter path* option.

Now you can run `Getting started <https://tradingstrategy.ai/docs/programming/code-examples/getting-started.html>`_ and other example notebooks. Open any `ipynb` file in Visual Studio Code and choose *Run All* on the open notebook.

.. image:: ./vscode.png
    :alt: Visual Studio Code example how to run a Jupyter Notebook

Local Jupyter installation
--------------------------

You run notebooks by installing a local `Jupyter notebook installation <https://jupyter.org/>`_.
This will create a local Jupyter server and open Jupyter notebooks in your web browser.

Start Jupyter server at the root folder:

.. code-block:: shell

    poetry run ipython notebook

Navigate to a file you want to edit in your web browser.
