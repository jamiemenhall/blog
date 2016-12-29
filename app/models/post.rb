class Post < ApplicationRecord
	validates :name, length: {maximum: 20}
	belongs_to :user

	before_validation :run_this
	validate :name_is_paul

	before_create :run_this_thing

	def name_is_paul
		if self.name == "paul"
			#everything is good
		else
			self.errors.add(:name, "You should be named Paul")
		end
	end

	def run_this
		puts "i'm being run".green
	end

	def run_this_thing
		puts "the thing is being run in before_create".blue
	end
end
