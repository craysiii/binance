
module Binance
  module Client
    class REST
      # Public: A Module containing all of the User Data API endpoints
      module UserDataAPI
        # Public: Retrieve the listen key for the given api key
        #
        # Returns a Hash with the request response
        def listen_key
          request :user_data, :post, 'userDataStream'
        end

        # Public: Ping the server to keep User Data stream alive
        #
        # options - The Hash which hosts various REST query params.
        #   :listen_key - The String of which stream to keep alive
        #
        # Returns a Hash with the request response
        def keep_stream_alive(options)
          request :user_data, :put, 'userDataStream', options
        end

        # Public: Close the User Data stream associated with the listen key
        #
        # options - The Hash which hosts various REST query params.
        #   :listen_key - The String of which stream to close
        #
        # Returns a Hash with the request response
        def close_stream(options)
          request :user_data, :delete, 'userDataStream', options
        end
      end
    end
  end
end