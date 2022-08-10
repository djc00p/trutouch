# frozen_string_literal: true

require "rails_helper"

RSpec.describe Appointment, type: :model do
  describe "Model Associations" do
    it { is_expected.to belong_to :customer }
    it { is_expected.to belong_to :vehicle }
    it { is_expected.to have_many :appointment_services }
    it { is_expected.to have_many :detail_services }
    it { is_expected.to have_many :tint_services }
    it { is_expected.to have_many :clear_bra_services }
    it { is_expected.to have_many :addresses }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :estimated_total_cost }
    it { is_expected.to validate_presence_of :estimated_total_time }
    it { is_expected.to validate_presence_of :pickup_drop_off }
    it { is_expected.to validate_presence_of :scheduled_for }
    it { is_expected.to validate_presence_of :scheduled_on }
    it { is_expected.to validate_presence_of :services_count }
    it { is_expected.to validate_presence_of :status }
  end
end
