
require 'faraday'
require 'faraday_middleware'
require_relative 'sign_request_middleware'
require_relative 'timestamp_request_middleware'

module Binance
  module Client
    class REST
      # API endpoints that require a timestamp and signature
      module Account_API
        def self.extended(base)
          REST.api[:account] = lambda do
            Faraday.new(url: "#{BASE_URL}/api") do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.headers['X-MBX-APIKEY'] = base.api_key
              conn.use TimestampRequestMiddleware
              conn.use SignRequestMiddleware, base.secret_key
              conn.adapter base.adapter
            end
          end
        end

        def create_order(options)
          request :account, :post, 'order', options
        end

        def create_test_order(options)
          request :account, :post, 'order/test', options
        end

        def query_order(options)
          request :account, :get, 'order', options
        end

        def cancel_order(options)
          request :account, :delete, 'order', options
        end

        def open_orders(options)
          request :account, :get, 'openOrders', options
        end

        def all_orders(options)
          request :account, :get, 'allOrders', options
        end

        def account_info(options = {})
          request :account, :get, 'account', options
        end

        def account_trade_list(options)
          request :account, :get, 'myTrades', options
        end
      end
    end
  end
end