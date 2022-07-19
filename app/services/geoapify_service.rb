# frozen_string_literal: true

class GeoapifyService
  attr_reader :trutouch_lat, :trutouch_lon, :radius_meters

  def initialize(address)
    @address = address
    @trutouch_lat = ENV["trutouch_lat"].to_f
    @trutouch_lon = ENV["trutouch_lon"].to_f
    @radius_meters = ENV["geoapify_radius_meters_limit"]
  end

  def geocode_search
    url = "/v1/geocode/search"
    params = { apiKey: ENV["GEOAPIFY_API_KEY"],
               format: "json",
               filter: "circle:#{@trutouch_lon},#{@trutouch_lat},#{@radius_meters}|countrycode:us",
               limit: 3,
               text: @address }

    get_json(url, params)
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.geoapify.com",
                headers: { "Accept" => "application/json" }) do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
