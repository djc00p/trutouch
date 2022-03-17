# frozen_string_literal: true

require "rails_helper"

RSpec.describe AppointmentController, type: :routing do
  it "routes to #index" do
    expect(get: "/appointment").to route_to("appointment#index")
  end
end
