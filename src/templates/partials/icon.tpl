{% load static %}

{% comment %}
# @description: Icon used across the website
# @param {string} icon: Icon ID
# @param {string} class_name: class name of the svg
{% endcomment %}

{% with block_class="svg" %}
    {% if icon %}
        <svg class="{% if class_name %}{{ class_name }}{% endif %}">
            <use xlink:href="{% static 'svg/icons.svg#'|add:icon %}"></use>
        </svg>
    {% endif %}
{% endwith %}