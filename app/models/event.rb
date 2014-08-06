class Event < ActiveRecord::Base
	belongs_to :organization
	has_many :attendance_confirmations, dependent: :destroy
	has_many :users, through: :attendance_confirmations
	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings

  	paginates_per 5

  	validates :name, presence: true
  	validates :location, presence: true
  	validates :description, presence: true
  	validates :event_email, presence: true
  	validates :date, presence: true
  	validates :time, presence: true
  	validates :endtime, presence: true

	def get_att_id(user)
		self.attendance_confirmations.find_by(user_id: user.id).id
	end

	def self.search(params)
		result = Event.all
		if params[:start_date].present? && params[:end_date].present?
			start_date = Date.parse(params[:start_date])
			end_date = Date.parse(params[:end_date])
			result = result & self.where(date: start_date..end_date)
		elsif params[:start_date].present?
			start_date = Date.parse(params[:start_date])
			result = result & self.where(date: start_date..100.years.from_now)
		elsif params[:end_date].present?
			end_date = Date.parse(params[:end_date])
			result = result & self.where(date: 100.years.ago..end_date)
		end
    result = result & self.where("name LIKE ?", "%#{params[:q]}%") if params[:q].present?
    result = result & Tag.find_tagged_events(params[:tag]) if params[:tag].present?
    result
	end

end
