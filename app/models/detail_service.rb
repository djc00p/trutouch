class DetailService < ApplicationRecord
  validates_uniqueness_of :name
  validates_presence_of :base_price
  validates_presence_of :description
end
