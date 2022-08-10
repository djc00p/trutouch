# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:valid_address) { "1750 Welton Street, Denver, CO 80202" }
  let(:addresses) { create_list(:address, 2, addressable: user) }

  before do |test|
    user
    visit sign_in_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_button "Sign In"
    click_on "Add Address" unless test.metadata[:dont_click_on]
  end

  it "is able to see new address add that uses 2 address lines", :vcr do
    fill_in "address[address_line1]", with: valid_address

    click_button "Create Address"

    expect(page).to have_content("Grand Hyatt Denver, 1750 Welton Street, Denver, CO 80202")
  end
end
