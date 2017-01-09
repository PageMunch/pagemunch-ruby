require_relative "./pagemunch/version"
require_relative "./pagemunch/configurable"
require 'faraday'
require 'faraday_middleware'

module Pagemunch
  class << self
    include Configurable

    def extract(url)
      conn.get do |req|
        req.url "#{base_url}extract"
        req.params['url'] = url
      end
    end

    private

    def base_url
      "https://api.pagemunch.com/"
    end

    def conn
      return @conn if @conn
      @conn =  Faraday.new(:url => base_url) do |faraday|
        faraday.request  :json
        faraday.response :json
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      @conn.params['apiKey'] = configuration['key']
      @conn.headers['User-Agent'] = "pagemunch-ruby (#{Pagemunch::VERSION})"
      @conn
    end
  end
end
