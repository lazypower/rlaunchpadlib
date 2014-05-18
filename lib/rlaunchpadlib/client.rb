require 'httparty'

module Rlaunchpadlib
    class Client

        include HTTParty

        attr_accessor :base_uri
        attr_accessor :api_version

        #TODO: Add Caching

        def initialize()
            @base_uri = "https://api.launchpad.net"
            @api_version = "1.0"
        end

        def get(scope, operation="")
            if operation.empty?
                result = self.class.get "#{@base_uri}/#{@api_version}/#{scope}"
                result.to_hash()
            else
                result = self.class.get "#{@base_uri}/#{@api_version}/#{scope}/?ws.op=#{operation}"
                result.to_hash()
            end
        end
    end
end