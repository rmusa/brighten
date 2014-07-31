class Organization < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :events, dependent: :destroy
	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings
end

