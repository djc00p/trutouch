# frozen_string_literal: true

class GeoapifyService
  attr_reader :trutouch_lat, :trutouch_lon, :radius_meters

  def initialize
    @trutouch_lat = ENV["trutouch_lat"].to_f
    @trutouch_lon = ENV["trutouch_lon"].to_f
    @radius_meters = ENV["geoapify_radius_meters_limit"]
  end

  def confirm_address(address)
    address_results = geocode_search(address)[:results]
    address_confidence_level = confirm_confidence_level(address_results, address)

    confirmed_address?(address, address_results, address_confidence_level)
  end

  def geocode_search(address)
    url = "/v1/geocode/search"
    params = { apiKey: ENV["GEOAPIFY_API_KEY"],
               format: "json",
               filter: "circle:#{@trutouch_lon},#{@trutouch_lat},#{@radius_meters}|countrycode:us",
               limit: 3,
               text: address }

    get_json(url, params)
  end

  private

  def conn
    Faraday.new(url: "https://api.geoapify.com",
                headers: { "Accept" => "application/json" }) do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url, params)
    response = conn.get(url, params)

    JSON.parse(response.body, symbolize_names: true)
  end

  def confirmed_address?(address, results, confidence_level)
    case confidence_level[:validation]
    when "NOT_CONFIRMED"
      { address_line1: address }.merge!(confidence_level)
    when "PARTIALLY_CONFIRMED"
      partially_confirmed_address(results[confidence_level.delete(:index)]).merge!(confidence_level)
    when "CONFIRMED"
      confirmed_address(results[0]).merge!(confidence_level)
    end
  end

  def confirmed_address(address)
    { address_line1: address[:address_line1], city: address[:city], state: address[:state_code],
      zip_code: address[:postcode] }
  end

  def partially_confirmed_address(address)
    confirmed_address(address)
  end

  def confirm_confidence_level(results, submitted_address)
    accept_level = 0.95
    decline_level = 0.2

    validation_result = {}

    if results.length.zero?
      validation_result[:validation] = "NOT_CONFIRMED"
      return validation_result
    end

    address = results[0]

    if address[:rank][:confidence] >= accept_level
      validation_result[:validation] = "CONFIRMED"
    elsif address[:rank][:confidence] < decline_level
      validation_result[:validation] = "NOT_CONFIRMED"
    else
      validation_result.merge!(partially_confirmed(submitted_address, results, accept_level))
    end

    validation_result
  end

  def address_attributes_included?(result, address)
    address = address.strip.titleize

    (result.key?(:housenumber) && result[:housenumber] == address.to_i.to_s) &&
      (address.include?(result[:city]) || address.include?(result[:postcode]))
  end

  def partially_confirmed(address, results, accept_level, validation_result = {})
    results.each_with_index do |result, index|
      next unless address_attributes_included?(result, address)

      validation_result[:index] = index
      validation_result[:validation] = "PARTIALLY_CONFIRMED"
      validation_result[:validation_details] = validation_details(result, accept_level)
    end

    validation_result[:validation] = "NOT_CONFIRMED" unless validation_result.key?(:validation)

    validation_result
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
