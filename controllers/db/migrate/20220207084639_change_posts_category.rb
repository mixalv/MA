class ChangePostsCategory < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:posts, :category, false)
  end
end
