# frozen_string_literal: true

require "rails_helper"

RSpec.describe ContactUsController, type: :routing do
  it "routes to #index" do
    expect(get: "/contact_us").to route_to("contact_us#index")
  end
end
