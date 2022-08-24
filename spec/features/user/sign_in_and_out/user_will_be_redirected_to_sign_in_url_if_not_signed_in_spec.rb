# frozen_string_literal: true

# frozen_string_literal

require "rails_helper"

describe "User", type: :feature do
  let(:user) { create(:user) }

  it "is redirected to sign_in_path if user is not signed in" do
    visit profile_url(user)

    expect(page).to have_current_path(sign_in_path)
  end
end
