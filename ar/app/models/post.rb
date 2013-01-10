class Post < ActiveRecord::Base
  has_many :comments, dependent: :delete_all
  has_and_belongs_to_many :tags

  attr_accessible :author, :title, :content

  scope :of, ->(name){ where(author: name) }
  scope :start_with, ->(str){ where(self.arel_table[:title].matches("#{str}%")) }

  def related_request
    t = Post.arel_table
    pt1 = Arel::Table.new(:posts_tags)
    pt2 = pt1.alias
    query = t.project(t[:id], t[:author], t[:title]).
      join(pt1).on(pt1[:post_id].eq(id)).
      join(pt2).on(pt2[:tag_id].eq(pt1[:tag_id]).and(pt2[:post_id].not_eq(t[:id]))).
      where(pt2[:post_id].eq(t[:id]))
    query.distinct
    query
  end

  def related(force_reload=false)
    (!@related || force_reload) ?
      (@related = Post.find_by_sql(related_request)) :
      @related
  end

end
