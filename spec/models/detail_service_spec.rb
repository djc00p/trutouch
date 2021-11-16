# frozen_string_literal: true

require "rails_helper"

RSpec.describe DetailService, type: :model do
  describe "Validations" do
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :base_price }
    it { is_expected.to validate_presence_of :description }
  end
end
