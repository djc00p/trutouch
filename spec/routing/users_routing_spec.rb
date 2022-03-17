# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/sign_up").to route_to("users#new")
    end

    it "routes to #show" do
      expect(get: "/profile/1").to route_to("users#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/profile/1/edit").to route_to("users#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/profile").to route_to("users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/profile/1").to route_to("users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/profile/1").to route_to("users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/profile/1").to route_to("users#destroy", id: "1")
    end

    it "routes to #activation" do
      expect(get: "/activation").to route_to("users#activation")
    end
  end
end
