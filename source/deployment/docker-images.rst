.. _managing docker images:

Managing Docker images
======================

In this section, we discuss how to install and run `trade-executor` Docker images.

Preface
-------

`trade-executor` is distributed as a Docker image.
`Trade executor Docker images are avaible in Github Container Registry <https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor>`_.

.. image:: docker-image.drawio.svg

- The image name is `ghcr.io/tradingstrategy-ai/trade-executor`

- The Docker image packages Python interpreter and `trade-executor` command

- It is automatically downloaded when you run `docker` or `docker-compose` command

- Always pin down the Docker image version to a known good version for yourself

- There shouldn't be need to build your own Docker image, though we provide instructions
  for this for developers later on

- The image is distributed using Github's Container Registry (ghcr.io) -
  you need to `docker login` to this registry to download the image

The first run
-------------

Start by setting up a command-line shell for the latest version of `trade-executor`.
`See here for the latest trade-executor releases <https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor>`__.

.. code-block:: shell

    export TRADE_EXECUTOR_VERSION=v163 && export TRADE_EXECUTOR_IMAGE=ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}
    docker run $TRADE_EXECUTOR_IMAGE version

Should output:

.. code-block:: text

    Version: v163
    Commit hash: 2bb422a35d2643265e38204af022560544294c52
    Commit message: Fix build instructions

