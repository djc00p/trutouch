class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :production_starting_year
      t.string :production_ending_year
      t.string :vehicle_size
      t.string :vehicle_type
      t.string :vehicle_class

      t.timestamps
    end
  end
end
