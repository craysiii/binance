# Binance

This is an unofficial Ruby wrapper for the Binance exchange REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'binance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install binance
    
## Features

#### Current

* Basic implementation of public, account, and withdraw REST API endpoints
* Easy to use authentication
* Methods return parsed JSON
* No need to generate timestamps
* No need to generate signatures

#### Planned

* Implementation of the User Data Stream API
* Implementation of the Websocket API
* Exception handling with responses
* High level abstraction

## Getting Started

Require the gem:

```ruby
require 'binance'
```

Create a new instance of the [REST Client](http://www.rubydoc.info/gems/binance/0.0.1/Binance/Client/REST):

```ruby
# If you only plan on touching public API endpoints, you can forgo any arguments
client = Binance::Client::REST.new
# Otherwise provide an api_key and secret_key as keyword arguments
client = Binance::Client::REST.new api_key: 'x', secret_key: 'y'
```

Create various requests:

```ruby
# Ping the server
client.ping # => {}

# Get kline data
client.klines symbol: 'NEOETH', interval: '1m', limit: 1
# => [[1511682480000, "0.08230000", "0.08230000", "0.08230000", "0.08230000", "0.00000000", 
# 1511682539999, "0.00000000", 0, "0.00000000", "0.00000000", "2885926.46000000"]]

# Create an order
client.create_order symbol: 'XRPETH', side: 'BUY', type: 'LIMIT', 
  timeInForce: 'GTC', quantity: '100.00000000', price: '0.00055000'
# => {"symbol"=>"XRPETH", "orderId"=>918248, "clientOrderId"=>"kmUU0i6cMWzq1NElE6ZTdu", 
# "transactTime"=>1511685028420, "price"=>"0.00055000", "origQty"=>"100.00000000", 
# "executedQty"=>"100.00000000", "status"=>"FILLED", "timeInForce"=>"GTC", "type"=>"LIMIT", 
# "side"=>"BUY"}

# Get deposit address
client.deposit_address asset: 'NEO'
# => {"address"=>"AHXeTWYv8qZQhQ2WNrBza9LHyzdZtFnbaT", "success"=>true, "addressTag"=>"", "asset"=>"NEO"}
```

Required and optional parameters, as well as enum values, can currently be found on the [Binance API Page](https://www.binance.com/restapipub.html). Parameters should always be passed to client methods as keyword arguments, with the same capitalization and spelling. 


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/craysiii/binance.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Donate

If This library is useful to you feel free to donate.
* BTC: 1P8uPgajnLr37mQfQ5Q8hVM9Y5ys56H7Xy
* ETH: 0x47bb8c57ead60707e38de9d42232cb3edbccd8f2
* NEO: AHXeTWYv8qZQhQ2WNrBza9LHyzdZtFnbaT
