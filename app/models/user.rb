# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :phone_number, :email, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  has_secure_password
end
