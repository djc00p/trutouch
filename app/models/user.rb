# frozen_string_literal: true

class User < ApplicationRecord
  before_save :normalize_phone_number

  # Associations
  belongs_to :customer, optional: true
  has_many :vehicles, as: :owner, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy

  # Validations
  validates :vehicles, length: { maximum: 10 }
  validates :first_name, :last_name, :phone_number, :email, :prefered_method_of_contact, presence: true
  validates :phone_number, :email, uniqueness: true
  # phone: true refers to the PhoneValidator for Phonelib gem
  validates :phone_number, phone: true
  has_secure_password

  def verify_through_prefered_method_of_contact
    update(verification_code: SecureRandom.random_number(100_000..999_999))
    case prefered_method_of_contact
    when "email"
      user_verification_email
    when "text"
      user_verification_text
    end
  end

  def user_verification_email
    UserMailer.with(user: self).welcome_verification.deliver_now
  end

  def user_verification_text
    TextMessages::VerificationJob.perform_now(self)
  end

  def formatted_phone_number
    parsed_phone_number = Phonelib.parse(phone_number)
    return phone_number if parsed_phone_number.invalid?

    formatted =
      (parsed_phone_number.full_national if parsed_phone_number.country_code == "1")
    formatted.gsub!(";", " x")
    formatted
  end

  private

  def normalize_phone_number
    self.phone_number = Phonelib.parse(phone_number).full_e164.presence
  end
end
