Sequel.migration do
  change do
    create_table :posts do
      primary_key :id
      String :author,  null: false, size: 100
      String :title,   null: false, size: 100
      String :content, null: false, text: true
    end
  end
end
