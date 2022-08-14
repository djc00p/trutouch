# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address_line1 { Faker::Address.street_address }
    address_line2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip_code }
    validation { "Confirmed" }
  end
end
