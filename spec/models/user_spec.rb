require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    
    before(:all) do
      @user = User.new(uid: "1234567", username: "githubuser", token: ENV["token"])
    end

    it "responds to uid" do
      expect(@user).to respond_to(:uid)
    end

    it "responds to username (nickname)" do
      expect(@user).to respond_to(:username)
    end

    it "responds to token" do
      expect(@user).to respond_to(:uid)
    end


  end
end
