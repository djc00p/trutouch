# frozen_string_literal: true

require "rails_helper"

RSpec.describe VehiclesController, type: :routing do
  describe "routing" do
    let(:user) { create(:user) }

    it "routes to #index" do
      expect(get: "/profile/#{user.id}/my_vehicles").to route_to(controller: "vehicles", action: "index",
                                                                 profile_id: user.id.to_s)
    end

    it "routes to #create" do
      expect(post: "/profile/#{user.id}/my_vehicles").to route_to(controller: "vehicles", action: "create",
                                                                  profile_id: user.id.to_s)
    end

    it "routes to #new" do
      expect(get: "/profile/#{user.id}/add_my_vehicle").to route_to(controller: "vehicles", action: "new",
                                                                    profile_id: user.id.to_s)
    end

    it "routes to #show" do
      expect(get: "/my_vehicles/1").to route_to("vehicles#show", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/my_vehicles/1").to route_to("vehicles#destroy", id: "1")
    end
  end
end
