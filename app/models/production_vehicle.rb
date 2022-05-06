# frozen_string_literal: true

class ProductionVehicle < ApplicationRecord
  # Instance Methods
  def production_year_and_make
    "#{production_year}, #{make}"
  end

  def production_year_make_and_model
    "#{production_year}, #{make}, #{model}"
  end

  # Class Methods
  def self.list_of_production_years
    select("DISTINCT production_year").order("production_year DESC")
  end

  def self.filter_by_year_for_makes
    select("DISTINCT production_year, make").order("production_year DESC, make ASC")
  end

  def self.filter_by_year_and_make_for_model
    select("DISTINCT production_year, make, model").order("production_year DESC, make, model ASC")
  end
end
