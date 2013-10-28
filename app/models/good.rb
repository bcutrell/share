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

  class << self
    def categorize(name)
      categorized_goods = []
      Good.all.each do |good|
        if good.categories.first.name == name
          categorized_goods << good
        end
      end
      categorized_goods
    end
  end

end
