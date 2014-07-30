class Organization < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :events, dependent: :destroy
	#has_many :following_users, through: :followings# , class_name:, foreign key is...
	
end

