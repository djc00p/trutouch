# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome activation" do
    let(:user) { create(:user, confirmation_code: SecureRandom.random_number(100_000..999_999)) }
    let(:mail) { described_class.with(user: user).welcome_activation }

    it "renders the subject" do
      expect(mail.subject).to eq("Welcome To TruTouch")
    end

    it "renders the to:" do
      expect(mail.to).to eq([user.email])
    end

    it "renders the from:" do
      expect(mail.from).to eq(["notifications@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Welcome to TruTouch Auto Detailing and Window Tint, #{user.first_name}")
    end

    it "renders the body with a confirmation code" do
      expect(mail.body.encoded).to match(user.confirmation_code.to_s)
    end
  end
end
