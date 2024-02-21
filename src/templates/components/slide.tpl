{% load modifier %}
{% load replace_tag %}
{% load element %}

{% comment %}
# @description: Slide for the banner of homepage
# @param {string} id: id of the slide
# @param {string} loop_counter: loop number
{% endcomment %}

{% with block_class="home-banner-slide" %}
<li class="{{block_class}}{{block_class|modifier:loop_counter}} {% firstof custom_class '' %}" {% if id %} id="{{id}}" {% endif %}>
  <div class="{{block_class|element:'content'}}">
    
    {% if slide.title%}
      <h1 class="{{block_class|element:'title'}} title-h1" {% if not first %} role="heading" aria-level="2" {% endif %}>
        {% if loop_counter == 2 %}
          {% for word in slide.title.split %}
            {% if forloop.last %}
            <span class="{{block_class|element:'word'}}">
              <span class="{{block_class|element:'word-emphasis'}}"></span>
              {{ word }}
            </span>
            {% else %}
              {{ word | safe }}
            {% endif %}
          {% endfor %}
        {% else %}
          {{slide.title | safe}}
        {% endif %}
      </h1>
    {% endif %}

    {% if slide.subtitle %}
      <h2 class="{{block_class|element:'subtitle'}} title-h6">{{slide.subtitle|replace_tag:'p,span'}}</h2>
    {% endif %}

    {% if slide.body %}
      <p class="{{block_class|element:'body'}} body">{{slide.body|replace_tag:'p,span'}}</p>
    {% endif %}
    
    {% if loop_counter == 1 %}
      {% include "partials/button.tpl" with title='Check Work' icon='icon-arrow-right' custom_class=block_class|element:'button' href="#work" only%}
    {% endif %}
  </div>

  {% if loop_counter != 3 %}
    <div class="{{block_class|element:'wave-container'}} {{block_class|element:'wave-container'}}-{{loop_counter}}">
      {% if loop_counter == 1 %}{% include "partials/wave-green.tpl" with class_name=block_class|element:'wave-green' %}{% endif %}
      {% include "partials/wave-black.tpl" with class_name=block_class|element:'wave-black' %}
    </div>
  {% endif %}
</li>
{% endwith %}