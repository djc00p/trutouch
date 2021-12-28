# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :phone_number }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :phone_number }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :password }
  end
end
