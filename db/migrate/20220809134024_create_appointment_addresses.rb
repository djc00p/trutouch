class CreateAppointmentAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :appointment_addresses do |t|
      t.boolean :pickup, null: false
      t.boolean :drop_off, null: false
      t.string :distance
      t.string :distance_units, default: "miles"
      t.string :excess_distance_upcharge
      t.time :estimated_drive_time
      t.string :special_instructions
      t.references :address
      t.references :appointment

      t.timestamps
    end
  end
end
