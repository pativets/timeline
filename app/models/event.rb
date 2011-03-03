class Event < ActiveRecord::Base

	attr_accessible :description, :event_title
	
	belongs_to:user
	
	validates :description, :presence => true, :length => {:maximum => 140}
	validates :user_id, :presence => true
	validates :event_title, :presence => true, :length => {:maximum => 20}
end
