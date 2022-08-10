# frozen_string_literal: true

class Appointment < ApplicationRecord
  # Model Associations
  belongs_to :customer
  belongs_to :vehicle
  has_many :appointment_addresses, dependent: :destroy
  has_many :addresses, through: :appointment_addresses
  has_many :appointment_services, dependent: :destroy
  has_many :detail_services, through: :appointment_services, source: :service,
                             source_type: "DetailService"
  has_many :tint_services, through: :appointment_services, source: :service,
                           source_type: "TintService"
  has_many :clear_bra_services, through: :appointment_services, source: :service,
                                source_type: "ClearBraService"

  # Validations
  validates :estimated_total_cost, :estimated_total_time, :pickup_drop_off, :scheduled_for,
            :scheduled_on, :services_count, :status, presence: true
end
