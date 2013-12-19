class Course < ActiveRecord::Base
	belongs_to :user
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  	has_many :followers, through: :reverse_relationships, source: :follower
  	
  def following?(other_user)
    relationships.find_by(follower_id: user.id)
  end

  def follow!(other_user)
    relationships.create!(follower_id: user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by(follower_id: user.id).destroy!
  end

end

