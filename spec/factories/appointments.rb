# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    began_at { "2022-08-08 07:26:12" }
    finished_at { "2022-08-08 07:26:12" }
    estimated_total_cost { "MyString" }
    estimated_total_time { "2022-08-08 07:26:12" }
    pickup_drop_off { false }
    scheduled_for { "2022-08-08 07:26:12" }
    scheduled_on { "2022-08-08 07:26:12" }
    services_count { 1 }
    status { "Pending" }
    total_cost { "MyString" }
    total_time { "2022-08-08 07:26:12" }
  end
end
