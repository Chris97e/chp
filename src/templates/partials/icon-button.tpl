{% load static %}
{% load element %}
{% load modifier %}

{% comment %}
# @description: Icon Button
# Button used to interact with the page
# @param {string} icon: ID of the icon
# @param {boolean} no_border: add a border to the button
# @param {string} custom_class: custom_class (Optional)
{% endcomment %}

{% with block_class="icon-button"  %}
  {% if icon %}
    <button class="{{ block_class }}{% if no_border %}{{ block_class|modifier:'no-border' }}{% endif %} {% firstof custom_class '' %}">
      {% include "partials/icon.tpl" with icon=icon class_name=block_class|element:'icon' %}
    </button>
  {% endif %}
{% endwith %}