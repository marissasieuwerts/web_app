class Course < ActiveRecord::Base
	attr_accessible :acode, :code, :description, :ects, :examination, :goals, :institute, :lecture_material, :name, :participant_count, :period, :sgid, :specialities, :timetable, :year
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :users, through: :relationships
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
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
