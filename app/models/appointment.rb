# frozen_string_literal: true

class Appointment < ApplicationRecord
  # Model Associations
  belongs_to :customer
  belongs_to :vehicle

  # Validations
  validates :estimated_total_cost, :estimated_total_time, :pickup_drop_off, :scheduled_for,
            :scheduled_on, :services_count, :status, presence: true
end
