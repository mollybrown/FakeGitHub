class GithubService

  def initialize(user)
    @user = user
    @github_api_root = Faraday.new(url: "https://api.github.com/")
    @github_api_root.headers[:Authorization] = "token #{@user['token']}"
  end

  def get_user
    @github_api_root.get("users/#{@user["username"]}")
  end

end
