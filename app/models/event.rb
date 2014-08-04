class Event < ActiveRecord::Base
	belongs_to :organization
	has_many :attendance_confirmations, dependent: :destroy
	has_many :users, through: :attendance_confirmations
	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings


	def get_att_id(user)
		self.attendance_confirmations.find_by(user_id: user.id).id
	end

	def self.search(tag, q, start_date, end_date)
		start_date =  start_date.kind_of?(Array) ? Date.parse(start_date[0]) : Date.parse(start_date.values[0]) if start_date && start_date[0] && !start_date[0].empty?
    end_date =  end_date.kind_of?(Array) ? Date.parse(end_date[0]) : Date.parse(end_date.values[0]) if end_date && end_date[0] && !end_date[0].empty?
    result = Event.all
    result = Tag.find_tagged_events(tag) if tag && !tag.empty?
    result = result & self.where("name LIKE ?", "%#{q}%") if q && !q.empty?
    result = result & self.where(date: start_date..end_date) if start_date && start_date[0] && !start_date[0].empty? && end_date && end_date[0] && !end_date[0].empty?
    result
	end

end
