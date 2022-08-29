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

  let(:cb) do
    create(
      :tint_service,
      name: "Full Clear Bra",
      price: 260,
      description: "Clear Bra things"
    )
  end

  before do
    details
    create_list(:tint_service, 5)
    cb
    create_list(:clear_bra_service, 5)

    visit our_services_path
  end

  describe "Clear Bra Services Section" do
    let(:tsc) { ClearBraService.all.count }

    it "has a h1 with Clear Bra Services" do
      within "#clear_bra_service_header" do
        expect(page).to have_css("h1", text: "Clear Bra Services")
      end
    end

    it "shows the exact amount of Clear Bra Service options available" do
      within "#clear_bra_service_object" do
        expect(page).to have_css("section", count: tsc)
      end
    end

    it "has the tint options name visible" do
      within "#service-#{cb.id}" do
        expect(page).to have_css("h2", text: cb.name)
      end
    end

    it "has the tint options price visible" do
      within "#service-#{cb.id}" do
        expect(page).to have_css("li", text: "Price: $#{cb.price}")
      end
    end

    it "has the tint options description visible" do
      within "#service-#{cb.id}" do
        expect(page).to have_css("li", text: cb.description)
      end
    end
  end
end
