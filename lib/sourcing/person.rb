module Sourcing
  class Person < Base
    path '/v1/people'

    def self.find(values, options = {})
      unless values.is_a?(Hash)
        values = {:id => values}
      end

      options = options.dup
      params  = options.delete(:params) || {}

      if email = values[:email]
        self.new(get(uri(:email, email), params, options))

      elsif twitter = values[:twitter]
        self.new(get(uri(:twitter, twitter), params, options))

      elsif github = values[:github]
        self.new(get(uri(:github, github), params, options))

      elsif name = values[:name]
        self.new(get(uri(:name, URI.escape(name)), params, options))

      elsif id = values[:id]
        self.new(get(id, params, options))

      else
        raise ArgumentError, 'Invalid values'
      end

    rescue Nestful::ResourceNotFound
    end

    def self.search(filters, params = {})
      post :search, params.merge(filters: filters)
    end

    class << self
      alias_method :[], :find
    end

    def tweets
      get :tweets
    end

    def notes
      get :notes
    end

    def create_note!(body)
      post :notes, body: body
    end

    def favorite!
      post :favorite
    end

    def unfavorite!
      delete :favorite
    end
  end
end