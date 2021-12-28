# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }

  before do
    user

    visit sign_in_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_button "Sign In"
  end

  it "can sign out" do
    click_on "Sign Out"

    expect(page).to have_content("See Ya! We look forward to your next visit!")
  end
end
