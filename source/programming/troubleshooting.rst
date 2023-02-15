Troubleshooting
===============

Preface
-------

Some common issues you might encounter and how to tackle them.

Resetting the API key
---------------------

You can reset the API key by deleting the config file:

.. code-block:: shell

    rm ~/.tradingstrategy/settings.json

Resetting the download cache
----------------------------

Downloaded files might get corrupted e.g. due to a partial download.

You can see a message like:

.. code-block:: none

    OSError: Could not open parquet input source '<Buffer>': Invalid: Parquet magic bytes not found in footer. Either the file is corrupted or this is not a parquet file.

To fix this issue, you can remove all files in the download cache.

.. code-block:: shell

    rm -rf ~/.cache/tradingstrategy/

Apple macOS on M1 ARM CPUs
--------------------------

Some dependencies, namely `numpy` are notorious difficult to install on new M1 CPU based Macs.
Here are some instructions for Macs only:

Before running installer, make sure you use OpenBLAS correctly from Homebrew:

.. code-block::shell

    brew install openblas
    export OPENBLAS="$(brew --prefix openblas)"

Running Jupyter notebooks with pdb based debuggers
--------------------------------------------------

You can run the notebooks from console:

.. code-block::shell

    ipython --TerminalIPythonApp.file_to_run=notebooks/pancakeswap-ema-b.ipynb

Then any `pdb` or `ipdb` breakpoints will work correctly.

Manually setting up Jupyter kernel for Visual Studio Code
---------------------------------------------------------

Create kern

.. code-block:: shell

    # First activate virtual env
    python3 -m ipykernel install --user --name=testx

Then

Visual Studio Code or PyCharm hangs at a notebook progress bar (tqdm)
---------------------------------------------------------------------

You might need ot increase the kernel IOPub limits.
The only way to do this for now is to start the kernel from the command line and
then give it this as an option.

.. code-block:: shell

  # Default is 1000/s
  jupyter server --ServerApp.iopub_msg_rate_limit 10000

Then use Visual Studio Code or PyCharm "Connect to remote kernel" feature
to connect this kernel you started from the command line yourself.
Then run the notebook.

