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
      group = FactoryGirl.create(:group, :with_good)
      membership = FactoryGirl.create(:group_membership, user: user, group: group)

      sign_in_as(user)
      visit home_dashboard_path
      click_on "View Groups"

      click_on user.groups.first.name
      expect(page).to have_image group.goods.first.image.thumb.url
  end

end

feature 'group member views items', %Q{
  As a member
  I want to contribute items in my private group
  So that I can decide get rid of them
} do

  # Acceptance Criteria:
  # * I must be a member of the private group

  scenario 'I contribute' do
      user = FactoryGirl.create(:user)
      group = FactoryGirl.create(:group, :with_good)
      membership = FactoryGirl.create(:group_membership, user: user, group: group)

      sign_in_as(user)
      click_on "View Groups"
      click_on user.groups.first.name
      click_on "New Good"
      fill_in 'Title', with: 'brand'
      fill_in 'Description', with: 'spanking'
      fill_in 'Location', with: 'new'
      attach_file('good_image', "#{Rails.root}/spec/support/images/test.jpg")
      click_on 'Create Good'
      click_on "View Groups"
      click_on user.groups.first.name

      expect(page).to have_image user.goods.first.image.thumb.url
  end

end
