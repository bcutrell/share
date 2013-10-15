class Category < ActiveRecord::Base

  ROOMS = [
    "Foyer",
    "Bathroom",
    "Hallway",
    "Living Room",
    "Bedroom",
    "Kitchen",
    "Storage"
  ]

  has_many :categorizations,
    inverse_of: :category

  has_many :goods,
    through: :categorizations,
    inverse_of: :categories

  validates_presence_of :name
  validates_inclusion_of :name, in: ROOMS

  def self.rooms
    ROOMS 
  end

end
