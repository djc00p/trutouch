# frozen_string_literal: true

class AppointmentAddress < ApplicationRecord
  # Model Associations
  belongs_to :address
  belongs_to :appointment

  # Validations
  validates :pickup, :drop_off, :distance_units, presence: true
end
