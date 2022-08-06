# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:partially_valid_address) { "16639 E Atlantic Pl, Aurora, CO" }
  let(:partially_confirmed_address) { create(:address,  validation: "Partially Confirmed", addressable: user) }

  before do |test|
    user
    user.addresses << partially_confirmed_address
    visit sign_in_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_button "Sign In"
    click_on "Add Address" unless test.metadata[:dont_click_on]
  end

  it "is able to add new partially confirmed address to user by filling in form", :vcr do
    fill_in "address[address_line1]", with: partially_valid_address

    click_button "Create Address"

    expect(page).to have_content("Your address has been add!")
  end

  it "is able to partially confirmed an address", :vcr do
    fill_in "address[address_line1]", with: partially_valid_address

    click_button "Create Address"

    expect(page).to have_content("Your address has been partially confirmed.")
  end

  it "is able to see partially confirmed address has a Confirm Address button", :vcr do
    fill_in "address[address_line1]", with: partially_valid_address

    click_button "Create Address"

    expect(page).to have_button("Confirm Address")
  end

  it "is able to confirm a partially confirmed address", :dont_click_on do
    within "##{partially_confirmed_address.id}" do
      click_button "Confirm Address"
    end

    expect(page).to have_content("Your address has been confirmed!")
  end
end
