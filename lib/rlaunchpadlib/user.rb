require 'httparty'

module Rlaunchpadlib
    class User

        attr_accessor :username
        attr_accessor :profile_data

        def initialize(username)
            @client = Rlaunchpadlib::Client.new
            @username = "~#{username}"
        end

        def profile
            if @profile_data.nil?
                @profile_data = @client.get(@username)
            else
                @profile_data
            end
        end

        def archive_subscriptions
            @client.get(@username, 'getArchiveSubscriptionUrls')
        end

        def branches
            @client.get(@username, 'getBranches')
        end

        def bug_subscriber_packages
            @client.get(@username, 'getBugSubscriberPackages')
        end

        def merge_proposals
            @client.get(@username, 'getMergeProposals')
        end

        def requested_reviews
            @client.get(@username, 'getRequestedReviews')
        end

        def bugs
            @client.get(@username, 'searchTasks')
        end


        # I'm nuts so lets patch method missing for easy acces to 
        # profile data.
        def method_missing(name, *args, &block)
          profile.has_key?(name.to_s) ? profile[name.to_s] : super
        end


    end
end