# Messaged
A Rails Engine for Hotwire Turbo-powered instant messaging.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "messaged"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install messaged
```

Generate the needed migrations and initializer:
```bash
rails generate messaged:install
rails messaged:install:migrations
```

## Usage
Messages broadcast to the DOM element id `messages`
```html
<div id="messages"></div>
```

To get started with a basic HTML structure, run in your terminal: `rails generate messaged:views`

If you're using this engine or `turbo-rails` for the first time, it is recommended to generate the views to familiarize yourself with how turbo tags are used when turbo streaming.

### Users
Messaged assumes you have a user model. You may customize the user model name in the initializer. For example, if your user model is called Member:
```ruby
# config/initializers/messaged.rb
Messaged.user_class = 'Member'
Messaged.current_user_method = :current_member
```

### Tenants
Messaged does not assume the application is multi-tenant, but does support it. By default, `Messaged.tenant_class` is set to `nil`.
```ruby
# config/initializers/messaged.rb
Messaged.tenant_class = 'Account'
Messaged.current_tenant_method = :current_account
```

## Dependencies
It is recommended, particularly for development, to have a websockets compatible web server. This is true for production as well, but puma adds an easy way to support websockets without needing additional infrastructure from external services.
```ruby
gem "puma"
```

By default, Messaged is powered by:
```ruby
gem "rails", ">= 7.0.2.3"
gem "importmap-rails", "1.1.5"
gem "turbo-rails", "1.3.0"
```
If your application cannot support these gems, it is recommended that you do not use the Messaged engine. Alternatively, feel free to work this engine and add support for your desired setup. Pull requests are welcome, see: [CONTRIBUTING.md](https://github.com/ianrandmckenzie/messaged/blob/main/CONTRIBUTING.md)

## Contributing
See [CONTRIBUTING.md](https://github.com/ianrandmckenzie/messaged/blob/main/CONTRIBUTING.md)

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
See also: [LICENSE.txt](https://github.com/ianrandmckenzie/messaged/blob/main/LICENSE.txt)

## TODO
* Add dynamic configurations for message broadcasting to tenants (like an organization chat room), rooms (like a Discord channel), or users (like direct messages in most direct-messaging apps such as Signal)
* Figure out how to support permissioning/authorization (such as Pundit/Cancancan) without being opinionated
* Complete adding rich_text support
* Ensure I18n support for hard-coded English strings that are seen by the end-user
* Create and finish the test suite
