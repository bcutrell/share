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
# * If I don't specify valid information, I get an error message and I'm prompted to correct my errors

  scenario 'I successfully post an item' do

    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit '/'

    click_link 'Dashboard'
    click_link 'Post item'

    fill_in 'Title', with: 'brand'
    fill_in 'Description', with: 'spanking'
    fill_in 'Location', with: 'new'
    attach_file('good_image', "#{Rails.root}/spec/support/images/test.jpg")
    click_on 'Create Good'
    expect(page).to have_content('Thanks for sharing')
  end

end