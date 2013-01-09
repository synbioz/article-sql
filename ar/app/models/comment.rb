class Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :author, :email, :content, :post_id
end
