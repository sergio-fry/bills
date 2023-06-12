def create_organization(name, creator: FactoryBot.create(:user))
  Domain::CreateOrganization.new(
    organization: FactoryBot.build(:organization, name:),
    creator:
  ).call
end

Given('organization {string}') do |name|
  create_organization name
end

def create_user_by_name(name)
  User.create!(
    name:,
    email: "#{name}@example.com",
    password: 'secret123',
    password_confirmation: 'secret123'
  )
end

Given('member {string} of Organization {string}') do |member_name, org_name|
  user = create_user_by_name member_name

  Domain::AddMember.new(
    creator: nil,
    user:,
    organization: Organization.find_by!(name: org_name),
    role: :member
  ).call
end
