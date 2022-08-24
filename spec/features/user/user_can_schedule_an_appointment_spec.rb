# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:addresses) { create_list(:address, 3, addressable_id: user) }
  let(:vehicles) { create_list(:vehicle, 3, owner_id: user) }
  let(:scheduled_time) { DateTime.parse("09am-0600").next_week(:friday, same_time: true) }
  let(:appointment) { { scheduled_for: scheduled_time, service_type: "DetailService", service: "Full Detail" } }

  describe "can schedule an appointment" do
    before do
      user.addresses << addresses
      user.vehicles << vehicles
      sign_in_as user
      visit new_profile_appointment_path(user)
    end

    it "fill out appointment form pickup and drop off included" do
      select "Yes", from: "appointment[pickup_drop_off]"
      select "Pickup and Drop Off", from: "appointment[pickup_and_drop_off]"
      select addresses[1], from: "appointment[pickup_address]"
      check "Same as pickup address", for: "appointment[drop_off_address]"
      select vehicles[1], from: "appointment[vehicle]"
      select_appointment_form_info appointment # spec/support/appointment_helpers

      click_on "Schedule Appointment"

      expect(page).to have_content("Your appointment has been scheduled! We look foward to seeing you!")
    end
  end
end
