require 'spec_helper'

feature 'user signs up', %Q{
  As an unauthenticated user
  I want to create an account
  So that I can sign in
} do

# Acceptance Criteria:
# * I must input my name and address
# * I must input my email
# * I must enter a password
# * If I do not enter my email, name, and address I will receive an error message
# * If I try to use the same email address twice I will receive an error message

scenario 'I will be able to sign up successfully' do

name = 'Stan Marsh'
email = "marsh@southpark.com"
password = "cartmenisnotmyfriend"
location = "colorado"

visit '/'

fill_in 'Username', with: name
fill_in 'Email', with: email
fill_in 'Password', with: password
fill_in 'Location', with: location
click_button 'Join'

expect(page).to have_content('Sign Out')
end

scenario 'After I sign in the sign up form will no longer be on the welcome page' do
  user = FactoryGirl.create(:user)
  sign_in_as(user)
  visit root_path
  expect(page).to_not have_content('Password')
  expect(page).to_not have_content('Email')

end

scenario 'If I specify incorrect information I will recieve an error message' do

name = 'Stan Marsh'
email = "marsh@southpark.com"
bad_password = 'cartmen'
location = "colorado"

visit '/'

fill_in 'Username', with: name
fill_in 'Email', with: email
fill_in 'Password', with: bad_password
fill_in 'Location', with: location
click_button 'Join'

expect(page).to have_content('too short')

end

end

feature 'Authenticated user signs in', %Q{
  As an authenticated user
  I want to sign in
  so that I can use the website
} do

# Acceptance Criteria:
# * I must enter in my email and password
# * If I enter the incorrect information
# I will receive an error message
# * If I forgot my password I will be directed
# to password reset

  scenario 'I sign in successfully ' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(page).to have_content('Sign Out')
  end
end

feature 'user is able to recover lost password', %Q{
  As an forgetful user
  I want to reset my password
  So that I can regain access to my account
} do

#   Acceptance Criteria:
# * I must specify a valid email
# * I receive an email if my account is registered with a secure option to reset my password
# * Upon following through with that option, I must create and confirm a new password
# * If my password and password confirmation do not match, I am prompted to re-enter and notified that my password does not match
# * If my password and password confirmation matches, my password is reset and I can authenticate using the newly set password
# * I am authenticated upon changing my password

scenario 'I recover my password' do
  end
end
