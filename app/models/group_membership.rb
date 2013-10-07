class GroupMembership < ActiveRecord::Base

belongs_to :user
belongs_to :group

validates_presence_of :user
validates_presence_of :group 

end
