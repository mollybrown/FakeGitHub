require 'rails_helper'

describe "Landing Page" do
  it "has a link to sign in or sign up" do

    expect(page).to have_link("Sign In")
    expect(page).to have_link("Sign Up")
  end
end
