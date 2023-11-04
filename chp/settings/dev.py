from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-7wjl%jqxshg)2cnt+6gecg+j$jwx0)y&&x*v_hi3_5(!m@io4&"

# SECURITY WARNING: define the correct hosts in production!
ALLOWED_HOSTS = ["*"]

EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"
INSTALLED_APPS = INSTALLED_APPS + [
    "debug_toolbar"
]

MIDDLEWARE = MIDDLEWARE + [
    "debug_toolbar.middleware.DebugToolbarMiddleware"
]

INTERNAL_IPS = [
    "127.0.0.1",
    "127.17.0.1"
]

try:
    from .local import *
except ImportError:
    pass
