Given('Logged in user') do
  @current_user = FactoryBot.create(:user)
  visit '/users/sign_in'
  fill_in 'Email', with: @current_user.email
  fill_in 'Password', with: 'secret123'
  click_on 'Log in'
end
