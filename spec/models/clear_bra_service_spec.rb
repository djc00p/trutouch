# frozen_string_literal: true

require "rails_helper"

RSpec.describe ClearBraService, type: :model do
  describe "Validations" do
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :description }
  end
end
