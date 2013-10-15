require 'spec_helper'

feature 'group passwords are encrypted', %Q{
  As a group member
  I want the group password to be encrypted
  Because passwords should never be in plain text
} do

# Acceptance Criteria
# * Passwords must be encrypted

  scenario 'My group has an encrpted password' do 
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      add_group
      group = Group.all.first
      group_member = GroupMembership.all.first

      expect(group.password).to_not eql("password")
      expect(group.group_memberships.first).to eql(group_member)
  end
end