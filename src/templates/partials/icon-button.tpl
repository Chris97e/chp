{% load static %}
{% load element %}

{% comment %}
# @description: Icon Button
# Button used to interact with the page
# @param {string} icon: ID of the icon
# @param {string} custom_class: custom_class (Optional)
{% endcomment %}

{% with block_class="icon-button"  %}
  {% if icon %}
    <button class="{{ block_class }} {% firstof custom_class '' %}">
      {% include "partials/icon.tpl" with icon=icon class_name=block_class|element:'icon' %}
    </button>
  {% endif %}
{% endwith %}