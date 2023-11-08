{% load static %}
{% load element %}
{% load modifier %}

{% comment %}
# @description: Menu desktop
# Holder the menu desktop 
{% endcomment %}

{% with block_class="nav-desktop" %}
<nav class="{{block_class}}">
    <ul class="{{block_class|element:'links'}}">
        {% include "partials/link-desktop.tpl" with title="Home" href="/" %}
        {% include "partials/link-desktop.tpl" with title="Projects" href="/projects" %}
        {% include "partials/link-desktop.tpl" with title="About" href="/about" %}
        {% include "partials/link-desktop.tpl" with title="Contact" href="/contact" %}
    </ul>
</nav>
{% endwith %}