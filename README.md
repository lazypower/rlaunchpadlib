# Rlaunchpadlib

[![Build Status](https://travis-ci.org/chuckbutler/rlaunchpadlib.svg?branch=master)](https://travis-ci.org/chuckbutler/rlaunchpadlib)
[![Code Climate](https://codeclimate.com/github/chuckbutler/rlaunchpadlib.png)](https://codeclimate.com/github/chuckbutler/rlaunchpadlib)
[![Coverage Status](https://coveralls.io/repos/chuckbutler/rlaunchpadlib/badge.png)](https://coveralls.io/r/chuckbutler/rlaunchpadlib)
[![Gem Version](https://badge.fury.io/rb/rlaunchpadlib.svg)](http://badge.fury.io/rb/rlaunchpadlib)

Launchpad.net API wrapper for ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'rlaunchpadlib'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rlaunchpadlib

## Usage

```ruby
person = Rlaunchpadlib::Person.new 'lazypower'
puts person.date_created
person.profile.inspect
```

You can optionally provide the fast_hash option which ensures that the keys to the Hash objects 
are symbols instead of strings.

```ruby
person = Rlaunchpadlib::Person.new 'lazypower', {:fast_hash => true}
puts person.date_created
person.profile.inspect
```

## Caveats

The Gem will initially be Read-only access to your launchpad data. 

## Roadmap

See: [Milestones](https://github.com/chuckbutler/rlaunchpadlib/issues/milestones) 



## Contributing

1. Fork it ( https://github.com/chuckbutler/rlaunchpadlib/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. **Add tests**
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
