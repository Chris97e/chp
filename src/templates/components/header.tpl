{% load element %}

{% comment %}
# @description: Header of the site
{% endcomment %}

{% with block_class="header" %}
<header class="{{block_class}} header--hide-on-scroll-down" data-comp="Header">
    <div class="{{block_class|element:'left'}}">
        {% include "partials/logo.tpl" %}
        {% include "partials/menu-desktop.tpl" %}
    </div>
    <div class="{{block_class|element:'right'}}">
        {% include "partials/social-networks.tpl" %}
        {% include "partials/button.tpl" with title="Let's talk" icon='icon-arrow-right' size='small' type='secondary' only %}
    </div>
    {% include "partials/icon-button.tpl" with icon="icon-menu" custom_class=block_class|element:'open-mobile' %}
    {% include "partials/menu-mobile.tpl" %}
</header>
{% endwith %}