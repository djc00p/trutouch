# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:vehicles) { create_list(:vehicle, 5, owner: user) }

  before do
    user.vehicles << vehicles
    sign_in_as user
    vehicles
    visit profile_my_vehicles_url(user)
  end

  describe "vehicles index" do
    it "can delete a vehicle" do
      within "#vehicle-#{vehicles[1].id}" do
        click_button class: "btn-danger"
      end

      expect(page).to have_content("Your vehicle has been deleted!")
    end
  end

  describe "vehicles show" do
    it "can delete a vehicle" do
      within "#vehicle-#{vehicles[1].id}" do
        click_button "Show"
      end

      click_button "Delete Vehicle"

      expect(page).to have_content("Your vehicle has been deleted!")
    end
  end
end
