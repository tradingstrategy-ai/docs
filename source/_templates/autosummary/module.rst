{{ fullname | partial_name | escape | underline}}

Documentation for `{{ fullname }}` Python module in Trading Strategy.

.. meta::
    :description: {{ fullname|extract_module_docstring }}
    :title: {{ name }} {{ objtype }} in {{ fullname|extract_mod_path }}


Module description
------------------

.. automodule:: {{ fullname }}

.. currentmodule:: {{ fullname }}

{% if classes %}
Classes
-------

.. autosummary::
    :toctree: .
    {% for class in classes %}
    {{ class }}
    {% endfor %}

{% endif %}

{% if functions %}
Functions
---------

.. autosummary::
    :toctree: .
    {% for function in functions %}
    {{ function }}
    {% endfor %}
{% endif %}

{% if modules %}
Submodules
----------

.. autosummary::
   :toctree:
   :recursive:
{% for item in modules %}
   {{ item }}
{%- endfor %}
{% endif %}