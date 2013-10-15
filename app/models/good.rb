class Good < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :group 

  has_many :categorizations,
    inverse_of: :good
  
  has_many :categories,
    through: :categorizations,
    inverse_of: :goods

  geocoded_by :location, if: :location? 
  after_validation :geocode

  validates_presence_of :location
  validates_presence_of :title
  validates_presence_of :image

  mount_uploader :image, ImageUploader
end
