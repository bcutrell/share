require 'spec_helper'

feature 'group member views items', %Q{
As a member
I want to view the items in my private group
So that I can decide which ones I want to claim
} do

# Acceptance Criteria: 
# * I must be a member of the private group

scenario 'I view group items' do 
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    add_group 
    visit home_dashboard_path

    click_on "View Groups"

    expect(page).to have_content(user.groups.first.name)
end
 
end