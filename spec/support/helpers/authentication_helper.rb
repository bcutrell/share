module AuthenticationHelper

  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  def add_good
    visit welcome_dashboard_path
    click_link 'Post item'
    fill_in 'Title', with: 'brand'
    fill_in 'Description', with: 'spanking'
    fill_in 'Location', with: 'new'
    page.attach_file("picture", Rack::Test::UploadedFile.new(File.join(Rails.root,'spec', 'support', 'good_images', 'DSC00391.JPG')))
    click_button 'Create Good'  
  end

end