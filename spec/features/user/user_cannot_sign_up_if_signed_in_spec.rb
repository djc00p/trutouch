# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:fake_email) { "email@email.com" }
  let(:fake_password) { "123" }

  before do
    user
    visit root_path
    click_link "Sign In"

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_button "Sign In"
  end

  it "can't visit sign up if signed in already" do
    visit sign_up_path

    expect(page).to have_content("Already Signed In! Please sign out to create a new account.")
  end

  it "can't visit sign in and is redirected to profile" do
    visit sign_up_path

    expect(page).to have_current_path(profile_path(user), ignore_query: true)
  end
end
