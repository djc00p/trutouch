class Address < ApplicationRecord
  belongs_to :user
  validates :address_line_1, :city, :state, :zip_code, presence: true
end
