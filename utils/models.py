from django.db import models

from wagtail.admin.panels import FieldPanel, MultiFieldPanel

class Costumer(models.Model):

    name = models.CharField( max_length=50)
    position = models.CharField( max_length=50)
    company = models.ForeignKey('utils.Company', null=True, on_delete=models.SET_NULL)
    photo = models.ForeignKey("wagtailimages.Image", null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )
    

    panels = [
        MultiFieldPanel(
            [
                FieldPanel("name"),
                FieldPanel("position"),
                FieldPanel('photo')
            ],
            heading="Costumer Information"
        ),
         MultiFieldPanel(
            [
                FieldPanel('company')
            ],
            heading="Costumer Company"
        )
    ]
    
    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name = "Costumer"
        verbose_name_plural = "Costumers"

class Company(models.Model):

    name = models.CharField(max_length=50)
    website = models.URLField(blank=True, null=True)
    photo = models.ForeignKey("wagtailimages.Image", null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )

    panels = [
        MultiFieldPanel(
            [
                FieldPanel("name"),
                FieldPanel("website"),
                FieldPanel('photo')
            ],
            heading="Company Information"
        )
    ]
    
    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name = "Company"
        verbose_name_plural = "Companies"

