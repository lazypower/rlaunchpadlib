require_relative '../../spec_helper'

describe 'Rlaunchpadlib::Project' do
 
    before(:each) do
        @project = Rlaunchpadlib::Project.new('bzr')
    end


     describe "default attributes" do

        it 'Must include the base Launchpad API endpoint' do
            expect(@project.base_uri).to eq('https://api.launchpad.net')
        end

        it 'Must include the base Launchpad API endpoint' do
            expect(@project.api_version).to eq('1.0')
        end

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

    describe "Dynamic Method Attributes" do

        it "Knows the project is active" do
            expect(@project.active).to eq(true)
        end
        
        it "Has a title" do
            expect(@project.title).to_not be_nil
        end

    end

end