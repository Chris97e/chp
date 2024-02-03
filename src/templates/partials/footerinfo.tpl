{% load element %}

{% comment %}
# @description: Info of the footer
{% endcomment %}

{% with block_class="footerinfo" %}

<div class="{{block_class}}">
  <div class="{{block_class|element:'content'}}">

    {% include "partials/logo.tpl" with size="l" over="black" custom_class=block_class|element:'logo' only %}

    <div class="{{block_class|element:'contact'}}">
      <h5 class="{{block_class|element:'title'}} title-h5">Say Hello</h5>
      <ul class="{{block_class|element:'links'}}">
        <li>
          {% include "partials/icon-link.tpl" with icon="icon-email" text="hello@chp.world" list=True only %}
        </li>
        <li>
          {% include "partials/icon-link.tpl" with icon="icon-phone" text="+57 316 796 4707" list=True only %}
        </li>
        <li>
          {% include "partials/icon-link.tpl" with icon="icon-docs" text="Curriculum vitae"  list=True only %}
        </li>
      </ul>
    </div>

    <div class="{{block_class|element:'navegation'}}">
      <h5 class="{{block_class|element:'title'}} title-h5">Navegation</h5>
      <ul class="{{block_class|element:'links'}}">
        <li>
          {% include "partials/icon-link.tpl" with text="• Home" only %}
        </li>
        <li>
          {% include "partials/icon-link.tpl" with text="• Work" only %}
        </li>
        <li>
          {% include "partials/icon-link.tpl" with text="• About" only %}
        </li>
        <li>
          {% include "partials/icon-link.tpl" with text="• Contact" only %}
        </li>
      </ul>
    </div>

    <ul class="{{block_class|element:'social-networks'}}">
      <li>
        {% include "partials/icon-button.tpl" with border="true" icon="icon-instagram" over="black" href="https://www.instagram.com/chris.97e/" target="_blank" %}
      </li>
      <li>
        {% include "partials/icon-button.tpl" with border="true" icon="icon-tumblr" over="black" href="https://www.tumblr.com/blog/chp" target="_blank" %}
      </li>
      <li>
        {% include "partials/icon-button.tpl" with border="true" icon="icon-linkedin" over="black" href="https://www.linkedin.com/in/chp97e/" target="_blank" %}
      </li>
    </ul>
  </div>
</div>
{% endwith %}