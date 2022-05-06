# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/vehicles", type: :request do
  let(:user) { create(:user) }
  let(:production_vehicle) { create(:production_vehicle) }
  let(:vehicles) { create_list(:vehicle, 2, user_id: user.id) }
  let(:valid_attributes) do
    {
      year: production_vehicle[:production_year],
      color: Faker::Vehicle.color,
      make: production_vehicle[:make],
      model: production_vehicle[:model]
    }
  end

  let(:invalid_attributes) do
    {
      year: 1,
      color: "14123736103",
      make: Faker::Name.last_name,
      model: Faker::Name.first_name
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      user.vehicles << [vehicles[0], vehicles[1]]
      get profile_my_vehicles_url(user)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get profile_add_my_vehicle_url(user)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get my_vehicle_url(vehicle)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Vehicle" do
        expect do
          post profile_my_vehicles_url(user), params: { vehicle: valid_attributes }
        end.to change(Vehicle, :count).by(1)
      end

      it "redirects to the user profile" do
        post profile_my_vehicles_url(user), params: { vehicle: valid_attributes }
        expect(response).to redirect_to(profile_url(user))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vehicle" do
        expect do
          post profile_my_vehicles_url(user), params: { vehicle: invalid_attributes }
        end.to change(Vehicle, :count).by(0)
      end

      it "renders a unsuccessful response (i.e. to display the 'new' template)" do
        post profile_my_vehicles_url(user), params: { vehicle: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested vehicle" do
      user.vehicles << [vehicles[0], vehicles[1]]
      expect do
        delete my_vehicle_url(vehicle)
      end.to change(Vehicle, :count).by(-1)
    end

    it "redirects to the profile_my_vehicles_url" do
      user.vehicles << [vehicles[0], vehicles[1]]
      delete my_vehicle_url(vehicle)
      expect(response).to redirect_to(profile_my_vehicles_url(user))
    end
  end
end
