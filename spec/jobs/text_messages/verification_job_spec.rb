# frozen_string_literal: true

require "rails_helper"

RSpec.describe TextMessages::VerificationJob, type: :job do
  describe "#perform_later" do
    let(:user) { create(:user) }

    before do
      user
    end

    it "sends verification text" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        described_class.perform_later(user)
      end.to have_enqueued_job
    end
  end
end
