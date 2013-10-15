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
# * If I click on view groups in the dashboard, 
# I will see all the groups I am a member of

    scenario 'I create a group' do 
        user = FactoryGirl.create(:user)
        sign_in_as(user)
        prev_count = Group.count

        click_on "Create New Group"
        fill_in 'Group Name', with: "PatsFans"
         within(:css, ".group_password") do
              fill_in 'Password', :with => 'password'
        end
        within(:css, ".group_password_confirmation") do
              fill_in 'Password', :with => 'password'
        end
        click_button 'Create Group'

        expect(page).to have_content("Group Created")
        expect(Group.count).to eql(prev_count + 1)
    end

    scenario 'I view my groups' do 
        user = FactoryGirl.create(:user)
        sign_in_as(user)
        
        add_group 
        visit home_dashboard_path
        click_on "View Groups"
    
        expect(page).to have_content(user.groups.first.name)
    end 
end