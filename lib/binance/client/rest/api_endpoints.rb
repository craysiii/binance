
module Binance
  module Client
    class REST
      API_ENDPOINTS = {
        # Public API Endpoints
        ping:             'v1/ping',
        time:             'v1/time',
        exchangeInfo:     'v1/exchangeInfo',
        products:         '/exchange/public/products',
        depth:            'v1/depth',
        trades:           'v1/trades',
        historicalTrades: 'v1/historicalTrades',
        aggTrades:        'v1/aggTrades',
        klines:           'v1/klines',
        twenty_four_hour: 'v1/ticker/24hr',
        price:            'v3/ticker/price',
        bookTicker:       'v3/ticker/bookTicker',

        # Account API Endpoints
        order:          'v3/order',
        order_test:     'v3/order/test',
        openOrders:     'v3/openOrders',
        allOrders:      'v3/allOrders',
        account:        'v3/account',
        myTrades:       'v3/myTrades',
        userDataStream: 'v1/userDataStream',

        # Withdraw API Endpoints
        withdraw:        'v3/withdraw.html',
        depositHistory:  'v3/depositHistory.html',
        withdrawHistory: 'v3/withdrawHistory.html',
        depositAddress:  'v3/depositAddress.html',
        accountStatus:   'v3/accountStatus.html'
      }.freeze
    end
  end
end
