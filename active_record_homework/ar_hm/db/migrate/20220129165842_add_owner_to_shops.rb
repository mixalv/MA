class AddOwnerToShops < ActiveRecord::Migration[7.0]
  def change
    add_reference :shops, :owner, foreign_key: {to_table: :users}
  end
end
