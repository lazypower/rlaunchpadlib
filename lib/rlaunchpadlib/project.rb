module Rlaunchpadlib
    class Project

        attr_accessor :project
        attr_accessor :overview_data

        def initialize(project)
            @project = project
            @client = Rlaunchpadlib::Client.new
        end

        def overview
            if @overview_data.nil?
                @client.get(@project)
            else
                @overview_data
            end
        end


        def bugs
            @client.get(@project, 'searchTasks')
        end


        # I'm nuts so lets patch method missing.
        def method_missing(name, *args, &block)
          overview.has_key?(name.to_s) ? overview[name.to_s] : super
        end
    end
end