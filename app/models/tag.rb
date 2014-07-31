class Tag < ActiveRecord::Base
	has_many :taggings
	#has_many :taggables, through: :taggings

	def self.find_tagged_events(tag_name)
		Tag.find_by(name: tag_name).taggings.where(taggable_type: "Event").map do |tagging|
			Event.find(tagging.taggable_id)
		end
	end

	def self.find_tagged_organizations(tag_name)
		Tag.find_by(name: tag_name).taggings.where(taggable_type: "Organization").map do |tagging|
			Organization.find(tagging.taggable_id)
		end
	end

	# def self.search(tag_name)  #, start_date, end_date)
	# 	where(name: tag_name)
	# 	#tag.date > start_dat && tag.date < end_date
	# end
	
end
