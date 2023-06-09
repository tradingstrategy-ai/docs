.. _strategy monitoring:

Website and monitoring
======================

After deploying your strategy either through :ref:`hot wallet deployment` or :ref:`vault deployment`,
it can start trading immediately.

You will still need to want to

- See how the strategy performs

- Set up alerts for error conditions like software crashes and gas spikes

Preface
-------

`trade-executor` offers multiple ways to report what it is doing

- Website frontend (lives in `Trading Strategy frontend repositry <https://github.com/tradingstrategy-ai/frontend/>`__)

- Discord alerts

- Logstash centralised logging

- Docker logs

Exposing the webhook port using a reverse HTTP proxy
----------------------------------------------------

After the `trade-executor` is running, its :ref:`webhook` is functional.
You still need to map HTTPS reverse proxy
that exposes `trade-executor` webhook to the world.

- `trade-executor` webhook server is read by the web frontend,
  monitoring tools

- We need to have a DNS name which points to our trade executor

- We need to map this DNS name to our server and our
  server needs to have a web server at ports 80 and 443
  to proxy the traffic

Here is an example how to configure `Caddyfile` subdomain for the trade executor webhook.
We do not cover how to run Caddy in these instructions,
more examples can be found in `proxy-server repository <https://github.com/tradingstrategy-ai/proxy-server/blob/master/Caddyfile>`__.

.. code-block:: text

    #
    # pancake-eth-usd-sma trade executor
    #
    # See https://tradingstrategy.ai/docs for details.
    # Internal 19003 port is set in docker-compose.yml
    #
    http://pancake-eth-usd-sma.example.com {
        reverse_proxy 127.0.0.1:19003
    }

.. note ::

    http:// or https:// in Caddy depends on how your server traffic is configured.
    For details see Caddy documentation.

Point your DNS service to have `A` and `AAAA` subdomains for `pancake-eth-usd-sma`.

After restaring Caddy with the new configutaion, you can do the same ping test as
we did using the localhost interface earlier. This time, we are using the
world exposed URL.

Perform the command your your local computer:

.. code-block:: shell

    curl https://pancake-eth-usd-sma.example.com/ping

This should give you the JSON result:

.. code-block:: text

    {"ping": "pong"}

Web frontend
------------

Trading Strategy SvelteKit based web frontend provides user interface for the strategy execution.

- The frontend runs as its independent web server using SvelteKit's built-in Vite
  web server, plus any number of reverse proxies like Cloudflare

- The frontend pulls the data from the trade executor over the webhook interface

Available strategies displayed on the website are configured in `TS_PUBLIC_STRATEGIES`
environment variable passed to the frontend when it is launched. This is usually done
when the Docker instance of the frontend is restarted.

- To test the frontend updates, you can run the frontend locally, you just need Node and NPM.
  The instructions are in `README <https://github.com/tradingstrategy-ai/frontend/>`_.

- Edit the `.env file <https://github.com/tradingstrategy-ai/frontend/blob/master/.env>`__
  on tbe production server to include the new strategy information

- `TS_PUBLIC_STRATEGIES` is a JSON encoded list of JavaScript objects

- For each strategy you need `id`, `name`, and webhook `url`

- Restart Docker instance

- Visit on `/strategies` landing page to see your new strategy is now showing up

`For more information, see frontend Github repository <https://github.com/tradingstrategy-ai/frontend/>`_.

Discord notifications
---------------------

A strategy can report its status to Discord.

- `trade-executor` takes this setting in `DISCORD_WEBHOOK_URL` configuration variable

- Create a Discord channel

- Choose Channel settings > *Integrations* > *Create Webhook*

- Name your webhook the same as your strategy

- Store the Discord webhook URL as `DISCORD_WEBHOOK_URL` in the secrets configuration file

Logstash logging
----------------

Logstash provides centralised logging server where multiple applications can send their logs.

- Better security and auditability as logs are centrally managed and secured

- Good search functionality over logs, allowing to diagnose issues faster

- Logstash is using unauthenticated UDP for log streams: you need to authenticate
  any logger using firewall IP address based whitelisting

A `trade-executor` can send its Python logs to LogStash using `LogStash adapter <https://github.com/tradingstrategy-ai/python-logstash>`__.

For further configuration about LogStash logging, see `python-logstash` documentation.

Monitoring the Docker container
-------------------------------

The Docker container is set up in such a way that it won't crash
in the case `trade-execution` fails with a Python exception

- The instance and its webhook service stay up despite `trade-executor` stopping

- You can read the status of the `trade-executor` is running back from `/status` endpoint

- `See /status documentation here <https://github.com/tradingstrategy-ai/spec/blob/main/trade-executor-api.yaml>`_.

Thus, the normal `docker-compose` restart policies are not working. Any trade execution restart
should be done only manually.

You can check the status if `trade-executor` is running by:

.. code-block:: shell

    curl http://localhost:19003/status | jq

.. code-block:: text

    {
      "last_refreshed_at": 1669801614.073565,
      "executor_running": true,
      "completed_cycle": null,
      "exception": null
    }


For any uptime monitoring you can check the status of `executor_running` field
to confirm the trade executor is properly running.