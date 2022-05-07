# frozen_string_literal: true

FactoryBot.define do
  factory :production_vehicle do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model(make_of_model: make) }
    production_year { Faker::Vehicle.year }
    vehicle_size { "Subcompact" }
    vehicle_type { "Luxury" }
    vehicle_class { Faker::Vehicle.car_type }
  end
end
