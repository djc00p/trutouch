# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }

  before do
    user
    sign_in_as user
  end

  it "can sign out" do
    click_on "Sign Out"

    expect(page).to have_content("See Ya! We look forward to your next visit!")
  end
end
