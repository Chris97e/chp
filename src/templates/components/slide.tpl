{% load modifier %}
{% load replace_tag %}
{% load element %}

{% comment %}
# @description: Slide for the banner of homepage
{% endcomment %}

{% with block_class="banner-slide" %}
<li class="{{block_class}} {% if custom_class %}{{custom_class}}{% endif %}">
    <div class="{{block_class|element:'content'}}">
        <div class="{{block_class|element:'copy'}}">
            <div class="{{block_class|element:'head'}}">
                {% if slide.title %}
                    {% if first %}
                        <h1 class="title-h1">{{slide.title|replace_tag:'p,span'}}</h1>
                    {% else %}
                        <h2 class="title-h1">{{slide.title|replace_tag:'p,span'}}</h2>
                    {% endif %}
                {% endif %}

                {% if slide.subtitle %}
                    <h2 class="title-h6">{{slide.subtitle|replace_tag:'p,span'}}</h2>
                {% endif %}
            </div>

            {% if slide.body %}
                <p class="{{block_class|element:'body'}} body">{{slide.body|replace_tag:'p,span'}}</p>
            {% endif %}
        </div>

        {% if loop_counter == 3 %}
            {% include "partials/button.tpl" with title='Check Work' icon='icon-arrow-right' type='secondary' theme='dark' only %}
        {% else %}
            {% include "partials/button.tpl" with title='Check Work' icon='icon-arrow-right' only %}
        {% endif %}
    </div>
    {% if loop_counter == 1 %}
        {% include "partials/icon.tpl" with icon='icon-wave' class_name=block_class|element:'wave' %}
    {% endif %}
</li>
{% endwith %}