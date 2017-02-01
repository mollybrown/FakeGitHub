class GithubService

  def initialize(user)
    @user = user
    @github_api_root = Faraday.new(url: "https://api.github.com/")
    @github_api_root.headers[:Authorization] = "token #{@user['token']}"
  end

  def get_user
    response = @github_api_root.get("users/#{@user["username"]}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_commits
    response = @github_api_root.get("users/#{@user["username"]}/events")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_repositories
    response = @github_api_root.get("users/#{@user["username"]}/repos")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_organizations
    response = @github_api_root.get("user/orgs")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_starred_repos
    response = @github_api_root.get("user/starred")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_followers
    response = @github_api_root.get("user/followers")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_following
    response = @github_api_root.get("user/following")
    JSON.parse(response.body, symbolize_names: true)
  end



end
