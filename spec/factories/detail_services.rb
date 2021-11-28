# frozen_string_literal: true

FactoryBot.define do
  factory :detail_service do
    sequence(:name) { |n| "Joe Mama#{n}" }
    base_price { rand(10..100) }
    description { "Cleaning services" }
  end
end
