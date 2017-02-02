class GithubService

  def initialize(user)
    @user = user
    @github_api_root = Faraday.new(url: "https://api.github.com/")
    @github_api_root.headers[:Authorization] = "token #{@user['token']}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_user
    parse(@github_api_root.get("users/#{@user["username"]}"))
  end

  def get_commits
    parse(@github_api_root.get("users/#{@user["username"]}/events"))
  end

  def get_repositories
    parse(@github_api_root.get("users/#{@user["username"]}/repos"))
  end

  def get_organizations
    parse(@github_api_root.get("user/orgs"))
  end

  def get_starred_repos
    parse(@github_api_root.get("user/starred"))
  end

  def get_followers
    parse(@github_api_root.get("user/followers"))
  end

  def get_following
    parse(@github_api_root.get("user/following"))
  end

end
