# frozen_string_literal: true

class AppointmentServices < ApplicationRecord
  # Model Associations
  belongs_to :appointment
  belongs_to :service, polymorphic: true
end
