class AddConfirmationCodeAndPreferedMethodOfContactToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirmation_code, :integer
    add_column :users, :prefered_method_of_contact, :string
  end
end
