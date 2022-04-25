# frozen_string_literal: true

require "rails_helper"

describe "User" do
  let(:user) { create(:user) }
  let(:production_vehicle) { create(:production_vehicle) }
  let(:params) do
    {
      year: production_vehicle[:production_year],
      color: Faker::Vehicle.color,
      make: production_vehicle[:make],
      model: production_vehicle[:model]
    }
  end

  before do |test|
    user
    visit profile_url(user)
    click_on "Add New Vehicle" unless test.metadata[:dont_click_on]
  end

  it "has an Add New Vehicle button", :dont_click_on do
    expect(page).to have_button("Add New Vehicle")
  end

  it "is able to add new vehicle to user by filling in form" do # rubocop:disable RSpec/ExampleLength
    fill_in "vehicle[year]", with: params[:year]
    fill_in "vehicle[color]", with: params[:color]
    fill_in "vehicle[make]", with: params[:make]
    fill_in "vehicle[model]", with: params[:model]

    click_on "Add Vehicle"

    expect(page).to have_content("Your #{params[:color]} #{params[:make]} #{params[:model]} has been add!")
  end

  it "is able to see the vehicle class" do # rubocop:disable RSpec/ExampleLength
    fill_in "vehicle[year]", with: params[:year]
    fill_in "vehicle[color]", with: params[:color]
    fill_in "vehicle[make]", with: params[:make]
    fill_in "vehicle[model]", with: params[:model]

    click_on "Add Vehicle"

    vehicle = Vehicle.last.where(user_id: user.id)

    expect(page).to have_content("Vehicle Class: #{vehicle.classification}")
  end
end
