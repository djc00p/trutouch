class CreateClearBraServices < ActiveRecord::Migration[6.0]
  def change
    create_table :clear_bra_services do |t|
      t.string :name
      t.integer :price
      t.text :description

      t.timestamps
    end
    add_index "clear_bra_services", ["name"], unique: true
  end
end
