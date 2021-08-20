# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Home", type: :feature do
  describe "home page" do
    before do
      visit root_path
    end

    describe "Company Services Sections" do
      it "has a description of company services" do
        within ".company_services" do
          expect(page).to have_css("h1", text: "TRUTOUCH SERVICES")
        end
      end

      it "has a list of company services" do
        within ".company_services_list" do
          expect(page).to have_selector("li", text: "High End Detailing")
        end
      end
    end

    describe "About Us Section" do
      it "has an Experienced Staff section" do
        within ".about_us" do
          expect(page).to have_content("Experienced Staff")
        end
      end

      it "has a High-Quality Products section" do
        within ".about_us" do
          expect(page).to have_content("High-Quality Products")
        end
      end

      it "has an Our Quality Promise section" do
        within ".about_us" do
          expect(page).to have_content("Our Quality Promise")
        end
      end
    end
  end
end
