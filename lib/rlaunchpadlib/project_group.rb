require 'httparty'

module Rlaunchpadlib
    class ProjectGroup

        include HTTParty

        attr_accessor :base_uri 
        attr_accessor :api_version
        attr_accessor :group

        def initialize(group)
            @base_uri = "https://api.launchpad.net"
            @api_version = "1.0"
            @group = group
        end

        def overview
            self.class.get "#{@base_uri}/#{@api_version}/#{@group}"
        end

        # I'm nuts so lets patch method missing.
        def method_missing(name, *args, &block)
          overview.has_key?(name.to_s) ? overview[name.to_s] : super
        end


    end
end