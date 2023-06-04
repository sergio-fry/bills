def loggged_in_user(user = FactoryBot.create(:user))
  @current_user = user
  visit '/users/sign_in'
  fill_in 'Email', with: @current_user.email
  fill_in 'Password', with: 'secret123'
  click_on 'Log in'
end

Given('Logged in user') do
  loggged_in_user
end

Given('Logged in as owner of Organization {string}') do |name|
  loggged_in_user Organization.find_by!(name:).owner
end

When('Visit {string} organization page') do |_name|
  visit '/'
  click_on 'Organizations'
  click_on 'Team A'
end
