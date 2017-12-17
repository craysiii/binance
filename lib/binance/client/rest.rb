
require 'faraday'
require_relative 'rest/api_endpoints'
require_relative 'rest/public_api'
require_relative 'rest/account_api'
require_relative 'rest/withdraw_api'

module Binance
  module Client
    # Provides low level methods for Binance APIs via their REST interface
    class REST
      BASE_URL = 'https://www.binance.com'.freeze

      # Gets populated by the different APIs that get extended by the instances
      @api = {}

      class << self
        attr_accessor :api
      end

      attr_reader :api_key, :secret_key, :adapter

      def initialize(api_key: '', secret_key: '', adapter: Faraday.default_adapter)
        @api_key = api_key
        @secret_key = secret_key
        @adapter = adapter

        extend Public_API
        extend Account_API
        extend Withdraw_API
      end

      def request(api, method, endpoint, options = {})
        conn = REST.api[api].call
        response = conn.send(method) do |req|
          req.url API_ENDPOINTS[endpoint]
          req.params.merge! options
        end

        response.body
      end

      def self.add_query_param(query, key, value)
        query = query.to_s
        query << '&' unless query.empty?
        query << "#{Faraday::Utils.escape key}=#{Faraday::Utils.escape value}"
      end
    end
  end
end
