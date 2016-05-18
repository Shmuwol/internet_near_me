# internet-near-me

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'internet_near_me'
```

And then execute:

    bundle

Or install it yourself as:

    gem install internet_near_me

## Usage

Open it with

    internet-near-me

Then enter a zip code

    Please enter your zip code:
    10023

It will display a list of the 10 nearest internet cafes:

    Internet cafes near 10023:
    --------------------
    1.
    Cafe Noi Espresso Bar
    387 Amsterdam Ave
    New York, NY 10024
    --------------------
    2.
    Irving Farm Coffee Roasters
    224 W 79th St
    New York, NY 10024
    --------------------
    3.
    Aroma Espresso Bar
    161 W 72nd St
    New York, NY 10023
    --------------------
    4.
    David Rubenstein Atrium
    61 W 62nd St
    New York, NY 10023
    --------------------
    5.
    Mille-Feuille Bakery
    2175 Broadway
    New York, NY 10036
    --------------------
    ...

You can then get details on one by entering a number:

    Enter a number to get more details or 'back' to enter a new zip code:
    1

    --------------------
    Cafe Noi Espresso Bar
    (212) 580-1315
    Today: 7:00 am - 7:00 pm
    4.0 stars (75 reviews)
    $$

You can then either enter `back` to change the zip code or another cafe number 
to get the details of. At any time you can type `exit` to leave the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lukegrecki/internet-near-me. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

