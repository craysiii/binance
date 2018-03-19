# Binance

[![Gem Version](https://badge.fury.io/rb/binance.svg)](https://badge.fury.io/rb/binance) 

This is an unofficial Ruby wrapper for the Binance exchange REST and WebSocket APIs.

##### Notice

We are now at 1.0 and there are breaking changes, mainly with some method names and the casing of keys. Be sure to check out the code while I work on better documentation.

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

* Basic implementation of REST API
  * Easy to use authentication
  * Methods return parsed JSON
  * No need to generate timestamps
  * No need to generate signatures
* Basic implementation of WebSocket API
  * Pass procs or lambdas to event handlers
  * Single and multiple streams supported
  * Runs on EventMachine

#### Planned

* Exception handling with responses
* High level abstraction

## Getting Started

#### REST Client

Require Binance:

```ruby
require 'binance'
```

Create a new instance of the [REST Client](http://www.rubydoc.info/gems/binance):

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
client.create_order! symbol: 'XRPETH', side: 'BUY', type: 'LIMIT', 
  time_in_force: 'GTC', quantity: '100.00000000', price: '0.00055000'
# => {"symbol"=>"XRPETH", "orderId"=>918248, "clientOrderId"=>"kmUU0i6cMWzq1NElE6ZTdu", 
# "transactTime"=>1511685028420, "price"=>"0.00055000", "origQty"=>"100.00000000", 
# "executedQty"=>"100.00000000", "status"=>"FILLED", "timeInForce"=>"GTC", "type"=>"LIMIT", 
# "side"=>"BUY"}

# Get deposit address
client.deposit_address asset: 'NEO'
# => {"address"=>"AHXeTWYv8qZQhQ2WNrBza9LHyzdZtFnbaT", "success"=>true, "addressTag"=>"", "asset"=>"NEO"}
```

Required and optional parameters, as well as enum values, can currently be found on the [Binance GitHub Page](https://github.com/binance-exchange/binance-official-api-docs). Parameters should always be passed to client methods as keyword arguments in snake_case form.

#### WebSocket Client

Require Binance and [EventMachine](https://github.com/eventmachine/eventmachine):

```ruby
require 'binance'
require 'eventmachine'
```

Create a new instance of the [WebSocket Client](http://www.rubydoc.info/gems/binance):

```ruby
client = Binance::Client::WebSocket.new
```

Create various WebSocket streams, wrapping calls inside `EM.run`:

```ruby
EM.run do
  # Create event handlers
  open    = proc { puts 'connected' }
  message = proc { |e| puts e.data }
  error   = proc { |e| puts e }
  close   = proc { puts 'closed' }

  # Bundle our event handlers into Hash
  methods = { open: open, message: message, error: error, close: close }

  # Pass a symbol and event handler Hash to connect and process events
  client.agg_trade symbol: 'XRPETH', methods: methods
  
  # kline takes an additional named parameter
  client.kline symbol: 'XRPETH', interval: '1m', methods: methods

  # As well as partial_book_depth
  client.partial_book_depth symbol: 'XRPETH', level: '5', methods: methods

  # Create a custom stream
  client.single stream: { type: 'aggTrade', symbol: 'XRPETH'}, methods: methods

  # Create multiple streams in one call
  client.multi streams: [{ type: 'aggTrade', symbol: 'XRPETH' },
                         { type: 'ticker', symbol: 'XRPETH' },
                         { type: 'kline', symbol: 'XRPETH', interval: '1m'},
                         { type: 'depth', symbol: 'XRPETH', level: '5'}],
               methods: methods 
end
```

#### User Data Stream

User data streams utilize both the REST and WebSocket APIs.

Require Binance and [EventMachine](https://github.com/eventmachine/eventmachine):

```ruby
require 'binance'
require 'eventmachine'
```

Create a new instance of the [REST Client](http://www.rubydoc.info/gems/binance) and [WebSocket Client](http://www.rubydoc.info/gems/binance):

```ruby
rest  = Binance::Client::REST.new api_key: 'x'
ws    = Binance::Client::WebSocket.new
```

Request a listen key from the REST API, and then create a WebSocket stream using it.

```ruby
listen_key = rest.listen_key['listenKey']

message = proc { |e| puts e.data }

EM.run do
  ws.user_data listen_key: listen_key, methods: {message: message}
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/craysiii/binance.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
