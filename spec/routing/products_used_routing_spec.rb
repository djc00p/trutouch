# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductsUsedController, type: :routing do
  it "routes to #index" do
    expect(get: "/products_used").to route_to("products_used#index")
  end
end
