class Post < ApplicationRecord
	validates :name, length: {maximum: 20}
	belongs_to :user

	validate :name_is_paul

	def name_is_paul
		if self.name == "paul"
			#everything is good
		else
			self.errors.add(:name, "You should be named Paul")
		end
	end
end
