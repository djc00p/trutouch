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
  end

  it "can sign in" do
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_button "Sign In"

    expect(page).to have_content("Welcome, #{user.first_name}!")
  end

  it "is shown an error when incorrect info is entered" do
    fill_in "session[email]", with: fake_email
    fill_in "session[password]", with: fake_password

    click_on "Sign In"

    expect(page).to have_content("Email or password is invalid, please try again.")
  end

  it "can't visit sign in if signed in already" do # rubocop:disable RSpec/ExampleLength
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_button "Sign In"

    visit sign_in_path

    expect(page).to have_content("Already Signed In")
  end
end
