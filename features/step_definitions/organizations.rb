def create_organization(name, creator: FactoryBot.create(:user))
  result = Domain::CreateOrganization.new(
    organization: FactoryBot.build(:organization, name:),
    creator:
  ).call

  expect(result).to be_success

  result.organization
end

Given('organization {string}') do |name|
  @organization = create_organization name
end

def create_user_by_name(name)
  User.create!(
    name:,
    email: "#{name}@example.com",
    password: 'secret123',
    password_confirmation: 'secret123'
  )
end

Given('member {string} added to organization') do |member_name|
  user = create_user_by_name member_name

  Domain::AddMember.new(
    creator: @current_user,
    user:,
    organization: @organization,
    role: :member
  ).call
end

Given('organization got income with amount {string}') do |amount|
  result = Domain::TrackIncome.new(
    creator: @current_user,
    membership: @organization.memberships.first,
    amount:
  ).call

  expect(result).to be_succes
end

When('expense {string} with amount {string} is tracked') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('organization balance is {string}') do |amount|
  expect(@organization.reload.amount).to eq amount
end
