# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Detail Services", type: :feature do
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

  describe "Additional Detail Services Section" do
    let(:sc) { DetailService.select_detail("Steam Cleaning") }
    let(:adsc) { DetailService.additional_detail_services.count }

    it "has a h1 with Additional Detail Services" do
      within "#additional_ds" do
        expect(page).to have_css("h1", text: "Additional Detail Services")
      end
    end

    it "shows the exact amount of Additional Detail Service options available" do
      within "#additional_ds" do
        expect(page).to have_css("section", count: adsc)
      end
    end

    it "has the detail options name visible" do
      within "#service-#{sc.id}" do
        expect(page).to have_css("h2", text: sc.name)
      end
    end

    it "has the detail options base price visible" do
      within "#service-#{sc.id}" do
        expect(page).to have_css("li", text: "Base Price: $#{sc.base_price}")
      end
    end

    it "has the detail options description visible" do
      within "#service-#{sc.id}" do
        expect(page).to have_css("li", text: sc.description)
      end
    end
  end
end
