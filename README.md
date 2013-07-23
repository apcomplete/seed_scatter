# SeedScatter

SeedScatter is a gem that adds utility and organization to Ruby on Rails seed files by scattering them into multiple files.

SeedScatter allows you to:

* Separate seeds into model specific files
* Dump model information already in the database to their respective seed files

## Installation

Add it to your Gemfile:

    gem 'seed_scatter'

And then run:

    $ bundle install

Or install it yourself as:

    $ gem install seed_scatter

## Usage

SeedScatter overrides the default rake task `db:seed` to separate seeds.  Seeding is still just as easy as it was before:

    $ rake db:seed

To dump a specific model's information from the database to a seed file:

    $ rake db:harvest[MODEL_NAME]

To dump all of your models' information from the database to their respective seed files:

    $ rake db:harvest

To re-seed a specific model:

    $ rake db:reseed[MODEL_NAME]

## Todos

* Support for namespaced models
* Support for join tables

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
