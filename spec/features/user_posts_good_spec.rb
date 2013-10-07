require 'spec_helper'

feature 'posts an item', %Q{
  As someone wanting to dispose of something
  I want to post an item
  So that I can share it with someone else
} do

# Acceptance Criteria:
# * I must specify a title 
# * I must provide an image
# * I can optionally specify a category
# * I must supply either a location or a phone number
# * Upon successful posting, the item is made publicly available to interested acquirers
# * If I don't specify valid information, I get an error message 
# and I'm prompted to correct my errors
# * If I create a good publicly it can only be seen in the public group
# * If I create a good privately it can only be seen in the private group

  scenario 'I successfully post an item' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_link 'Post item'
    fill_in 'Title', with: 'brand'
    fill_in 'Description', with: 'spanking'
    fill_in 'Location', with: 'new'
    attach_file('good_image', "#{Rails.root}/spec/support/images/test.jpg")
    click_on 'Create Good'
    
    expect(page).to have_content('Thanks for sharing')
  end

  scenario 'I post a private item' do 
    user = FactoryGirl.create(:user, :in_group)
    group = user.groups.first
    sign_in_as(user)

    visit group_path(group)
    click_on "Add Item"
    fill_in "Title", with: "chair"
    fill_in "Description", with: "good for sitting on"
    fill_in "Location", with: "Boston"
    attach_file('good_image', "#{Rails.root}/spec/support/images/test.jpg")
    click_on "Create Good"

    expect(page).to have_content("Thanks for sharing")
    expect(Good.last.private).to eql(true)
    expect(Good.last.group).to eql(group)
  end
end