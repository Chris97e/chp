{% load static %}
{% load element %}
{% load modifier %}

{% comment %}
# @description: Social Networks
# Holder the social networks
{% endcomment %}

{% with block_class="nav-social-networks" %}
<nav class="{{block_class}}">
  <ul class="{{block_class|element:'links'}}">
    <li>
      {% include "partials/icon-button.tpl" with border="true" icon="icon-instagram" href="https://www.instagram.com/chris.97e/" target="_blank" %}
    </li>
    <li>
      {% include "partials/icon-button.tpl" with border="true" icon="icon-tumblr" href="https://www.tumblr.com/blog/chp" target="_blank" %}
    </li>
    <li>
      {% include "partials/icon-button.tpl" with border="true" icon="icon-linkedin" href="https://www.linkedin.com/in/chp97e/" target="_blank" %}
    </li>
  </ul>
</nav>
{% endwith %}