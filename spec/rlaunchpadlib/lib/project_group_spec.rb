require_relative '../../spec_helper'

describe 'Rlaunchpadlib::ProjectGroup' do
 
    before(:each) do
        @projectgroup = Rlaunchpadlib::ProjectGroup.new('mozilla')
    end

    describe "GET overview" do

        before do
            VCR.insert_cassette 'project_group', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "records the fixture" do
            @projectgroup.overview
        end

        it "returns overview data as a hash" do
            expect(@projectgroup.overview).to be_a(Hash)
        end

        

    end

    describe "Dynamic Method Attributes" do

        it "Knows the project is active" do
            expect(@projectgroup.active).to eq(true)
        end
        
        it "Has a title" do
            expect(@projectgroup.title).to_not be_nil
        end

    end

    describe "Subresource of ProjectGroup Bugs" do

        before do
            VCR.insert_cassette 'project_group_bugs', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of all bugs" do
            expect(@projectgroup.bugs).to be_a(Hash)
        end

    end

    describe "Subresource of ProjectGroup MPs" do

        before do
            VCR.insert_cassette 'project_group_merges', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of all MPs" do
            expect(@projectgroup.merge_proposals).to be_a(Hash)
        end

    end


    describe "Subresource of ProjectGroup Branches" do

        before do
            VCR.insert_cassette 'project_group_branches', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "Returns a Hash of all Branches" do
            expect(@projectgroup.branches).to be_a(Hash)
        end

    end


end