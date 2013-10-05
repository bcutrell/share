module AuthenticationHelper

  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  def add_public_good
    visit home_dashboard_path
    click_on 'Public'
    click_on 'Post item'
    fill_in 'Title', with: 'brand'
    fill_in 'Description', with: 'spanking'
    fill_in 'Location', with: 'new'
    attach_file('good_image', "#{Rails.root}/spec/support/images/test.jpg")
    click_button 'Create Good'  
  end

end