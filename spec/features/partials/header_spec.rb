# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Header", type: :feature do
  before do
    visit root_path
  end

  describe "Logo" do
    it "has an image tag" do
      within ".logo" do
        expect(page).to have_css("img", id: "logo")
      end
    end

    it "is a link to the home page" do
      visit products_used_path

      click_on "TruTouch Logo"

      expect(page).to have_current_path(root_path, ignore_query: true)
    end
  end

  describe "Nav" do
    it "has a link to the Home page" do
      within "#nav_links" do
        expect(page).to have_link("Home")
      end
    end

    it "has a link to the Our Services page" do
      within "#nav_links" do
        expect(page).to have_link("Our Services")
      end
    end

    it "has a link to the Products Used page" do
      within "#nav_links" do
        expect(page).to have_link("Products Used")
      end
    end

    it "has a link to the Portfolio page" do
      within "#nav_links" do
        expect(page).to have_link("Portfolio")
      end
    end

    it "has a link to the Appointment page" do
      within "#nav_links" do
        expect(page).to have_link("Appointment")
      end
    end

    it "has a link to the Contact Us page" do
      within "#nav_links" do
        expect(page).to have_link("Contact Us")
      end
    end
  end

  describe "Nav Links Functionality" do
    let(:details) do
      s = ["Executive Full Detail", "Full Detail", "Odor Bomb", "Steam Cleaning"]
      create_list(:detail_service, 4) do |service, i|
        service.name = (s[i]).to_s
        service.save
      end
    end
    let(:user) { create(:user) }

    it "links to the Our Services page" do
      within "#nav_links" do
        details
        click_on "Our Services"

        expect(page).to have_current_path(our_services_path, ignore_query: true)
      end
    end

    it "links to the Products Used page" do
      click_on "Products Used"

      expect(page).to have_current_path(products_used_path, ignore_query: true)
    end

    it "links to the Portfolio page" do
      click_on "Portfolio"

      expect(page).to have_current_path(portfolio_path, ignore_query: true)
    end

    it "links to the Appointment page" do
      sign_in_as user
      click_on "Appointment"

      expect(page).to have_current_path(appointment_path, ignore_query: true)
    end

    it "links to the Contact Us page" do
      click_on "Contact Us"

      expect(page).to have_current_path(contact_us_path, ignore_query: true)
    end
  end
end
