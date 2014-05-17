require 'httparty'

module Rlaunchpadlib
    class User

        include HTTParty

        attr_accessor :base_uri 
        attr_accessor :api_version
        attr_accessor :username

        def initialize(username)
            @base_uri = "https://api.launchpad.net"
            @api_version = "1.0"
            @username = username
        end

        def profile
            self.class.get "#{@base_uri}/#{@api_version}/~#{@username}"
        end

        # I'm nuts so lets patch method missing.
        def method_missing(name, *args, &block)
          profile.has_key?(name.to_s) ? profile[name.to_s] : super
        end


    end
end