{% load element %}

{% comment %}
# @description: Testimonies
# Eyebrow, title, testimony-card
{% endcomment %}

{% with block_class="testimonies" %}
<section class="{{block_class}}">

  <h2 class="{{block_class|element:'header'}}">
    <span class="title-h5">{{ self.eyebrow }}</span>
    <span class="title-h3">{{ self.title }}</span>
  </h2>

  <ul class="{{block_class|element:'elements'}}">
    {% for item in self.testimony %}
      {% include "partials/testimony-card.tpl" with testimony=item.testimony costumer=item.costumer %}
    {% endfor %}
    <li class="{{block_class|element:'icon-holder'}}">
      {% include "partials/icon.tpl" with icon='icon-dots' class_name=block_class|element:'icon' %}
    </li>
  </ul>

</section>
{% endwith %}