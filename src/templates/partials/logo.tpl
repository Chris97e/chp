{% load static %}
{% load modifier %}

{% comment %}
  # @description: Main Site Logo
  # Main logo to use it across the site.
  # @param {string} size: size of the logo (Optional)
  #   - m: default Size -> 72px
  #   - xs: extra small -> 18px
  #   - s: small -> 32px
  #   - l: Large -> 120px
  #   - xl: Extra Large -> 240px
  # @param {string} over: Color of the logo over backgrounds
  #   - white: Default
  #   - black: Color of the logo over black background
  #   - green: Color of the logo over green background
{% endcomment %}

{% with block_class="logo-chp" %}
  <svg role="img" class="{{ block_class }}{% if size %}{{ block_class|modifier:size }}{% endif %}">
    <use xlink:href="{% static 'svg/logo.svg#chp' %}"></use>
  </svg>
{% endwith %}