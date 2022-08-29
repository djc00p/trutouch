# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Our Services", type: :feature do
  let(:s) do
    [
      "Executive Full Detail",
      "Full Detail",
      "Odor Bomb",
      "Steam Cleaning"
    ]
  end
  let(:details) do
    create_list(:detail_service, 9) do |service, i|
      if s
        service.name = s[i]
        service.save
      end
    end
  end

  before do
    details

    visit our_services_path
  end

  describe "Main Detail Services Section" do
    let(:fd) { DetailService.select_detail("Full Detail") }
    let(:mdsc) { DetailService.main_detail_services.count }

    it "has a h1 with Main Detail Services" do
      within "#main_detail_services" do
        expect(page).to have_css("h1", text: "Main Detail Services")
      end
    end

    it "shows the exact amount of Main Detail Service options available" do
      within "#main_detail_services" do
        expect(page).to have_css("section", count: mdsc)
      end
    end

    it "has the detail options name visible" do
      within "#service-#{fd.id}" do
        expect(page).to have_css("h2", text: fd.name)
      end
    end

    it "has the detail options base price visible" do
      within "#service-#{fd.id}" do
        expect(page).to have_css("li", text: "Base Price: $#{fd.base_price}")
      end
    end

    it "has the detail options description visible" do
      within "#service-#{fd.id}" do
        expect(page).to have_css("li", text: fd.description)
      end
    end
  end
end
