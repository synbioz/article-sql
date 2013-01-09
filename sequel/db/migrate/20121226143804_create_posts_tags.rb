Sequel.migration do
  change do
    create_join_table(post_id: :posts, tag_id: :tags)
  end
end
