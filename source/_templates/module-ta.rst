{{ fullname | partial_name | escape | underline}}

*{{ fullname }}* module.

yyyyyxxx22
{{ functions }}
xxx

.. automodule:: {{ fullname }}
    :imported-members:


{% if functions %}
Functions
---------

.. autosummary::
    :toctree: .
    {% for function in functions %}
    {{ function }}
    {% endfor %}
{% endif %}
