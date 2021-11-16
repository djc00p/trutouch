# frozen_string_literal: true

class TintService < ApplicationRecord
  validates :name, presence: true
  validates :tint_manufacturer, presence: true
  validates :vehicle_type, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
