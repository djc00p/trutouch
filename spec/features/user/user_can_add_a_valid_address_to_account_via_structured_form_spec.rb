# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:structured_address) do
    { housenumber: "9551", street: "S University Blvd", city: "Highlands Ranch", state: "Colorado", zip_code: "80126" }
  end

  before do
    user
    structured_address
    sign_in_as user
    click_on "Add Address"
  end

  it "is able to create new address to user by filling in the structured form", :vcr do
    structured_address_form_fill_in structured_address

    click_button "Create Address"

    expect(page).to have_content("Your address has been confirmed!")
  end
end
