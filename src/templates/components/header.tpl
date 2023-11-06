{% load modifier %}
{% load static %}
{% load element %}

{% comment %}
# @description: Header of the site
{% endcomment %}

{% with block_class="header" %}
<header class="{{block_class}}" data-comp="Header">
    {% include "partials/logo.tpl" %}
    {% include "partials/icon-button.tpl" with icon="icon-menu" custom_class=block_class|element:'open-mobile' %}
    {% include "partials/menu-mobile.tpl" %}
</header>
{% endwith %}