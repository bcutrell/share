require 'spec_helper'

feature 'logged in user views an item', %Q{
  As a public user
  I want to view lists available items
  so that I can decide whether or not I want to claim them 
} do

  # Acceptance Criteria:
  # * I must be logged in
  # * I must choose my location (do this later)
  # * I must choose the see items button
  # * If there are items I will see a list of items with their picture next to them 
  # * If there are no items to view I will be given an error message 

  scenario 'I view all the items' do
    user = FactoryGirl.create(:user)
    good = FactoryGirl.create(:good, :with_image)
    sign_in_as(user)
    click_link 'Dashboard'
    click_link 'View items'
    expect(page).to have_image good.image.thumb.url
  end
end
