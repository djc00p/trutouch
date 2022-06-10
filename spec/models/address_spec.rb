# frozen_string_literal: true

require "rails_helper"

RSpec.describe Address, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :address_line_1 }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :state }
    it { is_expected.to validate_presence_of :zip_code }
  end
end
