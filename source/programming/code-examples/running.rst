Running the examples
====================

Preface
-------

This page covers how to run Trading Strategy code examples

* How to use Trading Strategy API

* How to develop your own automated trading strategies

Prerequisites
-------------

Code examples are available able :term:`Jupyter notebooks <Jupyter notebooks>` in this documentation.

You to be able work with the examples you need to have

* Basic Python programming language understanding

* Basic Jupyter notebook understanding

To get started, you do not need to install any applications on your computer.

Methods for running example code
--------------------------------

Binder
~~~~~~

Binder is a cloud server for running notebook examples. This method
is integrated to the documentation and it is the easiest method to run any example code.

All example notebooks in the documentation come with Binder integration.
Press "Launch binder" badge on the top of any example page in the documentation.
This will automatically create a personal runnable notebook for you on a cloud server.

Click this button in the header of a notebook on a documentation page:

.. image:: ./binder-example.png

Visual Studio Code and other IDEs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

::

    /Users/moo/Library/Caches/pypoetry/virtualenvs/tradingstrategy-lMEetNwg-py3.8/bin/python

Then use Visual Studio Code *Python: Select Interpreter* command from *Command palette* to configure this interpreter by choosing *Enter interpreter path* option for the interpreter.

Now you can run `Getting started <https://tradingstrategy.ai/docs/programming/examples/getting-started.html>`_ and other example notebooks. Open `ipynb` file in Visual Studio Code. Then choose *Run All* on the open notebook.

.. image:: ./vscode.png
    :alt: Visual Studio Code example how to run a Jupyter Notebook

Local Jupyter installation
~~~~~~~~~~~~~~~~~~~~~~~~~~

You can also run notebooks by installing a local `Jupyter notebook installation <https://jupyter.org/>`_.

Take a git checkout.

Install using poetry:

.. code-block:: shell

    poetry install

Then start Jupyter server at the root folder:

.. code-block:: shell

    ipython notebook

Navigate to a file you want to edit in your web browser.