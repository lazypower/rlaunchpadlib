require_relative '../../spec_helper'

describe 'Rlaunchpadlib::User' do
 
    before(:each) do
        @user = Rlaunchpadlib::User.new('lazypower')
    end

    describe "GET profile" do

        before do
            VCR.insert_cassette 'user', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "records the fixture" do
            @user.profile
        end

        it "returns profile data as a hash" do
            expect(@user.profile).to be_a(Hash)
        end

        it "Knows if I've signed the code of conduct" do
            expect(@user.profile['is_ubuntu_coc_signer']).to eq(true)
        end

    end

    describe "Dynamic Method Attributes" do

        it "Translates hash keys to properties" do
            expect(@user.is_ubuntu_coc_signer).to eq(true)
        end
    end

end