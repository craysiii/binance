
require 'faraday'
require 'faraday_middleware'
require_relative 'sign_request_middleware'
require_relative 'timestamp_request_middleware'

module Binance
  module Client
    class REST
      # API endpoints with require a timestamp and signature,
      # as well as requiring url_encoded parameters
      module Withdraw_API
        def self.extended(base)
          REST.api[:withdraw] = lambda do
            Faraday.new(url: "#{BASE_URL}/wapi") do |conn|
              conn.request :url_encoded
              conn.response :json, content_type: /\bjson$/
              conn.headers['X-MBX-APIKEY'] = base.api_key
              conn.use TimestampRequestMiddleware
              conn.use SignRequestMiddleware, base.secret_key
              conn.adapter Faraday.default_adapter
            end
          end
        end

        def withdraw(options)
          request :withdraw, :post, 'withdraw', options
        end

        def deposit_history(options = {})
          request :withdraw, :get, 'depositHistory', options
        end

        def withdraw_history(options = {})
          request :withdraw, :get, 'withdrawHistory', options
        end

        def deposit_address(options)
          request :withdraw, :get, 'depositAddress', options
        end
      end
    end
  end
end