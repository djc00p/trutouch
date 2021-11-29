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

  describe "Deluxe Detail Services Section" do
    let(:efd) { DetailService.select_detail("Executive Full Detail") }
    let(:ddsc) { DetailService.deluxe_detail_services.count }

    it "has a h1 with Deluxe Detail Services" do
      within "#deluxe_ds" do
        expect(page).to have_css("h1", text: "Deluxe Detail Services")
      end
    end

    it "shows the exact amount of Deluxe Detail Service options available" do
      within "#deluxe_ds" do
        expect(page).to have_css("section", count: ddsc)
      end
    end

    it "has the detail options name visible" do
      within "#service-#{efd.id}" do
        expect(page).to have_css("h2", text: efd.name)
      end
    end

    it "has the detail options base price visible" do
      within "#service-#{efd.id}" do
        expect(page).to have_css("li", text: "Base Price: $#{efd.base_price}")
      end
    end

    it "has the detail options description visible" do
      within "#service-#{efd.id}" do
        expect(page).to have_css("li", text: efd.description)
      end
    end
  end
end
