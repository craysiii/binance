
require 'faraday'
require 'faraday_middleware'
require_relative 'sign_request_middleware'
require_relative 'timestamp_request_middleware'

module Binance
  module Client
    class REST
      # API endpoints that require a timestamp and signature
      module Account_API
        def account_api
          Faraday.new(url: "#{BASE_URL}/api/v3") do |conn|
            conn.request :json
            conn.response :json, content_type: /\bjson$/
            conn.headers['X-MBX-APIKEY'] = @api_key
            conn.use TimestampRequestMiddleware
            conn.use SignRequestMiddleware, @secret_key
            conn.adapter Faraday.default_adapter
          end
        end

        def create_order(options)
          response = account_api.post do |req|
            req.url 'order'
            req.params.merge! options
          end
          response.body
        end

        def query_order(options)
          response = account_api.get do |req|
            req.url 'order'
            req.params.merge! options
          end
          response.body
        end

        def cancel_order(options)
          response = account_api.delete do |req|
            req.url 'order'
            req.params.merge! options
          end
          response.body
        end

        def open_orders(options)
          response = account_api.get do |req|
            req.url 'openOrders'
            req.params.merge! options
          end
          response.body
        end

        def all_orders(options)
          response = account_api.get do |req|
            req.url 'allOrders'
            req.params.merge! options
          end
          response.body
        end

        def account_info(options = {})
          response = account_api.get do |req|
            req.url 'account'
            req.params.merge! options
          end
          response.body
        end

        def account_trade_list(options)
          response = account_api.get do |req|
            req.url 'myTrades'
            req.params.merge! options
          end
          response.body
        end
      end
    end
  end
end