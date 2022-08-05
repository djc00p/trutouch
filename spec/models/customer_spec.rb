# frozen_string_literal: true

require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "Validations" do
    it { is_expected.to have_one :user }
    it { is_expected.to have_many :vehicles }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone_number }
    it { is_expected.to validate_uniqueness_of :phone_number }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :prefered_method_of_contact }
  end
end
