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
  	endings = ["bu.edu", "harvard.edu", "mit.edu"]

  	# Way 1
  	email_is_ok = false
  	endings.each do |a|
	  	if self.email.end_with? a
	  		email_is_ok = true
	  	end
	end

	self.errors.add(:email, "you apparantly didn't get into a good school") unless email_is_ok


	# Way 2
	# email_suffix = self.email.take_suffix
	# self.errors.add(:email, "bad email") unless endings.includes? email_suffix

  end



end
