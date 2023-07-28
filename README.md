# Messaged
A Rails Engine for Hotwire Turbo-powered instant messaging.

The author would personally recommend against using this Gem if your Rails application is not built for Turbo Rails.

As seen on PalmerTrolls on YouTube!

![Video of Ben Palmer using `messaged` through a prank website](https://www.youtube.com/watch?v=5cDe5vkq9cs)

## Installation
Add this line to your application's Gemfile:

```ruby
gem "messaged"
```

And then execute:
```bash
bundle
```

Or install it yourself as:
```bash
gem install messaged
```

Generate the needed migrations and initializer:
```bash
rails generate messaged:install
rails messaged:install:migrations
```

### Importmap

If you do not yet have importmap-rails added to your application, be sure to add `config/importmap.rb`:
```ruby
# config/importmap.rb
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
```

## Usage
Messages broadcast to the DOM element id `messages`
```html
<div id="messages"></div>
```

To get started with a basic HTML structure, run in your terminal: `rails generate messaged:views`

If you're using this engine or `turbo-rails` for the first time, it is recommended to generate the views to familiarize yourself with how turbo tags are used when turbo streaming.

### Routes

If you're starting a fresh application, ensure your application has a root path.
```ruby
# For example:
root to: "home#index"
```

Next, set up your ActionCable routes if you haven't already.
```ruby 
mount ActionCable.server => '/cable'
```

Lastly, mount the Messaged engine's paths.
```ruby
mount Messaged::Engine => "/messaged"
```

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

## Other Info
Messaged is intended to be named through the nomenclature used in [Noticed](https://github.com/excid3/noticed), in part because Collin and I met through the GoRails Discord server (owned by @excid3).
—Ian

## TODO
* Complete adding rich_text support
* Complete multi-tenant support
* Create and finish the test suite via TestKit

### TODO on `bleeding` pre-merge
* Add documentation about how to extend messages and rooms
	*	If not for anyone else, do it for future you
* Add to docs about how it is up to the dev to determine how messages/rooms are authorized
