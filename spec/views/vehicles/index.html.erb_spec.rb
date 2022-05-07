# frozen_string_literal: true

require "rails_helper"

RSpec.describe "vehicles/index", type: :view do
  let(:user) { create(:user) }
  let(:vehicles) { create_list(:vehicle, 5, user_id: user.id) }

  before do
    user.vehicles << vehicles
    assign(:user, user)
    assign(:vehicles, vehicles)

    render
  end

  describe "renders attribute" do
    it "color in <p>" do
      expect(rendered).to match(/#{vehicles[2].color}/)
    end

    it "year in <p>" do
      expect(rendered).to match(/#{vehicles[2].year}/)
    end

    it "make in <p>" do
      expect(rendered).to match(/#{vehicles[2].make}/)
    end

    it "model in <p>" do
      expect(rendered).to match(/#{vehicles[2].model}/)
    end

    it "classification in <p>" do
      expect(rendered).to match(/#{vehicles[2].classification}/)
    end
  end
end
