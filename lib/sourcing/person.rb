module Sourcing
  class Person < Base
    path '/v1/people'

    def self.find(values, options = {})
      unless values.is_a?(Hash)
        values = {:id => values}
      end

      options = options.dup
      params  = options.delete(:params) || {}

      if key = options.delete(:api_key)
        options.merge!(
          auth_type: :bearer,
          password: key
        )
      end

      if email = values[:email]
        self.new(get(uri(:email, email), params, options))

      elsif twitter = values[:twitter]
        self.new(get(uri(:twitter, twitter), params, options))

      elsif github = values[:github]
        self.new(get(uri(:github, github), params, options))

      elsif id = values[:id]
        self.new(get(id, params, options))

      else
        raise ArgumentError, 'Invalid values'
      end

    rescue Nestful::ResourceNotFound
    end

    class << self
      alias_method :[], :find
    end
  end
end