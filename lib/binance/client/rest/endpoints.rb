module Binance
    module Client
        class REST
            ENDPOINTS = {
                # Public API Endpoints
                ping:              'v1/ping',
                time:              'v1/time',
                exchange_info:     'v1/exchangeInfo',
                depth:             'v1/depth',
                trades:            'v1/trades',
                historical_trades: 'v1/historicalTrades',
                agg_trades:        'v1/aggTrades',
                klines:            'v1/klines',
                twenty_four_hour:  'v1/ticker/24hr',
                price:             'v3/ticker/price',
                book_ticker:       'v3/ticker/bookTicker',

                # Account API Endpoints
                order:            'v3/order',
                test_order:       'v3/order/test',
                open_orders:      'v3/openOrders',
                all_orders:       'v3/allOrders',
                account:          'v3/account',
                my_trades:        'v3/myTrades',
                user_data_stream: 'v1/userDataStream',

                # Withdraw API Endpoints
                balance:          'v1/balance',
                withdraw:         'v3/withdraw.html',
                deposit_history:  'v3/depositHistory.html',
                withdraw_history: 'v3/withdrawHistory.html',
                deposit_address:  'v3/depositAddress.html',
                account_status:   'v3/accountStatus.html',
                system_status:    'v3/systemStatus.html',
                withdraw_fee:     'v3/withdrawFee.html',
                dust_log:         'v3/userAssetDribbletLog.html'
            }.freeze
        end

        class REST_FUTURE
            ENDPOINTS = {
                # Public API Endpoints
                ping:                'v1/ping',
                time:                'v1/time',
                exchange_info:       'v1/exchangeInfo',
                depth:               'v1/depth',
                trades:              'v1/trades',
                historical_trades:   'v1/historicalTrades',
                agg_trades:          'v1/aggTrades',
                klines:              'v1/klines',
                twenty_four_hour:    'v1/ticker/24hr',
                price:               'v1/ticker/price',
                book_ticker:         'v1/ticker/bookTicker',

                # Account API Endpoints
                order:               'v1/order',
                open_orders:         'v1/openOrders',
                all_orders:          'v1/allOrders',
                account:             'v1/account',
                user_trades:         'v1/userTrades',
                test_order:          'v1/order/test',
                user_data_stream:    'v1/userDataStream',
                withdraw:            'v1/withdraw.html',

                # Withdraw API Endpoints
                balance:             'v1/balance',
                funding_rate:        'v1/fundingRate',
                income:              'v1/income',
                leverage:            'v1/leverage',
                listenKey:           'v1/listenKey',
                position_risk:       'v1/positionRisk',
                premium_index:       'v1/premiumIndex',

                #not found in Future-API yet
                my_trades:           'v1/myTrades',
                deposit_history:     'v1/depositHistory.html',
                withdraw_history:    'v1/withdrawHistory.html',
                deposit_address:     'v1/depositAddress.html',
                account_status:      'v1/accountStatus.html',
                system_status:       'v1/systemStatus.html',
                withdraw_fee:        'v1/withdrawFee.html',
                dust_log:            'v1/userAssetDribbletLog.html'
            }.freeze
        end

    end
end
