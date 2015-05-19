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
            @clientfh = Rlaunchpadlib::Client.new({:fast_hash => true})
        end

        it "on a basic resource returns a Hash Result" do
            expect(@client.get('~lazypower')).to be_a(Hash)
        end

        it "on a sub-resource returns a Hash Result" do
           expect(@client.get('charms', 'getTasks')).to be_a(Hash) 
        end

        # These two tests could be beefed up to determine if the deeply-nested keys are symbols
        # but this test should suffice as the same operation is performed for each level.
        it "on a basic resource returns a Hash Result with symbolic keys [:fast_hash set to true]" do
          expect(@clientfh.get('~lazypower').keys[0]).to be_a(Symbol)
        end
        
        it "on a sub-resource returns a Hash Result with symbolic keys [:fast_hash set to true]" do
          expect(@clientfh.get('charms', 'getTasks').keys[0]).to be_a(Symbol)
        end
        
    end
end