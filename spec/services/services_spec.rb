require 'rails_helper'

describe GithubService do
  before(:all) do
    @user = User.create(uid: "8581642",
                        username: "mollybrown",
                        token: ENV['TOKEN'],
                        created_at: "2017-02-01 06:14:22",
                        updated_at: "2017-02-01 06:14:22")
  end

  context ".get_user" do
    it "returns basic user information" do
      VCR.use_cassette("github_service.get_user") do
        raw_user_info = GithubService.new(@user).get_user

        expect(raw_user_info).to be_an(Hash)

        expect(raw_user_info).to have_key(:id)
        expect(raw_user_info).to have_key(:login)
        expect(raw_user_info).to have_key(:email)
        expect(raw_user_info).to have_key(:name)
      end
    end
  end

  context ".get_commits" do
    it "returns user commits info" do
      VCR.use_cassette("github_service.get_commits") do
        raw_commits_info = GithubService.new(@user).get_commits
        expect(raw_commits_info).to be_an(Array)
        expect(raw_commits_info.count).to eq(30)

        raw_commit_info = raw_commits_info.first

        expect(raw_commit_info).to be_an(Hash)
        expect(raw_commit_info).to have_key(:repo)
        expect(raw_commit_info).to include(:type=>"PushEvent")
      end
    end
  end

  context ".get_following_commits" do
    it "returns commits info for followed users" do
      VCR.use_cassette("github_service.get_following_commits") do
        raw_following_commits_info = GithubService.new(@user).get_following_commits
        expect(raw_following_commits_info).to be_an(Array)
        expect(raw_following_commits_info.count).to eq(30)

        raw_followed_commit_info = raw_following_commits_info.first

        expect(raw_followed_commit_info).to be_an(Hash)
        expect(raw_followed_commit_info).to have_key(:repo)
        expect(raw_followed_commit_info).to include(:type=>"WatchEvent")
      end
    end
  end

  context ".get_repositories" do
    it "returns user repositories info" do
      VCR.use_cassette("github_service.get_repositories") do
        raw_repos_info = GithubService.new(@user).get_repositories
        expect(raw_repos_info).to be_an(Array)
        expect(raw_repos_info.count).to eq(27)

        raw_repo_info = raw_repos_info.first

        expect(raw_repo_info).to be_an(Hash)
        expect(raw_repo_info).to have_key(:description)
        expect(raw_repo_info).to include(:default_branch => "master")
      end
    end
  end

  context ".get_organizations" do
    it "returns user organizations info" do
      VCR.use_cassette("github_service.get_organizations") do
        raw_orgs_info = GithubService.new(@user).get_organizations
        expect(raw_orgs_info).to be_an(Array)
        expect(raw_orgs_info.count).to eq(0)

        raw_org_info = raw_orgs_info.first

        expect(raw_org_info).to eq(nil)
      end
    end
  end

  context ".get_starred_repos" do
    it "returns starred repositories info" do
      VCR.use_cassette("github_service.get_starred_repos") do
        raw_starred_repos_info = GithubService.new(@user).get_starred_repos
        expect(raw_starred_repos_info).to be_an(Array)
        expect(raw_starred_repos_info.count).to eq(5)

        raw_starred_repo_info = raw_starred_repos_info.first

        expect(raw_starred_repo_info).to be_an(Hash)
        expect(raw_starred_repo_info).to_not include("mollybrown")
      end
    end
  end

  context ".get_followers" do
    it "returns user followers info" do
      VCR.use_cassette("github_service.get_followers") do
        raw_followers_info = GithubService.new(@user).get_followers
        expect(raw_followers_info).to be_an(Array)
        expect(raw_followers_info.count).to eq(0)

        raw_follower_info = raw_followers_info.first

        expect(raw_follower_info).to eq(nil)
      end
    end
  end

  context ".get_following" do
    it "returns followed user info" do
      VCR.use_cassette("github_service.get_following") do
        raw_following_info = GithubService.new(@user).get_following
        expect(raw_following_info).to be_an(Array)
        expect(raw_following_info.count).to eq(2)

        raw_followed_info = raw_following_info.first

        expect(raw_followed_info).to include(:login=>"muan")
      end
    end
  end

end
