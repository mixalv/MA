class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :status
      t.string :country_code
    end
  end
end
