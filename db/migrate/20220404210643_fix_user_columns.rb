class FixUserColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :status, "unverified"
    rename_column :users, :confirmation_code, :verification_code
    add_index "users", ["phone_number"], unique: true
  end
end
