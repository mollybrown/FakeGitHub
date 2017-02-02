require 'rails_helper'

describe GithubService do
  before(:all) do
    @user = User.create(uid: "8581642",
                        username: "mollybrown",
                        token: "2bf42aac76350242875b4e8da9b91777527bb453",
                        created_at: "2017-02-01 06:14:22",
                        updated_at: "2017-02-01 06:14:22")
  end

  context ".get_user" do
    it "returns basic user information" do
      VCR.use_cassette("github_service.get_user") do
        raw_user_info = GithubService.new(@user).get_user

        expect(raw_user_info).to be_an(Hash)

        expect(raw_user_info).to have_key(:id)
        expect(raw_user_info).to have_key(:login)
        expect(raw_user_info).to have_key(:email)
        expect(raw_user_info).to have_key(:name)
      end
    end
  end
end
