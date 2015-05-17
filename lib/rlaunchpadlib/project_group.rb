require 'httparty'

module Rlaunchpadlib
  # 
  # bewitchingme: Added an option to ensure the resulting hash uses symbols for keys;
  # default behavior remains the same.
  # 
  # Person.new 'username', {:fast_hash => true}
  class ProjectGroup

        include HTTParty

        attr_accessor :group
        attr_accessor :overview_data
        attr_accessor :opts

        def initialize(group, options = {})
          @opts = options
          @group = group
          @client = Rlaunchpadlib::Client.new @opts
        end

        def overview
            if @overview_data.nil?
                @overview_data = @client.get(@group)
            end
            @overview_data
        end

        def bugs
            @client.get(@group, 'searchTasks')
        end

        def merge_proposals
            @client.get(@group, 'getMergeProposals')
        end

        def branches
            @client.get(@group, 'getBranches')
        end

        # I'm nuts so lets patch method missing.
        def method_missing(name, *args, &block)
          key = @opts[:fast_hash] ? name : name.to_s
          overview.has_key?(key) ? overview[key] : super
        end


    end
end