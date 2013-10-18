require 'spec_helper'

feature 'user creates a group', %Q{
    As a user
    I want to delete the goods I have posted
    So that others users will no longer inquire about them
} do

#Acceptance Criteria:
# * I must be logged in as an authenticated user
# * I must have goods outstanding
# * I must visit the inventory page

    scenario 'I delete a good' do
        user = FactoryGirl.create(:user)
        good = FactoryGirl.create(:good, :with_image)
        user.goods << good
        good.user = user
        prev_count = Good.count

        sign_in_as(user)
        visit "/goods/#{good.id}"
        click_on 'Remove Good'

        expect(Good.count).to eql(prev_count - 1)
    end
end
