from django.contrib import admin

from films.models import Actor, Category, Film, Language


# Register your models here.
class ActorAdmin(admin.ModelAdmin):
    pass


class CategoryAdmin(admin.ModelAdmin):
    pass


class FilmAdmin(admin.ModelAdmin):
    filter_horizontal = ('actors', 'categories')


class LanguageAdmin(admin.ModelAdmin):
    pass


admin.site.register(Actor, ActorAdmin)
admin.site.register(Category, CategoryAdmin)
admin.site.register(Film, FilmAdmin)
admin.site.register(Language, LanguageAdmin)
