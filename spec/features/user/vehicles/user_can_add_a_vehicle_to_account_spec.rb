# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:production_vehicles) { create_list(:production_vehicle, 10, production_year: :unique) }
  let(:params) do
    {
      year: production_vehicles[3][:production_year],
      color: "Black",
      make: production_vehicles[3][:make],
      model: production_vehicles[3][:model]
    }
  end

  before do |test|
    user
    production_vehicles
    sign_in_as user
    click_on "Add New Vehicle" unless test.metadata[:dont_click_on]
  end

  it "has an Add New Vehicle button", :dont_click_on do
    expect(page).to have_button("Add New Vehicle")
  end

  it "is able to add new vehicle to user by filling in form" do # rubocop:disable RSpec/ExampleLength
    select params[:year], from: "vehicle[year]"
    select params[:color], from: "vehicle[color]"
    select params[:make], from: "vehicle[make]"
    select params[:model], from: "vehicle[model]"

    click_button "Add Vehicle"

    expect(page).to have_content("Your #{params[:color]} #{params[:make]} #{params[:model]} has been add!")
  end

  it "is able to see the vehicle class" do # rubocop:disable RSpec/ExampleLength
    select params[:year], from: "vehicle[year]"
    select params[:color], from: "vehicle[color]"
    select params[:make], from: "vehicle[make]"
    select params[:model], from: "vehicle[model]"

    click_on "Add Vehicle"

    vehicle = Vehicle.last

    expect(page).to have_content("Vehicle Class: #{vehicle.classification}")
  end
end
