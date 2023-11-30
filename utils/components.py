from wagtail import blocks
from wagtail.images.blocks import ImageChooserBlock
from django.db import models
from wagtail.snippets.blocks import SnippetChooserBlock

class BannerBlock(blocks.StructBlock):

    slides = blocks.ListBlock(blocks.StructBlock([
        ('title', blocks.RichTextBlock(required=True, help_text="Add your title", max_length=160)),
        ('body', blocks.RichTextBlock(required=True, help_text="Add your description", max_length=160)),
        ('subtitle', blocks.CharBlock(required=False, help_text="Add your subtitle", max_length=100)),
        ('lottie', ImageChooserBlock(required=False, help_text="select your lottie")),
    ]))
    
    class Meta:
        template = "components/banner.tpl"
        icon = "image"
        label = "Banner"
    
    def __str__(self):
        return 'Banner'

class CaptionBlock(blocks.StructBlock):
    eyebrow = blocks.CharBlock(required=True, help_text="Add your eyebrow", max_length=50)
    title = blocks.CharBlock(required=True, help_text="Add your title", max_length=100)
    description = blocks.TextBlock(required=True, help_text="Add your description", max_length=300)

    class Meta:
        template = "components/caption.tpl"
        icon = "doc-full-inverse"
        label = "Caption"

class CompaniesBlock(blocks.StructBlock):
    number = blocks.CharBlock(required=True, help_text="Client Number", max_length=100)
    eyebrow = blocks.CharBlock(required=True, help_text="Eyebrow", max_length=20)
    title = blocks.CharBlock(required=True, help_text="Main title", max_length=20)
    description = blocks.TextBlock(required=True, help_text="Add your description", max_length=300)
    companies = blocks.ListBlock(blocks.StructBlock([
        ('company', SnippetChooserBlock('utils.Company')),
        ]))

    class Meta: 
        template = "components/companies.tpl"
        icon = "group"
        label= "Companies"

class TestimoniesBlock(blocks.StructBlock):
    eyebrow = blocks.CharBlock(required=True, help_text="Eyebrow", max_length=20)
    title = blocks.CharBlock(required=True, help_text="Title", max_length=32)
    testimony = blocks.ListBlock(blocks.StructBlock([
        ('costumer', SnippetChooserBlock('utils.Costumer')),
        ('testimony', blocks.TextBlock(required=True, help_text="Add your description", max_length=300))
        ]
    ))

    class Meta: 
        template = "components/testimonies.tpl"
        icon = "comment"
        label= "Testimonies"