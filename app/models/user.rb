class User < ActiveRecord::Base
has_many :blogs
	validates :username, uniqueness: true
	validates :username, presence: true
	
	has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  	has_many :followers, through: :relationships
  	has_many :followeds, through: :relationships
end
