class AddColumnValidationToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :validation, :string
  end
end
