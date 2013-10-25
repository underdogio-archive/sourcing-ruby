require 'nestful'
require 'sourcing/version'

module Sourcing
  def self.api_key=(value)
    Base.options = {
      :auth_type => :bearer,
      :password  => value
    }
  end

  def self.key=(value)
    self.api_key = value
  end

  class Base < Nestful::Resource
    endpoint 'https://api.sourcing.io'
  end

  autoload :Person, 'sourcing/person'
end