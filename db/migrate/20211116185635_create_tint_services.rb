class CreateTintServices < ActiveRecord::Migration[6.0]
  def change
    create_table :tint_services do |t|
      t.string :name
      t.string :tint_manufacturer
      t.string :vehicle_type
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
