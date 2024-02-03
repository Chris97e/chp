{% load modifier %}

{% comment %}
# @description: Link dektop for header
# Used to show links in desktop menu
# @param {href} href: url of direction
# @param {string} title: tile of the link
# @param {string} target: target of the a
# @param {string} custom_class: custom_class (Optional)
{% endcomment %}

{% with block_class="link-desktop" %}
<li>
    <a class="{{ block_class }} {% firstof custom_class '' %}{% if size %}{{block_class|modifier:size}}{% endif %}{% if request.path == href %}{{block_class|modifier:'active'}}{% endif %}" href="{% firstof href '#' %}" {% if target %}
        target="{{ target }}" {% endif %}>
        {% firstof title 'title' %}
    </a>
</li>
{% endwith %}