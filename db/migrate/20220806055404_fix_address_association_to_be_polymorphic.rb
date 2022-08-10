class FixAddressAssociationToBePolymorphic < ActiveRecord::Migration[7.1]
  def change
    remove_reference :addresses, :user, index: true, foreign_key: true

    add_reference :addresses, :addressable, polymorphic: true
  end
end
