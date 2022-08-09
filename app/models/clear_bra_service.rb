# frozen_string_literal: true

class ClearBraService < ApplicationRecord
  # Model Associations
  has_many :appointment_services, as: :service, dependent: :nullify
  has_many :appointments, through: :appointment_services

  # Validations
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
end
