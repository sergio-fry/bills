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

Given('organization {string} added') do |name|
  @organization = create_organization name
end

Given('member {string} added') do |name|
  @next_member_phone ||= 1_000_000

  visit_organization_page
  click_on 'add member'
  fill_in 'Name', with: name
  fill_in 'Phone', with: @next_member_phone
  @next_member_phone += 1

  click_on 'save'
end

Given('organization got income with amount {string}') do |amount|
  visit_organization_page
  click_on 'track incomes'
  fill_in 'Amount', with: amount
  select @organization.memberships.first.name, from: 'Member'
  click_on 'add'
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

When('expense {string} with amount {string} is tracked') do |_string, _string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('organization balance is {string}') do |amount|
  expect(@organization.reload.amount).to eq amount
end

When('visit {string} organization page') do |name|
  visit_organization_page name
end
