# frozen_string_literal: true

require "rails_helper"

RSpec.describe SessionsController, type: :routing do
  it "routes to #new" do
    expect(get: "/sign_in").to route_to("sessions#new")
  end

  it "routes to #create" do
    expect(post: "/sign_in").to route_to("sessions#create")
  end

  it "routes to #destroy" do
    expect(delete: "/sign_out").to route_to("sessions#destroy")
  end
end
