{% load element %}

{% comment %}
# @description: Action Banner to take user to contact page
{% endcomment %}

{% with block_class="action-banner"%}
<section class="{{block_class}}">
    <div class="{{ block_class|element:'container' }}">
        <div class="{{ block_class|element:'heading' }}" role="heading" aria-label="{{ self.eyebrow }} {{ self.title}}">
            <span class="{{ block_class|element:'eyebrow' }} title-h5 ">{{ self.eyebrow }}</span>
            <span class="{{ block_class|element:'title' }} title-h2">{{ self.title }}</span>
        </div>
        {% include "partials/button.tpl" with title=self.button icon='icon-arrow-right' href="#contact" only%}
    </div>

    {% include "partials/wave-closing.tpl" with class_name=block_class|element:'wave' %}
    {% include "partials/wave-closing-black.tpl" with class_name=block_class|element:'wave-black' %}
</section>
{% endwith %}