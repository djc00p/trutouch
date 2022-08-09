# frozen_string_literal: true

class AppointmentServices < ApplicationRecord
  # Model Associations
  belongs_to :appointment
  belongs_to :service, polymorphic: true

  # Validations
  validates :started_at, :estimated_cost, :estimated_time_to_complete, :special_instructions,
            presence: true
end
