class Comment < ActiveRecord::Base
  attr_accessible :comment, :link_id, :user_id
  
  belongs_to :user
  belongs_to :link
end
