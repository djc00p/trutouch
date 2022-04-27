# frozen_string_literal: true

require "rails_helper"

RSpec.describe Vehicle, type: :model do
  describe "Validations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to validate_presence_of :year }
    it { is_expected.to validate_presence_of :color }
    it { is_expected.to validate_presence_of :make }
    it { is_expected.to validate_presence_of :model }
    it { is_expected.to validate_presence_of :classification }
  end

  describe "Instance Methods" do
    let(:user) { create(:user) }
    let(:production_vehicle) { create(:production_vehicle) }
    let(:classification_string) { [production_vehicle[:vehicle_size], production_vehicle[:vehicle_type], production_vehicle[:vehicle_class]].compact.join(" ") }
    let(:vehicle) { build(:vehicle,
      year: production_vehicle[:production_year],
      color: Faker::Vehicle.color,
      make: production_vehicle[:make],
      model: production_vehicle[:model],
      classification: nil,
      user_id: user.id)
    }

    it "can find the production vehicle to get classification info" do
      expect(vehicle.production_vehicle).to match(production_vehicle)
    end

    it "can create a string of production vehicle classification info" do
      expect(vehicle.production_vehicle_classification(production_vehicle)).to match(classification_string)
    end

    it "can assign vehicle classification info from production vehicle" do
      vehicle.assign_classification
      expect(vehicle.classification).to match(classification_string)
    end
  end
end
