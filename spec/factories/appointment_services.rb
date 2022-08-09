# frozen_string_literal: true

FactoryBot.define do
  factory :appointment_service do
    started_at { "2022-08-08 07:26:12" }
    completed_at { "2022-08-08 07:26:12" }
    estimated_cost { "MyString" }
    estimated_time_to_complete { "2022-08-08 07:26:12" }
    actual_cost { nil }
    time_to_completion { nil }
    special_instructions { false }
  end
end
