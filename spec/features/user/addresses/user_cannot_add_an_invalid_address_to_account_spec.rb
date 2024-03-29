# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:invalid_address) { "752 E Tecnology Way, Denver, CO 80237" }

  before do
    user
    sign_in_as user
    click_on "Add Address"
  end

  it "is not able to add new address to user because it could not be confirmed", :vcr do
    fill_in "address[address_line1]", with: invalid_address

    click_button "Create Address"

    expect(page).to have_content("Please check the provided address is correct.")
  end
end
