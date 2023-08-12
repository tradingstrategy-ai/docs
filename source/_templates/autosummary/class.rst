{{ name | escape | underline }}

.. currentmodule:: {{ module }}

.. meta::
    :description: {{ fullname|extract_object_docstring }}
    :title: {{ name }} {{ objtype }} in {{ fullname|extract_mod_path }}

API documentation for `{{ fullname }}` Python class in Trading Strategy framework.

.. currentmodule:: {{ module }}

.. autoclass:: {{ objname }}
   :members:
   :show-inheritance:

   {% block methods %}
   .. automethod:: __init__

   {% if methods %}
   .. rubric:: Methods

   .. autosummary::
   {% for item in methods %}
      ~{{ name }}.{{ item }}
   {%- endfor %}
   {% endif %}
   {% endblock %}

   {% block attributes %}
   {% if attributes %}
   .. rubric:: Attributes

   .. autosummary::
   {% for item in attributes %}
      ~{{ name }}.{{ item }}
   {%- endfor %}
   {% endif %}
   {% endblock %}


