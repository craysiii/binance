require 'date'

module Binance
  module Client
    class REST
      # Generate a timestamp in milliseconds and append to query string
      TimestampRequestMiddleware = Struct.new(:app) do
        def call(env)
          env.url.query = REST.add_query_param(
            env.url.query, 'timestamp', DateTime.now.strftime('%Q')
          )

          app.call env
        end
      end
    end

        class REST_FUTURE
            # Generate a timestamp in milliseconds and append to query string
            TimestampRequestMiddleware = Struct.new(:app) do
                def call(env)
                    env.url.query = REST_FUTURE.add_query_param(
                        env.url.query, 'timestamp', DateTime.now.strftime('%Q')
                    )

                    app.call env
                end
            end
        end

  end
end
