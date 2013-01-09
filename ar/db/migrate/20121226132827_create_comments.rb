class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :author,  null: false, limit: 100
      t.string  :email,   null: false, limit: 100
      t.text    :content, null: false
      t.integer :post_id, null: false
    end
    add_index :comments, [:post_id]
  end
end
