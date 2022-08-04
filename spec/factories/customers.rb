# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "example#{n}@email.com" }
    phone_number { ["+14123736103", "+16699168802", "+18082347067", "+15156277272"].shuffle.pop }
    prefered_method_of_contact { "email" }
  end
end
