class Event < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :attended_events, foreign_key: "event_id" 
	has_many :attendees, through: :attended_events, source: :attendee
	scope :upcoming, -> {where("event_date > ?", DateTime.now )}
	scope :previous, -> {where("event_date < ?", DateTime.now  )} 
end
