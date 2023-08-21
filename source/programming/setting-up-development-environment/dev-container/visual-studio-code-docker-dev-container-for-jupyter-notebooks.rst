.. _Dev Container:

Visual Studio Code Dev Container for Jupyter Notebooks
======================================================

The Trading Strategy Dev Container is a pre-made development environment
for quant finance research in decentralised finance using Visual Studio
Code. It offers tools to analyse DEX market data, research and backtest
trading strategies.

.. figure:: vscode-splash.png
   :alt: img_1.png

`Microsoft Visual Studio Code <https://code.visualstudio.com/>`__ is a
popular editor for Jupyter notebooks. `Dev
Container <https://code.visualstudio.com/docs/devcontainers/containers>`__
is a Visual Studio Code feature to easily distribute ready-made
development environments to users. Visual Studio Code comes with
powerful editing features for `Jupyter
Notebooks <https://jupyter.org/>`__, a programming file format for data
research. Dev Containers work on any operating system (Windows, macOS,
Linux). Dev Container users a special ``.devcontainer`` configuration
format in supported Git repositories.

Trading Strategy Dev Container combines

-  Trading Strategy framework and libraries
-  Ready set up Python environment with correct Python interpreter and
   Jupyter Notebook kernel
-  Visual Studio Code plugins and settings needed to run and edit these
   notebooks, saving them to your local disk
-  Example notebooks ready available in the project explorer
-  Apple Silicon (Macbook M1) friendliness

You can find the related `.devcontainer
files <https://github.com/tradingstrategy-ai/trade-executor/tree/master/.devcontainer>`__
and
`Dockerimage <https://github.com/tradingstrategy-ai/trade-executor/tree/master/.devcontainer>`__
on Github.

Prerequisites
-------------

-  Existing basic knowledge of Python programming, Jupyter notebooks and
   data science and trading
-  The set up will download 2 GB+ data, so we do not recommend to try
   this over a mobile connection

Setting up Visual Studio Code
-----------------------------

-  `Install Visual Studio code <https://code.visualstudio.com/>`__
-  `Install Docker
   desktop <https://www.docker.com/products/docker-desktop/>`__
-  Install the `Dev Containers
   extension <https://code.visualstudio.com/docs/devcontainers/containers>`__
   within Visual Studio Code

Checkout the repository from Github
-----------------------------------

After you are done with the local software installation steps above, you
can check out the repository using Visual Studio Code.

.. figure:: git-clone.png
   :alt: img.png

Press ``F1`` to bring up the command palette (``fn`` + ``F1`` on Macs)

Choose ``Git Clone`` and then from ``Clone from Github``.

Paste in the repository URL:
``https://github.com/tradingstrategy-ai/trade-executor.git``.

It will now ask you for the destination folder on your hard disk. Choose
any folder name you like, e.g. ``my-fabulous-trading-strategy``.

Open the folder after cloning is complete.

.. figure:: open-folder.png
   :alt: img.png

Start the Dev Container
-----------------------

When the cloned Github project opens, you get a pop-up *Reopen in
container*.

.. figure:: open-in-dev-container.png
   :alt: img.png

Click it and Visual Studio Code will build the development environment
for you. This will take 2 - 15 minutes depening on your Internet
connection speed.

.. figure:: dev-container-building.png
   :alt: img.png

You can also manually execute this action by pressing ``F1`` to bring up
the command palette (``fn`` + ``F1`` on Macs) and finding *Reopen in
container* action.

Using the container
-------------------

After the container is started, open Terminal in Visual Studio Code
(*View > Terminal*). Press *New Terminal* button to open a new terminal
window within your Dev Cointainer.

.. figure:: new-termianl.png
   :alt: img.png

Paste in the following command:

.. code:: shell

   scripts/set-up-examples.sh 

.. figure:: cloning-examples.png
   :alt: img.png

This will create ``examples`` folder and copies all example notebooks
`from the Trading Strategy
documentation <https://tradingstrategy.ai/docs/>`__ there.

Running an example notebook
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here are short instructions how to edit and run example notebooks.

.. figure:: project-tree.png
   :alt: img.png

   img.png

Open ``examples/synthetic-ema.ipynb``

Edit the backtesting period in the first code cell:

.. figure:: backtesting-period.png
   :alt: img_1.png

Set to

.. code:: python

   start_at = datetime.datetime(2022, 1, 1)
   end_at = datetime.datetime(2023, 1, 1)

Then press Run all:

.. figure:: run-all.png
   :alt: img_1.png

If you get prompted to choose between different Python versions,
choose one in ``/usr/local/bin``.

Now scroll to the bottom of the notebook and see you have updated
results for 2022 - 2023:

.. figure:: run-all-results.png
   :alt: img_1.png

Next steps
----------

Instead of randomly clicking example notebooks around, we suggest `you
start with Getting started
documentation <https://tradingstrategy.ai/docs/programming/code-examples/getting-started.html>`__.

Using command line Python
-------------------------

You can also use Dev Container environment as normal Python development
environment.

If you open Visual Studio Code terminal and run ``python`` command it
comes with Trading Strategy packages installed.

.. figure:: command-line-python.png
   :alt: img_1.png

Troubleshooting
---------------

No space left on device error
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Make sure you clean up old Docker images, containers and volumes in your
Docker for Desktop to reclaim disk apce.

Manual build
~~~~~~~~~~~~

Building the Docker image by hand:

.. code:: shell

   docker build --file .devcontainer/Dockerfile .

Further reading
---------------

-  https://code.visualstudio.com/docs/devcontainers/containers
-  https://stackoverflow.com/questions/63998873/vscode-how-to-run-a-jupyter-notebook-in-a-docker-container-over-a-remote-serve
-  https://keestalkstech.com/2022/08/jupyter-notebooks-vscode-dev-container-with-puppeteer-support/
-  https://marioscalas.medium.com/using-python-and-poetry-inside-a-dev-container-33c80bc5a22c