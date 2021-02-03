# frozen_string_literal: true

# https://binance-docs.github.io/apidocs/spot/en/#change-log
module Binance
  module Client
    class REST
      METHODS = [
        # Public API Methods
        # #ping
        { name: :ping, client: :public,
          action: :get, endpoint: :ping },
        # #time
        { name: :time, client: :public,
          action: :get, endpoint: :time },
        # #exchange_info
        { name: :exchange_info, client: :public,
          action: :get, endpoint: :exchange_info },
        # #depth
        { name: :depth, client: :public,
          action: :get, endpoint: :depth },
        # #trades
        { name: :trades, client: :public,
          action: :get, endpoint: :trades },
        # #historical_trades
        { name: :historical_trades, client: :verified,
          action: :get, endpoint: :historical_trades },
        # #agg_trades
        { name: :agg_trades, client: :public,
          action: :get, endpoint: :agg_trades },
        # #klines
        { name: :klines, client: :public,
          action: :get, endpoint: :klines },
        # #twenty_four_hour
        { name: :twenty_four_hour, client: :public,
          action: :get, endpoint: :twenty_four_hour },
        # #price
        { name: :price, client: :public,
          action: :get, endpoint: :price },
        # #all_prices
        { name: :all_prices, client: :public,
          action: :get, endpoint: :price },
        # #book_ticker
        { name: :book_ticker, client: :public,
          action: :get, endpoint: :book_ticker },

        # Account API Methods
        # #create_order!
        { name: :create_order!, client: :signed,
          action: :post, endpoint: :order },
        # #create_test_order
        { name: :create_test_order, client: :signed,
          action: :post, endpoint: :test_order },
        # #query_order
        { name: :query_order, client: :signed,
          action: :get, endpoint: :order },
        # #cancel_order!
        { name: :cancel_order!, client: :signed,
          action: :delete, endpoint: :order },
        # #open_orders
        { name: :open_orders, client: :signed,
          action: :get, endpoint: :open_orders },
        # #all_orders
        { name: :all_orders, client: :signed,
          action: :get, endpoint: :all_orders },
        # e.g. client.account_info(recv_window: 6000)
        { name: :account_info, client: :signed,
          action: :get, endpoint: :account },
        # #my_trades
        { name: :my_trades, client: :signed,
          action: :get, endpoint: :my_trades },
        # #listen_key
        { name: :listen_key, client: :verified,
          action: :post, endpoint: :user_data_stream },
        # #keep_alive_stream!
        { name: :keep_alive_stream!, client: :verified,
          action: :put, endpoint: :user_data_stream },
        # #close_stream!
        { name: :close_stream!, client: :verified,
          action: :delete, endpoint: :user_data_stream },

        # Withdraw API Methods
        # #withdraw!
        { name: :withdraw!, client: :withdraw,
          action: :post, endpoint: :withdraw },
        # #deposit_history
        { name: :deposit_history, client: :withdraw,
          action: :get, endpoint: :deposit_history },
        # #withdraw_history
        { name: :withdraw_history, client: :withdraw,
          action: :get, endpoint: :withdraw_history },
        # #deposit_address
        { name: :deposit_address, client: :withdraw,
          action: :get, endpoint: :deposit_address },
        # #account_status
        { name: :account_status, client: :withdraw,
          action: :get, endpoint: :account_status },
        # #system_status
        { name: :system_status, client: :public_withdraw,
          action: :get, endpoint: :system_status },
        # #asset detail
        { name: :asset_detail, client: :withdraw,
          action: :get, endpoint: :asset_detail },
        # dust_log
        { name: :dust_log, client: :withdraw,
          action: :get, endpoint: :dust_log }
      ].freeze
    end
  end
end
