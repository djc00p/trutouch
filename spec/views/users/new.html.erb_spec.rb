# frozen_string_literal: true

require "rails_helper"

RSpec.describe "users/new", type: :view do
  before do
    assign(:user, User.new(
                    first_name: "Luke",
                    last_name: "Skywalker",
                    phone_number: "12379873",
                    email: "masterjedi@galacticsavior.com",
                    password: "Maythe4thBew/u"
                  ))
  end

  it "renders new user form" do # rubocop:disable RSpec/ExampleLength
    render

    assert_select "form[action=?][method=?]", profile_index_path, "post" do
      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[phone_number]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[confirm_password]"

      assert_select "input[name=?]", "user[prefered_method_of_contact]"
    end
  end
end
