# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user
  validates :address_line1, :city, :state, :zip_code, :validation, presence: true

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
    "#{address_line1}, #{city}, #{state} #{zip_code}"
  end

  def confirm_address(address)
    address_results = geocode_search_results(address)
    address_confidence_level = confirm_confidence_level(address_results, address)

    confirmed_address?(address_results, address_confidence_level)
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

  private

  def confirmed_address?(results, confidence_level)
    case confidence_level[:validation]
    when "NOT_CONFIRMED"
      confidence_level
    when "PARTIALLY_CONFIRMED"
      partially_confirmed_address(results[confidence_level.delete(:index)], confidence_level)
    when "CONFIRMED"
      confirmed_address(results[0], confidence_level)
    end
  end

  def confirmed_address(address, confidence_level)
    update(address_line1: address[:address_line1], city: address[:city], state: address[:state_code],
           zip_code: address[:postcode], validation: confidence_level[:validation].titleize)

    confidence_level
  end

  def partially_confirmed_address(address, confidence_level)
    confirmed_address(address, confidence_level)
  end

  def confirm_confidence_level(results, submitted_address)
    accept_level = 0.95

    validation_result = {}

    if results.length.zero?
      validation_result[:validation] = "NOT_CONFIRMED"
      return validation_result
    end

    address = results[0]

    if address[:rank][:confidence] >= accept_level
      validation_result[:validation] = "CONFIRMED"
    else
      paresed_results = parse_search_results(submitted_address, results, accept_level)
      validation_result.merge!(paresed_results)
    end

    validation_result
  end

  def parse_search_results(address, results, accept_level, validation_result = {})
    results.each_with_index do |result, index|
      next unless !validation_result.key?(:validation) && address_attributes_included?(result, address)

      validation_result[:index] = index
      validation_result[:validation] = "PARTIALLY_CONFIRMED"
      validation_result[:validation_details] = validation_details(result, accept_level)
    end

    validation_result[:validation] = "NOT_CONFIRMED" unless validation_result.key?(:validation)

    validation_result
  end

  def address_attributes_included?(result, address)
    address = address.strip.titleize

    (result.key?(:housenumber) && result[:housenumber] == address.to_i.to_s) &&
      (address.include?(result[:city]) || address.include?(result[:state]) ||
       address.include?(result[:state_code]) || address.include?(result[:postcode]))
  end

  def validation_details(address, accept_level)
    if address[:rank].key?(:confidence_street_level) && address[:rank][:confidence_street_level] >= accept_level
      "BUILDING_NOT_FOUND"
    elsif address[:rank][:confidence_city_level] >= accept_level
      "STREET_LEVEL_DOUBTS"
    else
      "CITY_LEVEL_DOUBTS"
    end
  end
end
