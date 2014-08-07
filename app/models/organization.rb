class Organization < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :events, dependent: :destroy
	has_many :taggings, as: :taggable, dependent: :destroy
	has_many :tags, through: :taggings

  paginates_per 5

	has_attached_file :picture, 
    :styles => { :medium => "300x300!", :thumb => "140x140!" }, 
    :default_url => "missing.jpg"
  validates_attachment_content_type :picture, 
    :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :description, presence: true
  validates :website, presence: true
  validates :address, presence: true

  def self.search(params)
    result = Organization.all
    result = result & Tag.find_tagged_organizations(params[:tag]) if params[:tag].present?
    result = result & self.where("lower(name) LIKE ?", "%#{params[:q].downcase}%") if params[:q].present?
    result
  end


end

