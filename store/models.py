from django.db import models


# Create your models here.
class Address(models.Model):
    address = models.CharField(max_length=50)
    address2 = models.CharField(max_length=50, blank=True)
    district = models.CharField(max_length=20)
    city = models.ForeignKey('store.City')
    postal_code = models.CharField(max_length=10, blank=True)
    phone = models.CharField(max_length=20)
    last_update = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'addresses'

    def __unicode__(self):
        return self.address


class City(models.Model):
    name = models.CharField(max_length=50)
    country = models.ForeignKey('store.Country')
    last_update = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'cities'

    def __unicode__(self):
        return self.name


class Country(models.Model):
    name = models.CharField(max_length=50)
    last_update = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'countries'

    def __unicode__(self):
        return self.name


class Customer(models.Model):
    store = models.ForeignKey('store.Store')
    first_name = models.CharField(max_length=45)
    last_name = models.CharField(max_length=45)
    email = models.CharField(max_length=50, blank=True)
    address = models.ForeignKey('store.Address')
    activebool = models.BooleanField()
    create_date = models.DateField()
    last_update = models.DateTimeField(auto_now=True, blank=True, null=True)
    active = models.IntegerField(blank=True, null=True)

    def __unicode__(self):
        return '%s, %s' % (self.last_name, self.first_name)


class Inventory(models.Model):
    film = models.ForeignKey('films.Film')
    store = models.ForeignKey('store.Store')
    last_update = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'inventory'

    def __unicode__(self):
        return self.film.title


class Payment(models.Model):
    customer = models.ForeignKey('store.Customer')
    staff = models.ForeignKey('store.Staff')
    rental = models.ForeignKey('store.Rental')
    amount = models.DecimalField(max_digits=5, decimal_places=2)
    payment_date = models.DateTimeField()

    def __unicode__(self):
        return 'Payment for %s' % self.film.title


class Rental(models.Model):
    rental_date = models.DateTimeField()
    inventory = models.ForeignKey('store.Inventory')
    customer = models.ForeignKey('store.Customer')
    return_date = models.DateTimeField(blank=True, null=True)
    staff = models.ForeignKey('store.Staff')
    last_update = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return 'Rental for %s' % self.inventory.film.title


class Staff(models.Model):
    first_name = models.CharField(max_length=45)
    last_name = models.CharField(max_length=45)
    address = models.ForeignKey('store.Address')
    email = models.CharField(max_length=50, blank=True)
    store = models.ForeignKey('store.Store')
    active = models.BooleanField()
    username = models.CharField(max_length=16)
    password = models.CharField(max_length=40, blank=True)
    last_update = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'staff'

    def __unicode__(self):
        return '%s, %s' % (self.last_name, self.first_name)


class Store(models.Model):
    manager_staff = models.ForeignKey('store.Staff', unique=True, related_name='store_manager')
    address = models.ForeignKey('store.Address')
    last_update = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return 'Store at %s' % self.address
