# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tint Services", type: :feature do
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

  let(:t) do
    create(
      :tint_service,
      name: "Full Tint",
      tint_manufacturer: "3M",
      vehicle_type: "sedan",
      price: 260,
      description: "3M window tint applied to four doors and the back window."
    )
  end

  before do
    details
    t
    create_list(:tint_service, 14)

    visit our_services_path
  end

  describe "Section" do
    it "has a h1 with Tint Information" do
      within "#tint_info" do
        expect(page).to have_css("h2", text: "Tint Information")
      end
    end

    it "has a h4 with Tint % Ranges" do
      within "#tint_info" do
        expect(page).to have_css("h4", text: "Tint % Ranges")
      end
    end

    it "has a example image with Tint % Ranges" do
      within "#tint_info" do
        expect(page).to have_css("img", id: "tpr")
      end
    end

    it "has a h1 with Tint Services" do
      within "#tint_service_header" do
        expect(page).to have_css("h1", text: "Tint Services")
      end
    end
  end
end
