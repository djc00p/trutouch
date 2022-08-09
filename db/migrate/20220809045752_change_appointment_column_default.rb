class ChangeAppointmentColumnDefault < ActiveRecord::Migration[7.1]
  def change
    change_column :appointments, :services_count, :integer, null: false, default: 0
  end
end
