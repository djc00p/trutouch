# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :user
  validates :year, :color, :make, :model, :classification, presence: true
end
