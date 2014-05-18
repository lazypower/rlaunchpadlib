require 'httparty'

module Rlaunchpadlib
    class ProjectGroup

        include HTTParty

        attr_accessor :group
        attr_accessor :overview_data

        def initialize(group)
            @group = group
            @client = Rlaunchpadlib::Client.new
        end

        def overview
             if @overview_data.nil?
                @client.get(@group)
            else
                @overview_data
            end
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
          overview.has_key?(name.to_s) ? overview[name.to_s] : super
        end


    end
end