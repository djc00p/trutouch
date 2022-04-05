# frozen_string_literal: true

require "rails_helper"

RSpec.describe ThankYouController, type: :routing do
  it "routes to #index" do
    expect(get: "/thank_you").to route_to("thank_you#index")
  end
end
