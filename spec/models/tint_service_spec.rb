# frozen_string_literal: true

require "rails_helper"

RSpec.describe TintService, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :tint_manufacturer }
    it { is_expected.to validate_presence_of :vehicle_type }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :description }
  end

  describe "Class Methods" do
    before do
      create_list(:tint_service, 14)
    end

    it "display all tint_services" do
      expect(described_class.tint_services.count).to eq(14)
    end
  end
end
