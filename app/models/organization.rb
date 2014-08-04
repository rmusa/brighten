class Organization < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :events, dependent: :destroy
	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings


	has_attached_file :picture, 
    :styles => { :medium => "300x300!", :thumb => "140x140!" }, 
    :default_url => "missing.jpg"
  validates_attachment_content_type :picture, 
    :content_type => /\Aimage\/.*\Z/


  def self.search(tag, q)
    result = Organization.all
    result = Tag.find_tagged_organizations(tag) if tag && !tag.empty?
    result = result & self.where("name LIKE ?", "%#{q}%") if q && !q.empty?
    result
  end


end

