class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  attr_accessible :name
end
