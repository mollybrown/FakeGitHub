require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    before(:all) do
      @user = User.create(uid: "1234567",
                          username: "githubuser",
                          token: "1234",
                          created_at: "2016-02-01 06:14:22",
                          updated_at: "2016-02-01 06:14:22")
    end

    it "has a user id" do
      expect(@user.uid).to eq("1234567")
    end

    it "has a username (nickname)" do
      expect(@user.username).to eq("githubuser")
    end

    it "has a token" do
      expect(@user.token).to eq("1234")
    end


  end
end
