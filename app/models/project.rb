class Project < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
  
  belongs_to :user
  has_many :links
  
  validates :title, :presence => true
  validates :description, :presence => true
  
  
end
