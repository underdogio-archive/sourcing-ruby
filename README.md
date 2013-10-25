# Sourcing

A Ruby API client to [https://sourcing.io](https://sourcing.io).

## Installation

Add this line to your application's Gemfile:

    gem 'sourcing'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sourcing

## Usage

First authorize requests by setting the API key found on your [account's settings page](https://sourcing.io/profile).

    Sourcing.api_key = ENV['SOURCING_KEY']

Then you can lookup people by email address:

    person = Sourcing::Person[email: 'info@eribium.org']

    pp person if person

If the person can't be found, then `nil` will be returned.