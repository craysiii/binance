
require 'faraday'
require_relative 'rest/public_api'
require_relative 'rest/account_api'
require_relative 'rest/withdraw_api'

module Binance
  module Client
    # Provides low level methods for Binance APIs via their REST interface
    class REST
      BASE_URL = 'https://www.binance.com'.freeze

      include REST::Public_API
      include REST::Account_API
      include REST::Withdraw_API

      def initialize(api_key: '', secret_key: '')
        @api_key = api_key
        @secret_key = secret_key
      end

      def self.add_query_param(query, key, value)
        query = query.to_s
        query << '&' unless query.empty?
        query << "#{Faraday::Utils.escape key}=#{Faraday::Utils.escape value}"
      end
    end
  end
end
