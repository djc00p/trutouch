# frozen_string_literal: true

require "rails_helper"

RSpec.describe AppointmentService, type: :model do
  describe "Model Associations" do
    it { is_expected.to belong_to :appointment }
    it { is_expected.to belong_to :service }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :started_at }
    it { is_expected.to validate_presence_of :estimated_cost }
    it { is_expected.to validate_presence_of :estimated_time_to_complete }
    it { is_expected.to validate_presence_of :special_instructions }
  end
end
