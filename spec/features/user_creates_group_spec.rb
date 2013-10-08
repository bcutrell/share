require 'spec_helper'

feature 'user creates a group', %Q{
    As a private user
    I want to beome the founder a group 
    So that I can invite my friends 
} do

#Acceptance Criteria:
# * I must be logged in as an authenticated user
# * I must supply a name for the group, a password
# * I can send out invitations to the group by email

scenario 'I create a group' do 
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    prev_count = Group.count

    click_on "Create New Group"

    fill_in 'Group Name', with: "PatsFans"
    fill_in 'Password', with: "password"

    click_button 'Create Group'

    expect(page).to have_content("Group Created")
    expect(Group.count).to eql(prev_count + 1)
end

scenario 'I invite friends' do 
end 
end