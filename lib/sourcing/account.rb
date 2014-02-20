module Sourcing
  class Account < Base
    path '/v1/account'

    def self.current
      self.new(get)
    end
  end
end