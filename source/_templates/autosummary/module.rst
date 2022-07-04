{{ fullname | partial_name | escape | underline}}

*{{ fullname }}* module.

.. rubric:: Description

.. automodule:: {{ fullname }}

.. currentmodule:: {{ fullname }}

{% if classes %}
.. rubric:: Classes

.. autosummary::
    :toctree: .
    {% for class in classes %}
    {{ class }}
    {% endfor %}

{% endif %}

{% if functions %}
.. rubric:: Functions

.. autosummary::
    :toctree: .
    {% for function in functions %}
    {{ function }}
    {% endfor %}
{% endif %}

{% if modules %}
.. rubric:: Modules

.. autosummary::
   :toctree:
   :recursive:
{% for item in modules %}
   {{ item }}
{%- endfor %}
{% endif %}