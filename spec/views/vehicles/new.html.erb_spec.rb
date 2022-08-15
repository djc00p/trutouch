# frozen_string_literal: true

require "rails_helper"

RSpec.describe "vehicles/new", type: :view do
  let(:user) do
    create(:user,
           first_name: "Luke",
           last_name: "Skywalker",
           phone_number: "+14123736103",
           email: "masterjedi@galacticsavior.com",
           password: "Maythe4thBew/u")
  end

  before do
    assign(:user, user)
    assign(:vehicle, build(:vehicle))
    controller.session["user_id"] = user
  end

  it "renders new vehicle form" do # rubocop:disable RSpec/ExampleLength
    render

    assert_select "form[action=?][method=?]", profile_my_vehicles_url(user), "post" do
      assert_select "select[name=?]", "vehicle[year]"

      assert_select "select[name=?]", "vehicle[color]"

      assert_select "select[name=?]", "vehicle[make]"

      assert_select "select[name=?]", "vehicle[model]"
    end
  end
end
