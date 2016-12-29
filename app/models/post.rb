class Post < ApplicationRecord
	validates :name, length: {maximum: 20}
	belongs_to :user
end
