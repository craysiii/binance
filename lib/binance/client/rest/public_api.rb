
require 'faraday'
require 'faraday_middleware'

module Binance
  module Client
    class REST
      # API endpoints that don't require any type of authentication
      module Public_API
        def self.extended(_base)
          REST.api[:public] = lambda do
            Faraday.new(url: "#{BASE_URL}/api/v1") do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.adapter Faraday.default_adapter
            end
          end
        end

        def ping
          request :public, :get, 'ping'
        end

        def time
          request :public, :get, 'time'
        end

        def exchange_info
          request :public, :get, 'exchangeInfo'
        end

        def products
          request :public, :get, '/exchange/public/product'
        end

        def depth(options)
          request :public, :get, 'depth', options
        end

        def agg_trades(options)
          request :public, :get, 'aggTrades', options
        end

        def klines(options)
          request :public, :get, 'klines', options
        end

        def twenty_four_hour(options)
          request :public, :get, 'ticker/24hr', options
        end

        def all_prices
          request :public, :get, 'ticker/allPrices'
        end

        def all_book_tickers
          request :public, :get, 'ticker/allBookTickers'
        end
      end
    end
  end
end
