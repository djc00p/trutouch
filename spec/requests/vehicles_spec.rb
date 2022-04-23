# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/vehicles", type: :request do
  let(:make) { Faker::Vehicle.make }
  let(:valid_attributes) do
    {
      year: rand(1970..Time.zone.now.year),
      color: Faker::Vehicle.color,
      make: make,
      model: Faker::Vehicle.model(make_of_model: make)
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

  describe "GET /new" do
    it "renders a successful response" do
      get add_vehicle_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Vehicle" do
        expect do
          post vehicle_url, params: valid_attributes
        end.to change(Vehicle, :count).by(1)
      end

      it "redirects to the user profile" do
        post vehicle_url, params: valid_attributes
        expect(response).to redirect_to(profile_url(user))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vehicle" do
        expect do
          post  vehicle_url, params: invalid_attributes
        end.to change(Vehicle, :count).by(0)
      end

      it "renders a unsuccessful response (i.e. to display the 'new' template)" do
        post vehicle_url, params: invalid_attributes
        expect(response).not_to be_successful
      end
    end
  end
end
