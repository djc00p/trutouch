# frozen_string_literal: true

require "rails_helper"

RSpec.describe OurServicesController, type: :routing do
  it "routes to #index" do
    expect(get: "/our_services").to route_to("our_services#index")
  end
end
