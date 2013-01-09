Sequel.migration do
  up do
    alter_table :posts do
      add_index :author
      add_unique_constraint :title
    end
  end

  down do
    alter_table :posts do
      drop_index :author
      drop_constraint :title, type: :unique
    end
  end
end
