from django import template

register = template.Library()

@register.filter
def element(block, arg):
  if arg == '':
    return ''
  else:
    return block + '__' + arg
