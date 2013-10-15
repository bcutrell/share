class Group < ActiveRecord::Base
  has_secure_password
  
  has_many :users, through: :group_memberships
  
  has_many :group_memberships,
  inverse_of: :group

  has_many :goods 

  validates_presence_of :name
  validates_presence_of :password 




  class << self
    def member_of(user)
      member_groups = []
      self.all.each do |group|
        if group.users.include?(user)
          member_groups << group 
        end
      end
      member_groups
    end
  end

end
