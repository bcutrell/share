require 'state_machine'

class Good < ActiveRecord::Base

  state_machine initial: :posted do 
    event :make_public do 
      transition :posted => :public 
    end
    event :make_private do 
      transition :posted => :private 
    end
  end 


  belongs_to :user

  validates_presence_of :location
  validates_presence_of :title

  mount_uploader :image, ImageUploader
end
