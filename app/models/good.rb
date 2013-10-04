class Good < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :location
  validates_presence_of :title

  mount_uploader :image, ImageUploader
end
