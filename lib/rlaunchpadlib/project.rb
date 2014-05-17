require 'httparty'

module Rlaunchpadlib
    class Project

        include HTTParty

        attr_accessor :base_uri 
        attr_accessor :api_version
        attr_accessor :project

        def initialize(project)
            @base_uri = "https://api.launchpad.net"
            @api_version = "1.0"
            @project = project
        end

        def overview
            self.class.get "#{@base_uri}/#{@api_version}/#{@project}"
        end

        # I'm nuts so lets patch method missing.
        def method_missing(name, *args, &block)
          overview.has_key?(name.to_s) ? overview[name.to_s] : super
        end


    end
end