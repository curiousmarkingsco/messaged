# Messaged
A Rails Engine for Hotwire Turbo-powered instant messaging.

## Usage
TODO: How to use Messaged. (finish below)

Messages broadcast to the DOM element id `messages`
```html
<div id="messages"></div>
```

TODO: Add option for `rails g messaged:views`

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

### Dependencies
It is recommended, particularly for development, to have a websockets compatible web server.
```ruby
gem "puma"
```

## Contributing
See [CONTRIBUTING.md](https://github.com/ianrandmckenzie/messaged/blob/main/CONTRIBUTING.md)

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
See also: [LICENSE.txt](https://github.com/ianrandmckenzie/messaged/blob/main/LICENSE.txt)