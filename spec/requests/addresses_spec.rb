# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/addresses", type: :request do
  let(:user) { create(:user) }
  let(:text_address) { "7350 E Colfax Ave, Denver, CO 80220" }
  let(:addresses) { create_list(:address, 2, user_id: user.id) }

  describe "GET /new" do
    it "renders a successful response" do
      get new_profile_address_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Address" do
        expect do
          post profile_addresses_url(user), params: { address: text_address }
        end.to change(Address, :count).by(1)
      end

      it "redirects to the user profile" do
        post profile_addresses_url(user), params: { address: text_address }
        expect(response).to redirect_to(profile_url(user))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Address" do
        expect do
          post profile_my_addresses_url(user), params: { address: text_address }
        end.to change(Address, :count).by(0)
      end

      it "renders a unsuccessful response (i.e. to display the 'new' template)" do
        post profile_my_addresses_url(user), params: { address: text_address }
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
