class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  # validate :email_is_bu_edu

  # def email_is_bu_edu
  # 	if self.email.end_with? "bu.edu"
  # 	else
  # 		self.errors.add(:email, "email must end in bu.edu")
  # 	end
  # end

  validate :user_went_to_one_of_these_schools

  def user_went_to_one_of_these_schools
  	if self.email.end_with?("bu.edu") || self.email.end_with?("harvard.edu") || self.email.end_with?("mit.edu")
  	else
  		self.errors.add(:email, "you apparantly didn't get into a good school")
  	end
  end



end
