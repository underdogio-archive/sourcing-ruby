require 'sourcing'
require 'pp'

Sourcing.api_key = ENV['SOURCING_KEY']

pp Sourcing::Person[email: 'info@eribium.org']