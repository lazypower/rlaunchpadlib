require_relative '../../spec_helper'

describe 'Rlaunchpadlib::ProjectGroup' do
 
    before(:each) do
        @projectgroup = Rlaunchpadlib::ProjectGroup.new('mozilla')
    end


     describe "default attributes" do

        it 'Must include the base Launchpad API endpoint' do
            expect(@projectgroup.base_uri).to eq('https://api.launchpad.net')
        end

        it 'Must include the base Launchpad API endpoint' do
            expect(@projectgroup.api_version).to eq('1.0')
        end

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

end