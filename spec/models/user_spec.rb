require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    before(:all) do
      @user = User.new(uid: "8581642", username: "mollybrown", token: ENV["token"])
    end

    it "responds to uid" do
      expect(@user).to respond_to(:uid)
    end

    it "responds to username (nickname)" do
      expect(@user).to respond_to(:username)
    end

    it "responds to token" do
      expect(@user).to respond_to(:uid)
    end

    it "returns the user's commits" do
      VCR.use_cassette("github_service.get_commits") do
        commits = User.commits(@user)
        expect(commits.count).to eq(30)
      end
    end

    it "returns the commits of followed users" do
      VCR.use_cassette("github_service.get_following_commits") do
        following_commits = User.following_commits(@user)
        expect(following_commits.count).to eq(30)
      end
    end

    it "returns the user's repositories" do
      VCR.use_cassette("github_service.get_repositories") do
        repos = User.repositories(@user)
        expect(repos.count).to eq(27)
      end
    end

    it "returns the user's organizations" do
      VCR.use_cassette("github_service.get_organizations") do
        orgs = User.organizations(@user)
        expect(orgs.count).to eq(1)
      end
    end

    it "returns the user's starred repos" do
      VCR.use_cassette("github_service.get_starred_repos") do
        stars = User.starred_repos(@user)
        expect(stars.count).to eq(5)
      end
    end

    it "returns the user's followers" do
      VCR.use_cassette("github_service.get_followers") do
        user_followers = User.followers(@user)
        expect(user_followers.count).to eq(0)
      end
    end

    it "returns the followed users" do
      VCR.use_cassette("github_service.get_followed") do
        user_following = User.following(@user)
        expect(user_following.count).to eq(2)
      end
    end

  end
end
