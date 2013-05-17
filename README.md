# SidekiqSquash

Sidekiq middleware notifies exceptions to Squash

## Installation

Add this line to your application's Gemfile:

    gem 'sidekiq_squash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq_squash

## Usage

Add the middleware to the Sidekiq server middleware.

```ruby
Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add SidekiqSquash::Middleware
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
