class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  belongs_to :school

  # after_validation :schoolcheck

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
  		puts "the email is #{self.email}".green
  		puts "email ends with a: #{self.email.end_with? a}".green

	  	if self.email.end_with? a
	  		email_is_ok = true
	  		puts "email is ok: #{email_is_ok}".green
	  		case a
	  			when "bu.edu" 
	  				the_school = School.where(name: 'BU').first
	  			when "harvard.edu"
	  				the_school = School.where(name: 'Harvard').first
	  			when "mit.edu"
	  				the_school = School.where(name: 'Mit').first
	  		end
	  		puts "the school is #{the_school.inspect}".blue
	  		self.school = the_school
	  	end
	end

	puts "email is ok after loop: #{email_is_ok}".on_green
	self.errors.add(:email, "you apparantly didn't get into a good school") unless email_is_ok


	# Way 2
	# email_suffix = self.email.take_suffix
	# self.errors.add(:email, "bad email") unless endings.includes? email_suffix
	puts "the errors are #{self.errors.inspect}".red
  end


  # def schoolcheck

  # 	if self.email.end_with? "bu.edu"
  # 		# self.school = School.find_by(name: 'BU')
  # 		self.school = School.where(name: "BU").first
  # 	end
  # 	if self.email.end_with? "mit.edu"
  # 		self.school = School.where(name: "Mit").first
  # 	end
  # 	if self.email.end_with? "harvard.edu"
  # 		self.school = School.where(name: "Harvard").first
  # 	end



  # end



end
