def loggged_in_user(user = FactoryBot.create(:user))
  @current_user = user
  visit '/users/sign_in'
  fill_in 'Email', with: @current_user.email
  fill_in 'Password', with: 'secret123'
  click_on 'Log in'
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

When('visit {string} organization page') do |_name|
  visit '/'
  click_on 'Organizations'
  click_on 'Team A'
end
