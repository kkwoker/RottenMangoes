class User < ActiveRecord::Base
	has_many :reviews
	has_many :movies
  has_secure_password
  scope :search, -> (query){  where("firstname like ? or lastname like ?", "%#{query}%", "%#{query}%")}
	def full_name
		"#{firstname} #{lastname}"
	end

	

		
end
