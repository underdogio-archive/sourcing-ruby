require 'nestful'
require 'sourcing/version'

module Sourcing
  def self.key=(value)
    Base.options = {
      :auth_type => :bearer,
      :password  => value
    }
  end

  class Base < Nestful::Resource
    endpoint 'https://api.sourcing.io'
  end

  autoload :Person, 'sourcing/person'
end