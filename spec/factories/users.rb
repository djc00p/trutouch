# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { ["+14123736103", "+16699168802", "+18082347067", "+15156277272"].shuffle.pop }
    sequence(:email) { |n| "example#{n}@email.com" }
    password { "MyString123" }
    prefered_method_of_contact { "email" }
  end
end
