class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number, limit: 15
      t.string :email
      t.string :password_digest
      t.integer "role", default: 0
      t.string :google_token
      t.string "status", default: "inactive"

      t.timestamps
    end
    add_index "users", ["email"], unique: true
  end
end
