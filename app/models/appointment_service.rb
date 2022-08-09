# frozen_string_literal: true

class AppointmentService < ApplicationRecord
  # Model Associations
  belongs_to :appointment
  belongs_to :service, polymorphic: true
  counter_culture :appointment, column_name: "services_count"

  # Validations
  validates :started_at, :estimated_cost, :estimated_time_to_complete, :special_instructions,
            presence: true
end
