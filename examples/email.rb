require 'sourcing'
require 'pp'

Sourcing.key = ENV['SOURCING_KEY']

pp Sourcing::Person[email: 'info@eribium.org']