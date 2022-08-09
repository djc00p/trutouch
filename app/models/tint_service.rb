# frozen_string_literal: true

class TintService < ApplicationRecord
  # Model Associations
  has_many :appointment_services, as: :service, dependent: :nullify
  has_many :appointments, through: :appointment_services

  # Validations
  validates :name, presence: true
  validates :tint_manufacturer, presence: true
  validates :vehicle_type, presence: true
  validates :price, presence: true
  validates :description, presence: true

  # Class Methods
  def self.tint_services
    all
  end
end
