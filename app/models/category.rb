class Category < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :categorizations
  has_many :links, through: :categorizations
end
