# frozen_string_literal: true

require "rails_helper"

RSpec.describe AddressesController, type: :routing do
  describe "routing" do
    let(:user) { create(:user) }

    it "routes to #create" do
      expect(post: "/profile/#{user.id}/addresses").to route_to(controller: "addresses", action: "create",
                                                                  profile_id: user.id.to_s)
    end

    it "routes to #new" do
      expect(get: "/profile/#{user.id}/add_address").to route_to(controller: "addresses", action: "new",
                                                                    profile_id: user.id.to_s)
    end

    it "routes to #destroy" do
      expect(delete: "/addresses/1").to route_to("addresses#destroy", id: "1")
    end
  end
end
