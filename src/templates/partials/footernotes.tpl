{% load element %}

{% comment %}
# @description: foonote for legal information
{% endcomment %}

{% with block_class="footernotes" %}
<div class="{{block_class}}">
  <ul class="{{block_class|element:'content'}}">
    <li class="{{block_class|element:'note'}} body-small"><span>2023 All rights reserved ©</span></li>
    <li class="{{block_class|element:'note'}} body-small"><span>Move foward.</span></li>
  </ul>
</div>
{% endwith %}