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
  @next_member_phone ||= 1000_000

  visit_organization_page
  click_on 'add member'
  fill_in 'Name', with: name
  fill_in 'Phone', with: @next_member_phone
  @next_member_phone += 1

  click_on 'save'
end

Given('organization got income with amount {string}') do |amount|
  result = Domain::TrackIncome.new(
    creator: @current_user,
    membership: @organization.memberships.first,
    amount:
  ).call

  expect(result).to be_succes
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
