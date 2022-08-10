# frozen_string_literal: true

class AppointmentAddress < ApplicationRecord
  belongs_to :address
  belongs_to :appointment
end
