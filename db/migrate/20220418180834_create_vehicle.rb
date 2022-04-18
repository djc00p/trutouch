class CreateVehicle < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :year
      t.string :color
      t.string :make
      t.string :model
      t.string :class

      t.timestamps
    end
  end
end
