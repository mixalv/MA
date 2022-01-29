class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :phone_number
      t.string :email
      t.string :first_name
      t.string :last_name
    end
  end
end
