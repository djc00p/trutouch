# frozen_string_literal: true

require "rails_helper"

RSpec.describe "vehicles/new", type: :view do
  before do
    assign(:vehicle, build(:vehicle))
  end

  it "renders new vehicle form" do # rubocop:disable RSpec/ExampleLength
    render

    assert_select "form[action=?][method=?]", my_vehicles_path, "post" do
      assert_select "input[name=?]", "vehicle[year]"

      assert_select "input[name=?]", "vehicle[color]"

      assert_select "input[name=?]", "vehicle[make]"

      assert_select "input[name=?]", "vehicle[model]"
    end
  end
end
