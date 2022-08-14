# frozen_string_literal: true

require "rails_helper"

module SignInHelpers
  def sign_in_as(user)
    visit sign_in_path
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_button "Sign In"
  end
end
