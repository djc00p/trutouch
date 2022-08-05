# frozen_string_literal: true

require "rails_helper"

RSpec.describe Address, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :address_line1 }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :zip_code }
  end

  describe "Model Associations" do
    it { is_expected.to belong_to :user }
  end

  describe "Class Methods" do
    it "has list of US States with a count of 50" do
      expect(described_class.us_states.count).to eq(50)
    end
  end
end
