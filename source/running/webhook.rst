.. _webhook:

Webhook server
==============

The webhook server allows web frontends to display the current
status of a trade executor.

- Open positions

- Current profit and loss, performance

- Logs and error conditions

About the server
----------------

- The server is written in Pyramid web framework

- The server API is specified as OpenAPI

- The default port of the server is `3456`

- The server is safe to expose to public Internet,
  assuming the underlying strategy is public

State download
--------------

- A trade executor persits is state as a JSON blob

- This JSON blob is described by :py:mod:`tradeexecutor.state`

- The web frontend download the whole state as a single blob
  download from the webhook server

