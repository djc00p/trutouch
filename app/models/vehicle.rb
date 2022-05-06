# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :user
  validates :year, :color, :make, :model, :classification, presence: true

  # Instance Methods
  def production_vehicle
    ProductionVehicle.find_by(make: make, model: model, production_year: year)
  end

  def production_vehicle_classification(production_vehicle)
    return unless production_vehicle

    production_vehicle.attributes.fetch_values("vehicle_size", "vehicle_type", "vehicle_class").compact.join(" ")
  end

  def assign_classification
    update_vehicle_classification
  end

  # Class Methods
  def self.colors
    %w[Beige Black Blue Brown Gold Gray Green Orange Pink Purple Red Silver White
       Yellow]
  end

  private

  def update_vehicle_classification
    assigned_classification = production_vehicle_classification(production_vehicle)

    update(classification: assigned_classification)
  end
end
