class Vote < ActiveRecord::Base
  attr_accessible :link_id, :up
  
  belongs_to :user
  belongs_to :link
end
