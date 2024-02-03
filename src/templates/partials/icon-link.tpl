{% load modifier %}
{% load element %}

{% comment %}
# @description: Icon Link
# Simply icon link used specially on the footer
# @param {string} icon: ID of the icon
# @param {string} text: text of the link
# @param {string} custom_class: custom_class (Optional)
# @param {string} url: url direction (Optional)
{% endcomment %}

{% with block_class="icon-link" %}
<a class="{{ block_class }}{% if list %}{{ block_class|modifier:'list' }}{% endif %} {% firstof custom_class '' %}" href="{% firstof url '#' %}">
  {% if icon %}
    {% include "partials/icon.tpl" with icon=icon class_name=block_class|element:'icon' %}
  {% endif %}
  <span class="{{ block_class|element:'text' }} body-small">
    {{ text }}
  </span>
</a>
{% endwith %}