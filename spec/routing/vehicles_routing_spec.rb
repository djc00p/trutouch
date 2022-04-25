# frozen_string_literal: true

require "rails_helper"

RSpec.describe VehiclesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/my_vehicles").to route_to("vehicles#index")
    end

    it "routes to #create" do
      expect(post: "/my_vehicles").to route_to("vehicles#create")
    end

    it "routes to #new" do
      expect(get: "/add_my_vehicle").to route_to("vehicles#new")
    end

    it "routes to #edit" do
      expect(get: "/my_vehicle/1/edit").to route_to("vehicles#edit", id: "1")
    end

    it "routes to #show" do
      expect(get: "/my_vehicle/1").to route_to("vehicles#show", id: "1")
    end

    it "routes to #update" do
      expect(patch: "/my_vehicle/1").to route_to("vehicles#update", id: "1")
    end

    it "routes to #update" do
      expect(put: "/my_vehicle/1").to route_to("vehicles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/my_vehicle/1").to route_to("vehicles#destroy", id: "1")
    end
  end
end
