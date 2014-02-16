from django.contrib import admin

from store.models import (Address, City, Country, Customer, Inventory, Payment,
                          Rental, Staff, Store)


# Register your models here.
class AddressAdmin(admin.ModelAdmin):
    pass


class CityAdmin(admin.ModelAdmin):
    pass


class CountryAdmin(admin.ModelAdmin):
    pass


class CustomerAdmin(admin.ModelAdmin):
    pass


class InventoryAdmin(admin.ModelAdmin):
    pass


class PaymentAdmin(admin.ModelAdmin):
    pass


class RentalAdmin(admin.ModelAdmin):
    pass


class StaffAdmin(admin.ModelAdmin):
    pass


class StoreAdmin(admin.ModelAdmin):
    pass


admin.site.register(Address, AddressAdmin)
admin.site.register(City, CityAdmin)
admin.site.register(Country, CountryAdmin)
admin.site.register(Customer, CustomerAdmin)
admin.site.register(Inventory, InventoryAdmin)
admin.site.register(Payment, PaymentAdmin)
admin.site.register(Rental, RentalAdmin)
admin.site.register(Staff, StaffAdmin)
admin.site.register(Store, StoreAdmin)
