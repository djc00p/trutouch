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
    click_on "Add Address"
    choose("structured-form")
  end

  it "is able to create new address to user by filling in the structured form", :vcr do
    fill_in "address[housenumber]", with: "9551"
    fill_in "address[street]", with: "S University Blvd"
    fill_in "address[city]", with: "Highlands Ranch"
    fill_in "address[zip_code]", with: "80126"
    
    click_button "Create Address"

    expect(page).to have_content("Your address has been confirmed!")
  end
end
