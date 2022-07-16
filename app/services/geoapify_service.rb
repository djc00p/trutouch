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
    address_confidence_levels = confidence_level(address_results)
    return unless address_confidence_levels[:validation] == ("CONFIRMED" || "PARTIALLY_CONFIRMED")

    confirmed_address(address_results[0]).merge!(address_confidence_levels)
  end

  def confirmed_address(address)
    { address_line1: address[:address_line1], city: address[:city], state: address[:state_code],
      zip_code: address[:postcode] }
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

  # Geoapify recommended check for confidenece_level

  def confidence_level(results)
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
      validation_result[:validation] = "PARTIALLY_CONFIRMED"
      validation_result[:validation_details] = if address[:rank][:confidence_street_level] >= accept_level
                                                 "BUILDING_NOT_FOUND"
                                               elsif address[:rank][:confidence_city_level] >= accept_level
                                                 "STREET_LEVEL_DOUBTS"
                                               else
                                                 "CITY_LEVEL_DOUBTS"
                                               end
    end

    validation_result
  end
end
