# frozen_string_literal: true

class DetailService < ApplicationRecord
  validates :name, uniqueness: true
  validates :base_price, presence: true
  validates :description, presence: true

  # Class Methods
  def self.detail_services
    all
  end

  def self.main_detail_services
    where(name: ["Exterior Detail", "Full Detail", "Interior Detail"])
      .order(id: :desc)
  end

  def self.deluxe_detail_services
    where(name: ["Executive Full Detail", "Presidential Full Detail"])
  end

  def self.additional_detail_services
    where.not(
      name: [
        "Exterior Detail",
        "Full Detail",
        "Interior Detail",
        "Executive Full Detail",
        "Presidential Full Detail"
      ]
    )
  end

  def self.select_detail(service)
    find_by!(name: service)
  end
end
