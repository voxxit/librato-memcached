# Librato::Memcached

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'librato-memcached', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install librato-memcached

## Usage

Submitting metrics is quite easy:

```shell
$ export MEMCACHE_SERVERS="localhost:11211,10.0.0.1:11212,..."
$ export LIBRATO_EMAIL="user@example.com"
$ export LIBRATO_TOKEN="..."
$ librato-memcached
```

And you're done! `librato-memcached` will keep submitting metrics every 60 seconds until you quit the process.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

1. Fork it: https://github.com/voxxit/librato-memcached/fork
2. Create a feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request: https://github.com/voxxit/librato-memcached/compare
