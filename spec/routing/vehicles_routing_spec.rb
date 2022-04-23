# frozen_string_literal: true

require "rails_helper"

RSpec.describe VehiclesController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/add_vehicle").to route_to("vehicles#new")
    end
  end
end
