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

        it "returns profile data as a hash" do
            expect(@user.profile).to be_a(Hash)
        end

        it "Knows if I've signed the code of conduct" do
            expect(@user.profile['is_ubuntu_coc_signer']).to eq(true)
        end

    end

    describe "GET user Archive Subscriptions" do

        before do
            VCR.insert_cassette 'user_archivesubscriptions', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.archive_subscriptions).to be_a(Hash)
        end
    end

    describe "GET User Branches" do

        before do
            VCR.insert_cassette 'user_branches', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.branches).to be_a(Hash)
        end
    end

    describe "GET User Bug Subscriber Packages" do

        before do
            VCR.insert_cassette 'user_bug_subscriber_packages', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.bug_subscriber_packages).to be_a(Hash)
        end
    end

    describe "GET User Merge Proposals" do

        before do
            VCR.insert_cassette 'user_merge_proposals', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.merge_proposals).to be_a(Hash)
        end
    end

    describe "GET User Requested Reviews" do

        before do
            VCR.insert_cassette 'user_requested_reviews', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.requested_reviews).to be_a(Hash)
        end
    end

    describe "GET User Bugs" do

        before do
            VCR.insert_cassette 'user_bugs', :record => :new_episodes
        end

        after do
            VCR.eject_cassette
        end

        it "returns a hash of Archive Subscriptions" do
            expect(@user.bugs).to be_a(Hash)
        end
    end


    describe "Dynamic Method Attributes" do

        it "Translates hash keys to properties" do
            expect(@user.is_ubuntu_coc_signer).to eq(true)
        end
    end

end