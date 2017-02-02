require 'rails_helper'

describe "Authentication Workflow:" do

  context "A user" do
    it "can visit the landing page (root)" do
      visit root_path

      assert_equal 200, page.status_code
      expect(current_path).to eq root_path
      expect(page).to have_content("Sign in to FakeGitHub")
      expect(page).to have_link("Sign In")
    end

    it "can sign in with a existing GitHub account" do
      VCR.use_cassette(".login") do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
          provider: 'github',
          uid: '8581642',
          credentials: {token: ENV['TOKEN']},
          info: {nickname: 'mollybrown'}
        })

        visit root_path

        click_link("Sign In")

        expect(current_path).to eq dashboard_index_path
        expect(page).to have_content("Molly Rachel Brown")
        expect(page).to have_content("mollybrown")
        expect(page).to have_content("mollyrachelbrown@gmail.com")
      end
    end
  end

end
