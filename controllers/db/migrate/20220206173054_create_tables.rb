class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, index: { unique: true }
      t.timestamps
    end

    create_table :posts do |t|
      t.string :content
      t.string :category
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true 
      t.timestamps 
    end
  end
end
