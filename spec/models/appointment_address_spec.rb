# frozen_string_literal: true

require "rails_helper"

RSpec.describe AppointmentAddress, type: :model do
  describe "Model Associations" do
    it { is_expected.to belong_to :address }
    it { is_expected.to belong_to :appointment }
  end

  describe "Validations" do
  end
end
