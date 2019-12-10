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
                # #account_info
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
                # #withdraw_fee
                { name: :withdraw_fee, client: :withdraw,
                action: :get, endpoint: :withdraw_fee },
                # dust_log
                { name: :dust_log, client: :withdraw,
                action: :get, endpoint: :dust_log }
            ].freeze
        end

        class REST_FUTURE
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
                # #account_info
                { name: :account_info, client: :signed,
                action: :get, endpoint: :account },
                # #user_trades
                { name: :user_trades, client: :signed,
                action: :get, endpoint: :user_trades },
                # #listen_key
                { name: :listen_key, client: :verified,
                action: :post, endpoint: :user_data_stream },
                # #keep_alive_stream!
                { name: :keep_alive_stream!, client: :verified,
                action: :put, endpoint: :user_data_stream },
                # #close_stream!
                { name: :close_stream!, client: :verified,
                action: :delete, endpoint: :user_data_stream },

                # Withdraw API Endpoints
                # # funding_rate
                { name: :funding_rate, client: :signed,
                action: :get, endpoint: :funding_rate },
                # # income
                { name: :income, client: :signed,
                action: :get, endpoint: :income },
                # # leverage
                { name: :leverage, client: :signed,
                action: :get, endpoint: :leverage },
                # # listenKey
                { name: :listenKey, client: :signed,
                action: :post, endpoint: :listenKey },
				# # listenKey
                { name: :getlistenKey, client: :signed,
                action: :get, endpoint: :listenKey },
                # # position_risk
                { name: :position_risk, client: :signed,
                action: :get, endpoint: :position_risk },
                # # premium_index
                { name: :premium_index, client: :signed,
                action: :get, endpoint: :premium_index },
				# #withdraw!
                { name: :withdraw!, client: :withdraw,
                action: :post, endpoint: :withdraw },
				# #balance
                { name: :balance, client: :signed,
                action: :get, endpoint: :balance },

                # NOT FOUND IN FUTURE API (yet)
                # #my_trades
                { name: :my_trades, client: :signed,
                action: :get, endpoint: :my_trades },
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
                # #withdraw_fee
                { name: :withdraw_fee, client: :withdraw,
                action: :get, endpoint: :withdraw_fee },
                # dust_log
                { name: :dust_log, client: :withdraw,
                action: :get, endpoint: :dust_log }
            ].freeze

        end
    end
end
