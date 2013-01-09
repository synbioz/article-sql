Sequel.migration do
  change do
    create_table :tags do
      primary_key :id
      String :name, null: false, size: 30
      index [:name], unique: true
    end
  end
end
