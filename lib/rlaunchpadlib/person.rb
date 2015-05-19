require 'httparty'

module Rlaunchpadlib

    ##
    # Wraps the Person object in Launchpad
    #
    # https://launchpad.net/+apidoc/1.0.html#person
    #
    # Provides READ ONLY access
    # 
    # bewitchingme: Added an option to ensure the resulting hash uses symbols for keys;
    # default behavior remains the same.
    # 
    # Person.new 'username', {:fast_hash => true}
    class Person

        attr_accessor :username
        attr_accessor :profile_data
        attr_accessor :archive_subscriptions_data
        attr_accessor :branches_data
        attr_accessor :bug_subscribers_data
        attr_accessor :merge_proposals_data
        attr_accessor :requested_reviews_data
        attr_accessor :bugs_data
        attr_accessor :opts
        
        def initialize(username, options = {})
            @opts = options
            @client = Rlaunchpadlib::Client.new @opts
            @username = "~#{username}"
        end

        def profile
            if @profile_data.nil?
                @profile_data = @client.get(@username)
            end
            @profile_data
        end

        def archive_subscriptions
            if @archive_subscriptions_data.nil?
                @archive_subscriptions_data =  @client.get(@username, 'getArchiveSubscriptionUrls')
            end
            @archive_subscriptions_data
        end

        def branches
            if @branches_data.nil?
                @branches_data = @client.get(@username, 'getBranches')
            end
            @branches_data
        end

        def bug_subscriber_packages
            if @bug_subscribers_data.nil?
                @bug_subscribers_data = @client.get(@username, 'getBugSubscriberPackages')
            end
            @bug_subscribers_data
        end

        def merge_proposals
            if @merge_proposals_data.nil?
                @merge_proposals_data = @client.get(@username, 'getMergeProposals')
            end
            @merge_proposals_data
        end

        def requested_reviews
            if @requested_reviews_data.nil?
                @requested_reviews_data = @client.get(@username, 'getRequestedReviews')
            end
            @requested_reviews_data
        end

        def bugs
            if @bugs_data.nil?
                @bugs_data = @client.get(@username, 'searchTasks')
            end
            @bugs_data
        end

        def clear_cache
            @profile_data = nil
            @archive_subscriptions_data = nil
            @branches_data = nil
            @bug_subscribers_data = nil
            @merge_proposals_data = nil
            @requested_reviews_data = nil
            @bugs_data = nil
        end

        # I'm nuts so lets patch method missing for easy acces to 
        # profile data.
        def method_missing(name, *args, &block)
          key = @opts[:fast_hash] ? name : name.to_s
          profile.has_key?(key) ? profile[key] : super
        end
    end
end