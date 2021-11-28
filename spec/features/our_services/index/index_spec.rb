# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Our Services", type: :feature do
  describe "our services page" do
    let(:s) { ["Executive Full Detail", "Full Detail", "Odor Bomb", "Steam Cleaning"] }
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

    describe "Detail Services Section" do
      it "has a h3 for Detail Services" do
        within "#detail_service_header" do
          expect(page).to have_css("h1", text: "Detail Services")
        end
      end
    end
  end
end
