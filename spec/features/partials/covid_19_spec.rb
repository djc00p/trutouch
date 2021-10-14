# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Covid 19", type: :feature do
  describe "covid 19 banner" do
    before do
      visit root_path
      # click_on(class: covid_19_info)
    end

    describe "Statement to the customer" do
      it "has a welcome message on covid pandemic" do
        within ".covid_welcome_message" do
          expect(page).to have_css("h2", text: "Hello, VALUED CUSTOMER")
        end
      end
    end

    describe "STEPS WE ARE TAKING Section" do
      it "has a FREE Pickup and Drop Off Service section" do
        within "#fpdos" do
          expect(page).to have_css("h2", text: "FREE Pickup and Drop Off Service")
        end
      end

      it "has a Onsite or At Home Vehicle Inspections section" do
        within "#oahvi" do
          expect(page).to have_css("h2", text: "Onsite or At Home Vehicle Inspections")
        end
      end

      it "has a Washing Hands and Wearing Protective Gear section" do
        within "#whwpg" do
          expect(page).to have_css("h2", text: "Washing Hands and Wearing Protective Gear")
        end
      end

      it "has a Employees Feeling Sick section" do
        within "#efs" do
          expect(page).to have_css("h2", text: "Employees Feeling Sick")
        end
      end
    end
  end
end
