{% load element %}
{% load modifier %}
{% load wagtailimages_tags %}

{% comment %}
# @description: Card Testimony
# Holder testimony
# @param {image} image: image of the person
# @param {string} name: full name of the person
# @param {string} position: company role of the person
# @param {string} description: caption testimony
{% endcomment %}

{% with block_class="testimony-card" %}
<li class="{{block_class}}">
  {% picture costumer.photo format-{jpeg,webp} width-{142} height-{162} class=block_class|element:'photo' %}
  <div class="{{block_class|element:'content'}}">
    <div class="{{block_class|element:'head'}}">
      <h4 class="{{block_class|element:'title'}} title-h6">{{ costumer.name }}</h4>
      <h5 class="{{block_class|element:'position'}} body-small">{{ costumer.position }}</h5>
    </div>
    <p class="{{block_class|element:'testimony'}} body-small">{{ testimony }}</p>
  </div>
</li>
{% endwith %}