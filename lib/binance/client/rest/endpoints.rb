module Binance
  module Client
    class REST
      ENDPOINTS = {
        # Public API Endpoints
        ping:              'v1/ping',
        time:              'v1/time',
        exchange_info:     'v1/exchangeInfo',
        coins_info:        'v1/capital/config/getall',
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
        withdraw:         'v3/withdraw.html',
        deposit_history:  'v3/depositHistory.html',
        withdraw_history: 'v3/withdrawHistory.html',
        deposit_address:  'v3/depositAddress.html',
        account_status:   'v3/accountStatus.html',
        system_status:    'v3/systemStatus.html',
        withdraw_fee:     'v3/withdrawFee.html',
        dust_log:         'v3/userAssetDribbletLog.html',

        # Broker API Endpoints
        # https://binance-docs.github.io/Brokerage-API/General/
        broker_info:                 'v1/broker/info',
        broker_rebates:              'v1/broker/rebate/recentRecord',
        sub_account:                 'v1/broker/subAccount',
        sub_account_api:             'v1/broker/subAccountApi',
        sub_account_permission:      'v1/broker/subAccountApi/permission',
        sub_account_commission:      'v1/broker/subAccountApi/commission',
        sub_account_bnb_burn:        'v1/broker/subAccount/bnbBurn/spot',
        sub_account_bnb_burn_status: 'v1/broker/subAccount/bnbBurn/status',
        sub_account_transfer:        'v1/broker/transfer',
        sub_account_deposit_address: 'v3/depositAddress.html',
        sub_account_deposit_history: 'v1/broker/subAccount/depositHistory',
        sub_account_balances:        'v1/broker/subAccount/spotSummary'
      }.freeze
    end
  end
end
