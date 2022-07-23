# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user
  validates :address_line1, :city, :state, :zip_code, :validation, presence: true
  include AddressConfirmation

  # Class Methods
  def self.us_states
    [%w[Alabama AL], %w[Alaska AK], %w[Arizona AZ], %w[Arkansas AR], %w[California CA], %w[Colorado CO],
     %w[Connecticut CT], %w[Delaware DE], %w[Florida FL], %w[Georgia GA], %w[Hawaii HI], %w[Idaho ID],
     %w[Illinois IL], %w[Indiana IN], %w[Iowa IA], %w[Kansas KS], %w[Kentucky KY], %w[Louisiana LA],
     %w[Maine ME], %w[Maryland MD], %w[Massachusetts MA], %w[Michigan MI], %w[Minnesota MN],
     %w[Mississippi MS], %w[Missouri MO], %w[Montana MT], %w[Nebraska NE], %w[Nevada NV],
     ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["New York", "NY"],
     ["North Carolina", "NC"], ["North Dakota", "ND"], %w[Ohio OH], %w[Oklahoma OK], %w[Oregon OR],
     %w[Pennsylvania PA], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"],
     %w[Tennessee TN], %w[Texas TX], %w[Utah UT], %w[Vermont VT], %w[Virginia VA], %w[Washington WA],
     ["West Virginia", "WV"], %w[Wisconsin WI], %w[Wyoming WY]]
  end

  # Instance Methods
  def formatted_address
    if address_line2.nil?
      "#{address_line1}, #{city}, #{state} #{zip_code}"
    else
      "#{address_line1}, #{address_line2}, #{city}, #{state} #{zip_code}"
    end
  end

  def geocode_search_results(address)
    geoapify_service(address).geocode_search[:results]
  end

  def geoapify_service(address)
    @geoapify_service ||= GeoapifyService.new(address)
  end

  def search_results(address)
    confirm_address(address)
  end
end
