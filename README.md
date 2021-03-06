# DataMasker

Data Masker masks data like customer names in a quick and deterministic way to enable demos or other purposes without easily giving away user information. It provides realistic looking data. Currently, it supports people names and generates data from an US census data set. Future versions may add support for additional data types. Suggestions welcome.

Caveat emptor: this is not meant to necessarily stand up to attacks by a determined adversary (in the cryptographical sense). While this is usually OK for purposes like live demos, you might want to consider another solution if you want to release a data set for public consumption. Use at your own risk.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'data_masker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install data_masker

## Usage

Mask customer names

```ruby
masked_name = DataMasker::MaskedName.new('John Doe')
masked_name.first_name
# => Cecile
masked_name.initial
# => Q
masked_name.last_name
# => Price
masked_name.to_s
# => Cecile Q. Price
```

Set salt
```ruby
DataMasker.salt = 'NaCl'
masked_name = DataMasker::MaskedName.new('John Doe')
masked_name.to_s
# => "Louis P. Schrader"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/peakxu/data_masker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
