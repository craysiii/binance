
require 'faye/websocket'

module Binance
  module Client
    # Basic implementation of WebSocket API using faye-websocket
    class WebSocket
      BASE_URL = 'wss://stream.binance.com:9443'.freeze

      def single(stream:, methods:)
        create_stream("#{BASE_URL}/ws/#{stream_url(stream)}",
                      methods: methods)
      end

      def multi(streams:, methods:)
        names = streams.map { |stream| stream_url(stream) }
        create_stream("#{BASE_URL}/stream?streams=#{names.join('/')}",
                      methods: methods)
      end

      def agg_trade(symbol:, methods:)
        single stream: { symbol: symbol, type: 'aggTrade' }, methods: methods
      end

      def trade(symbol:, methods:)
        single stream: { symbol: symbol, type: 'trade' }, methods: methods
      end

      def kline(symbol:, interval:, methods:)
        single stream: { symbol: symbol, type: 'kline', interval: interval },
               methods: methods
      end

      def ticker(symbol:, methods:)
        single stream: { symbol: symbol, type: 'ticker' }, methods: methods
      end

      def all_market_ticker(methods:)
        single stream: { symbol: '!ticker', type: 'arr' }, methods: methods
      end

      def partial_book_depth(symbol:, level:, methods:)
        single stream: { symbol: symbol, type: 'depth', level: level },
               methods: methods
      end

      def diff_depth(symbol:, methods:)
        single stream: { symbol: symbol, type: 'depth' }, methods: methods
      end

      private

      def stream_url(symbol:, type:, level: '', interval: '')
        "#{symbol.downcase}@#{type}".tap do |url|
          url << level
          url << "_#{interval}" unless interval.empty?
        end
      end

      def create_stream(url, methods:)
        Faye::WebSocket::Client.new(url)
                               .tap { |ws| attach_methods(ws, methods) }
      end

      def attach_methods(websocket, methods)
        methods.each_pair do |key, method|
          websocket.on(key) { |event| method.call(event) }
        end
      end
    end
  end
end
