.. _profitability:

Profitability calculations
==========================

In this chapter, we discuss differerent ways to calcualte profitability of the trading strategy
and what are the trade offs.

Challenges come from the effects of deposits and redemptions:
a live trading strategy does not have a fixed capital over its life time
like a backtest.

For open strategies, there can deposits and redemptions any time.
This will affect the equity, cash and thus performance per dollar.
To make matters more complex, on :term:`vault` based strategies
the underlying positions can be reduced by a redemption event.

To understand if a strategy is performing well we can look

- Profit of trades

- Profit of assets under management

- Profit per share

- Profit for individual investors

Profitability as realised positions profit
------------------------------------------

This is the default measurement for profitability.

For most of use cases, we want to measure the trading performance of the strategy,
not the return on capital. The realised positions profit is simply % profitability
of closed positions during the time period.

.. warning::

    Currently :term:`vault` based strategies can do in-kind redemption
    which directly affects the underlying open trading positions.
    Currently this is not yet accounted on these positions.

Profit per share
----------------

:term:`Vault` based strategies have underlying share token.
We can calculate profit per share that is comparable
to a profit per share calculations in any corporation or a fund.

.. warning::

    Some vault implementations do profit sharing in the form minting new shares
    to the asset manager and diluting the depositors. This will affect profit per
    share calculations and comparisons.

Total equity
------------

The :term:`equity curve` shows the both trading profits and new deposits and redemptions.
It cannot be used to determine the :term:`trading strategy` profitability if
deposits and redemptions can happen any time.

Funding flow
------------

Funding flow shows US dollar valued deposits and redemptions over time.
It's main use case is to calculate funding flow corrected returns.

Funding flow corrected returns
------------------------------

The funding flow corrected returns is the daily/monthly returns
minus any deposits and redemptions.

Any large funding flow event will skew this calculation.
Although funding flow corrected returns may be used as a profitability
metric, it is still subject to skew by funding events.

Profit for individual investors
-------------------------------

For any individual investors, we can calculate how much profit
this investor has done for his/her position over time.

.. note::

    Currently this information is not available through the trade execution user interface.


