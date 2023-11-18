{% load element %}

{% comment %}
# @description: Caption
# Title, simple text, and call to action
{% endcomment %}

{% with block_class="caption" %}
<section class="{{block_class}}">

	<h3 class="{{block_class|element:'title'}}">
		<div class="{{block_class|element:'title-text'}}">
			<div class="title-h5">
				{{self.eyebrow}}
			</div>
			<div class="title-h3">
				{{self.title}}
			</div>
		</div>
	</h3>

	<div class="{{block_class|element:'divider'}}"></div>

	<div class="{{block_class|element:'content'}}">
		<p class="{{block_class|element:'description'}} body">
			{{ self.description }}
		</p>
		{% include "partials/button.tpl" with title='View all' icon='icon-arrow-right' only %}
	</div>
</section>

<div style="height: 200vh;"></div>
{% endwith %}