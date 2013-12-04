class User < ActiveRecord::Base
  	validates :student_id, presence: true, length: { maximum: 8 }, length: { minimum: 8 },
                    	   uniqueness: true
	has_secure_password
	validates :password, length: { minimum: 6 }
end