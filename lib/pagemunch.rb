require "pagemunch/version"
require "pagemunch/configurable"
require 'faraday'
require 'faraday_middleware'

module Pagemunch
  class << self
    include Configurable

    def summary(url)
      conn.get "#{base_url}summary.json", {key:configuration['key'], url:url}
    end

    private

    def base_url
      "http://api.pagemunch.com/#{configuration['version']}/"
    end

    def conn
      @conn ||= Faraday.new(:url => base_url) do |faraday|
        faraday.request  :json
        faraday.response :json
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

  end
end
