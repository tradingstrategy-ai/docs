.. _managing docker images:

Managing Docker images
======================

In this section, we discuss how to install and run `trade-executor` :ref:`Docker` images.

Preface
-------

`trade-executor` is distributed as a Docker image.
`Trade executor Docker images are available in Github Container Registry <https://github.com/tradingstrategy-ai/trade-executor/pkgs/container/trade-executor>`_.

.. image:: docker-image.drawio.svg

- The image name is `ghcr.io/tradingstrategy-ai/trade-executor`

- The Docker image packages Python interpreter and `trade-executor` co`mmand

- It is automatically downloaded when you run `docker` or `docker-compose` command

- Always pin down the Docker image version to a known good version for yourself

- There shouldn't be need to build your own Docker image, though we provide instructions
  for this for developers later on

- The image is distributed using Github's Container Registry (ghcr.io) -
  you need to `docker login` to this registry to download the image

Installing Docker
-----------------

- For macOS use Docker for Mac
- [For Ubuntu](https://docs.docker.com/engine/install/ubuntu/):

```shell
sudo -i
apt install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Make ubuntu user to use Docker
# Note: not the safest method
usermod -aG docker ubuntu

# Restart need to change to takes effect
reboot now
```

Login to GHCR
-------------

Docker images are distributed on Github Container Registry.
The access is public, but you need to have an access token through your
Github account.

To enable docker login to Github see `how to set up Github access token to download Docker images from GHCR <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry>`_.

- `Create a personal access tokens in Developer settings of your Github account <https://github.com/settings/tokens>`__.

- You need an access token to publish, install, and delete private, internal, and public packages:
  `repo:*`.

When you find your token you can do:

.. code-block:: shell

    GITHUB_USERNAME=miohtama
    # Your Personal Access Token (classic)
    CR_PAT=ghp_mmc...
    docker login ghcr.io --username=$GITHUB_USERNAME --password=$CR_PAT

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

.. _docker compose example:

Docker Compose example
----------------------

After Docker runs from the command line, you can create a `docker-compose.yml` entry for your strategy.
Compose configuration files are how :ref:`Docker` containers and instances are run.

You need to pass in local file system folders, or create a Docker volumes for

- `strategy/`, or any path where your strategy module is

- `state/` where your strategy persistent state is stored

- `cache/` where downloaded datasets are stored

- For webhook port we use `19006` in the example below.
  This needs to be any open ane unoccupied localhost port on your server.

Example `docker-compose.yml`:

.. code-block:: yaml

    version: "3.9"

    # The base template for trade-executor live trading
    x-trade-executor: &default-trade-executor
      image: ghcr.io/tradingstrategy-ai/trade-executor:${TRADE_EXECUTOR_VERSION}
      # All live executors have internal exception recovery mechanism,
      # If trade executor stops it must be manually restarted.
      # However webhook server stays around and can still take commands
      # even if the trade executor loop has stopped.
      restart: "no"
      mem_swappiness: 0
      volumes:
        # Map the path from where we load the strategy Python modules
        - ./strategy:/usr/src/trade-executor/strategy
        # Save the strategy execution state in the local filesystem
        - ./state:/usr/src/trade-executor/state
        # Cache the dataset downloads in the local filesystem
        - ./cache:/usr/src/trade-executor/cache
        # Save the log files to the local file system
        - ./logs:/usr/src/trade-executor/logs

      # This is the default trade-executor command to
      # launch as a daemon mode.
      # There are several subcommands.
      command: start

    services:

      enzyme-polygon-eth-usdc:
        <<: *default-trade-executor
        container_name: enzyme-polygon-eth-usdc
        ports:
          - "127.0.0.1:19006:3456"
        env_file:
          - ~/secrets/enzyme-polygon-eth-usdc-final.env

We pin down our `trade-executor` version using `TRADE_EXECUTOR_VERSION` environment variable.
`See the repo for stable versions <https://github.com/tradingstrategy-ai/trade-executor/>`__.
**Do not use latest tag as it is unstable, unless you build the Docker image yourself**.

.. code-block:: shell

    export TRADE_EXECUTOR_VERSION=v13

Now we can try this out. We invoke `hello` subcommand
to see that the application launches correctly.

.. code-block:: shell

    docker-compose run enzyme-polygon-eth-usdc version

Missing env files
~~~~~~~~~~~~~~~~~

If you have several services in the same `docker-compose.yml` and `docker-compose` complains about missing `.env`
files you can simply create empty files. E.g. `touch ~/pancake-eth-usd-sma-final.env`.