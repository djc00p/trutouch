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

  def my_addresses
    user_customer_associations("Address", "addressable_type", "addressable_id", "address_line1")
  end

  def my_vehicles
    user_customer_associations("Vehicle", "owner_type", "owner_id", "year, color, make, model")
  end

  def user_customer_associations(association_type, polymorphic_type, polymorphic_id, distinctions)
    # The send() method allows the string given through association_type to be converted to a method call.
    # ex. customer.send("addresses") == customer.addresses
    associations = send(association_type.downcase.pluralize)
    
    if customer_id.nil?
      associations
    elsif !customer_id.nil? && associations.length.positive?
      distinct_user_customer_associations(association_type, polymorphic_type, polymorphic_id, distinctions)
    else
      customer.send(association_type.downcase.pluralize)
    end
  end

  def distinct_user_customer_associations(association_type, polymorphic_type, polymorphic_id, distinctions)
    klass = Object.const_get association_type
    klass.select("DISTINCT on (#{distinctions}) *")
         .where({ polymorphic_type => %w[User Customer] })
         .where({ polymorphic_id => [id, customer_id] })
  end

  private

  def normalize_phone_number
    self.phone_number = Phonelib.parse(phone_number).full_e164.presence
  end
end
