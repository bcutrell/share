require 'spec_helper'

feature 'user can select public or private', %Q{
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
    public_good = FactoryGirl.create(:good, :public)
    sign_in_as(user)
    click_on "Public"
    click_on "View items"

    expect(page).to have_image public_good.image.thumb.url
    end

  scenario 'I choose a private group' do 
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group)
    private_good = FactoryGirl.create(:good, :public)
    sign_in_as(user)
    
    click_on "Private"
    click_on "Join Group"

    select(group.name, :from => 'Group Name')
    click_on "Join Group"

    expect(page).to have_content("Welcome To The Group!")
    expect(group.users.first).to eql(user)
  end 


end

