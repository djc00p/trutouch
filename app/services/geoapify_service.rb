# frozen_string_literal: true

class GeoapifyService
  def confirm_address(address)
    address_results = address_look_up(address)[:results]
    address_confidence_levels = confidence_level(address_results)
    return unless address_confidence_levels[:validation] == ("CONFIRMED" || "PARTIALLY_CONFIRMED")

    confirmed_address(address_results[0]).merge!(address_confidence_levels)
  end

  def confirmed_address(address)
    { address_line1: address[:address_line1], city: address[:city], state: address[:state_code],
      zip_code: address[:postcode] }
  end

  def address_look_up(address)
    get_json(address)
  end

  private

  def conn
    lat_lon = "#{ENV['trutouch_lat']},#{ENV['trutouch_lon']}"
    radius_meters = ENV["geoapify_radius_meters_limit"]

    Faraday.new(url: "https://api.geoapify.com/v1/geocode/search",
                headers: { "Accept" => "application/json" }) do |f|
      f.params[:limit] = 3
      f.params[:filter] = "circle:#{lat_lon},#{radius_meters}|countrycode:us"
      f.params[:apiKey] = ENV["GEOAPIFY_API_KEY"]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(address)
    response = conn.get(address)
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
