class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.datetime :began_at
      t.datetime :finished_at
      t.string :estimated_total_cost
      t.time :estimated_total_time
      t.boolean :pickup_drop_off
      t.datetime :scheduled_for
      t.datetime :scheduled_on
      t.integer :services_count
      t.string :status, default: "Pending"
      t.string :total_cost
      t.time :total_time

      t.timestamps
    end

    add_reference :appointments, :customer, foreign_key: true, index: true
    add_reference :appointments, :vehicle, foreign_key: true, index: true
  end
end
