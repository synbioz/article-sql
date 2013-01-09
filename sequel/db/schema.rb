Sequel.migration do
  change do
    create_table(:posts) do
      primary_key :id, :type=>"int(11)"
      column :author, "varchar(100)", :null=>false
      column :title, "varchar(100)", :null=>false
      column :content, "text", :null=>false
      
      index [:author]
      index [:title], :name=>:title, :unique=>true
    end
    
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:tags) do
      primary_key :id, :type=>"int(11)"
      column :name, "varchar(30)", :null=>false
      
      index [:name], :unique=>true
    end
    
    create_table(:comments) do
      primary_key :id, :type=>"int(11)"
      column :author, "varchar(100)", :null=>false
      column :email, "varchar(100)", :null=>false
      column :content, "text", :null=>false
      foreign_key :post_id, :posts, :type=>"int(11)", :null=>false, :key=>[:id]
      
      index [:post_id], :name=>:post_id
    end
    
    create_table(:posts_tags) do
      foreign_key :post_id, :posts, :type=>"int(11)", :null=>false, :key=>[:id]
      foreign_key :tag_id, :tags, :type=>"int(11)", :null=>false, :key=>[:id]
      
      primary_key [:post_id, :tag_id]
      
      index [:tag_id, :post_id]
    end
  end
end
