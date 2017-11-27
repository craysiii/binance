
module Binance
  module Client
    class REST
      # Sign the query string using HMAC(sha-256) and appends to query string
      SignRequestMiddleware = Struct.new(:app, :secret_key) do
        def call(env)
          value = OpenSSL::HMAC.hexdigest(
            OpenSSL::Digest.new('sha256'), secret_key, env.url.query
          )
          env.url.query = REST.add_query_param(env.url.query, 'signature', value)

          app.call env
        end
      end
    end
  end
end
