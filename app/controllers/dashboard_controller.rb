class DashboardController < ApplicationController
  def index
    user = User.find(session[:user_id])
    user_stuff = User.user_info(user)
    @name = user_stuff[:name]
    @location = user_stuff[:location]
    @email = user_stuff[:email]
    @username = user_stuff[:login]
    @avatar = user_stuff[:avatar_url]

    @starred = User.starred_repos(user)
    @followers = User.followers(user)
    @following = User.following(user)
    @commits = User.commits(user)
    @repositories = User.repositories(user)
    @organizations = User.organizations(user)
    @following_commits = User.following_commits(user)
  end

end
