require_relative '../../spec_helper'

describe 'Rlaunchpadlib::Client' do
 
    describe "GET" do

        before do
            VCR.insert_cassette 'client_get', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        before(:each) do
            @client = Rlaunchpadlib::Client.new
        end

        it "on a basic resource returns a Hash Result" do
            expect(@client.get('~lazypower')).to be_a(Hash)
        end

        it "on a sub-resource returns a Hash Result" do
           expect(@client.get('charms', 'getTasks')).to be_a(Hash) 
        end

    end
end