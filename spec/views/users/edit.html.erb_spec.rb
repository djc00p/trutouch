# frozen_string_literal: true

require "rails_helper"

RSpec.describe "users/edit", type: :view do
  let(:user) do
    assign(:user, User.create!(
                    first_name: "MyString",
                    last_name: "MyString",
                    phone_number: "+14123736103",
                    email: "MyString",
                    password: "MyString",
                    prefered_method_of_contact: "email"
                  ))
  end

  before do
    user
  end

  it "renders the edit user form" do # rubocop:disable RSpec/ExampleLength
    render

    assert_select "form[action=?][method=?]", profile_path(user), "post" do
      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[phone_number]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[prefered_method_of_contact]"
    end
  end
end
