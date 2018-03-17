require 'net-http2'

require_relative '../rest'
require_relative 'signed_full_path'


module Binance
  module Client
    # Public: Client with methods mirroring the Binance REST APIs
    class REST::HTTP2

      include Binance::Client::REST::PublicAPI
      include Binance::Client::REST::AccountAPI
      include Binance::Client::REST::WithdrawAPI

      # Public: Initialize a REST Client
      #
      # :api_key    - The String API key to authenticate
      # :secret_key - The String secret key to authenticate
      def initialize(api_key: nil, secret_key: nil)
        @api_key = api_key
        @secret_key = secret_key
      end

      def call_async(api_request)
        client.call_async(api_request)
      end

      def call(api_request)
        client.call(api_request.method, api_request.full_path).body
      end

      private

      def client
        @client ||= NetHttp2::Client.new(Binance::Client::REST::BASE_URL)
      end

      def request(api, http_method, api_method, params = {})
        case api
        when :public
          request_method = :public
          path = '/api/%s' % Binance::Client::REST::API_ENDPOINTS[api_method]
        when :public_withdraw
          request_method = :public
          path = '/wapi/%s' % Binance::Client::REST::API_ENDPOINTS[api_method]
        when :verified, :signed
          request_method = :timestamped
          path = '/api/%s' % Binance::Client::REST::API_ENDPOINTS[api_method]
        when :withdraw
          request_method = :timestamped
          path = '/wapi/%s' % Binance::Client::REST::API_ENDPOINTS[api_method]
        else
          raise TypeError, "Unknown request endpoint: #{api.inspect}"
        end
        send(request_method, http_method, path, params)
      end

      def public(http_method, path, params = {})
        client.prepare_request(http_method, path, params: params)
      end

      def verified(http_method, path, params = {})
        client.prepare_request(
          http_method, path,
          headers: { 'X-MBX-APIKEY' => @api_key },
          params: params
        )
      end

      def signed(http_method, path, params = {})
        verified(http_method, path, params).extend(Binance::Client::REST::SignedFullPath).tap do |request|
          request.set_secret(@secret_key)
        end
      end

      def timestamped(http_method, path, params = {})
        signed(
          http_method, path,
          params.merge('timestamp' => DateTime.now.strftime('%Q'))
        )
      end
    end
  end
end
