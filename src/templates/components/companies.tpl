{% load element %}

{% comment %}
# @description: Costumer
# Number, Eyebrow, title, description, and images
{% endcomment %}

{% with block_class="companies" %}
<section class="{{block_class}}">

  <div class="{{block_class|element:'left-content'}}">
    <h2 class="{{block_class|element:'header-tablet'}}">
      <span class="title-h2">+{{ self.number }}</span>
      <span class="{{block_class|element:'eyebrow'}}">
        <span class="title-h5">{{ self.eyebrow }}</span>
        <span class="{{block_class|element:'title'}} title-h3">{{ self.title }}</span>
      </span>
    </h2>
    <ul class="{{block_class|element:'images'}}">
      {% for item in self.companies %}
        {% include "partials/company-pill.tpl" with image=item.company.photo %}
      {% endfor %}
        {% include "partials/company-pill.tpl" with add='add' %}
    </ul>
  </div>

  <div class="{{block_class|element:'divider'}}"></div>

	<div class="{{block_class|element:'right-content'}}">
  
    <h2 class="{{block_class|element:'header'}}">
      <span class="{{block_class|element:'eyebrow'}}">
        <span class="title-h2">+{{ self.number }}</span>
        <span class="title-h5">{{ self.eyebrow }}</span>
      </span>
      <span class="{{block_class|element:'title'}} title-h3">{{ self.title }}</span>
    </h2>

		<p class="{{block_class|element:'description'}} body">
			{{ self.description }}
		</p>
		{% include "partials/button.tpl" with title='Join us' icon='icon-arrow-right' custom_class=block_class|element:'button' only %}
	</div>
</section>
{% endwith %}
