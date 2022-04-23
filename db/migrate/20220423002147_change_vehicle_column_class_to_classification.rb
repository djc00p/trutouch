class ChangeVehicleColumnClassToClassification < ActiveRecord::Migration[7.1]
  def change
    rename_column :vehicles, :class, :classification
  end
end
