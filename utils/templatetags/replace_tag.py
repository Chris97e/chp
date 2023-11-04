from django import template
from bs4 import BeautifulSoup
from django.utils.safestring import mark_safe


register = template.Library()

@register.filter
def replace_tag(block, arguments):
  arg = arguments.split(',')
  tag_to_replace = arg[0]
  tag_to_include = arg[1]
  html = BeautifulSoup(str(block), 'html.parser')
  tags = html.find_all(tag_to_replace)

  for tag in tags:
    new_tag = html.new_tag(tag_to_include)
    new_tag.extend(tag.contents)
    tag.replace_with(new_tag)

  return mark_safe(str(html))
