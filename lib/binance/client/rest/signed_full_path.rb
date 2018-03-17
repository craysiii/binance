
module Binance
  module Client
    class REST
      module SignedFullpath
        def set_secret(secret)
          @secret = secret
        end

        def full_path
          path = super
          params = path.split('?', 2).last
          signature = OpenSSL::HMAC.hexdigest(
            OpenSSL::Digest.new('sha256', @secret, params)
          )
          @secret = nil
          path + "&signature=%s" % signature
        end
      end
    end
  end
end
