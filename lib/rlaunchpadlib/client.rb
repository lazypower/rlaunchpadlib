require 'httparty'

module Rlaunchpadlib
    class Client

        include HTTParty

        attr_accessor :base_uri
        attr_accessor :api_version
        attr_accessor :opts

        def initialize(options = {})
            @base_uri = "https://api.launchpad.net"
            @api_version = "1.0"
            @opts = options
        end

        def get(scope, operation="")
            result = nil
            
            if operation.empty?
                result = self.class.get "#{@base_uri}/#{@api_version}/#{scope}"
            else
                result = self.class.get "#{@base_uri}/#{@api_version}/#{scope}/?ws.op=#{operation}"
            end
            
            if fast_hash?
                symbolize_keys result.to_hash()
            else
                result.to_hash()
            end
        end

        private
            # Compliments of Nico Ritsche & Samson Ootoovak
            # 
            # https://gist.github.com/ncri/5661189
            def symbolize_keys(hash)
                hash.inject({}){|result, (key, value)|
                    new_key = case key
                        when String then key.to_sym
                        else key
                    end
                    new_value = case value
                        when Hash then symbolize_keys(value)
                        when Array then value.map{ |v| v.is_a?(Hash) ? symbolize_keys(v) : v }
                        else value
                    end
                    result[new_key] = new_value
                    result
                }
            end
            
            def fast_hash?
                @opts.has_key?(:fast_hash) ? @opts[:fast_hash] : false
            end
    end
end