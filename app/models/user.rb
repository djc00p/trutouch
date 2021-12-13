class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone_number
  validates_uniqueness_of :email
  has_secure_password
end
