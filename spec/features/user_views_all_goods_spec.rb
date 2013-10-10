require 'spec_helper'

feature 'user views all goods', %Q{
  As a user
  I want to see the items I have posted
  So that I can organize my goods
} do

# Acceptance Criteria
# * Passwords must be encrypted

  scenario 'I view all my goods' do 
      user = FactoryGirl.create(:user)
      good = FactoryGirl.create(:good, :with_image)
      user.goods << good 

      sign_in_as(user)
      click_on "Goods"
      
      expect(page).to have_image user.goods.first.image.thumb.url
  end
end