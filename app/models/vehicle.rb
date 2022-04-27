# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :user
  validates :year, :color, :make, :model, :classification, presence: true

  # Instance Methods
  def production_vehicle
    ProductionVehicle.find_by(make: make, model: model, production_year: year)
  end

  def production_vehicle_classfication(production_vehicle)
    production_vehicle.attributes.fetch_values("vehicle_size", "vehicle_type", "vehicle_class").compact.join(" ")
  end
end
