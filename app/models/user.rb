class User < ActiveRecord::Base
	attr_accessible :student_id, :password, :password_confirmation
	has_many :courses, through: :relationships, source: :followed
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  	has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  	has_many :followers, through: :reverse_relationships, source: :follower

	before_create :create_remember_token
  	validates :student_id, presence: true, length: { maximum: 8 }, length: { minimum: 8 },
                    	   uniqueness: true
	has_secure_password
	validates :password, length: { minimum: 6 }
	
	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end
  	
 def following?(course)
    relationships.find_by(followed_id: course.id)
  end

  def follow!(course)
    relationships.create!(followed_id: course.id)
  end
  
 def unfollow!(course)
    relationships.find_by(id).destroy!
  end

  	private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end