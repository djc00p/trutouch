# frozen_string_literal: true

class ClearBraService < ApplicationRecord
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
end
