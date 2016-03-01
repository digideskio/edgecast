require 'httparty'
require 'json'

module Edgecast
  class CDN
    PLATFORM_HTTP_LARGE = 3
    PLATFORM_HTTP_SMALL = 8

    include HTTParty
    base_uri "https://api.edgecast.com"

    def initialize(account_number, api_key)
      @account_number = account_number
      @api_key = api_key
    end

    def headers
      {
        "Authorization" => "TOK:#{@api_key}",
        "Content-Type" => "application/json",
        "Accept" => "application/json"
      }
    end

    def asset_description(asset)
      {
        "MediaPath" => "#{asset}",
        "MediaType" => Edgecast::CDN::PLATFORM_HTTP_SMALL
      }
    end

    def purge(asset)
      options = {
        :body => asset_description(asset).to_json,
        :headers => headers
      }
      self.class.put("/v2/mcc/customers/#{@account_number}/edge/purge",options)
    end

    def load(asset)
      options = {
        :body => asset_description(asset).to_json,
        :headers => headers
      }
      self.class.put("/v2/mcc/customers/#{@account_number}/edge/load",options)
    end
  end
end
