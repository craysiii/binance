
require 'faraday'
require_relative 'rest/api_endpoints'
require_relative 'rest/public_api'
require_relative 'rest/account_api'
require_relative 'rest/withdraw_api'

module Binance
  module Client
    # Public: Client with methods mirroring the Binance REST APIs
    class REST
      # Public: String base url for REST client to use
      BASE_URL = 'https://www.binance.com'.freeze

      # Gets populated by the different APIs that get extended by the instances
      @api = {}

      class << self
        attr_accessor :api
      end

      attr_reader :api_key, :secret_key, :adapter

      # Public: Initialize a REST Client
      #
      # :api_key    - The String API key to authenticate (Default = '').
      #
      # :secret_key - The String secret key to authenticate (Default = '').
      #
      # :adapter    - The Faraday::Adapter to be used for the client
      #               (Default = Faraday.default_adapter).
      def initialize(api_key: '', secret_key: '',
                     adapter: Faraday.default_adapter)
        @api_key = api_key
        @secret_key = secret_key
        @adapter = adapter

        extend Public_API
        extend Account_API
        extend Withdraw_API
      end

      private

      # Internal: Create a request that hits one of the REST APIs
      #
      # api - The Symbol that represents which API to use.
      #
      # method - The Symbol that represents which HTTP method to use.
      #
      # endpoint - The String that represents which API endpoint to request
      #            from.
      #
      # options - The Hash which hosts various REST query params. (Default = {})
      #           Each endpoint will have their own required and optional
      #           params.
      def request(api, method, endpoint, options = {})
        conn = REST.api[api].call
        response = conn.send(method) do |req|
          req.url API_ENDPOINTS[endpoint]
          req.params.merge! options
        end

        response.body
      end

      # Internal: Append key-value pair to REST query string
      #
      # query - The String of the existing request query url.
      #
      # key   - The String that represents the param type.
      #
      # value - The String that represents the param value.
      def self.add_query_param(query, key, value)
        query = query.to_s
        query << '&' unless query.empty?
        query << "#{Faraday::Utils.escape key}=#{Faraday::Utils.escape value}"
      end
    end
  end
end
