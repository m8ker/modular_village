class Feedback < ActiveRecord::Base
  validates_presence_of :name, :comment
  attr_accessible :comment, :name
end
