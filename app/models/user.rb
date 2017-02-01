class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |user|
      user.uid       = auth_info.uid
      user.token     = auth_info.credentials.token
      # user.email     = auth_info.info.email
      # user.avatar    = auth_info.info.image
      # user.name      = auth_info.info.name
      user.username  = auth_info.info.nickname
      # user.followers = auth_info.extras.raw_info.followers
      # user.following = auth_info.extras.raw_info.following
      user.save
      return user
    end
  end

  def self.user_info(user)
    GithubService.new(user).get_user
  end

end
