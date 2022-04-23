# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    year { rand(1970..Time.now.year) }
    color { Faker::Vehicle.color }
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model(make_of_model: make) }
    classification { Faker::Vehicle.car_type }
  end
end
