# frozen_string_literal: true

class GeoapifyService
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
end
