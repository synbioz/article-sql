class AddAuthorIndexAndTitleContraintOnPosts < ActiveRecord::Migration
  def change
    add_index :posts, :author
    add_index :posts, :title, unique: true
  end
end
