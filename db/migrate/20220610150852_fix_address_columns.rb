class FixAddressColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :addresses, :address_line_1, :address_line1
    rename_column :addresses, :address_line_2, :address_line2
  end
end
