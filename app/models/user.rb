class User < ApplicationRecord
	EMAIL_FORMAT = /\A[a-z].+@[a-z]+.[a-z]+\z/
	has_many :events, foreign_key: "creator_id"
	before_save :email_downcase
	validates :name, presence: true
	validates :email, presence: true, 
						 format:{with: EMAIL_FORMAT},
						 confirmation: {case_sensitive: false}  
	

	def email_downcase
  	email.downcase!
	end
end
