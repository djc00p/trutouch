# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/users", type: :request do # rubocop:disable Metrics/BlockLength
  let(:valid_attributes) do
    {
      first_name: "Luke",
      last_name: "Skywalker",
      phone_number: "12379873",
      email: "masterjedi@galacticsavior.com",
      password: "Maythe4thBew/u"
    }
  end

  let(:invalid_attributes) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone_number: "12379873",
      password: ""
    }
  end

  let(:user) { User.create! valid_attributes }

  before do |test|
    user unless test.metadata[:no_user_needed]
  end

  describe "GET /show" do
    it "renders a successful response" do
      get profile_url(user)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get sign_up_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_profile_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User", :no_user_needed do
        expect do
          post  profile_index_url, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it "redirects to the created user", :no_user_needed do
        post profile_index_url, params: { user: valid_attributes }
        expect(response).to redirect_to(profile_url(User.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect do
          post  profile_index_url, params: { user: invalid_attributes }
        end.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post profile_index_url, params: { user: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          phone_number: "12379873",
          email: Faker::Internet.email
        }
      end

      it "updates the requested user" do
        patch profile_url(user), params: { user: new_attributes }
        user.reload
        expect(user.first_name).not_to eq(valid_attributes[:first_name])
      end

      it "redirects to the user" do
        patch profile_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(profile_url(user))
      end
    end

    context "with invalid parameters" do
      it "renders a unsuccessful response (i.e. to display the 'edit' template)" do
        patch profile_url(user), params: { user: invalid_attributes }
        expect(response).not_to be_successful
      end

      it "renders a unsuccessful response with status code 422" do
        patch profile_url(user), params: { user: invalid_attributes }
        expect(response.status).to(eq(302))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      expect do
        delete profile_url(user)
      end.to change(User, :count).by(-1)
    end

    it "redirects to the root_path" do
      delete profile_url(user)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /activation" do
    it "sets the user's status to active" do
      get activation_url, params: { email: user.email }
      user.reload
      expect(user.status).to eq("active")
    end

    it "redirects to the thank you page" do
      get activation_url, params: { email: user.email }
      expect(response).to redirect_to(thank_you_path)
    end
  end
end
