# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "visits home page" do
      get root_path

      expect(response).to render_template(:index)
    end
  end
end
