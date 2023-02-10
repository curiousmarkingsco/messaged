# Messaged configuration

# ==> User Configuration
# The name of the class your app uses for your users.
# By default the engine will use 'User' but if you have another name
# for your user class - change it here.
Messaged.user_class = 'User'

# This method is used by Messaged controllers and views to fetch the currently signed-in user
Messaged.current_user_method = :current_user

# ==> Multi-tenant Configuration
# The name of the class your app uses for your tenants.
# By default the engine will use nil (in other words, tenancy in the
# application is not assumed). If you have another name
# for your tenant class - change it here. Example: 'Account'
# Messaged.tenant_class = 'Account'
# Messaged.current_tenant_method = :current_account

# This method is used by Messaged controllers and views to fetch the currently signed-in user
# Messaged.current_tenant_method = :"current_#{Messaged.tenant_class_name.demodulize.underscore}"
