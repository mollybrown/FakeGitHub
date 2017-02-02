class User < ApplicationRecord

  # def initialize(user)
  #   GithubService.new(user)
  # end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid       = auth_info.uid
      user.token     = auth_info.credentials.token
      user.username  = auth_info.info.nickname
      user.save
      return user
    end
  end

  def self.user_info(user)
    GithubService.new(user).get_user
  end

  def self.repositories(user)
    GithubService.new(user).get_repositories
  end

  def self.organizations(user)
    GithubService.new(user).get_organizations
  end

  def self.starred_repos(user)
    GithubService.new(user).get_starred_repos
  end

  def self.followers(user)
    GithubService.new(user).get_followers
  end

  def self.following(user)
    GithubService.new(user).get_following
  end

  def self.commits(user)
    commits_array = []
    result = GithubService.new(user).get_commits

    commits_array = result.map do |push_event|
      push_event[:payload][:commits]
    end
  end

end
