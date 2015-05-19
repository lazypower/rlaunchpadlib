module Rlaunchpadlib
  # 
  # bewitchingme: Added an option to ensure the resulting hash uses symbols for keys;
  # default behavior remains the same.
  # 
  # Rlaunchpadlib::Project.new 'project', {:fast_hash => true}
  class Project

        attr_accessor :project
        attr_accessor :overview_data

        attr_accessor :bug_data
        attr_accessor :branch_data
        attr_accessor :merge_proposal_data
        attr_accessor :subscription_data
        attr_accessor :timeline_data
        attr_accessor :opts

        def initialize(project, options = {})
            @opts = options
            @project = project
            @client = Rlaunchpadlib::Client.new @opts
        end

        def overview
            if @overview_data.nil?
                @overview_data = @client.get(@project)
            end
            @overview_data
        end


        def bugs
            if @bug_data.nil?
                @bug_data = @client.get(@project, 'searchTasks')
            end
            @bug_data
        end


        def branches
            if @branch_data.nil?
                @branch_data = @client.get(@project, 'getBranches')
            end
            @branch_data
        end


        def merge_proposals
            if @merge_proposal_data.nil?
                @merge_proposal_data = @client.get(@project, 'getMergeProposals')
            end
            @merge_proposal_data
        end

        def subscriptions
            if @subscription_data.nil?
                @subscription_data = @client.get(@project, 'getSubscriptions')
            end
            @subscription_data
        end

        def timeline
            if @timeline_data.nil?
                @timeline_data = @client.get(@project, 'get_timeline')
            end
            @timeline_data
        end


        def clear_cache
            @overview_data = nil
            @subscription_data = nil
            @branch_data = nil
            @merge_proposal_data = nil
            @bug_data = nil
            @timeline_data = nil
        end

        # I'm nuts so lets patch method missing.
        def method_missing(name, *args, &block)
          key = @opts[:fast_hash] ? name : name.to_s
          overview.has_key?(key) ? overview[key] : super
        end
    end
end