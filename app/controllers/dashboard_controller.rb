class DashboardController < ApplicationController
  def index
    # byebug
    @user = User.find(session[:user_id])
  end
end
