# frozen_string_literal: true

require "rails_helper"

RSpec.describe "vehicles/show", type: :view do
  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle, owner: user) }

  before do
    assign(:vehicle, vehicle)

    render
  end

  describe "renders attribute" do
    it "color in <p>" do
      expect(rendered).to match(/#{vehicle.color}/)
    end

    it "year in <p>" do
      expect(rendered).to match(/#{vehicle.year}/)
    end

    it "make in <p>" do
      expect(rendered).to match(/#{vehicle.make}/)
    end

    it "model in <p>" do
      expect(rendered).to match(/#{vehicle.model}/)
    end

    it "classification in <p>" do
      expect(rendered).to match(/#{vehicle.classification}/)
    end
  end
end
