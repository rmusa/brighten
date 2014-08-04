class Event < ActiveRecord::Base
	belongs_to :organization
	has_many :attendance_confirmations, dependent: :destroy
	has_many :users, through: :attendance_confirmations
	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings


	def get_att_id(user)
		self.attendance_confirmations.find_by(user_id: user.id).id
	end

	def self.search(q)
  	where("name LIKE ?", "%#{q}%")
  end

  def self.search_by_date(start_date, end_date)
  	start_date =  start_date.kind_of?(Array) ? Date.parse(start_date[0]) : Date.parse(start_date.values[0])
    end_date =  end_date.kind_of?(Array) ? Date.parse(end_date[0]) : Date.parse(end_date.values[0])

  	where(date: start_date..end_date)
  end

end
