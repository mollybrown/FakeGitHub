require 'rails_helper'

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      'uid' => '8581642',
      # 'info' => { 'name' => 'Molly Rachel Brown',
      #             'email' => 'mollbrown@gmail.com',
      #             'nickname' => 'mollybrown'
      #            },
    })
  end

  # OmniAuth.config.test_mode = true
  #   omniauth_hash = { 'provider' => 'github',
  #                     'uid' => '8581642',
  #                     'info' => {
  #                         'name' => 'Molly Rachel Brown',
  #                         'email' => 'mollbrown@gmail.com',
  #                         'nickname' => 'mollybrown'
  #                     },
  #
  #   }
  #
  #   OmniAuth.config.add_mock(:github, omniauth_hash)

describe "Authentication Workflow:" do
  before do
    stub_omniauth
    # Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  context "A user" do
    it "can visit the landing page (root)" do
      visit root_path

      assert_equal 200, page.status_code
      expect(current_path).to eq root_path
      expect(page).to have_content("Sign in to FakeGitHub")
      expect(page).to have_link("Sign In")
    end

    xit "can sign in with a existing GitHub account" do
      visit root_path

      click_link("Sign In")
      click_link("Sign in with GitHub")

      expect(current_path).to eq dashboard_index_path
      expect(page).to have_content("Molly Rachel Brown")
      expect(page).to have_content("mollybrown")
      expect(page).to have_content("mollyrachelbrown@gmail.com")
    end
  end

end
