class CreateAppointmentServices < ActiveRecord::Migration[7.1]
  def change
    create_table :appointment_services do |t|
      t.datetime :started_at
      t.datetime :completed_at
      t.string :estimated_cost
      t.time :estimated_time_to_complete
      t.string :actual_cost
      t.time :time_to_completion
      t.string :special_instructions
      t.references :appointment
      t.references :service, polymorphic: true

      t.timestamps
    end
  end
end
