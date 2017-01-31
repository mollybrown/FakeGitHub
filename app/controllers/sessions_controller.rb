class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    binding.pry

    # user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    # session[:user_id] = user.id
    # redirect_to root_url, :notice => "Signed in!"

    # @response =
    Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV['GITHUB_KEY']}&client_secret=#{ENV['GITHUB_SECRET']}&code=#{params["code"]}")
    #
    #
    # token = @response.body.split(/\W+/)[1]
    redirect_to dashboard_index_path
  end

end
