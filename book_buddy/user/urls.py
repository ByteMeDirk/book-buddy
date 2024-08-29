from django.urls import path

from .views import user_register, user_login, user_logout

urlpatterns = [
    path("user/register/", user_register, name="register"),
    path("user/login/", user_login, name="login"),
    path("user/logout/", user_logout, name="logout"),
]
