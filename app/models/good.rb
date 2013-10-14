class Good < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :group 

  geocoded_by :location, if: :location? 
  after_validation :geocode

  # validates_presence_of :location
  validates_presence_of :title

  validates_presence_of :image

  mount_uploader :image, ImageUploader

  private
  
  def geocode_by_location
    self.latitude, self.longitude = Geocoder.coordinates(location)
  end
end
