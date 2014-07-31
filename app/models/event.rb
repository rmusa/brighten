class Event < ActiveRecord::Base
	belongs_to :organization
	has_many :attendance_confirmations, dependent: :destroy
	has_many :users, through: :attendance_confirmations
	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings


	def get_att_id(user)
		self.attendance_confirmations.find_by(user_id: user.id).id
	end

end
