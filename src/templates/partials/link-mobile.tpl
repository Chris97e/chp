{% load static %}
{% load element %}
{% load modifier %}

{% comment %}
# @description: Link mobile
# Used to show links in mobie menu
# @param {href} href: url of direction
# @param {string} size: size of the text
# @param {string} title: tile of the link
# @param {string} target: target of the a
# @param {string} custom_class: custom_class (Optional)
{% endcomment %}

{% with block_class="link-mobile" %}

<li>
    <a class="{{ block_class }} {% firstof custom_class '' %}{% if size %}{{block_class|modifier:size}}{% endif %}{% if request.path == href %}{{block_class|modifier:'active'}}{% endif %}" href="{% firstof href '#' %}" {% if target %}
        target="{{ target }}" {% endif %}>
        {% firstof title 'title' %}
        {% include "partials/icon.tpl" with icon='icon-arrow-left' class_name=block_class|element:'icon' %}
    </a>
</li>
{% endwith %}