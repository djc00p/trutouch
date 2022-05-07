class ChangeVehiclesToProductionVehicles < ActiveRecord::Migration[7.1]
  def change
    rename_table :vehicles, :production_vehicles
    remove_column :production_vehicles, :production_ending_year
    rename_column :production_vehicles, :production_starting_year, :production_year
  end
end
