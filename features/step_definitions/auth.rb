Given('Logged in user') do
  @current_user = FactoryBot.create(:user)
  sign_in @current_user
end
