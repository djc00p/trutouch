class FixVehicleColumnName < ActiveRecord::Migration[7.1]
  def change
    remove_reference :vehicles, :user, index: true, foreign_key: true

    add_reference :vehicles, :owner, polymorphic: true
  end
end
