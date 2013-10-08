require 'state_machine'

class Good < ActiveRecord::Base

  # state_machine initial: :posted do 
  #   event :make_public do 
  #     transition :posted => :public 
  #   end
  #   event :make_private do 
  #     transition :posted => :private 
  #   end
  # end 


  belongs_to :user

  belongs_to :group 

  validates_presence_of :location
  validates_presence_of :title

  validates_presence_of :image

  mount_uploader :image, ImageUploader
end
