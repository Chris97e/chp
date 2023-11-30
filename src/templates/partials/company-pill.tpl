{% load element %}
{% load modifier %}
{% load wagtailimages_tags %}

{% comment %}
# @description: Costumer Pill
# Holder for image customer
# @param {string} add: to use add icon
# @param {wagtail Image} image: image of the costumer
{% endcomment %}

{% with block_class="company-pill" %}
<li class="{{block_class}}{% if add %}{{block_class|modifier:'add'}}{% endif %}">
  {% if add %}
    <div class="{{block_class|element:'shadow'}}">
    </div>
    {% include "partials/icon.tpl" with icon='icon-plus' class_name=block_class|element:'icon' only %}
  {% else %}
    {% picture image format-{jpeg,webp} width-{100} height-{100} class=block_class|element:'shadow' %}
    {% picture image format-{jpeg,webp} width-{100} height-{100} class=block_class|element:'image' %}
  {% endif %}
</li>
{% endwith %}