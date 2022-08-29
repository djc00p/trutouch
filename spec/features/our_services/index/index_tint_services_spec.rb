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

  describe "Tint Services Section" do
    let(:tsc) { TintService.tint_services.count }

    it "shows the exact amount of Tint Service options available" do
      within "#tint_service_object" do
        expect(page).to have_css("section", count: tsc)
      end
    end

    it "has the tint options name visible" do
      within "#service-#{t.id}" do
        expect(page).to have_css("h2", text: t.name)
      end
    end

    it "has the tint options tint_manufacturer visible" do
      within "#service-#{t.id}" do
        expect(page).to have_css("li", text: "Tint Manufacturer: #{t.tint_manufacturer}")
      end
    end

    it "has the tint options vehicle_type visible" do
      within "#service-#{t.id}" do
        expect(page).to have_css("li", text: "Vehicle Type: #{t.vehicle_type}")
      end
    end

    it "has the tint options price visible" do
      within "#service-#{t.id}" do
        expect(page).to have_css("li", text: "Price: $#{t.price}")
      end
    end

    it "has the tint options description visible" do
      within "#service-#{t.id}" do
        expect(page).to have_css("li", text: t.description)
      end
    end
  end
end
