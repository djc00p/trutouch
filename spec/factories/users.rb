FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    sequence(:email) { |n| "example#{n}@email.com" }
    password { "MyString123" }
  end
end
