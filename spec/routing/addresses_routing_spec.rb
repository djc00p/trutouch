# frozen_string_literal: true

require "rails_helper"

RSpec.describe AddressesController, type: :routing do
  describe "routing" do
    let(:user) { create(:user) }
    let(:address) { create(:address, user_id: user.id) }

    it "routes to #create" do
      expect(post: "/profile/#{user.id}/addresses").to route_to(controller: "addresses", action: "create",
                                                                profile_id: user.id.to_s)
    end

    it "routes to #new" do
      expect(get: "/profile/#{user.id}/addresses/new").to route_to(controller: "addresses", action: "new",
                                                                   profile_id: user.id.to_s)
    end

    it "routes to #destroy" do
      expect(delete: "/addresses/#{address.id}").to route_to("addresses#destroy", id: address.id.to_s)
    end
  end
end
