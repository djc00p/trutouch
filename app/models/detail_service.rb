# frozen_string_literal: true

class DetailService < ApplicationRecord
  validates :name, uniqueness: true
  validates :base_price, presence: true
  validates :description, presence: true
end
