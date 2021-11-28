# frozen_string_literal: true

require "rails_helper"

RSpec.describe DetailService, type: :model do
  describe "Validations" do
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :base_price }
    it { is_expected.to validate_presence_of :description }
  end

  describe "Class Methods" do
    before do
      create(:detail_service, name: "Executive Full Detail", base_price: 10, description: "With our Full Detail")
      create(:detail_service, name: "Full Detail", base_price: 10, description: "With our Full Detail")
      create(:detail_service, name: "Odor Bomb", base_price: 10, description: "With our Full Detail")
      create(:detail_service, name: "Steam Cleaning", base_price: 10, description: "Hot Cleaning")
      create_list(:detail_service, 5)
    end

    it "display all detail_services" do
      expect(described_class.detail_services.count).to eq(9)
    end

    it "display all main_detail_services" do
      expect(described_class.main_detail_services.count).to eq(1)
    end

    it "display all deluxe_detail_services" do
      expect(described_class.deluxe_detail_services.count).to eq(1)
    end

    it "display all additional_detail_services" do
      expect(described_class.additional_detail_services.count).to eq(7)
    end

    it "display a select_detail" do
      expect(described_class.select_detail("Steam Cleaning").description).to eq("Hot Cleaning")
    end
  end
end
