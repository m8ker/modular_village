class Link < ActiveRecord::Base
   
   attr_accessible :title, :url
   
   belongs_to :user
   has_many :comments
   has_many :votes
   has_many :stars
   
   validates :title, :presence => true
   validates :url, :presence => true
   validates_format_of :url, :with => URI.regexp(['http']) 
   
end
