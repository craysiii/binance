
module Binance
  module Client
    class REST
      # Public: A module containing all of the Account API endpoints
      module AccountAPI
        # Public: Create a new order on the specified symbol for the
        # authenticated account
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol           - The String of which trading pair to create the
        #                       order on.
        #   :side             - The String determining which side to create the
        #                       order on.
        #   :type             - The String determining what type of order it is.
        #   :timeInForce      - The String determining what the time in force is
        #                       (optional).
        #   :quantity         - The String determining the amount of assets to
        #                       purchase.
        #   :price            - The String determining what price to purchase at
        #                       (optional).
        #   :newClientOrderId - The String which uniquely identifies this order
        #                       (optional).
        #   :stopPrice        - The String determining which price to stop at
        #                       (optional).
        #   :icebergQty       - The String determining the amount of assets to
        #                       show on the order book (optional).
        #   :newOrderRespType - The String which sets the type of response to
        #                       receive (optional).
        #   :recvWindow       - The Number of how long a request is valid for
        #                       in milliseconds (optional).
        #
        # Returns a Hash of the request response
        def create_order(options)
          request :signed, :post, :order, options
        end

        # Public: Create a test order on the specified symbol for the
        # authenticated account
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol           - The String of which trading pair to create the
        #                       order on.
        #   :side             - The String determining which side to create the
        #                       order on.
        #   :type             - The String determining what type of order it is.
        #   :timeInForce      - The String determining what the time in force is
        #                       (optional).
        #   :quantity         - The String determining the amount of assets to
        #                       purchase.
        #   :price            - The String determining what price to purchase at
        #                       (optional).
        #   :newClientOrderId - The String which uniquely identifies this order
        #                       (optional).
        #   :stopPrice        - The String determining which price to stop at
        #                       (optional).
        #   :icebergQty       - The String determining the amount of assets to
        #                       show on the order book (optional).
        #   :newOrderRespType - The String which sets the type of response to
        #                       receive (optional).
        #   :recvWindow       - The Number of how long a request is valid for
        #                       in milliseconds (optional).
        #
        # Returns a Hash of the request response
        def create_test_order(options)
          request :signed, :post, :order_test, options
        end

        # Public: Query an orders status on the specified symbol for the
        # authenticated account. One must send either an :orderId or
        # :origOrderId, but not both.
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol            - The String of which trading pair to query from
        #                        (optional).
        #   :orderId           - The String determining which order to query
        #                        (optional).
        #   :origClientOrderId - The String determining which order to cancel
        #                        (optional).
        #   :recvWindow        - The Number of how long a request is valid for
        #                        in milliseconds (optional).
        #
        # Returns a Hash of the request response
        def query_order(options)
          request :signed, :get, :order, options
        end

        # Public: Cancel the order specified for the authenticated account.
        # One must send either an :orderId or :origOrderId, but not both.
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol            - The String of which trading pair to delete from
        #                        (optional).
        #   :orderId           - The String determining which order to cancel
        #                        (optional).
        #   :origClientOrderId - The String determining which order to cancel
        #                        (optional).
        #   :newClientOrderId  - The String used in uniquely identifying the
        #                        cancel order (optional).
        #   :recvWindow        - The Number of how long a request is valid for
        #                        in milliseconds (optional).
        #
        # Returns a Hash with the request response
        def cancel_order(options)
          request :signed, :delete, :order, options
        end

        # Public: Retrieve open orders for the authenticated account
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol     - The String of which trading pair to retrieve
        #                 (optional).
        #   :recvWindow - The Number of how long a request is valid for in
        #                 milliseconds (optional).
        #
        # Returns a Hash with the request response
        def open_orders(**options)
          request :signed, :get, :openOrders, options
        end

        # Public: Retrieve all orders of the specified symbol for the
        # authenticated account
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol     - The String of which trading pair to retrieve.
        #   :orderId    - The String determining which order to start the data
        #                 from (optional).
        #   :limit      - The Number of how many trades to request (optional).
        #   :recvWindow - The Number of how long a request is valid for in
        #                 milliseconds (optional).
        #
        # Returns a Hash with the request response
        def all_orders(options)
          request :signed, :get, :allOrders, options
        end

        # Public: Retrieve account information for the authenticated account
        #
        # options - The Hash which hosts various REST query params.
        #   :recvWindow - The Number of how long a request is valid for in
        #                 milliseconds (optional).
        #
        # Returns a Hash with the request response
        def account_info(options = {})
          request :signed, :get, :account, options
        end

        # Public: Retrieve trade data of the specified symbol for the
        # authenticated account
        #
        # options - The Hash which hosts various REST query params.
        #   :symbol - The String of which trading pair to retrieve.
        #   :limit  - The Number of how many trades to request (optional).
        #   :fromId - The String of which trade ID to fetch from (optional).
        #   :recvWindow - The Number of how long a request is valid for in
        #                 milliseconds (optional).
        #
        # Returns a Hash with the request response
        def account_trade_list(options)
          request :signed, :get, :myTrades, options
        end

        # Public: Retrieve the listen key for the given api key
        #
        # Returns a Hash with the request response
        def listen_key
          request :verified, :post, :userDataStream
        end

        # Public: Ping the server to keep User Data stream alive
        #
        # options - The Hash which hosts various REST query params.
        #   :listen_key - The String of which stream to keep alive
        #
        # Returns a Hash with the request response
        def keep_stream_alive(options)
          request :verified, :put, :userDataStream, options
        end

        # Public: Close the User Data stream associated with the listen key
        #
        # options - The Hash which hosts various REST query params.
        #   :listen_key - The String of which stream to close
        #
        # Returns a Hash with the request response
        def close_stream(options)
          request :verified, :delete, :userDataStream, options
        end
      end
    end
  end
end
