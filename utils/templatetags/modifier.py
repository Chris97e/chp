from django import template

register = template.Library()

@register.filter
def modifier(block, arg):
  print(arg)
  if arg == '':
    return ''
  else:
    return ' ' + block + '--' + arg
