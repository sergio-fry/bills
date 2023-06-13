def logout = visit '/users/sign_out'

def loggged_in_user(user = FactoryBot.create(:user))
  logout if @current_user.present?

  visit '/users/sign_in'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'secret123'
  click_on 'Log in'

  @current_user = user
end

Given('logged in user') do
  loggged_in_user
end

Given('logged in as owner of organization {string}') do |name|
  loggged_in_user Organization.find_by!(name:).owner
end

Given('logged in as owner of organization') do
  loggged_in_user @organization.owner
end
