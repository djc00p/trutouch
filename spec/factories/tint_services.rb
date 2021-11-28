# frozen_string_literal: true

FactoryBot.define do
  factory :tint_service do
    name { "Full Tint" }
    tint_manufacturer { "3m" }
    vehicle_type { "any" }
    price { rand(10..100) }
    description { "Window tint" }
  end
end
