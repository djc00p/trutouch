# frozen_string_literal: true

require "rails_helper"

RSpec.describe "users/show", type: :view do
  before do
    @user = assign(:user, User.create!(
                            first_name: "First Name",
                            last_name: "Last Name",
                            phone_number: "+14123736103",
                            email: "Email",
                            password: "Password Digest",
                            prefered_method_of_contact: "text"
                          ))
    render
  end

  describe "renders attribute" do
    it "first_name in <p>" do
      expect(rendered).to match(/First Name/)
    end

    it "last_name in <p>" do
      expect(rendered).to match(/Last Name/)
    end

    it "email in <p>" do
      expect(rendered).to match(/Email/)
    end

    it "prefered_method_of_contact in <p>" do
      expect(rendered).to match(/text/)
    end
  end
end
