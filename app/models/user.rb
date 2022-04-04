# frozen_string_literal: true

class User < ApplicationRecord
  before_save :normalize_phone_number

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :phone_number, :email, uniqueness: true
  has_secure_password

  def user_activation_email
    UserMailer.with(user: self).welcome_activation.deliver_now
  end

  def formatted_phone_number
    parsed_phone_number = Phonelib.parse(phone_number)
    return phone_number if parsed_phone_number.invalid?

    formatted =
      if parsed_phone_number.country_code == "1"
        parsed_phone_number.full_national
      else
        parsed_phone_number.full_international
      end
    formatted.gsub!(";", " x")
    formatted
  end

  private

  def normalize_phone
    self.phone_number = Phonelib.parse(phone_number).full_e164.presence
  end
end
