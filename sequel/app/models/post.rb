class Post < Sequel::Model
  one_to_many :comments
  many_to_many :tags

  dataset_module do
    def of(name)
      where(author: name)
    end

    def start_with(str)
      where(title: /^#{str}/)
    end
  end

  def related_request
    Post.distinct.select(:id, :author, :title).
      join(:posts_tags___pt1, post_id: id).
      join(:posts_tags___pt2, [{pt2__tag_id: :pt1__tag_id}, Sequel.~(pt2__post_id: id)]).
      where(pt2__post_id: :id)
  end

  def related(force_reload=false)
    (!@related || force_reload) ?
      (@related = related_request.all) :
      @related
  end
end
