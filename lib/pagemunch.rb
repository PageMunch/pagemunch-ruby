require "pagemunch/version"
require "pagemunch/configurable"
require 'faraday'
require 'faraday_middleware'

module Pagemunch
  class << self
    include Configurable

    def summary(url)
      conn.get do |req|
        req.url "#{base_url}summary.json"
        req.params['url'] = url
      end
    end

    def classify(url)
      conn.get do |req|
        req.url "#{base_url}classify.json"
        req.params['url'] = url
      end
    end

    private

    def base_url
      "http://api.pagemunch.com/#{configuration['version']}/"
    end

    def conn
      return @conn if @conn
      @conn =  Faraday.new(:url => base_url) do |faraday|
        faraday.request  :json
        faraday.response :json
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      @conn.params['key'] = configuration['key']
      @conn.headers['User-Agent'] = "pagemunch-ruby (#{Pagemunch::VERSION})"
      @conn
    end

  end
end
