{% comment %}
# @description: Footer of the site
{% endcomment %}

{% with block_class="footer" %}
<footer class="{{block_class}}">
  {% include "partials/footerinfo.tpl" %}
  {% include "partials/footernotes.tpl" %}
</footer>
{% endwith %}