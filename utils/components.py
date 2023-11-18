from wagtail import blocks
from wagtail.images.blocks import ImageChooserBlock

class BannerBlock(blocks.StructBlock):

    slides = blocks.ListBlock(blocks.StructBlock([
        ('title', blocks.RichTextBlock(required=True, help_text="Add your title", max_length=160)),
        ('body', blocks.RichTextBlock(required=True, help_text="Add your description", max_length=160)),
        ('subtitle', blocks.CharBlock(required=False, help_text="Add your subtitle", max_length=100)),
        ('lottie', ImageChooserBlock(required=False, help_text="select your lotie")),
    ]))

    class Meta:
        template = "components/banner.tpl"
        icon = "image"
        label = "Banner"

class CaptionBlock(blocks.StructBlock):
    eyebrow = blocks.CharBlock(required=True, help_text="Add your eyebrow", max_length=50)
    title = blocks.CharBlock(required=True, help_text="Add your title", max_length=100)
    description = blocks.TextBlock(required=True, help_text="Add your description", max_length=300)

    class Meta:
        template = "components/caption.tpl"
        icon = "doc-full-inverse"
        label = "Caption"