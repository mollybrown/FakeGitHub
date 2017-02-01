class DashboardController < ApplicationController
  def index
    user = User.find(session[:user_id])
    @user_stuff = User.user_info(user)
    render json: @user_stuff.body
  end

end
