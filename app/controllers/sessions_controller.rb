class SessionsController < ApplicationController

  def create
    # render json: request.env["omniauth.auth"]
      # byebug
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to dashboard_index_path
    else
      redirect_to root_path
    end
  end

end
