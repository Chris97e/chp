{% load modifier %}
{% load replace_tag %}
{% load element %}

{% comment %}
# @description: Slide for the banner of homepage
{% endcomment %}

{% with block_class="banner-slide" %}
<li class="{{block_class}} {{block_class|modifier:loop_counter}} {% firstof custom_class '' %}"
  {% if id %}
    id="{{id}}"
  {% endif %}
>
  <div class="{{block_class|element:'content'}}">
    <div class="{{block_class|element:'copy'}}">
      <div class="{{block_class|element:'head'}}">
        {% if first %}
          <h1 class="title-h1">{{slide.title|replace_tag:'p,span'}}</h1>
        {% else %}
          <h2 class="title-h1">{{slide.title|replace_tag:'p,span'}}</h2>
        {% endif %}

        {% if slide.subtitle %}
          <h2 class="title-h6">{{slide.subtitle|replace_tag:'p,span'}}</h2>
        {% endif %}
      </div>

      <p class="{{block_class|element:'body'}} body">{{slide.body|replace_tag:'p,span'}}</p>
    </div>

    {% if loop_counter == 1 %}
      {% include "partials/button.tpl" with title='Check Work' icon='icon-arrow-right' href="#work" only%}
    {% endif %}

  </div>
  {% if loop_counter == 1 %}
    <div class="{{block_class|element:'wave-container'}}">
      {% include "partials/wave-green.tpl" with class_name=block_class|element:'wave-green' %}
      {% include "partials/wave-black.tpl" with class_name=block_class|element:'wave-black' %}
    </div>
  {% endif %}

  {% if loop_counter == 2 %}
    <div class="{{block_class|element:'wave-container-2'}}">
      {% include "partials/wave-black.tpl" with class_name=block_class|element:'wave-black-2' %}
    </div>
  {% endif %}
</li>
{% endwith %}