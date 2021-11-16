# frozen_string_literal: true

FactoryBot.define do
  factory :tint_service do
    name { "MyString" }
    tint_manufacturer { "MyString" }
    vehicle_type { "MyString" }
    price { "" }
    description { "MyText" }
  end
end
