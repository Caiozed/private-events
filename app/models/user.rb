class User < ApplicationRecord
	EMAIL_FORMAT = /\A[a-z].+@[a-z]+.[a-z]+\z/
	has_many :events, foreign_key: "creator_id"
	has_many :attended_events, foreign_key: "attendee_id"
	has_many :user_events, through: :attended_events, source: :user_event
	before_save :email_downcase
	validates :name, presence: true
	validates :email, presence: true, 
						 format:{with: EMAIL_FORMAT},
						 confirmation: {case_sensitive: false}  
	def email_downcase
  	email.downcase!
	end
end
