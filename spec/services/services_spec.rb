require 'rails_helper'

describe GithubService do
  before(:all) do
    @user = User.create(uid: "8581642",
                        username: "mollybrown",
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

  context ".get_commits" do
    it "returns user commits info" do
      VCR.use_cassette("github_service.get_commits") do
        raw_user_info = GithubService.new(@user).get_commits

        expect(raw_user_info).to be_an(Array)
        expect(raw_user_info.count).to eq(27)

        expect(raw_user_info).to have_key(:id)
        expect(raw_user_info).to have_key(:login)
        expect(raw_user_info).to have_key(:email)
        expect(raw_user_info).to have_key(:name)
      end
    end
  end

end
