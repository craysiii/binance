
require 'faraday'
require 'faraday_middleware'

module Binance
  module Client
    class REST
      # API endpoints that don't require any type of authentication
      module Public_API
        def public_api
          Faraday.new(url: "#{BASE_URL}/api/v1") do |conn|
            conn.request :json
            conn.response :json, content_type: /\bjson$/
            conn.adapter Faraday.default_adapter
          end
        end

        def ping
          public_api.get('ping').body
        end

        def time
          public_api.get('time').body
        end

        def exchange_info
          public_api.get('exchangeInfo').body
        end

        def products
          public_api.get('/exchange/public/product').body
        end

        def depth(options)
          response = public_api.get do |req|
            req.url 'depth'
            req.params.merge! options
          end
          response.body
        end

        def agg_trades(options)
          response = public_api.get do |req|
            req.url 'aggTrades'
            req.params.merge! options
          end
          response.body
        end

        def klines(options)
          response = public_api.get do |req|
            req.url 'klines'
            req.params.merge! options
          end
          response.body
        end

        def twenty_four_hour(options)
          response = public_api.get do |req|
            req.url 'ticker/24hr'
            req.params.merge! options
          end
          response.body
        end

        def all_prices
          public_api.get('ticker/allPrices').body
        end

        def all_book_tickers
          public_api.get('ticker/allBookTickers').body
        end
      end
    end
  end
end
