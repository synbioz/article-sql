class CreatePostTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author,  null: false, limit: 100
      t.string :title,   null: false, limit: 100
      t.text   :content, null: false
    end
  end
end
