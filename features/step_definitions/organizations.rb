def create_organization(name)
  visit '/'
  click_on 'Organizations'
  click_on 'new organization'
  fill_in 'Name', with: name
  click_on 'create'

  Organization.find_by! name:
end

def visit_organization_page(name = @organization.name)
  visit '/'
  click_on 'Organizations'
  click_on name
end

Given('create organization {string}') do |name|
  @organization = create_organization name
end

Given('add member {string} to organization') do |name|
  @next_member_phone ||= 1_000_000

  visit_organization_page
  click_on 'add member'
  fill_in 'Name', with: name
  fill_in 'Phone', with: @next_member_phone
  @next_member_phone += 1

  click_on 'save'
end

def track_income(amount, member_name = @organization.memberships.first.name)
  visit_organization_page
  click_on 'add income'
  fill_in 'Amount', with: amount
  select member_name, from: 'Member'
  click_on 'add'
end

Given('track income {string}') do |amount|
  track_income amount
end

When('track income {string} by {string}') do |amount, member_name|
  track_income amount, member_name
end

Given('organization {string} owned by another user') do |name|
  current_user_was = @current_user
  organization_was = @organization

  loggged_in_user
  create_organization name

  loggged_in_user current_user_was
  @current_user = current_user_was
  @organization = organization_was
end

When('track expense {string} with comment {string}') do |amount, comment|
  visit_organization_page
  click_on 'add expense'
  fill_in 'Amount', with: amount
  fill_in 'Comment', with: comment
  click_on 'add'
end

Given('organization balance is {string}') do |amount|
  visit_organization_page
  expect(page).to have_css('.organization__balance', text: amount)
end

When('visit organization page') do
  visit_organization_page
end
