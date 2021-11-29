# frozen_string_literal: true

FactoryBot.define do
  factory :clear_bra_service do
    sequence(:name) { |n| "Clear Bra#{n}" }
    price { 1 }
    description { "MyText" }
  end
end
