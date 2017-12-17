
require 'faraday'
require 'faraday_middleware'

module Binance
  module Client
    class REST
      # API endpoints that don't require any type of authentication
      module Public_API
        def self.extended(base)
          REST.api[:public] = lambda do
            Faraday.new(url: "#{BASE_URL}/api") do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.adapter base.adapter
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
          request :public, :get, 'products'
        end

        def depth(options)
          request :public, :get, 'depth', options
        end

        def trades(options)
          request :public, :get, 'trades', options
        end

        def historical_trades(options)
          request :public, :get, 'historicalTrades', options
        end

        def agg_trades(options)
          request :public, :get, 'aggTrades', options
        end

        def klines(options)
          request :public, :get, 'klines', options
        end

        def twenty_four_hour(options)
          request :public, :get, '24hr', options
        end

        def price(options)
          request :public, :get, 'price', options
        end

        # Ensure backwards compatibility
        def all_prices
          request :public, :get, 'price'
        end

        def book_ticker(options)
          request :public, :get, 'bookTicker', options
        end

        # Ensure backwards compatibility
        def all_book_tickers
          request :public, :get, 'bookTicker'
        end
      end
    end
  end
end
