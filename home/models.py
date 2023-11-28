from django.db import models
from wagtail.models import Page
from wagtail.admin.panels import FieldPanel
from utils import components
from wagtail import blocks
from wagtail.fields import StreamField

class HomePage(Page):
    template = "pages/home.html"
    max_count = 1

    body = StreamField([
        ("Banner", components.BannerBlock()),
        ("Caption", components.CaptionBlock()),
        ("Costumers", components.CostumersBlock())
    ], use_json_field=True, null=True, blank=True)

    content_panels = Page.content_panels + [
        FieldPanel("body")
    ]
    
