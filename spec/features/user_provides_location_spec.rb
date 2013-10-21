require 'spec_helper'

feature 'User provides the location of a good', %Q{
  As a user
  I want to provide a location of a good
  So that people can find it
} do

# Acceptance Criteria
# * I must be logged in
# * I must be adding a valid good
# * I can provide a street address for the good
# * When someone views the good they can see the location on google maps

  scenario 'I provide a valid location' do
    good = FactoryGirl.create(:good, :with_image, location: "17 braddock park, Boston, MA")
    user = good.user
    sign_in_as(user)

    visit good_path(good.id)
    page.has_css?('#map')
    page.has_css?('leaflet-marker-icon')
  end
end
