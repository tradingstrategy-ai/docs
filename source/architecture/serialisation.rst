.. _serialisation:

Serialisation
=============

The strategy :ref:`state` is serialised as JSON

- The raw state is written to the disk as a flat JSON file

- The web frontend downloads the same JSON file to display the strategy execution
  state to the user

- State is defined as nested, tree-like, structure of Python :py:mod:`dataclass` classes

Here are some gotchas.

Serialisation library
---------------------

Python `dataclasses-json` library is used to seralise everything.

Dates
-----

JSON does not have native date type.

Dates are serialised as UTC UNIX timestamps, or integer seconds
since 1970.

Prices
------

Because we are doing algorithmic trading, not accounting,
prices do not need to be exact.

Prices are serialised as floats.

Accounting quantities
---------------------

Numbers needing accounting purposes, like quantity of token holdings,
are presented by Python :py:class:`decimal.Decimal`. Because JSON
cannot present these numbers, they are serialised as infinite accurate
strings.

Inline token and trading pair identifiers
-----------------------------------------

Token and trading pair identifiers are not passed by a reference,
lie trading pair id or address, but by a copy. This copy contains
information like token names and decimals. This information
is duplicated in every copy, making this inefficient, but it
greatly simplifies client side and executor side coding,
because the :ref:`trading universe` may be dynamic.


