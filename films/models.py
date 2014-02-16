from django.db import models


# Create your models here.
class Actor(models.Model):
    first_name = models.CharField(max_length=45)
    last_name = models.CharField(max_length=45)
    last_update = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return '%s, %s' % (self.last_name, self.first_name)


class Category(models.Model):
    name = models.CharField(max_length=25)
    last_update = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'categories'

    def __unicode__(self):
        return self.name


class Film(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    release_year = models.IntegerField(blank=True, null=True)
    language = models.ForeignKey('films.Language', related_name='films')
    original_language = models.ForeignKey('films.Language', blank=True, null=True, related_name='original_films')
    rental_duration = models.SmallIntegerField()
    rental_rate = models.DecimalField(max_digits=4, decimal_places=2)
    length = models.SmallIntegerField(blank=True, null=True)
    replacement_cost = models.DecimalField(max_digits=5, decimal_places=2)
    rating = models.CharField(max_length=5, blank=True)
    last_update = models.DateTimeField(auto_now=True)
    #special_features = models.TextField(blank=True) # This field type is a guess.

    categories = models.ManyToManyField('films.Category')
    actors = models.ManyToManyField('films.Actor')

    def __unicode__(self):
        return self.title


'''
class FilmActor(models.Model):
    actor = models.ForeignKey('films.Actor')
    film = models.ForeignKey('films.Film')
    last_update = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return 'Film %s Actor %s %s' % (self.film.title, self.actor.first_name, self.actor.last_name)


class FilmCategory(models.Model):
    film = models.ForeignKey('films.Film')
    category = models.ForeignKey('films.Category')
    last_update = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'film categories'

    def __unicode__(self):
        return 'Film %s Category %s' % (self.film.title, self.category.name)
'''


class Language(models.Model):
    name = models.CharField(max_length=20)
    last_update = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return self.name
