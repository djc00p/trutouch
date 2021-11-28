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

  describe "Detail Service Header" do
    let(:obd) { DetailService.select_detail("Odor Bomb") }

    it "has a h1 with Detail Services" do
      within "#detail_service_header" do
        expect(page).to have_css("h1", text: "Detail Services")
      end
    end

    it "has a h4 with Additional Charges" do
      within "#detail_service_header" do
        expect(page).to have_css("h4", text: "Additional Charges")
      end
    end

    it "has a list of additional charges to be added to the detail services." do
      within "#detail_service_header" do
        expect(page).to have_css("ul/li", text: "Optional Odor Bomb $#{obd.base_price}")
      end
    end
  end
end
