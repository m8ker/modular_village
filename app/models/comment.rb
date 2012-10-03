class Comment < ActiveRecord::Base
  attr_accessible :link_id, :message, :user_id
  
  belongs_to :user
  belongs_to :link
end
