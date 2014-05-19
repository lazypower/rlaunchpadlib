require_relative '../../spec_helper'

describe 'Rlaunchpadlib::Project' do
 
    before(:each) do
        @project = Rlaunchpadlib::Project.new('bzr')
    end

    describe "GET overview" do

        before do
            VCR.insert_cassette 'project', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "records the fixture" do
            @project.overview
        end

        it "returns overview data as a hash" do
            expect(@project.overview).to be_a(Hash)
        end

    end


    describe "Subresource of Project Bugs" do

        before do
            VCR.insert_cassette 'project_bugs', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of all bugs" do
            expect(@project.bugs).to be_a(Hash)
        end

    end

    describe "Subresource of Project Branches" do

        before do
            VCR.insert_cassette 'project_branches', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of all Branches" do
            expect(@project.branches).to be_a(Hash)
        end

    end


    describe "Subresource of Project Merge Proposals" do

        before do
            VCR.insert_cassette 'project_merge_proposals', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of all Merge Proposals" do
            expect(@project.merge_proposals).to be_a(Hash)
        end

    end


    describe "Subresource of Project Subscriptions" do

        before do
            VCR.insert_cassette 'project_subscriptions', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of all Subscriptions" do
            expect(@project.subscriptions).to be_a(Hash)
        end

    end


    describe "Subresource of Project Timeline" do

        before do
            VCR.insert_cassette 'project_timeline', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of the Timeline" do
            expect(@project.timeline).to be_a(Hash)
        end

    end


     describe "Reset Cache" do
        it "clears all data storage attributes" do
            # warm the caches
            @project.subscription_data = Hash.new
            @project.merge_proposal_data = Hash.new
            @project.branch_data = Hash.new
            @project.overview_data = Hash.new
            @project.bug_data = Hash.new
            @project.timeline_data = Hash.new
            # expunge the cache
            @project.clear_cache
            expect(@project.subscription_data).to be_nil
            expect(@project.merge_proposal_data).to be_nil
            expect(@project.branch_data).to be_nil
            expect(@project.overview_data).to be_nil
            expect(@project.timeline_data).to be_nil
        end
    end


    describe "Dynamic Method Attributes" do

        it "Knows the project is active" do
            expect(@project.active).to eq(true)
        end
        
        it "Has a title" do
            expect(@project.title).to_not be_nil
        end

    end

end