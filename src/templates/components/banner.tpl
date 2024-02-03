{% load element %}

{% comment %}
# @description: Banner for Homepage
{% endcomment %}

{% with block_class="banner-home"%}
<ul class="{{block_class}}" data-comp="HomeSlider">
    {% for slide in self.slides %}
        {% cycle '' '' 'work'  as id silent %}
        {% include "components/slide.tpl" with slide=slide first=forloop.first loop_counter=forloop.counter id=id %}
    {% endfor %}
</ul>
{% endwith %}