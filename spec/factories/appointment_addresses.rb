# frozen_string_literal: true

FactoryBot.define do
  factory :appointment_address do
    pickup { true }
    drop_off { false }
    distance { "MyString" }
    distance_units { "MyString" }
    excess_distance_upcharge { "MyString" }
    estimated_drive_time { "2022-08-09 07:40:24" }
    special_instructions { "MyString" }
  end
end
