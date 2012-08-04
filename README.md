# Rpg

This library aims to generate random (but correct!) <a href="http://en.wikipedia.org/wiki/PESEL">PESEL</a> numbers.

## Installation

Add this line to your application's Gemfile:

    gem 'rpg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rpg

## Usage

    # Generate pesel for female, born at March 14, 1988
    @pesel = Rpg::Pesel.new(gender: :female, date: "1988-03-14")
    @pesel.generate # => "88031469364"

    # date can be Date object as well:
    @pesel = Rpg::Pesel.new(gender: :male, date: Date.parse("1988-03-14"))
    @pesel.generate # => "88031443355"

    #if you don't specify gender, it will be random.
    @pesel = Rpg::Pesel.new(date: Date.parse("1960-10-10"))
    @pesel.generate # => "60101014058"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
