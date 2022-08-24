# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }

  before do
    user
    sign_in_as user
    visit verification_url(user)
    user.reload
  end

  it "can verify account" do
    fill_in "user[verification_code]", with: user.verification_code

    click_button "Update User"

    expect(page).to have_content("Thank you! Your account is now verified.")
  end
end
