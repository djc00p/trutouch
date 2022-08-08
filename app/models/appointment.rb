# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
end
