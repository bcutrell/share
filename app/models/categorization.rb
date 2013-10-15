class Categorization < ActiveRecord::Base

  belongs_to :good,
    inverse_of: :categorizations

  belongs_to :category,
    inverse_of: :categorizations

  validates_presence_of :good
  validates_presence_of :category
  
end
