{% load element %}

{% comment %}
# @description: Menu mobile
# Holder the menu for mobile version
{% endcomment %}

{% with block_class="nav-mobile" %}
<nav class="{{block_class}}" aria-hidden="true">
    <span class="{{block_class|element:'main'}}">
        <div class="{{block_class|element:'close-container'}}">
            {% include "partials/icon-button.tpl" with icon="icon-close" no_border="true" custom_class=block_class|element:'close'%}
        </div>
        <div class="{{block_class|element:'menu-container'}}">
            <p class="{{block_class|element:'date'}} addorment-small">2023</p>
            <ul class="{{block_class|element:'links'}}">
                {% include "partials/link-mobile.tpl" with title="Home" href="/" %}
                {% include "partials/link-mobile.tpl" with title="Project" href="/projects" %}
                {% include "partials/link-mobile.tpl" with title="About" href="/about" %}
                {% include "partials/link-mobile.tpl" with title="Contact" href="/contact" %}
                <li aria-hidden="true">
                    {% include "partials/icon.tpl" with icon="icon-wave-menu" class_name=block_class|element:'icon-wave' %}
                </li>
            </ul>
            <div class="{{block_class|element:'footer'}}">
                <ul class="{{block_class|element:'networks'}}">
                    {% include "partials/link-mobile.tpl" with size="small" title="Instagram" href="https://www.instagram.com/chris.97e/" target="_blank" %}
                    <li class="addorment-small">/</li>
                    {% include "partials/link-mobile.tpl" with size="small" title="Tumblr" href="https://www.tumblr.com/blog/chp" target="_blank" %}
                    <li class="addorment-small">/</li>
                    {% include "partials/link-mobile.tpl" with size="small" title="LinkedIn" href="https://www.linkedin.com/in/chp97e/" target="_blank" %}
                </ul>
                {% include "partials/logo.tpl" with over="green" %}
                {% include "partials/icon.tpl" with icon="icon-keep" class_name=block_class|element:'icon-keep' %}
            </div>
        </div>
    </span>
</nav>
{% endwith %}