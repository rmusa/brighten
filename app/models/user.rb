class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :attendance_confirmations, dependent: :destroy
  has_many :events, through: :attendance_confirmations
  has_many :organizations, dependent: :destroy

  has_attached_file :profile_picture, 
    :styles => { :medium => "300x300!", :thumb => "140x140!" }, 
    :default_url => "missing.jpg"
  validates_attachment_content_type :profile_picture, 
    :content_type => /\Aimage\/.*\Z/
end
  