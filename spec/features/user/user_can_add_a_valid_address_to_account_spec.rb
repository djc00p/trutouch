# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:valid_address) { "7350 E Colfax Ave, Denver, CO 80220" }
  let(:addresses) { create_list(:address, 2, user_id: user.id) }

  before do |test|
    user
    visit sign_in_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_button "Sign In"
    click_on "Add Address" unless test.metadata[:dont_click_on]
  end

  it "has an Add Address button", :dont_click_on do
    expect(page).to have_button("Add Address")
  end

  it "is able to add new address to user by filling in form", :vcr do
    fill_in "address[address_line1]", with: valid_address

    click_button "Create Address"

    expect(page).to have_content("Your address has been confirmed!")
    expect(page).to have_content("Your address has been add!")
  end

  it "is able to see new address add by the user", :vcr do
    fill_in "address[address_line1]", with: valid_address

    click_button "Create Address"

    expect(page).to have_content("7350 East Colfax Avenue, Denver, CO 80220")
  end
end
