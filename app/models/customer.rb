# frozen_string_literal: true

class Customer < ApplicationRecord
  # Associations
  has_one :user, dependent: :destroy
  has_many :vehicles, as: :owner, dependent: :destroy

  # Validations
  validates :first_name, :last_name, :email, :phone_number, :prefered_method_of_contact, presence: true
  validates :phone_number, :email, uniqueness: true
  validates :phone_number, phone: true
end
