# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/vehicles", type: :request do
  let(:user) { create(:user) }
  let(:production_vehicle) { create(:production_vehicle) }
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

  before do
    # Trying to assin a current user but could not figure out the allow(). I will work on it later.
    # let(:my_instance) {
    #   instance_double(VehiclesController)
    # }
    # let(:double_class) {
    #   class_double(Vehicle).as_stubbed_const
    # }
    # allow(my_instance).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "GET /new" do
    it "renders a successful response" do
      get add_my_vehicle_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Vehicle" do
        expect do
          post my_vehicles_url, params: { vehicle: valid_attributes }
        end.to change(Vehicle, :count).by(1)
      end

      it "redirects to the user profile" do
        post my_vehicles_url, params: { vehicle: valid_attributes }
        expect(response).to redirect_to(profile_url(user))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vehicle" do
        expect do
          post my_vehicles_url, params: { vehicle: invalid_attributes }
        end.to change(Vehicle, :count).by(0)
      end

      it "renders a unsuccessful response (i.e. to display the 'new' template)" do
        post my_vehicles_url, params: { vehicle: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end
end
