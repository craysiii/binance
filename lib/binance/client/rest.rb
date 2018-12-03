require 'faraday'

require_relative 'rest/sign_request_middleware'
require_relative 'rest/timestamp_request_middleware'
require_relative 'rest/clients'
require_relative 'rest/endpoints'
require_relative 'rest/methods'

module Binance
  module Client
    class REST
      BASE_URL = 'https://api.binance.com'.freeze

      def initialize(api_key: '', secret_key: '',
                     adapter: Faraday.default_adapter, proxy: nil)
        @clients = {}
        @clients[:public]   = public_client adapter, proxy
        @clients[:verified] = verified_client api_key, adapter, proxy
        @clients[:signed]   = signed_client api_key, secret_key, adapter, proxy
        @clients[:withdraw] = withdraw_client api_key, secret_key, adapter, proxy
        @clients[:public_withdraw] = public_withdraw_client adapter, proxy
      end

      METHODS.each do |method|
        define_method(method[:name]) do |options = {}|
          response = @clients[method[:client]].send(method[:action]) do |req|
            req.url ENDPOINTS[method[:endpoint]]
            req.params.merge! options.map { |k, v| [camelize(k.to_s), v] }.to_h
          end
          response.body
        end
      end

      def self.add_query_param(query, key, value)
        query = query.to_s
        query << '&' unless query.empty?
        query << "#{Faraday::Utils.escape key}=#{Faraday::Utils.escape value}"
      end

      def camelize(str)
        str.split('_')
           .map.with_index { |word, i| i.zero? ? word : word.capitalize }.join
      end
    end
  end
end
