# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:invalid_address) { "650 S R L Thornton Fwy, Dallas, TX 75203" }

  before do
    user
    sign_in_as user
    click_on "Add Address"
  end

  it "is not able to add new address to user because out side our radius or cant be found", :vcr do
    fill_in "address[address_line1]", with: invalid_address

    click_button "Create Address"

    expect(page).to have_content("Please check the provided address is correct.")
  end
end
