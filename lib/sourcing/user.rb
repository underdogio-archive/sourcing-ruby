module Sourcing
  class User < Base
    path '/v1/user'

    def self.current
      self.new(get)
    end
  end
end