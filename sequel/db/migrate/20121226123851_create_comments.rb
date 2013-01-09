Sequel.migration do
  change do
    create_table :comments do
      primary_key :id
      String  :author,  null: false, size: 100
      String  :email,   null: false, size: 100
      String  :content, null: false, text: true

      foreign_key :post_id, :posts, on_delete: :cascade, null: false
    end
  end
end
