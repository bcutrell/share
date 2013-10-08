require 'spec_helper'

describe GroupMembership do
  it {should belong_to (:user)}
  it {should belong_to (:group)}

  it {should have_valid(:user).when(User.new) }
  it {should have_valid(:group).when(Group.new) }
  
end
