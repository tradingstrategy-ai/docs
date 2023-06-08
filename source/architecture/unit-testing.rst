Unit testing
============

Unit testing

- Ensures :py:mod:`tradeexecutor` module internally acts coherently

- Helps to do quick smoke tests on strategies

Pytest based
------------

Unit tests are written using pytest library.

Debug data
----------

Each :ref:`strategy cycle` takes in a Python dictionary called `cycle_debug_data`

- This dictionary can contain anything, and unlike state, does not need
  to be JSON serialisable

- The content of this dictionary should not be used to make trading decisions

- The strategies can write internal flags and such into this dta

- Unit tests can inspect this debug data to see if strategy is working

- In live trading, this data is discarded after each cycle

See :ref:`decide_trades` function.