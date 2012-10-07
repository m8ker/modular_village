class Link < ActiveRecord::Base
   
   attr_accessible :title, :url, :project_id, :tag_list, :category_ids
   
   
   belongs_to :user
   belongs_to :project
   has_many :comments
   has_many :votes
   has_many :stars
   has_many :taggings
   has_many :tags, through: :taggings
   has_many :categorizations
   has_many :categories, through: :categorizations
   
   validates :title, :presence => true
   validates :url, :presence => true
   validates_format_of :url, :with => URI.regexp(['http']) 
   
   def self.tagged_with(name)
     Tag.find_by_name!(name).articles
   end

   def self.tag_counts
     Tag.select("tags.*, count(taggings.tag_id) as count").
       joins(:taggings).group("taggings.tag_id")
   end

   def tag_list
     tags.map(&:name).join(", ")
   end

   def tag_list=(names)
     self.tags = names.split(",").map do |n|
       Tag.where(name: n.strip).first_or_create!
     end
   end
end

