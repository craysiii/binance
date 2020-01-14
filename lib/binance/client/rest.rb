require 'faraday'

require_relative 'rest/sign_request_middleware'
require_relative 'rest/timestamp_request_middleware'
require_relative 'rest/clients'
require_relative 'rest/endpoints'
require_relative 'rest/methods'

module Binance
  module Client
    class REST
            def initialize(api_key: '', secret_key: '',
                adapter: Faraday.default_adapter)
                @clients = {}
                @clients[:public]   = public_client adapter
                @clients[:verified] = verified_client api_key, adapter
                @clients[:signed]   = signed_client api_key, secret_key, adapter
                @clients[:withdraw] = withdraw_client api_key, secret_key, adapter
                @clients[:public_withdraw] = public_withdraw_client adapter
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

        class REST_FUTURE
      def initialize(api_key: '', secret_key: '',
                     adapter: Faraday.default_adapter)
        @clients = {}
        @clients[:public]   = public_client adapter
        @clients[:verified] = verified_client api_key, adapter
        @clients[:signed]   = signed_client api_key, secret_key, adapter
        @clients[:withdraw] = withdraw_client api_key, secret_key, adapter
        @clients[:public_withdraw] = public_withdraw_client adapter
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
