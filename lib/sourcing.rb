require 'nestful'
require 'sourcing/version'

module Sourcing
  def self.api_key=(value)
    Base.options Base.options.merge(
      :auth_type => :bearer,
      :password  => value
    )
  end

  def self.key=(value)
    self.api_key = value
  end

  class Base < Nestful::Resource
    endpoint 'https://api.sourcing.io'
    options :format => :json
  end

  autoload :Account, 'sourcing/account'
  autoload :Person, 'sourcing/person'
  autoload :User, 'sourcing/user'
end