class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :prefered_method_of_contact

      t.timestamps

      t.index %i[ email ], name: "index_customers_email_uniqueness", unique: true
      t.index %i[ phone_number ], name: "index_customers_phone_number_uniqueness", unique: true
    end

    add_reference :users, :customer, foreign_key: true
  end
end
