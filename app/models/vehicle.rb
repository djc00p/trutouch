# frozen_string_literal: true

class Vehicle < ApplicationRecord
  # Associations
  belongs_to :owner, polymorphic: true

  # Validations
  validates :year, :color, :make, :model, :classification, presence: true

  # Instance Methods
  def production_vehicle
    ProductionVehicle.find_by(make_model_split, production_year: year)
  end

  def production_vehicle_classification(production_vehicle)
    return unless production_vehicle

    production_vehicle.attributes.fetch_values("vehicle_size", "vehicle_type", "vehicle_class").compact.join(" ")
  end

  def assign_classification
    update_vehicle_make_model_and_classification
  end

  # Class Methods
  def self.colors
    %w[Beige Black Blue Brown Gold Gray Green Orange Pink Purple Red Silver White
       Yellow]
  end

  private

  def make_model_split
    { make: make.split(", ").pop, model: model.split(", ").pop }
  end

  def update_vehicle_make_model_and_classification
    assigned_classification = production_vehicle_classification(production_vehicle)

    update(**make_model_split, classification: assigned_classification)
  end
end
