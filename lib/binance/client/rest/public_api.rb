
module Binance
  module Client
    class REST
      # Public: A Module containing all of the Public API endpoints
      module PublicAPI
        # Public: Ping the server to test connectivity
        #
        # Returns a Hash with the request response
        def ping
          request :public, :get, 'ping'
        end

        # Public: Retrieve the server time in milliseconds
        #
        # Returns a Hash with the request response
        def time
          request :public, :get, 'time'
        end

        # Public: Retrieve current exchange trading rules and symbol information
        #
        # Returns a Hash with the request response
        def exchange_info
          request :public, :get, 'exchangeInfo'
        end

        # Public: Retrieve current exchange asset information. This is an
        # undocumented endpoint.
        #
        # Returns a Hash with the request response
        def products
          request :public, :get, 'products'
        end

        # Public: Retrieve depth information for the specified symbol
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol - The String of which trading pair to retrieve.
        #   :limit  - The Number of how many updates to request (optional).
        #
        # Returns a Hash with the request response
        def depth(options)
          request :public, :get, 'depth', options
        end

        # Public: Retrieve recent trades for the specified symbol
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol - The String of which trading pair to retrieve.
        #   :limit  - The Number of how many trades to request (optional).
        #
        # Returns a Hash with the request response
        def trades(options)
          request :public, :get, 'trades', options
        end

        # Public: Retrieve old trade data for the specified symbol
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol - The String of which trading pair to retrieve.
        #   :limit  - The Number of how many trades to request (optional).
        #   :fromId - The String of which trade ID to fetch from (optional).
        #
        # Returns a Hash with the request response
        def historical_trades(options)
          request :user_data, :get, 'historicalTrades', options
        end

        # Public: Retrieve aggregate trade data for the specified symbol
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol     - The String of which trading pair to retrieve.
        #   :fromId     - The String of which trade ID to fetch from (optional).
        #   :startTime  - The Timestamp of when to get trades from in
        #                 milliseconds (optional).
        #   :endTime    - The Timestamp of when to get trades until in
        #                 milliseconds (optional).
        #   :limit      - The Number of how many trades to request (optional).
        #
        # Returns a Hash with the request response
        def agg_trades(options)
          request :public, :get, 'aggTrades', options
        end

        # Public: Retrieve kline data for the specified symbol
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol     - The String of which trading pair to retrieve.
        #   :interval   - The String of which interval to retrieve (optional).
        #   :fromId     - The String of which trade ID to fetch from (optional).
        #   :startTime  - The Timestamp of when to get trades from in
        #                 milliseconds (optional).
        #   :endTime    - The Timestamp of when to get trades until in
        #                 milliseconds (optional).
        #   :limit      - The Number of how many trades to request (optional).
        #
        # Returns a Hash with the request response
        def klines(options)
          request :public, :get, 'klines', options
        end

        # Public: Retrieve 24 hour ticker price data
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol - The String of which trading pair to retrieve (optional).
        #
        # Returns a Hash with the request response
        def twenty_four_hour(options)
          request :public, :get, '24hr', options
        end

        # Public: Retrieve price ticker data for the specified symbol
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol - The String of which trading pair to retrieve (optional).
        #
        # Returns a Hash with the request response
        def price(options)
          request :public, :get, 'price', options
        end

        # Public: Retrieve all price ticker data
        #
        # Returns a Hash with the request response
        def all_prices
          request :public, :get, 'price'
        end

        # Public: Retrieve best price per quantity on the order book
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol - The String of which trading pair to retrieve (optional).
        #
        # Returns a Hash with the request response
        def book_ticker(options)
          request :public, :get, 'bookTicker', options
        end

        # Public: Retrieve all book ticker data  for all symbols
        #
        # Returns a Hash with the request response
        def all_book_tickers
          request :public, :get, 'bookTicker'
        end
      end
    end
  end
end
