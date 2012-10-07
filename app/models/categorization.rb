class Categorization < ActiveRecord::Base
  attr_accessible :link_id, :category_id
  
  belongs_to :category
  belongs_to :link
end
