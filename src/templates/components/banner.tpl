{% load modifier %}
{% load static %}
{% load element %}

{% comment %}
# @description: Banner for Homepage
{% endcomment %}

{% with block_class="banner-home" slide_class="banner-slide"%}
<ul class="{{block_class}}">
    {% for slide in self.slides %}
        {% cycle slide_class|modifier:'first' slide_class|modifier:'second' slide_class|modifier:'third' as slide_loop_class silent %}
        {% include "components/slide.tpl" with slide=slide first=forloop.first loop_counter=forloop.counter custom_class=slide_loop_class %}
    {% endfor %}
</ul>
{% endwith %}