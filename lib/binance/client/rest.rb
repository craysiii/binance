
require 'faraday'
require 'faraday_middleware'

require_relative 'rest/sign_request_middleware'
require_relative 'rest/timestamp_request_middleware'

require_relative 'rest/public_api'
require_relative 'rest/account_api'
require_relative 'rest/withdraw_api'
require_relative 'rest/user_data_api'

require_relative 'rest/api_endpoints'

module Binance
  module Client
    # Public: Client with methods mirroring the Binance REST APIs
    class REST
      # Public: String base url for REST client to use
      BASE_URL = 'https://www.binance.com'.freeze

      include PublicAPI
      include AccountAPI
      include WithdrawAPI
      include UserDataAPI

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
        @library = {}
        @library[:public] = public_client adapter
        @library[:account] = account_client api_key, secret_key, adapter
        @library[:withdraw] = withdraw_client api_key, secret_key, adapter
        @library[:user_data] = user_data_client api_key, adapter
      end

      private

      def public_client(adapter)
        Faraday.new(url: "#{BASE_URL}/api") do |conn|
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          conn.adapter adapter
        end
      end

      def account_client(api_key, secret_key, adapter)
        Faraday.new(url: "#{BASE_URL}/api") do |conn|
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          conn.headers['X-MBX-APIKEY'] = api_key
          conn.use TimestampRequestMiddleware
          conn.use SignRequestMiddleware, secret_key
          conn.adapter adapter
        end
      end

      def withdraw_client(api_key, secret_key, adapter)
        Faraday.new(url: "#{BASE_URL}/wapi") do |conn|
          conn.request :url_encoded
          conn.response :json, content_type: /\bjson$/
          conn.headers['X-MBX-APIKEY'] = api_key
          conn.use TimestampRequestMiddleware
          conn.use SignRequestMiddleware, secret_key
          conn.adapter adapter
        end
      end

      def user_data_client(api_key, adapter)
        Faraday.new(url: "#{BASE_URL}/api") do |conn|
          conn.response :json, content_type: /\bjson$/
          conn.headers['X-MBX-APIKEY'] = api_key
          conn.adapter adapter
        end
      end

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
        response = @library[api].send(method) do |req|
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
