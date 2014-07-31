class Organization < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :events, dependent: :destroy
	has_many :tags, as: :taggable	

	# Crashes if no tags selected!!
	
end

