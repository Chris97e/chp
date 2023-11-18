{% load static %}
{% load element %}
{% load modifier %}

{% comment %}
# @description: Button
# Button used to interact with the page
# @param {string} icon: ID of the icon
# @param {title} string: title of the button
# @param {string} custom_class: custom_class (Optional)
# @param {string} size: size of the logo (Optional)
#   - s: small
#   - m: medifum -> default
#   - l: Large
# @param {string} type: Color of the logo over backgrounds
#   - primary: Default
#   - secondary: Color of the logo over black background
# @param {string} theme: theme of the button
#   - light: Default
#   - dark: shadows are dark
{% endcomment %}

{% with block_class="main-button" %}
  {% if title %}
    <a class="button {{ block_class }}{% if size %}{{ block_class|modifier:size }}{% endif %}{% if type %}{{ block_class|modifier:type }}{% endif %}{% if theme %}{{ block_class|modifier:theme }}{% endif %} {% firstof custom_class '' %}"
      {% if href %}
        href="{{href}}"
      {% endif %}
    >
      {{ title }}
      <div class="{{block_class|element:'icon-container'}}">
        {% include "partials/icon.tpl" with icon=icon class_name=block_class|element:'icon' %}
      </div>
    </a>
  {% endif %}
{% endwith %}