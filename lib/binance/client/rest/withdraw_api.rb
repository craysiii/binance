
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
        def withdraw_api
          Faraday.new(url: "#{BASE_URL}/wapi/v3") do |conn|
            conn.request :url_encoded
            conn.response :json, content_type: /\bjson$/
            conn.headers['X-MBX-APIKEY'] = @api_key
            conn.use TimestampRequestMiddleware
            conn.use SignRequestMiddleware, @secret_key
            conn.adapter Faraday.default_adapter
          end
        end

        def withdraw(options)
          response = withdraw_api.post do |req|
            req.url 'withdraw.html'
            req.params.merge! options
          end
          response.body
        end

        def deposit_history(options = {})
          response = withdraw_api.get do |req|
            req.url 'depositHistory.html'
            req.params.merge! options
          end
          response.body
        end

        def withdraw_history(options = {})
          response = withdraw_api.get do |req|
            req.url 'withdrawHistory.html'
            req.params.merge! options
          end
          response.body
        end

        def deposit_address(options)
          response = withdraw_api.get do |req|
            req.url 'depositAddress.html'
            req.params.merge! options
          end
          response.body
        end
      end
    end
  end
end