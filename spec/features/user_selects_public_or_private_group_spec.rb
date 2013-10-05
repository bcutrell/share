require 'spec_helper'

feature 'user can select public or private group', %Q{
As an authenticated user
I want to choose whether I want to access a public or private group
So that I can access the inventories I am interested in
} do 

# Acceptance Criteria: 
# * I can only choose public or private
# * I need to be signed in in order to choose 
# * If I choose public I go to the public goods index
# * If I choose private I go to the private groups page
# * If I make the wrong choice I can go back by 
# clicking an icon at the bottom of the page

  scenario 'I choose public' do 
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on "Public"
    click_on "View items"
    end

  scenario 'I post a public good' do 
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    add_public_good 
  end 
end