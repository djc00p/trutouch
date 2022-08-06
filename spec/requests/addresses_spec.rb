# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/addresses", type: :request do
  let(:user) { create(:user) }
  let(:valid_address) { { address_line1: "7350 E Colfax Ave, Denver, CO 80220" } }
  let(:partially_valid_address) { { address_line1: "16639 E Atlantic Pl, Aurora, CO" } }
  let(:invalid_address) { { address_line1: "7582 E Tecnology Way, Denver, CO 80237" } }
  let(:addresses) { create_list(:address, 2, validation: "Confirmed", addressable: user) }

  describe "GET /new" do
    it "renders a successful response" do
      get new_profile_address_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Address", :vcr do
        expect do
          post profile_addresses_url(user), params: { address: valid_address }
        end.to change(Address, :count).by(1)
      end

      it "redirects to the user profile", :vcr do
        post profile_addresses_url(user), params: { address: valid_address }
        expect(response).to redirect_to(profile_url(user))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Address", :vcr do
        expect do
          post profile_addresses_url(user), params: { address: invalid_address }
        end.to change(Address, :count).by(0)
      end

      it "renders a unsuccessful response (i.e. to display the 'new' template)", :vcr do
        post profile_addresses_url(user), params: { address: invalid_address }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested vehicle" do
      user.addresses << addresses
      expect do
        delete address_url(addresses[0])
      end.to change(Address, :count).by(-1)
    end

    it "redirects to the profile_url" do
      user.addresses << addresses
      delete address_url(addresses[0])
      expect(response).to redirect_to(profile_url(user))
    end
  end
end
