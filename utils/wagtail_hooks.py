from wagtail.snippets.models import register_snippet

from utils.models import Costumer, Company

register_snippet(Costumer)
register_snippet(Company)