# Messaged configuration

# ==> User Configuration
# The name of the class your app uses for your users.
# By default the engine will use 'User' but if you have another name
# for your user class - change it here.
Messaged.user_class = 'User'

# This method is used by Messaged controllers and views to fetch the currently signed-in user
Messaged.current_user_method = :"current_#{Messaged.user_class_name.demodulize.underscore}"

# User avatar URL. rails_gravatar gem is used by default:
Messaged.avatar_url = ->(user) { RailsGravatar.src(user.email, 156, 'mm') }

# ==> Multi-tenant Configuration
# The name of the class your app uses for your tenants.
# By default the engine will use nil (in other words, tenancy in the
# application is not assumed). If you have another name
# for your tenant class - change it here. Example: 'Account'
Messaged.tenant_class = nil

# This method is used by Messaged controllers and views to fetch the currently signed-in user
Messaged.current_tenant_method = :"current_#{Messaged.tenant_class.demodulize.underscore}"
