# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }

  before do
    sign_in_as user
    visit appointment_path
  end

  it "able to see and click on schedule appointment" do
    click_on "Schedule Appointment"

    expect(page).to have_current_path(new_profile_appointment_path(user), ignore_query: true)
  end
end
