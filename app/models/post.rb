class Post < ApplicationRecord
	validates :name, length: {maximum: 7}
end
