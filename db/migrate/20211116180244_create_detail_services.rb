class CreateDetailServices < ActiveRecord::Migration[6.0]
  def change
    create_table :detail_services do |t|
      t.string :name
      t.integer :base_price
      t.text :description

      t.timestamps
    end
    add_index "detail_services", ["name"], unique: true
  end
end
