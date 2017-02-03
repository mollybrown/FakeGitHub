class DashboardController < ApplicationController
  def index
    user = User.find(session[:user_id])
    @user_profile = User.user_info(user)
    @starred = User.starred_repos(user)
    @followers = User.followers(user)
    @following = User.following(user)
    @organizations = User.organizations(user)
    @repositories = User.repositories(user)
  end

end
