# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "Model Associations" do
    it { is_expected.to belong_to :customer }
    it { is_expected.to have_many :vehicles }
    it { is_expected.to have_many :addresses }
  end
  
  describe "Validations" do
    it { is_expected.to validate_length_of :vehicles }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :phone_number }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :phone_number }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :prefered_method_of_contact }
  end

  describe "Instance Methods" do
    let(:user) { create :user }

    context "when an user account is created" do
      it "sends an verification email" do
        expect { user.user_verification_email }
          .to change { ActionMailer::Base.deliveries.count }.by(1)
      end
      # will update later need to create a working mock class for this.
      # it "sends an verification text" do
      #   include ActiveJob::TestHelper
      #   ActiveJob::Base.queue_adapter = :test
      #
      #   expect { user.user_verification_text }
      #     .to change { ActiveJob::Base.queue_adapter.enqueued_jobs }.by(1)
      # end
    end
  end
end
