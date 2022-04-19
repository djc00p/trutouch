# frozen_string_literal: true

require "rails_helper"

RSpec.describe Vehicle, type: :model do
  describe "Validations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to validate_presence_of :year }
    it { is_expected.to validate_presence_of :make }
    it { is_expected.to validate_presence_of :model }
    it { is_expected.to validate_presence_of :color }
    it { is_expected.to validate_presence_of :class }
  end
end
