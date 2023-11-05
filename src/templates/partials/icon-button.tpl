{% load static %}
{% load element %}

{% comment %}
# @description: Main Site Logo
# Main logo to use it across the site.
# @param {string} icon: ID of the icon
# @param {string} size: size of the logo (Optional)
# - m: default Size -> 72px
# - xs: extra small -> 18px
# - s: small -> 32px
# - l: Large -> 120px
# - xl: Extra Large -> 240px
# @param {string} over: Color of the logo over backgrounds
# - white: Default
# - black: Color of the logo over black background
# - green: Color of the logo over green background
{% endcomment %}

{% with block_class="icon-button"  %}
<button class="{{ block_class }}">
  <svg class="{{ block_class|element:'icon' }}">
    {% if icon %}
    <use xlink:href="{% static 'svg/icons.svg#'|add:icon %}"></use>
    {% endif %}
  </svg>
</button>
{% endwith %}