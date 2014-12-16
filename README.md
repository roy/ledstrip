# Ledstrip

So you have a ledstrip? And you have a Raspberry Pi?

Let's combine the two and have some fun with ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'ledstrip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ledstrip

## Usage
``` ruby
strip = Ledstrip::Strip.new(30, Ledstrip::Type::LPD6803.new)

loop do
  30.times do |x|
    strip.leds[x].r = rand(255)
    strip.leds[x].g = rand(255)
    strip.leds[x].b = rand(255)
  end

  strip.draw
  sleep .5
end
```

## Current Status

Very much a work in progress, I haven't even tested it on the raspi yet as my strip is currently being shipped to me.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ledstrip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
